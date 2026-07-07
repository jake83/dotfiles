# dotfiles

Fully reproducible macOS dev environment via nix-darwin + home-manager + nix-homebrew.

## Fresh machine setup

**1. Install Nix** (Determinate Systems installer — this repo assumes it manages the daemon):
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

**2. Clone this repo:**
```bash
git clone git@github.com:jake83/dotfiles.git ~/github/jake83/dotfiles
cd ~/github/jake83/dotfiles
```

**3. Before first run, check/update these machine-specific values:**
- `configuration.nix` → `system.primaryUser` and `nix-homebrew.user` should match your macOS username (`whoami`)
- `configuration.nix` → `nixpkgs.hostPlatform` — `aarch64-darwin` for Apple Silicon, `x86_64-darwin` for Intel
- `home.nix` → `home.username` / `home.homeDirectory` should match too

**4. First activation** (bootstraps `darwin-rebuild`, which doesn't exist yet on a fresh machine):
```bash
sudo nix run nix-darwin -- switch --flake ~/.dotfiles#mac
```
If Homebrew is already installed manually on this Mac, you'll be prompted to set `nix-homebrew.autoMigrate = true;` — this migrates it in place without losing installed packages.

**5. From now on, rebuild with:**
```bash
./rebuild.sh
```

## Manual steps not covered by this repo

These can't be captured declaratively and need doing once per machine:
- `gh auth login` (or `gh auth switch --user jake83`) — GitHub CLI auth
- SSH keys for git push/pull
- Claude Code / Codex CLI auth (`claude` will prompt on first run)
- Any 1Password / keychain items

## Notes

- `home.activation.installNpmGlobals` installs `intelephense`, `prettier`, `tree-sitter-cli` globally via npm into `~/.npm-global` on every rebuild — not managed by Nix directly since they're not (yet) packaged in nixpkgs.
- If WezTerm/zsh/Claude config files pre-exist on a machine, `home-manager.backupFileExtension = "backup"` will rename conflicts to `.backup` rather than failing the build.
- After any rebuild that touches PATH or session variables, fully quit and relaunch WezTerm (Cmd+Q) rather than opening a new tab — a stale shell can hold onto old environment state (`__HM_SESS_VARS_SOURCED` guard) and skip re-sourcing.

## Troubleshooting

**`compinit: no such file or directory: /opt/homebrew/share/zsh/site-functions/_brew`**

The `_brew` completion symlink points into Homebrew's old repo layout, which moves once nix-homebrew takes over. Fix:
```bash
ln -sfn "$(brew --repository)/completions/zsh/_brew" /opt/homebrew/share/zsh/site-functions/_brew
rm -f ~/.zcompdump*
```

**`dyld: Library not loaded: .../icu4c/lib/libicui18n.XX.dylib` when running a Node-based global tool**

Homebrew's `node` fell out of sync with an upgraded `icu4c`. Fix:
```bash
brew reinstall node
```

**A freshly installed npm-global tool or new PATH entry isn't found, even in a "new" terminal tab**

Home-manager's session vars are guarded by `__HM_SESS_VARS_SOURCED`, which is `export`ed and therefore survives `exec zsh` — a new tab in an already-running WezTerm can inherit it and skip re-sourcing. Fully quit WezTerm (Cmd+Q) and relaunch, or manually:
```bash
unset __HM_SESS_VARS_SOURCED
exec zsh
```

**`home-manager` activation fails with "Existing file ... would be clobbered"**

A real (non-Nix-managed) file already exists where home-manager wants to place a symlink. Either let `backupFileExtension` rename it automatically on next rebuild, or remove/move it yourself first if you don't need to keep it:
```bash
mv ~/.config/whatever ~/.config/whatever.old
./rebuild.sh
```

**`sudo: darwin-rebuild: command not found`**

Only happens before the very first successful activation — `darwin-rebuild` doesn't exist until then. Run the bootstrap command in step 4 above first.
