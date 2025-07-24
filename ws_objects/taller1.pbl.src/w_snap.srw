$PBExportHeader$w_snap.srw
forward
global type w_snap from window
end type
type cb_2 from commandbutton within w_snap
end type
type cb_1 from commandbutton within w_snap
end type
end forward

global type w_snap from window
integer width = 4727
integer height = 1956
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
end type
global w_snap w_snap

on w_snap.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.cb_1}
end on

on w_snap.destroy
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cb_2 from commandbutton within w_snap
integer x = 270
integer y = 320
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Firmar"
end type

event clicked;nvo_firmar lnvo_firmar

lnvo_firmar = CREATE nvo_firmar

//lnvo_firmar.of_signpdf( 
//    as_srcpdf,        // Ruta del PDF original que quieres firmar
//    as_destpdf,       // Ruta del PDF resultante con la firma
//    as_p12file,       // Ruta del archivo .p12 (certificado digital)
//    as_p12password,   // Contraseña del certificado .p12
//    as_reason,        // Razón o propósito de la firma (ej. "Aprobado", "Certificación", etc.)
//    as_location,      // Ubicación física o entidad (ej. "Ciudad, País" o "Nombre de empresa")
//    abln_visible      // TRUE si la firma debe verse en el PDF, FALSE si es invisible
//)


lnvo_firmar.of_signpdf("C:\Documentos\ejemplo.pdf", "C:\Documentos\ejemplo_firmado.pdf",   "C:\Certificados\UFREDO FABIAN JACHO VILLAFUERTE 0502336548-210624105333.p12",    "99Saloav99",    "Aprobado por el departamento legal",      "Ciudad de Quito, Quito",    TRUE )

end event

type cb_1 from commandbutton within w_snap
integer x = 229
integer y = 92
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

event clicked;nvo_mensajes lnvo_ver
integer li_resultado
string ls_saludos

lnvo_ver = CREATE nvo_mensajes

li_resultado = lnvo_ver.Of_sumar(100,50)
ls_saludos = lnvo_ver.OF_Saludo( 'Fabian')

messagebox("Resultado","Suma: " + string(li_resultado)+ "   saludo " + ls_saludos)

destroy lnvo_ver
end event

