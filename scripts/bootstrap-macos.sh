#!/usr/bin/env bash
# Bootstrap this dotfiles repo on macOS (Homebrew-based).
# Idempotent: safe to run as many times as you like.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=common.sh
source "$SCRIPT_DIR/common.sh"

info "macOS bootstrap starting"
check_repo_location

# ── Homebrew ─────────────────────────────────────────────────
if have brew; then
    ok "Homebrew found"
else
    fail "Homebrew is required. Install it from https://brew.sh and re-run."
fi

# ── Packages ────────────────────────────────────────────────
PACKAGES=(neomutt pass pinentry-mac urlview zellij nvim)
for pkg in "${PACKAGES[@]}"; do
    if brew list --formula "$pkg" >/dev/null 2>&1; then
        ok "already installed: $pkg"
    else
        info "installing: $pkg"
        brew install "$pkg"
    fi
done

# ── Oh My Zsh ───────────────────────────────────────────────
if [ -d "$HOME/.oh-my-zsh" ]; then
    ok "oh-my-zsh already installed"
else
    info "installing oh-my-zsh"
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# ── Symlinks ────────────────────────────────────────────────
link "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"

# ── Private email addresses ─────────────────────────────────
ensure_accounts_local

# ── Password store ──────────────────────────────────────────
setup_pass

# ── gpg-agent (GUI pinentry + 8h cache) ─────────────────────
PINENTRY="$(brew --prefix)/bin/pinentry-mac"
if [ -x "$PINENTRY" ]; then
    setup_gpg_agent "$PINENTRY"
else
    warn "pinentry-mac not found — skipping gpg-agent config"
fi

# ── Verify ──────────────────────────────────────────────────
verify_neomutt_config

echo
info "macOS bootstrap finished."
echo "Manual steps that remain (only on a brand-new machine):"
echo "  - import your GPG private key:  gpg --import <backup>"
echo "  - restart your terminal, then run: neomutt"
