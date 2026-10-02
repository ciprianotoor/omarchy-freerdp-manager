# Omarchy FreeRDP Manager

Gestor de máquinas virtuales RDP para Omarchy usando FreeRDP.

## Instalación

Requiere Omarchy, `freerdp`, `jq`, `fzf`, `gum` y `secret-tool`.

```bash
git clone https://github.com/ciprianotoor/omarchy-freerdp-manager.git
cd omarchy-freerdp-manager
./install.sh
omarchy restart shell
```

También aparece en el menú de Omarchy en **Acciones → Máquinas virtuales**.

## Uso

- Clic izquierdo en el icono rojo del monitor: abre el gestor una sola vez.
- Clic derecho: oculta la ventana del gestor.
- Las contraseñas se guardan en el llavero del sistema mediante `secret-tool`.
- Los perfiles no guardan contraseñas en JSON.

## Licencia

MIT
