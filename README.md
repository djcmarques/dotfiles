# dotfiles

Minimal zsh setup for GitHub Codespaces, with Oh My Zsh, autosuggestions,
and syntax highlighting. The installer replaces `$HOME/.zshrc` with a symlink
to this repository's `.zshrc`; back up any existing configuration first.

## Publish and enable

1. Create an empty repository named `dotfiles` on GitHub (without a README).
2. From this local repository, make the installer executable and publish:

   ```sh
   chmod +x install.sh
   git add install.sh .zshrc README.md
   git update-index --chmod=+x install.sh
   git commit -m "Add Codespaces zsh dotfiles"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/dotfiles.git
   git push -u origin main
   ```

   If `origin` already exists, use `git remote set-url origin URL` instead.
   `git update-index --chmod=+x` records the executable bit in git, even on
   filesystems that do not preserve Unix permissions.

3. Open **GitHub Settings → Codespaces → Dotfiles**, enable **Automatically
   install dotfiles**, select your `dotfiles` repository, and save.
4. Create a new codespace. Codespaces runs `install.sh` automatically.
   Open a new zsh terminal (or run `zsh` if the terminal still starts another
   shell). If `chsh` is unavailable or denied, installation still succeeds.

To reapply the configuration manually, run `./install.sh` from this repository.