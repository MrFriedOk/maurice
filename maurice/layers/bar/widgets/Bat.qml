import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower
import "../universal" as Wi
import "../../../data" as D

Rectangle{
   color: D.Colors.surface
   width: text.width + 20
   
   Layout.fillHeight: true
   Layout.fillWidth: true
   Wi.Widget{
      id: text

      text.text: "BAT " + (UPower.displayDevice.percentage * 100) + "%"
      text.color: D.Colors.fg
   }
}