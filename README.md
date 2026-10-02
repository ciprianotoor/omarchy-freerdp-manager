# Omarchy FreeRDP Manager

Gestor de máquinas virtuales RDP para Omarchy usando FreeRDP. Permite guardar perfiles, conectarse desde una terminal flotante y conservar las contraseñas en el llavero del sistema.

## Requisitos

Se necesita:

- Omarchy con Omarchy Shell/Quickshell.
- `freerdp`: cliente RDP (`xfreerdp3`).
- `foot`: terminal usada por el lanzador de Omarchy.
- `jq`: lectura y escritura de perfiles JSON.
- `fzf`: selector de máquinas.
- `gum`: formularios y menús interactivos.
- `libsecret`: proporciona `secret-tool` para guardar contraseñas de forma segura.
- `git`: para descargar el repositorio.

En Omarchy/Arch Linux se pueden instalar con:

```bash
sudo pacman -S freerdp foot jq fzf gum libsecret git
```

Si Omarchy administra los paquetes, también se puede usar:

```bash
omarchy pkg add freerdp foot jq fzf gum libsecret git
```

Comprueba que estén disponibles:

```bash
xfreerdp3 /version
foot --version
jq --version
fzf --version
gum --version
secret-tool --version
```

## Instalación

Clona el repositorio, entra en él y ejecuta el instalador:

```bash
git clone https://github.com/ciprianotoor/omarchy-freerdp-manager.git
cd omarchy-freerdp-manager
./install.sh
omarchy restart shell
```

El instalador copia el plugin a `~/.config/omarchy/plugins/`, instala los comandos en `~/.local/bin/` y añade el acceso a la barra y al menú de Omarchy. No modifica `/usr/share/omarchy/`.

Después aparecerá en:

- Icono rojo de monitor en la barra.
- **Menú de Omarchy → Acciones → Máquinas virtuales**.

## Uso

1. Haz clic izquierdo en el icono de la barra.
2. Selecciona **Agregar máquina**.
3. Introduce nombre, host, puerto, usuario, dominio opcional, gateway opcional y contraseña.
4. Selecciona **Conectar** para abrir la sesión RDP.

El clic izquierdo no crea otra ventana si el gestor ya está abierto. El clic derecho oculta la ventana del gestor.

Los perfiles se guardan en:

```text
~/.local/share/omarchy/freerdp/profiles.json
```

Las contraseñas no se guardan en ese archivo: se almacenan en el llavero de escritorio mediante `secret-tool`.

## Desinstalación

Desde el directorio del repositorio:

```bash
rm -rf ~/.config/omarchy/plugins/cipriano.freerdp-manager
rm -f ~/.local/bin/omarchy-freerdp-manager ~/.local/bin/omarchy-freerdp-toggle
```

Después elimina manualmente las entradas del plugin en `~/.config/omarchy/shell.json` y `~/.config/omarchy/extensions/omarchy-menu.jsonc`, y reinicia:

```bash
omarchy restart shell
```

## Licencia

MIT
