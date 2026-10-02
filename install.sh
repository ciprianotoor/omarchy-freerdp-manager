#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
plugin_dir="$HOME/.config/omarchy/plugins/cipriano.freerdp-manager"
bin_dir="$HOME/.local/bin"
mkdir -p "$plugin_dir" "$bin_dir"
cp "$root/manifest.json" "$root/BarWidget.qml" "$plugin_dir/"
cp "$root/bin/omarchy-freerdp-manager" "$root/bin/omarchy-freerdp-toggle" "$bin_dir/"
chmod +x "$bin_dir/omarchy-freerdp-manager" "$bin_dir/omarchy-freerdp-toggle"

shell="$HOME/.config/omarchy/shell.json"
if [[ -f "$shell" ]] && ! grep -q 'cipriano.freerdp-manager' "$shell"; then
  sed -i '/"omarchy.agents"/a\        {\n          "id": "cipriano.freerdp-manager"\n        },' "$shell"
fi

menu="$HOME/.config/omarchy/extensions/omarchy-menu.jsonc"
if [[ -f "$menu" ]] && ! grep -q 'trigger.virtual-machines' "$menu"; then
  sed -i '/"trigger":.*"label":"Acciones"/a\  "trigger.virtual-machines": {"icon":"RDP","label":"Máquinas virtuales","action":"omarchy-launch-floating-terminal-with-presentation omarchy-freerdp-manager"},' "$menu"
fi

printf 'FreeRDP Manager instalado. Reinicia el shell con: omarchy restart shell\n'
