return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = function()
    local harpoon = require("harpoon")
    local keys = {
      { "<leader>ja", function() harpoon:list():add() end, desc = "Add File" },
      { "<leader>jj", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Menu" },
      { "<leader>jn", function() harpoon:list():next() end, desc = "Next" },
      { "<leader>jp", function() harpoon:list():prev() end, desc = "Prev" },
    }
    for i = 1, 5 do
      table.insert(keys, {
        "<leader>j" .. i,
        function() harpoon:list():select(i) end,
        desc = "File " .. i,
      })
    end
    return keys
  end,
}
