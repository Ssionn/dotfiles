# Neovim Dotfiles with Kitty Terminal

This repository contains my personal Neovim configuration, optimized for use with the Kitty terminal emulator. It provides a powerful, customized development environment for various programming languages.

![image](https://github.com/user-attachments/assets/3ce15477-51f3-4fa1-b2c0-8a9eb46dfa0f)


---

### Prerequisites

- [Neovim (>= 0.5.0)](https://neovim.io/)
- [Kitty terminal emulator](https://sw.kovidgoyal.net/kitty/overview/)
- [Git](https://git-scm.com/)
- [Node.js and npm (for CoC)](https://nodejs.org/en)
- [Ripgrep (for telescope.nvim)](https://github.com/BurntSushi/ripgrep)
- [Make (for compiling certain plugins)](https://www.gnu.org/software/make/)

---

### Installation

Clone this repository:
```
git clone https://github.com/ssionn/dotfiles.git
```

Run the installation script:

```
cd ~/.dotfiles
./install.sh
```

This script will:

- Create symbolic links for Neovim, Kitty, and Phpactor configurations
- Run Packer sync to install and update all Neovim plugins
- Compile telescope-fzf-native.nvim if necessary
- Install Ripgrep if it's not already present
- Set up CoC (Conquer of Completion) for Neovim

Open Neovim to finish plugin installation:

```
nvim
```

---

### Features

- Packer.nvim for plugin management
- Telescope for fuzzy finding
- CoC for autocompletion and language server protocol support
- Custom keybindings for improved workflow
- Phpactor integration for enhanced PHP development
- Kitty terminal configuration for a seamless experience

---

### Customization

Neovim configuration files are located in ~/.config/nvim/
Kitty configuration can be found in ~/.config/kitty/
Phpactor settings are in ~/.config/phpactor/

Feel free to modify these files to suit your preferences.
Updating
To update the configuration and plugins:

Pull the latest changes from the repository:

```
cd ~/.dotfiles
git pull
```

Run the installation script again:

```
./install.sh
```

Open Neovim and run ```:PackerSync``` to update plugins.

---

### Troubleshooting
If you encounter any issues:

- Ensure all prerequisites are installed and up to date
- Check the Neovim health status with ```:checkhealth```
- Review the installation script output for any error messages

### Contributing
Feel free to fork this repository and submit pull requests for any improvements or bug fixes.

---

### License
This project is open-source and available under the MIT License.
