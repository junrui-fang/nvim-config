return {
  {
    "neovim/nvim-lspconfig",
    opts = { servers = { ansiblels = {} } },
  },

  {
    "mfussenegger/nvim-ansible",
    ft = "yaml",
    keys = {
      {
        "<leader>la",
        function() require("ansible").run() end,
        desc = "Ansible Run Playbook/Role",
        silent = true,
        ft = "yaml",
      },
    },
  },
}
