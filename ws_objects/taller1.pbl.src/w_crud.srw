$PBExportHeader$w_crud.srw
forward
global type w_crud from window
end type
type cb_2 from commandbutton within w_crud
end type
type cb_1 from commandbutton within w_crud
end type
type st_2 from statictext within w_crud
end type
type st_1 from statictext within w_crud
end type
type sle_apellido from singlelineedit within w_crud
end type
type sle_nombre from singlelineedit within w_crud
end type
type dw_datos_personales from datawindow within w_crud
end type
end forward

global type w_crud from window
integer width = 4754
integer height = 1980
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
st_2 st_2
st_1 st_1
sle_apellido sle_apellido
sle_nombre sle_nombre
dw_datos_personales dw_datos_personales
end type
global w_crud w_crud

on w_crud.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.sle_apellido=create sle_apellido
this.sle_nombre=create sle_nombre
this.dw_datos_personales=create dw_datos_personales
this.Control[]={this.cb_2,&
this.cb_1,&
this.st_2,&
this.st_1,&
this.sle_apellido,&
this.sle_nombre,&
this.dw_datos_personales}
end on

on w_crud.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_apellido)
destroy(this.sle_nombre)
destroy(this.dw_datos_personales)
end on

event open;dw_datos_personales.settransobject(SQLCA)

long ll_return

ll_return = dw_datos_personales.retrieve( )

if ll_return = -1 then
	messagebox("Aviso!","No existen datos")
end if
end event

type cb_2 from commandbutton within w_crud
integer x = 974
integer y = 416
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Eliminar"
end type

event clicked;integer li_respuesta

li_respuesta = MessageBox("Aviso", "¿Está seguro que desea eliminar?", Question!, YesNo!)

IF li_respuesta = 1 THEN
	dw_datos_personales.deleterow( dw_datos_personales.getrow())
	dw_datos_personales.update( )
	dw_datos_personales.retrieve( )
	sle_nombre.text = ''
	sle_apellido.text = ''
END IF
end event

type cb_1 from commandbutton within w_crud
integer x = 457
integer y = 416
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Agregar"
end type

event clicked;long ll_row

if cb_1.text = 'Agregar' then
	ll_row= dw_datos_personales.insertrow(0)
	dw_datos_personales.scrolltorow(ll_row)
	dw_datos_personales.object.nombre[ll_row] =  sle_nombre.text 
	dw_datos_personales.object.apellidos[ll_row] = sle_apellido.text 
else
	dw_datos_personales.object.nombre[dw_datos_personales.getrow()] = sle_nombre.text 
	dw_datos_personales.object.apellidos[dw_datos_personales.getrow()] = sle_apellido.text 
	cb_1.text = 'Agregar'
end if

dw_datos_personales.update( )	
messagebox("Aviso","Datos procesados exitosamente!!")

dw_datos_personales.retrieve( )
sle_nombre.text = ''
sle_apellido.text = ''
end event

type st_2 from statictext within w_crud
integer x = 2016
integer y = 212
integer width = 343
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Apellidos:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_crud
integer x = 297
integer y = 212
integer width = 343
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombres:"
boolean focusrectangle = false
end type

type sle_apellido from singlelineedit within w_crud
integer x = 2391
integer y = 192
integer width = 850
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_nombre from singlelineedit within w_crud
integer x = 649
integer y = 192
integer width = 850
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_datos_personales from datawindow within w_crud
integer x = 206
integer y = 648
integer width = 3666
integer height = 1088
integer taborder = 20
string title = "none"
string dataobject = "d_datos_personales"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;sle_nombre.text = dw_datos_personales.object.nombre[dw_datos_personales.getrow()]
sle_apellido.text = dw_datos_personales.object.apellidos[dw_datos_personales.getrow()]

cb_1.text = 'Actualizar'
end event

