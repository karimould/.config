# Karim's macOS Config

Personal dotfiles and application configuration, version-controlled in
`~/.config`. Most tools read their config from `~/.config` automatically
(XDG base directory), so **only files that live outside this repo need a
symlink**.

## Layout

| Directory        | Used by  | Needs a symlink?                                  |
| ---------------- | -------- | ------------------------------------------------- |
| `scripts/`       | you 🙂   | No — run `bootstrap-macos.sh` / `bootstrap-linux.sh` |
| `zsh/`           | zsh      | **Yes** — `~/.zshrc` → `zsh/.zshrc`               |
| `neomutt/`       | NeoMutt  | No — read from `~/.config/neomutt` directly       |
| `nvim/`          | Neovim   | No — XDG default                                  |
| `ghostty/`       | Ghostty  | No — reads `$XDG_CONFIG_HOME/ghostty` on macOS    |
| `zellij/`        | Zellij   | No — XDG default                                  |
| `opencode/`      | OpenCode | No — XDG default                                  |

> **Backup tip:** the only thing in this whole setup that cannot be
> regenerated from the repo is your GPG private key. Keep an offline
> backup of it: `gpg --export-secret-keys > gpg-secret-backup.gpg`

## Setup on a new machine

### The fast way

Clone the repo and run the bootstrap for your platform:

```sh
git clone <repo-url> ~/.config
~/.config/scripts/bootstrap-macos.sh    # macOS
~/.config/scripts/bootstrap-linux.sh    # Linux (apt/dnf/pacman)
```

The script is **idempotent** — safe to re-run any time. It installs the
packages, creates the symlinks, writes `gpg-agent.conf` with the right
pinentry for your platform, and verifies the neomutt config. It will
interactively ask you only for the things it cannot know:

- your two email addresses (written to gitignored `accounts.local`)
- which GPG key to initialise `pass` with
- the mail passwords (`pass insert`)

### The manual way

1. Clone the repo into place:

   ```sh
   git clone <repo-url> ~/.config
   ```

2. Create the required symlinks (currently only one):

   ```sh
   # zsh config
   ln -sf ~/.config/zsh/.zshrc ~/.zshrc
   ```

3. Add your private email addresses (gitignored, never committed):

   ```sh
   cd ~/.config
   cp neomutt/accounts.local.example neomutt/accounts.local
   $EDITOR neomutt/accounts.local   # fill in real addresses
   ```

4. Install the dependencies referenced by these configs:

   ```sh
   brew install neomutt pass pinentry-mac urlview zellij
   # oh-my-zsh (used by zsh/.zshrc)
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

5. Import your GPG key for `pass`, then initialise the password store:

   ```sh
   pass init <gpg-key-id>
   pass insert mail/gmail
   pass insert mail/icloud
   ```

6. Write `~/.gnupg/gpg-agent.conf` (macOS):

   ```text
   pinentry-program /opt/homebrew/bin/pinentry-mac
   default-cache-ttl 28800
   max-cache-ttl 28800
   ```

7. Restart the terminal (or `source ~/.zshrc`).

## Notes

- `~/.gnupg/gpg-agent.conf` (outside this repo) sets
  `pinentry-program /opt/homebrew/bin/pinentry-mac` and an 8 h passphrase
  cache TTL so NeoMutt can fetch credentials from `pass` without prompting
  mid-session.
- The `neomutt()` shell function in `zsh/.zshrc` pre-warms the gpg-agent
  cache from `pass` before launching, then enables truecolor
  (`TERM=xterm-direct`) for the Dracula theme.
