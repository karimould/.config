#!/usr/bin/env bash
# Bootstrap this dotfiles repo on Linux.
# Detects apt / dnf / pacman. Idempotent: safe to re-run.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=common.sh
source "$SCRIPT_DIR/common.sh"

info "Linux bootstrap starting"
check_repo_location

# ── Package manager detection ───────────────────────────────
if have apt-get; then
    PKG_MGR="apt"
elif have dnf; then
    PKG_MGR="dnf"
elif have pacman; then
    PKG_MGR="pacman"
else
    fail "No supported package manager found (apt/dnf/pacman). Install the packages listed below manually."
fi
ok "package manager: $PKG_MGR"

# ── Packages ────────────────────────────────────────────────
install_pkg() {
    local pkg="$1"
    if have "$pkg"; then
        ok "already installed: $pkg"
        return
    fi
    info "installing: $pkg"
    case "$PKG_MGR" in
        apt)    sudo apt-get update -qq && sudo apt-get install -y "$pkg" ;;
        dnf)    sudo dnf install -y "$pkg" ;;
        pacman) sudo pacman -S --noconfirm --needed "$pkg" ;;
    esac
}

CORE_PACKAGES=(neomutt pass gnupg zellij nvim)
for pkg in "${CORE_PACKAGES[@]}"; do
    install_pkg "$pkg" || fail "failed to install required package: $pkg"
done

# Optional packages — nice to have, not fatal when unavailable.
OPTIONAL_PACKAGES=(urlview pinentry-curses pinentry-qt pinentry-gnome3)
for pkg in "${OPTIONAL_PACKAGES[@]}"; do
    install_pkg "$pkg" || warn "could not install optional package: $pkg"
done

# ── Oh My Zsh ───────────────────────────────────────────────
if [ -d "$HOME/.oh-my-zsh" ]; then
    ok "oh-my-zsh already installed"
else
    info "installing oh-my-zsh"
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || \
        warn "oh-my-zsh install failed — zshrc expects it at ~/.oh-my-zsh"
fi

# ── Symlinks ────────────────────────────────────────────────
link "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"

# ── Private email addresses ─────────────────────────────────
ensure_accounts_local

# ── Password store ──────────────────────────────────────────
setup_pass

# ── gpg-agent (pick best available pinentry + 8h cache) ─────
PINENTRY=""
for candidate in pinentry-qt pinentry-gnome3 pinentry-curses pinentry-tty; do
    if have "$candidate"; then
        PINENTRY="$(command -v "$candidate")"
        break
    fi
done
if [ -n "$PINENTRY" ]; then
    setup_gpg_agent "$PINENTRY"
else
    warn "no pinentry found — skipping gpg-agent config"
fi

# ── Verify ──────────────────────────────────────────────────
verify_neomutt_config

echo
info "Linux bootstrap finished."
echo "Manual steps that remain (only on a brand-new machine):"
echo "  - import your GPG private key:  gpg --import <backup>"
echo "  - restart your terminal, then run: neomutt"
