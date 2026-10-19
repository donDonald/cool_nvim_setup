#!/bin/bash

INFO="$HOME/.config/nvim/.INFO.md"
HOTKEYS="$HOME/.config/nvim/HOTKEYS.md"
HOTKEYS_TEMPLATE="$HOME/.config/nvim/.HOTKEYS.md"
HOTKEYS_TMP="$HOME/.config/nvim/.HOTKEYS.tmp"
rm -f "$INFO"
echo "# Actual ($(LC_TIME=C date)) neovim setup" >> "$INFO"
echo "neovim:$(nvim --version | head -1)" >> "$INFO"
echo "fzf:$(fzf --version)" >> "$INFO"
echo "lazygit:$(lazygit --version)" >> "$INFO"
echo "tig:$(tig --version | head -1)" >> "$INFO"
echo "rustup:$(rustup --version | head -1)" >> "$INFO"
echo "rustc:$(rustc --version | head -1)" >> "$INFO"
echo "rust-analyzer:$(rust-analyzer --version | head -1)" >> "$INFO"
echo >> "$INFO"

cat "$INFO" "$HOTKEYS_TEMPLATE" > "$HOTKEYS_TMP" \
 && mv "$HOTKEYS_TMP" "$HOTKEYS"

rm -f "$HOTKEYS_TMP"
rm -f "$INFO"
