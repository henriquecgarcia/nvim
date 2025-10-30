-- nvim/lua/custom/plugins/comment.lua
return {
  "numToStr/Comment.nvim",
  lazy = false,
  config = function()
    require("Comment").setup()

    local api = vim.api

    -- Mapeia Ctrl+/ no modo normal para comentar/descomentar a linha atual
    api.nvim_set_keymap(
      "n",
      "<C-_>",
      "gcc",  -- usa o comando do plugin para comentar a linha
      { noremap = false, silent = true }
    )

    -- Mapeia Ctrl+/ no modo visual (seleção)
    api.nvim_set_keymap(
      "v",
      "<C-_>",
      "gc",  -- comenta seleção
      { noremap = false, silent = true }
    )

    -- Mapeia \# para comentar as próximas N linhas
    vim.keymap.set("n", "\\#", function()
      -- Pergunta quantas linhas comentar
      local count = vim.fn.input("Comentar quantas linhas? (default = 1): ")
      count = tonumber(count) or 1
      local current = vim.api.nvim_win_get_cursor(0)[1]
      for i = 0, count - 1 do
        vim.cmd((current + i) .. "s/^/-- /")  -- muda aqui se for outra linguagem
      end
    end, { noremap = true, silent = true })
  end,
}

