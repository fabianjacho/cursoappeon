$PBExportHeader$w_graficos.srw
forward
global type w_graficos from window
end type
type wb_chart from webbrowser within w_graficos
end type
end forward

global type w_graficos from window
integer width = 4567
integer height = 2316
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
wb_chart wb_chart
end type
global w_graficos w_graficos

on w_graficos.create
this.wb_chart=create wb_chart
this.Control[]={this.wb_chart}
end on

on w_graficos.destroy
destroy(this.wb_chart)
end on

event open;wb_chart.navigate( "file://C:/graficos/echart.html")
end event

type wb_chart from webbrowser within w_graficos
integer x = 283
integer y = 72
integer width = 3886
integer height = 1924
end type

