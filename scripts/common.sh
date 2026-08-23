#!/usr/bin/env bash
# Shared helpers for the bootstrap scripts.
# Sourced by bootstrap-macos.sh and bootstrap-linux.sh — not runnable directly.

set -euo pipefail

RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
BLUE=$'\033[0;34m'
NC=$'\033[0m'

info() { printf '%s==>%s %s\n' "$BLUE" "$NC" "$*"; }
ok()   { printf '%s ok %s %s\n' "$GREEN" "$NC" "$*"; }
warn() { printf '%s !! %s %s\n' "$YELLOW" "$NC" "$*"; }
fail() { printf '%s error: %s\n' "$RED" "$NC" "$*" >&2; exit 1; }

# Check that a command exists.
have() { command -v "$1" >/dev/null 2>&1; }

# The repo must be cloned at ~/.config for every relative reference to work.
check_repo_location() {
    [ -f "$HOME/.config/neomutt/neomuttrc" ] ||
        fail "This repo must be cloned to \$HOME/.config (looked for $HOME/.config/neomutt/neomuttrc)"
    [ -f "$HOME/.config/zsh/.zshrc" ] ||
        fail "zsh/.zshrc not found in repo — incomplete clone?"
}

# Create a symlink at $2 pointing to $1. Idempotent.
link() {
    local target="$1" dest="$2"
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$target" ]; then
        ok "symlink already correct: $dest"
    elif [ -e "$dest" ]; then
        warn "$dest already exists and is NOT our symlink — leaving it alone"
    else
        ln -s "$target" "$dest"
        ok "created symlink: $dest -> $target"
    fi
}

# Prompt until non-empty input is given.
prompt_value() {
    local label="$1" value=""
    while [ -z "$value" ]; do
        printf '%s' "$label"
        read -r value
    done
    printf '%s\n' "$value"
}

# Write a file only if its content differs. Idempotent.
write_if_changed() {
    local path="$1" content="$2"
    mkdir -p "$(dirname "$path")"
    if [ -f "$path" ] && [ "$(cat "$path")" = "$content" ]; then
        ok "already correct: $path"
    else
        printf '%s\n' "$content" > "$path"
        ok "wrote: $path"
    fi
}

# Write the platform gpg-agent config and restart the agent.
setup_gpg_agent() {
    local pinentry="$1"
    write_if_changed "$HOME/.gnupg/gpg-agent.conf" \
"pinentry-program $pinentry
default-cache-ttl 28800
max-cache-ttl 28800"
    chmod 700 "$HOME/.gnupg" 2>/dev/null || true
    info "restarting gpg-agent"
    gpgconf --kill gpg-agent 2>/dev/null || true
}

# True when a GPG secret key exists in the keyring.
has_gpg_secret_key() {
    have gpg && gpg --list-secret-keys 2>/dev/null | grep -q '^sec'
}

# First secret key id, or empty.
first_gpg_key_id() {
    gpg --list-secret-keys --keyid-format long 2>/dev/null |
        awk '/^sec/ { print $2; exit }' | cut -d/ -f2
}

# Create accounts.local from prompts if it does not exist yet.
ensure_accounts_local() {
    local file="$HOME/.config/neomutt/accounts.local" gmail icloud
    if [ -f "$file" ]; then
        ok "accounts.local already present"
        return
    fi
    echo "No accounts.local found. Your email addresses stay out of git;"
    echo "they are written to a gitignored local file only."
    gmail="$(prompt_value "Gmail address: ")"
    icloud="$(prompt_value "iCloud address: ")"
    cat > "$file" <<EOF
# accounts.local — PRIVATE, do not commit

# Gmail
set my_gmail = "$gmail"

# iCloud
set my_icloud = "$icloud"
EOF
    ok "wrote: $file"
}

# pass init + password entries, skipped when already done or impossible.
setup_pass() {
    local entry id
    if ! have pass; then
        warn "'pass' not installed — skipping password store setup"
        return
    fi
    if ! has_gpg_secret_key; then
        warn "no GPG secret key in keyring — cannot initialise pass"
        warn "import your private key backup first:"
        warn "    gpg --import backup-secret-keys.gpg"
        return
    fi
    if [ ! -f "$HOME/.password-store/.gpg-id" ]; then
        id="$(first_gpg_key_id)"
        printf 'GPG key id for pass [%s]: ' "${id:-?}"
        read -r input_id
        id="${input_id:-$id}"
        [ -n "$id" ] || { warn "no key id — skipping pass init"; return; }
        pass init "$id"
    else
        ok "password store already initialised"
    fi
    for entry in mail/gmail mail/icloud; do
        if pass show "$entry" >/dev/null 2>&1 || pass ls "$entry" >/dev/null 2>&1; then
            ok "pass entry exists: $entry"
        else
            info "creating pass entry: $entry (type/paste password twice)"
            pass insert "$entry" || warn "could not create $entry — run 'pass insert $entry' later"
        fi
    done
}

# Parse-test the neomuttrc and report.
verify_neomutt_config() {
    info "verifying neomutt configuration"
    # Neomutt may exit non-zero because of IMAP login noise on first run;
    # we only care that the config itself parsed (our echo marker).
    local out
    out="$(neomutt -F "$HOME/.config/neomutt/neomuttrc" -e 'echo config-ok' </dev/null 2>&1 || true)"
    if grep -q 'config-ok' <<<"$out"; then
        ok "neomuttrc parses cleanly"
    else
        warn "neomutt configuration has errors:"
        head -5 <<<"$out"
    fi
}
