$PBExportHeader$w_consumo_api.srw
forward
global type w_consumo_api from window
end type
type cb_1 from commandbutton within w_consumo_api
end type
type dw_1 from datawindow within w_consumo_api
end type
end forward

global type w_consumo_api from window
integer width = 4978
integer height = 2080
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
dw_1 dw_1
end type
global w_consumo_api w_consumo_api

on w_consumo_api.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.dw_1}
end on

on w_consumo_api.destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_1 from commandbutton within w_consumo_api
integer x = 37
integer y = 16
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Listar"
end type

event clicked;HttpClient l_http
String ls_url, ls_response
Integer li_rc

ls_url = "http://173.208.167.230:8082/api/facturacion/listarProducto/?idEmisor=8907"
l_http = Create HttpClient

li_rc = l_http.SendRequest("GET", ls_url)

IF li_rc = 1 THEN
    l_http.GetResponseBody(ls_response)
ELSE
    MessageBox("Error", "No se pudo conectar a la API.")
    RETURN
END IF

// Importar JSON al DataWindow
dw_1.Reset()
Integer li_imported
li_imported = dw_1.ImportJson(ls_response)

IF li_imported > 0 THEN
    MessageBox("OK", "Datos cargados: " + String(li_imported))
ELSE
    MessageBox("Error", "No se pudieron cargar datos en el DataWindow")
END IF
end event

type dw_1 from datawindow within w_consumo_api
integer x = 37
integer y = 148
integer width = 4855
integer height = 1740
integer taborder = 10
string title = "none"
string dataobject = "d_consumo_api"
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

