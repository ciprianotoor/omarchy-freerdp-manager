import QtQuick
import Quickshell
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "cipriano.freerdp-manager"
  implicitWidth: button.implicitWidth
  implicitHeight: barSize

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "󰍹"
    foreground: "#ef4444"
    useActiveColor: false
    tooltipText: "Gestionar máquinas virtuales (FreeRDP)"
    onPressed: function(buttonCode) {
      if (buttonCode === Qt.RightButton) {
        Quickshell.execDetached(["/home/cipriano/.local/bin/omarchy-freerdp-toggle"])
      } else if (buttonCode === Qt.LeftButton)
        Quickshell.execDetached(["/home/cipriano/.local/bin/omarchy-freerdp-toggle", "open"])
    }
  }
}
