# Neovim configuration managed using https://github.com/nix-community/nixvim
{
  # Theme
  colorschemes.kanagawa.enable = true;
  colorschemes.oxocarbon.enable = false;


  # Settings
  opts = {
    expandtab = true;
    shiftwidth = 2;
    smartindent = true;
    tabstop = 2;
    number = true;
    relativenumber = true;
    clipboard = "unnamedplus";
    # Always show the signcolumn, otherwise text would be shifted when displaying error icons
    signcolumn = "yes";
  };

  # Keymaps
  globals = {
    mapleader = " ";
  };

  keymaps = [
    {
      action = "<cmd>Neotree toggle<CR>";
      key = "<leader>fq";
    }
    {
      action = "<cmd>Neotree<CR>";
      key = "<leader>fe";
    }
    # Lazygit
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options = {
        desc = "LazyGit (root dir)";
      };
    }
  ];

  plugins = {

    # UI
    web-devicons.enable = true;
    lualine.enable = true;
    bufferline.enable = false;
    treesitter.enable = true;
    conform-nvim.enable = true;
    emmet.enable = true;
    image.enable = true;
    diffview.enable = true;
    comment.enable = true;
    spectre.enable = true;
    nvim-autopairs.enable = true;
    dashboard.enable = true;
    gitsigns.enable = true;
    notify.enable = true;
    which-key = {
      enable = true;
    };

    mini = {
      enable = true;
      modules = {
        icons = {
          enable = true;
        };
      };
    };

    neo-tree = {
      enable = true;
      autoCleanAfterSessionRestore = true;
      closeIfLastWindow = true;
    };
    noice = {
      # WARNING: This is considered experimental feature, but provides nice UX
      enable = false;
      settings.presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
        #inc_rename = false;
        #lsp_doc_border = false;
      };
    };
    telescope = {
      enable = true;
      keymaps = {
        "<leader>sf" = {
          options.desc = "file finder";
          action = "find_files";
        };
        "<leader>sg" = {
          options.desc = "find via grep";
          action = "live_grep";
        };
      };
      extensions = {
        file-browser.enable = true;
      };
    };

    # Dev
    lsp = {
      enable = true;
      servers = {
        hls = {
          enable = true;
          installGhc = false; # Managed by Nix devShell
        };
        marksman.enable = true;
        nil_ls.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
      };
    };
  };
}
