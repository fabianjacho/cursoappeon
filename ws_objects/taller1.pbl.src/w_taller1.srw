$PBExportHeader$w_taller1.srw
forward
global type w_taller1 from window
end type
type cb_1 from commandbutton within w_taller1
end type
type st_1 from statictext within w_taller1
end type
end forward

global type w_taller1 from window
integer width = 4791
integer height = 2632
boolean titlebar = true
string title = "Taller1"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
st_1 st_1
end type
global w_taller1 w_taller1

on w_taller1.create
this.cb_1=create cb_1
this.st_1=create st_1
this.Control[]={this.cb_1,&
this.st_1}
end on

on w_taller1.destroy
destroy(this.cb_1)
destroy(this.st_1)
end on

type cb_1 from commandbutton within w_taller1
integer x = 622
integer y = 96
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

type st_1 from statictext within w_taller1
integer x = 210
integer y = 116
integer width = 357
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hola Mundo"
boolean focusrectangle = false
end type

