$PBExportHeader$w_graficos1.srw
forward
global type w_graficos1 from window
end type
type cb_2 from commandbutton within w_graficos1
end type
type cb_1 from commandbutton within w_graficos1
end type
type wb_1 from webbrowser within w_graficos1
end type
end forward

global type w_graficos1 from window
integer width = 4859
integer height = 3032
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
cb_2 cb_2
cb_1 cb_1
wb_1 wb_1
end type
global w_graficos1 w_graficos1

on w_graficos1.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.wb_1=create wb_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.wb_1}
end on

on w_graficos1.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.wb_1)
end on

type cb_2 from commandbutton within w_graficos1
integer x = 736
integer y = 32
integer width = 631
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Gráfico con dos series"
end type

event clicked;String ls_json, ls_html, ls_path, ls_template, ls_insert
Integer li_total, li_fila
String ls_mes, ls_valor, ls_cantidad
Integer li_pos_start, li_pos_end


// Crear y recuperar datos del DataWindow
DataStore ds_ventas
ds_ventas = CREATE DataStore
ds_ventas.DataObject = "d_compras" // Reemplaza con el nombre real de tu DataWindow
ds_ventas.SetTransObject(SQLCA)
ds_ventas.Retrieve()

// Convertir datos a JSON
li_total = ds_ventas.RowCount()
ls_json = "["

FOR li_fila = 1 TO li_total
    ls_mes = ds_ventas.GetItemString(li_fila, "mes")
    ls_valor = String(ds_ventas.GetItemNumber(li_fila, "valor"))
    ls_cantidad = String(ds_ventas.GetItemNumber(li_fila, "cantidad"))	  

    IF li_fila > 1 THEN
        ls_json += ","
    END IF

    ls_json += '{"mes":"' + ls_mes + '", "ventas":' + ls_valor + ', "cantidad":' + ls_cantidad + '}'
NEXT

ls_json += "]"
ls_insert = 'data = ' + ls_json + ';'

// Leer archivo HTML base
Integer li_file
li_file = FileOpen("C:\graficos\graficos2series.html", StreamMode!, Read!, LockRead!)
IF li_file < 1 THEN
    MessageBox("Error", "No se pudo abrir el archivo base HTML.")
    RETURN
END IF

FileRead(li_file, ls_template)
FileClose(li_file)

// Reemplazar sección var data = [...]
li_pos_start = Pos(ls_template, "data = [")
IF li_pos_start > 0 THEN
    li_pos_end = Pos(ls_template, "];", li_pos_start)
    IF li_pos_end > li_pos_start THEN
        ls_html = Left(ls_template, li_pos_start - 1) + ls_insert + Mid(ls_template, li_pos_end + 2)
    ELSE
        MessageBox("Error", "No se encontró el final de los datos en el HTML.")
        RETURN
    END IF
ELSE
    MessageBox("Error", "No se encontró la variable 'data =' en el HTML.")
    RETURN
END IF

// Guardar HTML temporal
ls_path = "C:\graficos\graficos2series.html"
li_file = FileOpen(ls_path, StreamMode!, Write!, LockWrite!, Replace!)
IF li_file < 1 THEN
    MessageBox("Error", "No se pudo escribir el archivo temporal.")
    RETURN
END IF

FileWrite(li_file, ls_html)
FileClose(li_file)

// Cargar en WebBrowser
wb_1.Navigate("file://" + ls_path)

end event

type cb_1 from commandbutton within w_graficos1
integer x = 87
integer y = 32
integer width = 608
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Gráfico con una serie"
end type

event clicked;String ls_json, ls_html, ls_path, ls_template, ls_insert
Integer li_total, li_fila
String ls_mes, ls_valor
Integer li_pos_start, li_pos_end


// Crear y recuperar datos del DataWindow
DataStore ds_ventas
ds_ventas = CREATE DataStore
ds_ventas.DataObject = "d_ventas" // Reemplaza con el nombre real de tu DataWindow
ds_ventas.SetTransObject(SQLCA)
ds_ventas.Retrieve()

// Convertir datos a JSON
li_total = ds_ventas.RowCount()
ls_json = "["

FOR li_fila = 1 TO li_total
    ls_mes = ds_ventas.GetItemString(li_fila, "mes")
    ls_valor = String(ds_ventas.GetItemNumber(li_fila, "valor"))

    IF li_fila > 1 THEN
        ls_json += ","
    END IF

    ls_json += '{"mes":"' + ls_mes + '", "ventas":' + ls_valor + '}'
NEXT

ls_json += "]"
ls_insert = 'data = ' + ls_json + ';'

// Leer archivo HTML base
Integer li_file
li_file = FileOpen("C:\graficos\graficos.html", StreamMode!, Read!, LockRead!)
IF li_file < 1 THEN
    MessageBox("Error", "No se pudo abrir el archivo base HTML.")
    RETURN
END IF

FileRead(li_file, ls_template)
FileClose(li_file)

// Reemplazar sección var data = [...]
li_pos_start = Pos(ls_template, "data = [")
IF li_pos_start > 0 THEN
    li_pos_end = Pos(ls_template, "];", li_pos_start)
    IF li_pos_end > li_pos_start THEN
        ls_html = Left(ls_template, li_pos_start - 1) + ls_insert + Mid(ls_template, li_pos_end + 2)
    ELSE
        MessageBox("Error", "No se encontró el final de los datos en el HTML.")
        RETURN
    END IF
ELSE
    MessageBox("Error", "No se encontró la variable 'data =' en el HTML.")
    RETURN
END IF

// Guardar HTML temporal
ls_path = "C:\graficos\graficos.html"
li_file = FileOpen(ls_path, StreamMode!, Write!, LockWrite!, Replace!)
IF li_file < 1 THEN
    MessageBox("Error", "No se pudo escribir el archivo temporal.")
    RETURN
END IF

FileWrite(li_file, ls_html)
FileClose(li_file)

// Cargar en WebBrowser
wb_1.Navigate("file://" + ls_path)

end event

type wb_1 from webbrowser within w_graficos1
integer x = 87
integer y = 172
integer width = 4251
integer height = 2368
end type

