$PBExportHeader$w_principal.srw
forward
global type w_principal from window
end type
type mdi_1 from mdiclient within w_principal
end type
end forward

global type w_principal from window
integer width = 4754
integer height = 2056
boolean titlebar = true
string title = "Ejercicios"
string menuname = "m_principal"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
end type
global w_principal w_principal

on w_principal.create
if this.MenuName = "m_principal" then this.MenuID = create m_principal
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_principal.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

type mdi_1 from mdiclient within w_principal
long BackColor=268435456
end type

