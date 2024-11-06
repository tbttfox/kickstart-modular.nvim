return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      --[[
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      --]]
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_format' }, -- { 'isort', 'black' }
        cpp = { 'clang-fmt-pre', 'clang-format', 'clang-fmt-post' },
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },

      formatters = {

        ['clang-fmt-pre'] = {
          ---Replace all `#pragma omp ...` with `//#pragma omp ...`
            format = function(self, ctx, lines, callback)
              -- Use this variable if options should be possible
              local _ = self.options
              local format_erros = nil
              local formatted_lines = vim.deepcopy(lines)
              local pattern = '^%s*#pragma omp'
              for i, line in ipairs(lines) do
                if line:match(pattern) then
                  local fmt_line = line:gsub(pattern, '//#pragma omp')
                  formatted_lines[i] = fmt_line
              end
            end
          callback(format_erros, formatted_lines)
          end
        },
        ["clang-format"] = {
          append_args = function(self, ctx)
            local style = {
              "BasedOnStyle: Google",
              "BreakAfterJavaFieldAnnotations: True",
              "AlignArrayOfStructures: Right",
              "AlignTrailingComments: {Kind: Always}",
              "AlignAfterOpenBracket: BlockIndent",
              "ColumnLimit: 120",
              "IndentWidth: 4",
              "PointerAlignment: Left",
            }
            local style_str = "{"
            for index, value in ipairs(style) do
              style_str = style_str .. value
              if index ~= #style then
                style_str = style_str .. ", "
              end
            end
            style_str = style_str .. "}"

            return {
              "--style", style_str,
            }
          end,
        },
        ['clang-fmt-post'] = {
          ---Replace all `//#pragma omp ...` with `#pragma omp ...`
          format = function(self, ctx, lines, callback)
            -- Use this variable if options should be possible
            local _ = self.options
            local format_erros = nil
            local formatted_lines = vim.deepcopy(lines)
            local pattern = '//%s#pragma omp'
            for i, line in ipairs(formatted_lines) do
              if line:match(pattern) then
                formatted_lines[i] = line:gsub(pattern, '#pragma omp')
              end
            end
          callback(format_erros, formatted_lines)
          end,
        },

        --[[
        clang_format = {
          command = "clang-format",
          prepend_args = { "--style", "Google" },
        },
        ]]--

      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
