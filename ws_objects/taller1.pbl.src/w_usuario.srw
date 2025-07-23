$PBExportHeader$w_usuario.srw
forward
global type w_usuario from window
end type
type st_2 from statictext within w_usuario
end type
type cb_3 from commandbutton within w_usuario
end type
type st_1 from statictext within w_usuario
end type
type cb_2 from commandbutton within w_usuario
end type
type cb_1 from commandbutton within w_usuario
end type
type dw_usuario from datawindow within w_usuario
end type
type gb_1 from groupbox within w_usuario
end type
type sle_1 from singlelineedit within w_usuario
end type
type gb_2 from groupbox within w_usuario
end type
end forward

global type w_usuario from window
integer width = 4754
integer height = 1980
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
cb_3 cb_3
st_1 st_1
cb_2 cb_2
cb_1 cb_1
dw_usuario dw_usuario
gb_1 gb_1
sle_1 sle_1
gb_2 gb_2
end type
global w_usuario w_usuario

type variables
long il_row
end variables

forward prototypes
public function string base64encode (string as_input)
public function integer bitand (integer a, integer b)
public subroutine wf_limpiar ()
end prototypes

public function string base64encode (string as_input);   string ls_base64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    string ls_output = ""
    long ll_len, ll_i
    long li_char1, li_char2, li_char3
    long li_enc1, li_enc2, li_enc3, li_enc4

    ll_len = Len(as_input)
    ll_i = 1

    do while ll_i <= ll_len
        // Obtener 3 caracteres
        li_char1 = Asc(Mid(as_input, ll_i, 1))
        li_char2 = 0
        li_char3 = 0

        if ll_i + 1 <= ll_len then
            li_char2 = Asc(Mid(as_input, ll_i + 1, 1))
        end if

        if ll_i + 2 <= ll_len then
            li_char3 = Asc(Mid(as_input, ll_i + 2, 1))
        end if

        // Codificación
        li_enc1 = li_char1 / 4
        li_enc2 = BitAnd(li_char1, 3) * 16 + li_char2 / 16
        li_enc3 = BitAnd(li_char2, 15) * 4 + li_char3 / 64
        li_enc4 = BitAnd(li_char3, 63)

        // Ajustar si hay padding
        if ll_i + 1 > ll_len then
            li_enc3 = 64
            li_enc4 = 64
        elseif ll_i + 2 > ll_len then
            li_enc4 = 64
        end if

        // Construir resultado
        ls_output += Mid(ls_base64chars, li_enc1 + 1, 1)
        ls_output += Mid(ls_base64chars, li_enc2 + 1, 1)
        if li_enc3 = 64 then
            ls_output += "="
        else
            ls_output += Mid(ls_base64chars, li_enc3 + 1, 1)
        end if
        if li_enc4 = 64 then
            ls_output += "="
        else
            ls_output += Mid(ls_base64chars, li_enc4 + 1, 1)
        end if

        ll_i += 3
    loop

    return ls_output


end function

public function integer bitand (integer a, integer b);return Integer(Mod(a / 2 ^ Integer(Log(b)/Log(2)), 2)) * b
end function

public subroutine wf_limpiar ();dw_usuario.reset( )
dw_usuario.insertrow(0)
end subroutine

on w_usuario.create
this.st_2=create st_2
this.cb_3=create cb_3
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_usuario=create dw_usuario
this.gb_1=create gb_1
this.sle_1=create sle_1
this.gb_2=create gb_2
this.Control[]={this.st_2,&
this.cb_3,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.dw_usuario,&
this.gb_1,&
this.sle_1,&
this.gb_2}
end on

on w_usuario.destroy
destroy(this.st_2)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_usuario)
destroy(this.gb_1)
destroy(this.sle_1)
destroy(this.gb_2)
end on

type st_2 from statictext within w_usuario
integer x = 910
integer y = 132
integer width = 1353
integer height = 244
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421376
long backcolor = 67108864
string text = "Prácticas Appeon"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_usuario
integer x = 910
integer y = 988
integer width = 507
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Registrar Usuario"
end type

event clicked;string ls_encrypt, ls_clave
integer li_reg

dw_usuario.accepttext( )

select max(id) into :li_reg from usuario;
ls_clave = dw_usuario.object.clave[1]

SELECT encode(digest(:ls_clave, 'sha256'),'HEX') into: ls_encrypt
	from usuario
	using sqlca;
	
sle_1.text = ls_encrypt
dw_usuario.object.id[1] = li_reg + 1
dw_usuario.object.clave[1] = ls_encrypt

if dw_usuario.update( ) < 0 then
	rollback;
	messagebox("Aviso","No se puedo ingresar el usuario")
else
	commit;
	messagebox("Aviso","Usuario creado exitosamente!")
	wf_limpiar()
end if


end event

type st_1 from statictext within w_usuario
integer x = 338
integer y = 1296
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resultado:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_usuario
integer x = 1888
integer y = 988
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancelar"
end type

type cb_1 from commandbutton within w_usuario
integer x = 1449
integer y = 988
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ingresar"
end type

event clicked;string ls_clave, ls_usuario
string ls_encrypt
integer li_existe

dw_usuario.accepttext( )
ls_usuario = dw_usuario.object.usuario[1]
ls_clave = dw_usuario.object.clave[1]

if lenA(ls_clave) > 0 then
	
	SELECT encode(digest(:ls_clave, 'sha256'),'HEX') into: ls_encrypt
	from usuario
	using sqlca;
	sle_1.text = ls_encrypt

	select count(*) into :li_existe from usuario
	where clave = :ls_encrypt and 
			 usuario = :ls_usuario
	 using sqlca;
	 
	
	if li_existe > 0 then
		messagebox("","Acceso Correcto")
	else
		messagebox("","Usuario no existe")		
	end if
end if
end event

type dw_usuario from datawindow within w_usuario
integer x = 910
integer y = 420
integer width = 1353
integer height = 524
integer taborder = 10
string title = "none"
string dataobject = "d_usuario"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;settransobject(SQLCA)
insertrow(0)
end event

type gb_1 from groupbox within w_usuario
integer x = 846
integer y = 940
integer width = 1504
integer height = 184
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type sle_1 from singlelineedit within w_usuario
integer x = 786
integer y = 1280
integer width = 2350
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_usuario
integer x = 247
integer y = 1152
integer width = 3026
integer height = 364
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

