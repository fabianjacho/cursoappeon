$PBExportHeader$nvo_pdfcontentbyte.sru
forward
global type nvo_pdfcontentbyte from dotnetobject
end type
end forward

global type nvo_pdfcontentbyte from dotnetobject
end type
global nvo_pdfcontentbyte nvo_pdfcontentbyte

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PdfContentByte"

/*      Error types       */
Constant Int SUCCESS        =  0 // No error since latest reset
Constant Int LOAD_FAILURE   = -1 // Failed to load assembly
Constant Int CREATE_FAILURE = -2 // Failed to create .NET object
Constant Int CALL_FAILURE   = -3 // Call to .NET function failed

/* Latest error -- Public reset via of_ResetError */
PRIVATEWRITE Long il_ErrorType   
PRIVATEWRITE Long il_ErrorNumber 
PRIVATEWRITE String is_ErrorText 

PRIVATE:
/*  .NET object creation */
Boolean ib_objectCreated
end variables

forward prototypes
public subroutine of_setassemblyerror (long al_errortype, string as_actiontext, long al_errornumber, string as_errortext)
public subroutine of_reseterror ()
public function boolean of_createondemand ()
public subroutine  of_setrgbcolorstroke(long al_red,long al_green,long al_blue)
public subroutine  of_setcolorstroke(dotnetobject anv_value)
public subroutine  of_setcolorfill(dotnetobject anv_value)
public subroutine  of_setcolorfill(dotnetobject anv_sp,real ar_tint)
public subroutine  of_setcolorfill(dotnetobject anv_dn,real ar_tints[])
public subroutine  of_setcolorfill(dotnetobject anv_lab,real ar_l,real ar_a,real ar_b)
public subroutine  of_setcolorstroke(dotnetobject anv_sp,real ar_tint)
public subroutine  of_setcolorstroke(dotnetobject anv_sp,real ar_tints[])
public subroutine  of_setcolorstroke(dotnetobject anv_lab,real ar_l,real ar_a,real ar_b)
public subroutine  of_setpatternfill(dotnetobject anv_p)
public subroutine  of_setpatternfill(dotnetobject anv_p,dotnetobject anv_color)
public subroutine  of_setpatternfill(dotnetobject anv_p,dotnetobject anv_color,real ar_tint)
public subroutine  of_setpatternstroke(dotnetobject anv_p,dotnetobject anv_color)
public subroutine  of_setpatternstroke(dotnetobject anv_p,dotnetobject anv_color,real ar_tint)
public subroutine  of_setpatternstroke(dotnetobject anv_p)
public subroutine  of_paintshading(dotnetobject anv_shading)
public subroutine  of_paintshading1(dotnetobject anv_shading)
public subroutine  of_setshadingfill(dotnetobject anv_shading)
public subroutine  of_setshadingstroke(dotnetobject anv_shading)
public subroutine  of_showtext(dotnetobject anv_text)
public subroutine  of_localgoto(string as_name,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public function boolean of_localdestination(string as_name,dotnetobject anv_destination)
public function dotnetobject of_getduplicate(boolean abln_inheritgraphicstate)
public subroutine  of_inheritgraphicstate(dotnetobject anv_parentcanvas)
public subroutine  of_remotegoto(string as_filename,string as_name,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_remotegoto(string as_filename,long al_page,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_roundrectangle(real ar_x,real ar_y,real ar_w,real ar_h,real ar_r)
public subroutine  of_roundrectangle(double adb_x,double adb_y,double adb_w,double adb_h,double adb_r)
public subroutine  of_setaction(dotnetobject anv_action,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_setliteral(string as_s)
public subroutine  of_setliteral(char ach_c)
public subroutine  of_setliteral(real ar_n)
public subroutine  of_drawradiofield(real ar_llx,real ar_lly,real ar_urx,real ar_ury,boolean abln_on)
public subroutine  of_drawradiofield(double adb_llx,double adb_lly,double adb_urx,double adb_ury,boolean abln_on)
public subroutine  of_drawtextfield(real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_drawtextfield(double adb_llx,double adb_lly,double adb_urx,double adb_ury)
public subroutine  of_drawbutton(real ar_llx,real ar_lly,real ar_urx,real ar_ury,string as_text,dotnetobject anv_bf,real ar_size)
public subroutine  of_drawbutton(double adb_llx,double adb_lly,double adb_urx,double adb_ury,string as_text,dotnetobject anv_bf,real ar_size)
public subroutine  of_setgstate(dotnetobject anv_gstate)
public subroutine  of_beginlayer(dotnetobject anv_layer)
public subroutine  of_endlayer()
public subroutine  of_addannotation(dotnetobject anv_annot,boolean abln_applyctm)
public subroutine  of_setdefaultcolorspace(dotnetobject anv_name,dotnetobject anv_obj)
public subroutine  of_transform(dotnetobject anv_af)
public subroutine  of_transform1(dotnetobject anv_tx)
public subroutine  of_beginmarkedcontentsequence(dotnetobject anv_struc)
public subroutine  of_beginmarkedcontentsequence(dotnetobject anv_struc,string as_expansion)
public subroutine  of_endmarkedcontentsequence()
public subroutine  of_beginmarkedcontentsequence(dotnetobject anv_tag,dotnetobject anv_property,boolean abln_inline)
public subroutine  of_beginmarkedcontentsequence1(dotnetobject anv_tag)
public subroutine  of_sanitycheck()
public subroutine  of_openmcblock(dotnetobject anv_element)
public subroutine  of_closemcblock(dotnetobject anv_element)
public subroutine  of_addimage(dotnetobject anv_image,real ar_a,real ar_b,real ar_c,real ar_d,real ar_e,real ar_f,boolean abln_inlineimage)
public subroutine  of_addimage(dotnetobject anv_image,double adb_a,double adb_b,double adb_c,double adb_d,double adb_e,double adb_f,boolean abln_inlineimage)
public subroutine  of_reset()
public subroutine  of_reset(boolean abln_validatecontent)
public subroutine  of_begintext()
public subroutine  of_endtext()
public subroutine  of_savestate()
public subroutine  of_restorestate()
public subroutine  of_setcharacterspacing(real ar_value)
public subroutine  of_setwordspacing(real ar_value)
public subroutine  of_sethorizontalscaling(real ar_value)
public subroutine  of_setfontandsize(dotnetobject anv_bf,real ar_size)
public subroutine  of_settextrenderingmode(long al_value)
public subroutine  of_settextrise(real ar_value)
public subroutine  of_settextrise(double adb_value)
public subroutine  of_showtext(string as_text)
public subroutine  of_showtextgid(string as_gids)
public function dotnetobject of_getkernarray(string as_text,dotnetobject anv_font)
public subroutine  of_showtextkerned(string as_text)
public subroutine  of_newlineshowtext(string as_text)
public subroutine  of_newlineshowtext(real ar_wordspacing,real ar_charspacing,string as_text)
public subroutine  of_settextmatrix(real ar_a,real ar_b,real ar_c,real ar_d,real ar_x,real ar_y)
public subroutine  of_settextmatrix(dotnetobject anv_transform)
public subroutine  of_settextmatrix1(dotnetobject anv_transform)
public subroutine  of_settextmatrix(real ar_x,real ar_y)
public subroutine  of_movetext(real ar_x,real ar_y)
public subroutine  of_movetextwithleading(real ar_x,real ar_y)
public subroutine  of_newlinetext()
public subroutine  of_addoutline(dotnetobject anv_outline,string as_name)
public function real of_geteffectivestringwidth(string as_text,boolean abln_kerned)
public subroutine  of_showtextaligned(long al_alignment,string as_text,real ar_x,real ar_y,real ar_rotation)
public subroutine  of_showtextalignedkerned(long al_alignment,string as_text,real ar_x,real ar_y,real ar_rotation)
public subroutine  of_concatctm(real ar_a,real ar_b,real ar_c,real ar_d,real ar_e,real ar_f)
public subroutine  of_concatctm(double adb_a,double adb_b,double adb_c,double adb_d,double adb_e,double adb_f)
public subroutine  of_concatctm(dotnetobject anv_transform)
public subroutine  of_concatctm1(dotnetobject anv_transform)
public function dotnetobject of_bezierarc(real ar_x1,real ar_y1,real ar_x2,real ar_y2,real ar_startang,real ar_extent)
public function dotnetobject of_bezierarc(double adb_x1,double adb_y1,double adb_x2,double adb_y2,double adb_startang,double adb_extent)
public subroutine  of_arc(real ar_x1,real ar_y1,real ar_x2,real ar_y2,real ar_startang,real ar_extent)
public subroutine  of_arc(double adb_x1,double adb_y1,double adb_x2,double adb_y2,double adb_startang,double adb_extent)
public subroutine  of_ellipse(double adb_x1,double adb_y1,double adb_x2,double adb_y2)
public subroutine  of_ellipse(real ar_x1,real ar_y1,real ar_x2,real ar_y2)
public function dotnetobject of_createpattern(real ar_width,real ar_height,real ar_xstep,real ar_ystep)
public function dotnetobject of_createpattern(real ar_width,real ar_height)
public function dotnetobject of_createpattern(real ar_width,real ar_height,real ar_xstep,real ar_ystep,dotnetobject anv_color)
public function dotnetobject of_createpattern(real ar_width,real ar_height,dotnetobject anv_color)
public function dotnetobject of_createtemplate(real ar_width,real ar_height)
public function dotnetobject of_createappearance(real ar_width,real ar_height)
public subroutine  of_addpsxobject(dotnetobject anv_psobject)
public subroutine  of_addtemplate(dotnetobject anv_template,real ar_a,real ar_b,real ar_c,real ar_d,real ar_e,real ar_f)
public subroutine  of_addtemplate(dotnetobject anv_template,double adb_a,double adb_b,double adb_c,double adb_d,double adb_e,double adb_f)
public subroutine  of_addtemplate(dotnetobject anv_template,real ar_a,real ar_b,real ar_c,real ar_d,real ar_e,real ar_f,boolean abln_tagcontent)
public subroutine  of_addtemplate(dotnetobject anv_template,double adb_a,double adb_b,double adb_c,double adb_d,double adb_e,double adb_f,boolean abln_tagcontent)
public subroutine  of_addtemplate(dotnetobject anv_template,double adb_a,double adb_b,double adb_c,double adb_d,double adb_e,double adb_f,boolean abln_tagtemplate,boolean abln_tagcontent)
public function dotnetobject of_addformxobj(dotnetobject anv_formxobj,dotnetobject anv_name,real ar_a,real ar_b,real ar_c,real ar_d,real ar_e,real ar_f)
public function dotnetobject of_addformxobj(dotnetobject anv_formxobj,dotnetobject anv_name,double adb_a,double adb_b,double adb_c,double adb_d,double adb_e,double adb_f)
public subroutine  of_addtemplate(dotnetobject anv_template,dotnetobject anv_transform)
public subroutine  of_addtemplate(dotnetobject anv_template,dotnetobject anv_transform,boolean abln_tagcontent)
public subroutine  of_addtemplate1(dotnetobject anv_template,dotnetobject anv_transform,boolean abln_tagcontent)
public subroutine  of_addtemplate1(dotnetobject anv_template,dotnetobject anv_transform)
public subroutine  of_addtemplate(dotnetobject anv_template,real ar_x,real ar_y)
public subroutine  of_addtemplate(dotnetobject anv_template,double adb_x,double adb_y)
public subroutine  of_addtemplate(dotnetobject anv_template,real ar_x,real ar_y,boolean abln_tagcontent)
public subroutine  of_addtemplate(dotnetobject anv_template,double adb_x,double adb_y,boolean abln_tagcontent)
public subroutine  of_setcmykcolorfill(long al_cyan,long al_magenta,long al_yellow,long al_black)
public subroutine  of_setcmykcolorstroke(long al_cyan,long al_magenta,long al_yellow,long al_black)
public subroutine  of_setrgbcolorfill(long al_red,long al_green,long al_blue)
public function string of_tostring()
public function boolean of_istagged()
public function blob of_topdf(dotnetobject anv_writer)
public subroutine  of_add(dotnetobject anv_other)
public subroutine  of_setleading(real ar_v)
public subroutine  of_setflatness(real ar_value)
public subroutine  of_setflatness(double adb_value)
public subroutine  of_setlinecap(long al_value)
public subroutine  of_setrenderingintent(dotnetobject anv_ri)
public subroutine  of_setlinedash(real ar_value)
public subroutine  of_setlinedash(double adb_value)
public subroutine  of_setlinedash(real ar_unitson,real ar_phase)
public subroutine  of_setlinedash(double adb_unitson,double adb_phase)
public subroutine  of_setlinedash(real ar_unitson,real ar_unitsoff,real ar_phase)
public subroutine  of_setlinedash(double adb_unitson,double adb_unitsoff,double adb_phase)
public subroutine  of_setlinedash(real ar_array[],real ar_phase)
public subroutine  of_setlinedash(double adb_array[],double adb_phase)
public subroutine  of_setlinejoin(long al_value)
public subroutine  of_setlinewidth(real ar_value)
public subroutine  of_setlinewidth(double adb_value)
public subroutine  of_setmiterlimit(real ar_value)
public subroutine  of_setmiterlimit(double adb_value)
public subroutine  of_clip()
public subroutine  of_eoclip()
public subroutine  of_setgrayfill(real ar_value)
public subroutine  of_resetgrayfill()
public subroutine  of_setgraystroke(real ar_value)
public subroutine  of_resetgraystroke()
public subroutine  of_setrgbcolorfillf(real ar_red,real ar_green,real ar_blue)
public subroutine  of_resetrgbcolorfill()
public subroutine  of_setrgbcolorstrokef(real ar_red,real ar_green,real ar_blue)
public subroutine  of_resetrgbcolorstroke()
public subroutine  of_setcmykcolorfillf(real ar_cyan,real ar_magenta,real ar_yellow,real ar_black)
public subroutine  of_resetcmykcolorfill()
public subroutine  of_setcmykcolorstrokef(real ar_cyan,real ar_magenta,real ar_yellow,real ar_black)
public subroutine  of_resetcmykcolorstroke()
public subroutine  of_moveto(real ar_x,real ar_y)
public subroutine  of_moveto(double adb_x,double adb_y)
public subroutine  of_lineto(real ar_x,real ar_y)
public subroutine  of_lineto(double adb_x,double adb_y)
public subroutine  of_curveto(real ar_x1,real ar_y1,real ar_x2,real ar_y2,real ar_x3,real ar_y3)
public subroutine  of_curveto(double adb_x1,double adb_y1,double adb_x2,double adb_y2,double adb_x3,double adb_y3)
public subroutine  of_curveto(real ar_x2,real ar_y2,real ar_x3,real ar_y3)
public subroutine  of_curveto(double adb_x2,double adb_y2,double adb_x3,double adb_y3)
public subroutine  of_curvefromto(real ar_x1,real ar_y1,real ar_x3,real ar_y3)
public subroutine  of_curvefromto(double adb_x1,double adb_y1,double adb_x3,double adb_y3)
public subroutine  of_circle(real ar_x,real ar_y,real ar_r)
public subroutine  of_circle(double adb_x,double adb_y,double adb_r)
public subroutine  of_rectangle(real ar_x,real ar_y,real ar_w,real ar_h)
public subroutine  of_rectangle(double adb_x,double adb_y,double adb_w,double adb_h)
public subroutine  of_variablerectangle(dotnetobject anv_rect)
public subroutine  of_rectangle(dotnetobject anv_rectangle)
public subroutine  of_closepath()
public subroutine  of_newpath()
public subroutine  of_stroke()
public subroutine  of_closepathstroke()
public subroutine  of_fill()
public subroutine  of_eofill()
public subroutine  of_fillstroke()
public subroutine  of_closepathfillstroke()
public subroutine  of_eofillstroke()
public subroutine  of_closepatheofillstroke()
public subroutine  of_addimage(dotnetobject anv_image)
public subroutine  of_addimage(dotnetobject anv_image,boolean abln_inlineimage)
public subroutine  of_addimage(dotnetobject anv_image,real ar_a,real ar_b,real ar_c,real ar_d,real ar_e,real ar_f)
public subroutine  of_addimage(dotnetobject anv_image,double adb_a,double adb_b,double adb_c,double adb_d,double adb_e,double adb_f)
public subroutine  of_addimage(dotnetobject anv_image,dotnetobject anv_transform)
public subroutine  of_addimage1(dotnetobject anv_image,dotnetobject anv_transform)
public function boolean get_suppresstagging()
public subroutine  set_suppresstagging(boolean abln_value)
public function dotnetobject get_internalbuffer()
public function real get_xtlm()
public function real get_ytlm()
public function real get_characterspacing()
public function real get_wordspacing()
public function real get_horizontalscaling()
public function real get_leading()
public function dotnetobject get_rootoutline()
public function dotnetobject get_pdfwriter()
public function dotnetobject get_pdfdocument()
public function dotnetobject get_duplicate()
end prototypes

public subroutine of_setassemblyerror (long al_errortype, string as_actiontext, long al_errornumber, string as_errortext);
//*----------------------------------------------------------------------------------------------*/
//* PRIVATE of_setAssemblyError
//* Sets error description for specified error condition report by an assembly function
//*
//* Error description layout
//* 		| <actionText> failed.<EOL>
//* 		| Error Number: <errorNumber><EOL>
//* 		| Error Text: <errorText> (*)
//*  (*): Line skipped when <ErrorText> is empty
//*----------------------------------------------------------------------------------------------*/

/*    Format description */
String ls_error
ls_error = as_actionText + " failed.~r~n"
ls_error += "Error Number: " + String(al_errorNumber) + "."
If Len(Trim(as_errorText)) > 0 Then
	ls_error += "~r~nError Text: " + as_errorText
End If

/*  Retain state in instance variables */
This.il_ErrorType = al_errorType
This.is_ErrorText = ls_error
This.il_ErrorNumber = al_errorNumber
end subroutine

public subroutine of_reseterror ();
//*--------------------------------------------*/
//* PUBLIC of_ResetError
//* Clears previously registered error
//*--------------------------------------------*/

This.il_ErrorType = This.SUCCESS
This.is_ErrorText = ''
This.il_ErrorNumber = 0
end subroutine

public function boolean of_createondemand ();
//*--------------------------------------------------------------*/
//*  PUBLIC   of_createOnDemand( )
//*  Return   True:  .NET object created
//*               False: Failed to create .NET object
//*  Loads .NET assembly and creates instance of .NET class.
//*  Uses .NET when loading .NET assembly.
//*  Signals error If an error occurs.
//*  Resets any prior error when load + create succeeds.
//*--------------------------------------------------------------*/

This.of_ResetError( )
If This.ib_objectCreated Then Return True // Already created => DONE

Long ll_status 
String ls_action

/* Load assembly using .NET */
ls_action = 'Load ' + This.is_AssemblyPath
DotNetAssembly lnv_assembly
lnv_assembly = Create DotNetAssembly
ll_status = lnv_assembly.LoadWithDotNet(This.is_AssemblyPath)

/* Abort when load fails */
If ll_status <> 1 Then
	This.of_SetAssemblyError(This.LOAD_FAILURE, ls_action, ll_status, lnv_assembly.ErrorText)
	Return False // Load failed => ABORT
End If

/*   Create .NET object */
ls_action = 'Create ' + This.is_ClassName
ll_status = lnv_assembly.CreateInstance(is_ClassName, This)

/* Abort when create fails */
If ll_status <> 1 Then
	This.of_SetAssemblyError(This.CREATE_FAILURE, ls_action, ll_status, lnv_assembly.ErrorText)
	Return False // Load failed => ABORT
End If

This.ib_objectCreated = True
Return True
end function

public subroutine  of_setrgbcolorstroke(long al_red,long al_green,long al_blue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetRGBColorStroke
//*   Argument:
//*              Long al_red
//*              Long al_green
//*              Long al_blue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setrgbcolorstroke(al_red,al_green,al_blue)
end subroutine

public subroutine  of_setcolorstroke(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetColorStroke
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcolorstroke(anv_value)
end subroutine

public subroutine  of_setcolorfill(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetColorFill
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcolorfill(anv_value)
end subroutine

public subroutine  of_setcolorfill(dotnetobject anv_sp,real ar_tint);
//*-----------------------------------------------------------------*/
//*  .NET function : SetColorFill
//*   Argument:
//*              Dotnetobject anv_sp
//*              Real ar_tint
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcolorfill(anv_sp,ar_tint)
end subroutine

public subroutine  of_setcolorfill(dotnetobject anv_dn,real ar_tints[]);
//*-----------------------------------------------------------------*/
//*  .NET function : SetColorFill
//*   Argument:
//*              Dotnetobject anv_dn
//*              Real ar_tints[]
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcolorfill(anv_dn,ar_tints)
end subroutine

public subroutine  of_setcolorfill(dotnetobject anv_lab,real ar_l,real ar_a,real ar_b);
//*-----------------------------------------------------------------*/
//*  .NET function : SetColorFill
//*   Argument:
//*              Dotnetobject anv_lab
//*              Real ar_l
//*              Real ar_a
//*              Real ar_b
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcolorfill(anv_lab,ar_l,ar_a,ar_b)
end subroutine

public subroutine  of_setcolorstroke(dotnetobject anv_sp,real ar_tint);
//*-----------------------------------------------------------------*/
//*  .NET function : SetColorStroke
//*   Argument:
//*              Dotnetobject anv_sp
//*              Real ar_tint
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcolorstroke(anv_sp,ar_tint)
end subroutine

public subroutine  of_setcolorstroke(dotnetobject anv_sp,real ar_tints[]);
//*-----------------------------------------------------------------*/
//*  .NET function : SetColorStroke
//*   Argument:
//*              Dotnetobject anv_sp
//*              Real ar_tints[]
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcolorstroke(anv_sp,ar_tints)
end subroutine

public subroutine  of_setcolorstroke(dotnetobject anv_lab,real ar_l,real ar_a,real ar_b);
//*-----------------------------------------------------------------*/
//*  .NET function : SetColorStroke
//*   Argument:
//*              Dotnetobject anv_lab
//*              Real ar_l
//*              Real ar_a
//*              Real ar_b
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcolorstroke(anv_lab,ar_l,ar_a,ar_b)
end subroutine

public subroutine  of_setpatternfill(dotnetobject anv_p);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPatternFill
//*   Argument:
//*              Dotnetobject anv_p
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpatternfill(anv_p)
end subroutine

public subroutine  of_setpatternfill(dotnetobject anv_p,dotnetobject anv_color);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPatternFill
//*   Argument:
//*              Dotnetobject anv_p
//*              Dotnetobject anv_color
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpatternfill(anv_p,anv_color)
end subroutine

public subroutine  of_setpatternfill(dotnetobject anv_p,dotnetobject anv_color,real ar_tint);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPatternFill
//*   Argument:
//*              Dotnetobject anv_p
//*              Dotnetobject anv_color
//*              Real ar_tint
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpatternfill(anv_p,anv_color,ar_tint)
end subroutine

public subroutine  of_setpatternstroke(dotnetobject anv_p,dotnetobject anv_color);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPatternStroke
//*   Argument:
//*              Dotnetobject anv_p
//*              Dotnetobject anv_color
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpatternstroke(anv_p,anv_color)
end subroutine

public subroutine  of_setpatternstroke(dotnetobject anv_p,dotnetobject anv_color,real ar_tint);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPatternStroke
//*   Argument:
//*              Dotnetobject anv_p
//*              Dotnetobject anv_color
//*              Real ar_tint
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpatternstroke(anv_p,anv_color,ar_tint)
end subroutine

public subroutine  of_setpatternstroke(dotnetobject anv_p);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPatternStroke
//*   Argument:
//*              Dotnetobject anv_p
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpatternstroke(anv_p)
end subroutine

public subroutine  of_paintshading(dotnetobject anv_shading);
//*-----------------------------------------------------------------*/
//*  .NET function : PaintShading
//*   Argument:
//*              Dotnetobject anv_shading
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.paintshading(anv_shading)
end subroutine

public subroutine  of_paintshading1(dotnetobject anv_shading);
//*-----------------------------------------------------------------*/
//*  .NET function : PaintShading
//*   Argument:
//*              Dotnetobject anv_shading
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.paintshading(anv_shading)
end subroutine

public subroutine  of_setshadingfill(dotnetobject anv_shading);
//*-----------------------------------------------------------------*/
//*  .NET function : SetShadingFill
//*   Argument:
//*              Dotnetobject anv_shading
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setshadingfill(anv_shading)
end subroutine

public subroutine  of_setshadingstroke(dotnetobject anv_shading);
//*-----------------------------------------------------------------*/
//*  .NET function : SetShadingStroke
//*   Argument:
//*              Dotnetobject anv_shading
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setshadingstroke(anv_shading)
end subroutine

public subroutine  of_showtext(dotnetobject anv_text);
//*-----------------------------------------------------------------*/
//*  .NET function : ShowText
//*   Argument:
//*              Dotnetobject anv_text
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.showtext(anv_text)
end subroutine

public subroutine  of_localgoto(string as_name,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : LocalGoto
//*   Argument:
//*              String as_name
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.localgoto(as_name,ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public function boolean of_localdestination(string as_name,dotnetobject anv_destination);
//*-----------------------------------------------------------------*/
//*  .NET function : LocalDestination
//*   Argument:
//*              String as_name
//*              Dotnetobject anv_destination
//*   Return : Boolean
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Boolean lbln_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lbln_result)
	Return lbln_result
End If

/* Trigger the dotnet function */
lbln_result = This.localdestination(as_name,anv_destination)
Return lbln_result
end function

public function dotnetobject of_getduplicate(boolean abln_inheritgraphicstate);
//*-----------------------------------------------------------------*/
//*  .NET function : GetDuplicate
//*   Argument:
//*              Boolean abln_inheritgraphicstate
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet function */
lnv_result = This.getduplicate(abln_inheritgraphicstate)
Return lnv_result
end function

public subroutine  of_inheritgraphicstate(dotnetobject anv_parentcanvas);
//*-----------------------------------------------------------------*/
//*  .NET function : InheritGraphicState
//*   Argument:
//*              Dotnetobject anv_parentcanvas
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.inheritgraphicstate(anv_parentcanvas)
end subroutine

public subroutine  of_remotegoto(string as_filename,string as_name,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : RemoteGoto
//*   Argument:
//*              String as_filename
//*              String as_name
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.remotegoto(as_filename,as_name,ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public subroutine  of_remotegoto(string as_filename,long al_page,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : RemoteGoto
//*   Argument:
//*              String as_filename
//*              Long al_page
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.remotegoto(as_filename,al_page,ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public subroutine  of_roundrectangle(real ar_x,real ar_y,real ar_w,real ar_h,real ar_r);
//*-----------------------------------------------------------------*/
//*  .NET function : RoundRectangle
//*   Argument:
//*              Real ar_x
//*              Real ar_y
//*              Real ar_w
//*              Real ar_h
//*              Real ar_r
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.roundrectangle(ar_x,ar_y,ar_w,ar_h,ar_r)
end subroutine

public subroutine  of_roundrectangle(double adb_x,double adb_y,double adb_w,double adb_h,double adb_r);
//*-----------------------------------------------------------------*/
//*  .NET function : RoundRectangle
//*   Argument:
//*              Double adb_x
//*              Double adb_y
//*              Double adb_w
//*              Double adb_h
//*              Double adb_r
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.roundrectangle(adb_x,adb_y,adb_w,adb_h,adb_r)
end subroutine

public subroutine  of_setaction(dotnetobject anv_action,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAction
//*   Argument:
//*              Dotnetobject anv_action
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setaction(anv_action,ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public subroutine  of_setliteral(string as_s);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLiteral
//*   Argument:
//*              String as_s
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setliteral(as_s)
end subroutine

public subroutine  of_setliteral(char ach_c);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLiteral
//*   Argument:
//*              Char ach_c
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setliteral(ref ach_c)
end subroutine

public subroutine  of_setliteral(real ar_n);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLiteral
//*   Argument:
//*              Real ar_n
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setliteral(ar_n)
end subroutine

public subroutine  of_drawradiofield(real ar_llx,real ar_lly,real ar_urx,real ar_ury,boolean abln_on);
//*-----------------------------------------------------------------*/
//*  .NET function : DrawRadioField
//*   Argument:
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*              Boolean abln_on
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.drawradiofield(ar_llx,ar_lly,ar_urx,ar_ury,abln_on)
end subroutine

public subroutine  of_drawradiofield(double adb_llx,double adb_lly,double adb_urx,double adb_ury,boolean abln_on);
//*-----------------------------------------------------------------*/
//*  .NET function : DrawRadioField
//*   Argument:
//*              Double adb_llx
//*              Double adb_lly
//*              Double adb_urx
//*              Double adb_ury
//*              Boolean abln_on
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.drawradiofield(adb_llx,adb_lly,adb_urx,adb_ury,abln_on)
end subroutine

public subroutine  of_drawtextfield(real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : DrawTextField
//*   Argument:
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.drawtextfield(ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public subroutine  of_drawtextfield(double adb_llx,double adb_lly,double adb_urx,double adb_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : DrawTextField
//*   Argument:
//*              Double adb_llx
//*              Double adb_lly
//*              Double adb_urx
//*              Double adb_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.drawtextfield(adb_llx,adb_lly,adb_urx,adb_ury)
end subroutine

public subroutine  of_drawbutton(real ar_llx,real ar_lly,real ar_urx,real ar_ury,string as_text,dotnetobject anv_bf,real ar_size);
//*-----------------------------------------------------------------*/
//*  .NET function : DrawButton
//*   Argument:
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*              String as_text
//*              Dotnetobject anv_bf
//*              Real ar_size
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.drawbutton(ar_llx,ar_lly,ar_urx,ar_ury,as_text,anv_bf,ar_size)
end subroutine

public subroutine  of_drawbutton(double adb_llx,double adb_lly,double adb_urx,double adb_ury,string as_text,dotnetobject anv_bf,real ar_size);
//*-----------------------------------------------------------------*/
//*  .NET function : DrawButton
//*   Argument:
//*              Double adb_llx
//*              Double adb_lly
//*              Double adb_urx
//*              Double adb_ury
//*              String as_text
//*              Dotnetobject anv_bf
//*              Real ar_size
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.drawbutton(adb_llx,adb_lly,adb_urx,adb_ury,as_text,anv_bf,ar_size)
end subroutine

public subroutine  of_setgstate(dotnetobject anv_gstate);
//*-----------------------------------------------------------------*/
//*  .NET function : SetGState
//*   Argument:
//*              Dotnetobject anv_gstate
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setgstate(anv_gstate)
end subroutine

public subroutine  of_beginlayer(dotnetobject anv_layer);
//*-----------------------------------------------------------------*/
//*  .NET function : BeginLayer
//*   Argument:
//*              Dotnetobject anv_layer
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.beginlayer(anv_layer)
end subroutine

public subroutine  of_endlayer();
//*-----------------------------------------------------------------*/
//*  .NET function : EndLayer
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.endlayer()
end subroutine

public subroutine  of_addannotation(dotnetobject anv_annot,boolean abln_applyctm);
//*-----------------------------------------------------------------*/
//*  .NET function : AddAnnotation
//*   Argument:
//*              Dotnetobject anv_annot
//*              Boolean abln_applyctm
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addannotation(anv_annot,abln_applyctm)
end subroutine

public subroutine  of_setdefaultcolorspace(dotnetobject anv_name,dotnetobject anv_obj);
//*-----------------------------------------------------------------*/
//*  .NET function : SetDefaultColorspace
//*   Argument:
//*              Dotnetobject anv_name
//*              Dotnetobject anv_obj
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setdefaultcolorspace(anv_name,anv_obj)
end subroutine

public subroutine  of_transform(dotnetobject anv_af);
//*-----------------------------------------------------------------*/
//*  .NET function : Transform
//*   Argument:
//*              Dotnetobject anv_af
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.transform(anv_af)
end subroutine

public subroutine  of_transform1(dotnetobject anv_tx);
//*-----------------------------------------------------------------*/
//*  .NET function : Transform
//*   Argument:
//*              Dotnetobject anv_tx
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.transform(anv_tx)
end subroutine

public subroutine  of_beginmarkedcontentsequence(dotnetobject anv_struc);
//*-----------------------------------------------------------------*/
//*  .NET function : BeginMarkedContentSequence
//*   Argument:
//*              Dotnetobject anv_struc
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.beginmarkedcontentsequence(anv_struc)
end subroutine

public subroutine  of_beginmarkedcontentsequence(dotnetobject anv_struc,string as_expansion);
//*-----------------------------------------------------------------*/
//*  .NET function : BeginMarkedContentSequence
//*   Argument:
//*              Dotnetobject anv_struc
//*              String as_expansion
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.beginmarkedcontentsequence(anv_struc,as_expansion)
end subroutine

public subroutine  of_endmarkedcontentsequence();
//*-----------------------------------------------------------------*/
//*  .NET function : EndMarkedContentSequence
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.endmarkedcontentsequence()
end subroutine

public subroutine  of_beginmarkedcontentsequence(dotnetobject anv_tag,dotnetobject anv_property,boolean abln_inline);
//*-----------------------------------------------------------------*/
//*  .NET function : BeginMarkedContentSequence
//*   Argument:
//*              Dotnetobject anv_tag
//*              Dotnetobject anv_property
//*              Boolean abln_inline
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.beginmarkedcontentsequence(anv_tag,anv_property,abln_inline)
end subroutine

public subroutine  of_beginmarkedcontentsequence1(dotnetobject anv_tag);
//*-----------------------------------------------------------------*/
//*  .NET function : BeginMarkedContentSequence
//*   Argument:
//*              Dotnetobject anv_tag
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.beginmarkedcontentsequence(anv_tag)
end subroutine

public subroutine  of_sanitycheck();
//*-----------------------------------------------------------------*/
//*  .NET function : SanityCheck
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.sanitycheck()
end subroutine

public subroutine  of_openmcblock(dotnetobject anv_element);
//*-----------------------------------------------------------------*/
//*  .NET function : OpenMCBlock
//*   Argument:
//*              Dotnetobject anv_element
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.openmcblock(anv_element)
end subroutine

public subroutine  of_closemcblock(dotnetobject anv_element);
//*-----------------------------------------------------------------*/
//*  .NET function : CloseMCBlock
//*   Argument:
//*              Dotnetobject anv_element
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.closemcblock(anv_element)
end subroutine

public subroutine  of_addimage(dotnetobject anv_image,real ar_a,real ar_b,real ar_c,real ar_d,real ar_e,real ar_f,boolean abln_inlineimage);
//*-----------------------------------------------------------------*/
//*  .NET function : AddImage
//*   Argument:
//*              Dotnetobject anv_image
//*              Real ar_a
//*              Real ar_b
//*              Real ar_c
//*              Real ar_d
//*              Real ar_e
//*              Real ar_f
//*              Boolean abln_inlineimage
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addimage(anv_image,ar_a,ar_b,ar_c,ar_d,ar_e,ar_f,abln_inlineimage)
end subroutine

public subroutine  of_addimage(dotnetobject anv_image,double adb_a,double adb_b,double adb_c,double adb_d,double adb_e,double adb_f,boolean abln_inlineimage);
//*-----------------------------------------------------------------*/
//*  .NET function : AddImage
//*   Argument:
//*              Dotnetobject anv_image
//*              Double adb_a
//*              Double adb_b
//*              Double adb_c
//*              Double adb_d
//*              Double adb_e
//*              Double adb_f
//*              Boolean abln_inlineimage
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addimage(anv_image,adb_a,adb_b,adb_c,adb_d,adb_e,adb_f,abln_inlineimage)
end subroutine

public subroutine  of_reset();
//*-----------------------------------------------------------------*/
//*  .NET function : Reset
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.reset()
end subroutine

public subroutine  of_reset(boolean abln_validatecontent);
//*-----------------------------------------------------------------*/
//*  .NET function : Reset
//*   Argument:
//*              Boolean abln_validatecontent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.reset(abln_validatecontent)
end subroutine

public subroutine  of_begintext();
//*-----------------------------------------------------------------*/
//*  .NET function : BeginText
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.begintext()
end subroutine

public subroutine  of_endtext();
//*-----------------------------------------------------------------*/
//*  .NET function : EndText
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.endtext()
end subroutine

public subroutine  of_savestate();
//*-----------------------------------------------------------------*/
//*  .NET function : SaveState
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.savestate()
end subroutine

public subroutine  of_restorestate();
//*-----------------------------------------------------------------*/
//*  .NET function : RestoreState
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.restorestate()
end subroutine

public subroutine  of_setcharacterspacing(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetCharacterSpacing
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcharacterspacing(ar_value)
end subroutine

public subroutine  of_setwordspacing(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetWordSpacing
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setwordspacing(ar_value)
end subroutine

public subroutine  of_sethorizontalscaling(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetHorizontalScaling
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.sethorizontalscaling(ar_value)
end subroutine

public subroutine  of_setfontandsize(dotnetobject anv_bf,real ar_size);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFontAndSize
//*   Argument:
//*              Dotnetobject anv_bf
//*              Real ar_size
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setfontandsize(anv_bf,ar_size)
end subroutine

public subroutine  of_settextrenderingmode(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTextRenderingMode
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settextrenderingmode(al_value)
end subroutine

public subroutine  of_settextrise(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTextRise
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settextrise(ar_value)
end subroutine

public subroutine  of_settextrise(double adb_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTextRise
//*   Argument:
//*              Double adb_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settextrise(adb_value)
end subroutine

public subroutine  of_showtext(string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : ShowText
//*   Argument:
//*              String as_text
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.showtext(as_text)
end subroutine

public subroutine  of_showtextgid(string as_gids);
//*-----------------------------------------------------------------*/
//*  .NET function : ShowTextGid
//*   Argument:
//*              String as_gids
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.showtextgid(as_gids)
end subroutine

public function dotnetobject of_getkernarray(string as_text,dotnetobject anv_font);
//*-----------------------------------------------------------------*/
//*  .NET function : GetKernArray
//*   Argument:
//*              String as_text
//*              Dotnetobject anv_font
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet function */
lnv_result = This.getkernarray(as_text,anv_font)
Return lnv_result
end function

public subroutine  of_showtextkerned(string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : ShowTextKerned
//*   Argument:
//*              String as_text
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.showtextkerned(as_text)
end subroutine

public subroutine  of_newlineshowtext(string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : NewlineShowText
//*   Argument:
//*              String as_text
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.newlineshowtext(as_text)
end subroutine

public subroutine  of_newlineshowtext(real ar_wordspacing,real ar_charspacing,string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : NewlineShowText
//*   Argument:
//*              Real ar_wordspacing
//*              Real ar_charspacing
//*              String as_text
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.newlineshowtext(ar_wordspacing,ar_charspacing,as_text)
end subroutine

public subroutine  of_settextmatrix(real ar_a,real ar_b,real ar_c,real ar_d,real ar_x,real ar_y);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTextMatrix
//*   Argument:
//*              Real ar_a
//*              Real ar_b
//*              Real ar_c
//*              Real ar_d
//*              Real ar_x
//*              Real ar_y
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settextmatrix(ar_a,ar_b,ar_c,ar_d,ar_x,ar_y)
end subroutine

public subroutine  of_settextmatrix(dotnetobject anv_transform);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTextMatrix
//*   Argument:
//*              Dotnetobject anv_transform
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settextmatrix(anv_transform)
end subroutine

public subroutine  of_settextmatrix1(dotnetobject anv_transform);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTextMatrix
//*   Argument:
//*              Dotnetobject anv_transform
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settextmatrix(anv_transform)
end subroutine

public subroutine  of_settextmatrix(real ar_x,real ar_y);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTextMatrix
//*   Argument:
//*              Real ar_x
//*              Real ar_y
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settextmatrix(ar_x,ar_y)
end subroutine

public subroutine  of_movetext(real ar_x,real ar_y);
//*-----------------------------------------------------------------*/
//*  .NET function : MoveText
//*   Argument:
//*              Real ar_x
//*              Real ar_y
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.movetext(ar_x,ar_y)
end subroutine

public subroutine  of_movetextwithleading(real ar_x,real ar_y);
//*-----------------------------------------------------------------*/
//*  .NET function : MoveTextWithLeading
//*   Argument:
//*              Real ar_x
//*              Real ar_y
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.movetextwithleading(ar_x,ar_y)
end subroutine

public subroutine  of_newlinetext();
//*-----------------------------------------------------------------*/
//*  .NET function : NewlineText
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.newlinetext()
end subroutine

public subroutine  of_addoutline(dotnetobject anv_outline,string as_name);
//*-----------------------------------------------------------------*/
//*  .NET function : AddOutline
//*   Argument:
//*              Dotnetobject anv_outline
//*              String as_name
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addoutline(anv_outline,as_name)
end subroutine

public function real of_geteffectivestringwidth(string as_text,boolean abln_kerned);
//*-----------------------------------------------------------------*/
//*  .NET function : GetEffectiveStringWidth
//*   Argument:
//*              String as_text
//*              Boolean abln_kerned
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.geteffectivestringwidth(as_text,abln_kerned)
Return lr_result
end function

public subroutine  of_showtextaligned(long al_alignment,string as_text,real ar_x,real ar_y,real ar_rotation);
//*-----------------------------------------------------------------*/
//*  .NET function : ShowTextAligned
//*   Argument:
//*              Long al_alignment
//*              String as_text
//*              Real ar_x
//*              Real ar_y
//*              Real ar_rotation
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.showtextaligned(al_alignment,as_text,ar_x,ar_y,ar_rotation)
end subroutine

public subroutine  of_showtextalignedkerned(long al_alignment,string as_text,real ar_x,real ar_y,real ar_rotation);
//*-----------------------------------------------------------------*/
//*  .NET function : ShowTextAlignedKerned
//*   Argument:
//*              Long al_alignment
//*              String as_text
//*              Real ar_x
//*              Real ar_y
//*              Real ar_rotation
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.showtextalignedkerned(al_alignment,as_text,ar_x,ar_y,ar_rotation)
end subroutine

public subroutine  of_concatctm(real ar_a,real ar_b,real ar_c,real ar_d,real ar_e,real ar_f);
//*-----------------------------------------------------------------*/
//*  .NET function : ConcatCTM
//*   Argument:
//*              Real ar_a
//*              Real ar_b
//*              Real ar_c
//*              Real ar_d
//*              Real ar_e
//*              Real ar_f
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.concatctm(ar_a,ar_b,ar_c,ar_d,ar_e,ar_f)
end subroutine

public subroutine  of_concatctm(double adb_a,double adb_b,double adb_c,double adb_d,double adb_e,double adb_f);
//*-----------------------------------------------------------------*/
//*  .NET function : ConcatCTM
//*   Argument:
//*              Double adb_a
//*              Double adb_b
//*              Double adb_c
//*              Double adb_d
//*              Double adb_e
//*              Double adb_f
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.concatctm(adb_a,adb_b,adb_c,adb_d,adb_e,adb_f)
end subroutine

public subroutine  of_concatctm(dotnetobject anv_transform);
//*-----------------------------------------------------------------*/
//*  .NET function : ConcatCTM
//*   Argument:
//*              Dotnetobject anv_transform
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.concatctm(anv_transform)
end subroutine

public subroutine  of_concatctm1(dotnetobject anv_transform);
//*-----------------------------------------------------------------*/
//*  .NET function : ConcatCTM
//*   Argument:
//*              Dotnetobject anv_transform
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.concatctm(anv_transform)
end subroutine

public function dotnetobject of_bezierarc(real ar_x1,real ar_y1,real ar_x2,real ar_y2,real ar_startang,real ar_extent);
//*-----------------------------------------------------------------*/
//*  .NET function : BezierArc
//*   Argument:
//*              Real ar_x1
//*              Real ar_y1
//*              Real ar_x2
//*              Real ar_y2
//*              Real ar_startang
//*              Real ar_extent
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet function */
lnv_result = This.bezierarc(ar_x1,ar_y1,ar_x2,ar_y2,ar_startang,ar_extent)
Return lnv_result
end function

public function dotnetobject of_bezierarc(double adb_x1,double adb_y1,double adb_x2,double adb_y2,double adb_startang,double adb_extent);
//*-----------------------------------------------------------------*/
//*  .NET function : BezierArc
//*   Argument:
//*              Double adb_x1
//*              Double adb_y1
//*              Double adb_x2
//*              Double adb_y2
//*              Double adb_startang
//*              Double adb_extent
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet function */
lnv_result = This.bezierarc(adb_x1,adb_y1,adb_x2,adb_y2,adb_startang,adb_extent)
Return lnv_result
end function

public subroutine  of_arc(real ar_x1,real ar_y1,real ar_x2,real ar_y2,real ar_startang,real ar_extent);
//*-----------------------------------------------------------------*/
//*  .NET function : Arc
//*   Argument:
//*              Real ar_x1
//*              Real ar_y1
//*              Real ar_x2
//*              Real ar_y2
//*              Real ar_startang
//*              Real ar_extent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.arc(ar_x1,ar_y1,ar_x2,ar_y2,ar_startang,ar_extent)
end subroutine

public subroutine  of_arc(double adb_x1,double adb_y1,double adb_x2,double adb_y2,double adb_startang,double adb_extent);
//*-----------------------------------------------------------------*/
//*  .NET function : Arc
//*   Argument:
//*              Double adb_x1
//*              Double adb_y1
//*              Double adb_x2
//*              Double adb_y2
//*              Double adb_startang
//*              Double adb_extent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.arc(adb_x1,adb_y1,adb_x2,adb_y2,adb_startang,adb_extent)
end subroutine

public subroutine  of_ellipse(double adb_x1,double adb_y1,double adb_x2,double adb_y2);
//*-----------------------------------------------------------------*/
//*  .NET function : Ellipse
//*   Argument:
//*              Double adb_x1
//*              Double adb_y1
//*              Double adb_x2
//*              Double adb_y2
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.ellipse(adb_x1,adb_y1,adb_x2,adb_y2)
end subroutine

public subroutine  of_ellipse(real ar_x1,real ar_y1,real ar_x2,real ar_y2);
//*-----------------------------------------------------------------*/
//*  .NET function : Ellipse
//*   Argument:
//*              Real ar_x1
//*              Real ar_y1
//*              Real ar_x2
//*              Real ar_y2
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.ellipse(ar_x1,ar_y1,ar_x2,ar_y2)
end subroutine

public function dotnetobject of_createpattern(real ar_width,real ar_height,real ar_xstep,real ar_ystep);
//*-----------------------------------------------------------------*/
//*  .NET function : CreatePattern
//*   Argument:
//*              Real ar_width
//*              Real ar_height
//*              Real ar_xstep
//*              Real ar_ystep
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet function */
lnv_result = This.createpattern(ar_width,ar_height,ar_xstep,ar_ystep)
Return lnv_result
end function

public function dotnetobject of_createpattern(real ar_width,real ar_height);
//*-----------------------------------------------------------------*/
//*  .NET function : CreatePattern
//*   Argument:
//*              Real ar_width
//*              Real ar_height
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet function */
lnv_result = This.createpattern(ar_width,ar_height)
Return lnv_result
end function

public function dotnetobject of_createpattern(real ar_width,real ar_height,real ar_xstep,real ar_ystep,dotnetobject anv_color);
//*-----------------------------------------------------------------*/
//*  .NET function : CreatePattern
//*   Argument:
//*              Real ar_width
//*              Real ar_height
//*              Real ar_xstep
//*              Real ar_ystep
//*              Dotnetobject anv_color
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet function */
lnv_result = This.createpattern(ar_width,ar_height,ar_xstep,ar_ystep,anv_color)
Return lnv_result
end function

public function dotnetobject of_createpattern(real ar_width,real ar_height,dotnetobject anv_color);
//*-----------------------------------------------------------------*/
//*  .NET function : CreatePattern
//*   Argument:
//*              Real ar_width
//*              Real ar_height
//*              Dotnetobject anv_color
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet function */
lnv_result = This.createpattern(ar_width,ar_height,anv_color)
Return lnv_result
end function

public function dotnetobject of_createtemplate(real ar_width,real ar_height);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateTemplate
//*   Argument:
//*              Real ar_width
//*              Real ar_height
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet function */
lnv_result = This.createtemplate(ar_width,ar_height)
Return lnv_result
end function

public function dotnetobject of_createappearance(real ar_width,real ar_height);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateAppearance
//*   Argument:
//*              Real ar_width
//*              Real ar_height
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet function */
lnv_result = This.createappearance(ar_width,ar_height)
Return lnv_result
end function

public subroutine  of_addpsxobject(dotnetobject anv_psobject);
//*-----------------------------------------------------------------*/
//*  .NET function : AddPSXObject
//*   Argument:
//*              Dotnetobject anv_psobject
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addpsxobject(anv_psobject)
end subroutine

public subroutine  of_addtemplate(dotnetobject anv_template,real ar_a,real ar_b,real ar_c,real ar_d,real ar_e,real ar_f);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTemplate
//*   Argument:
//*              Dotnetobject anv_template
//*              Real ar_a
//*              Real ar_b
//*              Real ar_c
//*              Real ar_d
//*              Real ar_e
//*              Real ar_f
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtemplate(anv_template,ar_a,ar_b,ar_c,ar_d,ar_e,ar_f)
end subroutine

public subroutine  of_addtemplate(dotnetobject anv_template,double adb_a,double adb_b,double adb_c,double adb_d,double adb_e,double adb_f);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTemplate
//*   Argument:
//*              Dotnetobject anv_template
//*              Double adb_a
//*              Double adb_b
//*              Double adb_c
//*              Double adb_d
//*              Double adb_e
//*              Double adb_f
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtemplate(anv_template,adb_a,adb_b,adb_c,adb_d,adb_e,adb_f)
end subroutine

public subroutine  of_addtemplate(dotnetobject anv_template,real ar_a,real ar_b,real ar_c,real ar_d,real ar_e,real ar_f,boolean abln_tagcontent);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTemplate
//*   Argument:
//*              Dotnetobject anv_template
//*              Real ar_a
//*              Real ar_b
//*              Real ar_c
//*              Real ar_d
//*              Real ar_e
//*              Real ar_f
//*              Boolean abln_tagcontent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtemplate(anv_template,ar_a,ar_b,ar_c,ar_d,ar_e,ar_f,abln_tagcontent)
end subroutine

public subroutine  of_addtemplate(dotnetobject anv_template,double adb_a,double adb_b,double adb_c,double adb_d,double adb_e,double adb_f,boolean abln_tagcontent);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTemplate
//*   Argument:
//*              Dotnetobject anv_template
//*              Double adb_a
//*              Double adb_b
//*              Double adb_c
//*              Double adb_d
//*              Double adb_e
//*              Double adb_f
//*              Boolean abln_tagcontent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtemplate(anv_template,adb_a,adb_b,adb_c,adb_d,adb_e,adb_f,abln_tagcontent)
end subroutine

public subroutine  of_addtemplate(dotnetobject anv_template,double adb_a,double adb_b,double adb_c,double adb_d,double adb_e,double adb_f,boolean abln_tagtemplate,boolean abln_tagcontent);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTemplate
//*   Argument:
//*              Dotnetobject anv_template
//*              Double adb_a
//*              Double adb_b
//*              Double adb_c
//*              Double adb_d
//*              Double adb_e
//*              Double adb_f
//*              Boolean abln_tagtemplate
//*              Boolean abln_tagcontent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtemplate(anv_template,adb_a,adb_b,adb_c,adb_d,adb_e,adb_f,abln_tagtemplate,abln_tagcontent)
end subroutine

public function dotnetobject of_addformxobj(dotnetobject anv_formxobj,dotnetobject anv_name,real ar_a,real ar_b,real ar_c,real ar_d,real ar_e,real ar_f);
//*-----------------------------------------------------------------*/
//*  .NET function : AddFormXObj
//*   Argument:
//*              Dotnetobject anv_formxobj
//*              Dotnetobject anv_name
//*              Real ar_a
//*              Real ar_b
//*              Real ar_c
//*              Real ar_d
//*              Real ar_e
//*              Real ar_f
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet function */
lnv_result = This.addformxobj(anv_formxobj,anv_name,ar_a,ar_b,ar_c,ar_d,ar_e,ar_f)
Return lnv_result
end function

public function dotnetobject of_addformxobj(dotnetobject anv_formxobj,dotnetobject anv_name,double adb_a,double adb_b,double adb_c,double adb_d,double adb_e,double adb_f);
//*-----------------------------------------------------------------*/
//*  .NET function : AddFormXObj
//*   Argument:
//*              Dotnetobject anv_formxobj
//*              Dotnetobject anv_name
//*              Double adb_a
//*              Double adb_b
//*              Double adb_c
//*              Double adb_d
//*              Double adb_e
//*              Double adb_f
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet function */
lnv_result = This.addformxobj(anv_formxobj,anv_name,adb_a,adb_b,adb_c,adb_d,adb_e,adb_f)
Return lnv_result
end function

public subroutine  of_addtemplate(dotnetobject anv_template,dotnetobject anv_transform);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTemplate
//*   Argument:
//*              Dotnetobject anv_template
//*              Dotnetobject anv_transform
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtemplate(anv_template,anv_transform)
end subroutine

public subroutine  of_addtemplate(dotnetobject anv_template,dotnetobject anv_transform,boolean abln_tagcontent);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTemplate
//*   Argument:
//*              Dotnetobject anv_template
//*              Dotnetobject anv_transform
//*              Boolean abln_tagcontent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtemplate(anv_template,anv_transform,abln_tagcontent)
end subroutine

public subroutine  of_addtemplate1(dotnetobject anv_template,dotnetobject anv_transform,boolean abln_tagcontent);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTemplate
//*   Argument:
//*              Dotnetobject anv_template
//*              Dotnetobject anv_transform
//*              Boolean abln_tagcontent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtemplate(anv_template,anv_transform,abln_tagcontent)
end subroutine

public subroutine  of_addtemplate1(dotnetobject anv_template,dotnetobject anv_transform);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTemplate
//*   Argument:
//*              Dotnetobject anv_template
//*              Dotnetobject anv_transform
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtemplate(anv_template,anv_transform)
end subroutine

public subroutine  of_addtemplate(dotnetobject anv_template,real ar_x,real ar_y);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTemplate
//*   Argument:
//*              Dotnetobject anv_template
//*              Real ar_x
//*              Real ar_y
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtemplate(anv_template,ar_x,ar_y)
end subroutine

public subroutine  of_addtemplate(dotnetobject anv_template,double adb_x,double adb_y);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTemplate
//*   Argument:
//*              Dotnetobject anv_template
//*              Double adb_x
//*              Double adb_y
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtemplate(anv_template,adb_x,adb_y)
end subroutine

public subroutine  of_addtemplate(dotnetobject anv_template,real ar_x,real ar_y,boolean abln_tagcontent);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTemplate
//*   Argument:
//*              Dotnetobject anv_template
//*              Real ar_x
//*              Real ar_y
//*              Boolean abln_tagcontent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtemplate(anv_template,ar_x,ar_y,abln_tagcontent)
end subroutine

public subroutine  of_addtemplate(dotnetobject anv_template,double adb_x,double adb_y,boolean abln_tagcontent);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTemplate
//*   Argument:
//*              Dotnetobject anv_template
//*              Double adb_x
//*              Double adb_y
//*              Boolean abln_tagcontent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtemplate(anv_template,adb_x,adb_y,abln_tagcontent)
end subroutine

public subroutine  of_setcmykcolorfill(long al_cyan,long al_magenta,long al_yellow,long al_black);
//*-----------------------------------------------------------------*/
//*  .NET function : SetCMYKColorFill
//*   Argument:
//*              Long al_cyan
//*              Long al_magenta
//*              Long al_yellow
//*              Long al_black
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcmykcolorfill(al_cyan,al_magenta,al_yellow,al_black)
end subroutine

public subroutine  of_setcmykcolorstroke(long al_cyan,long al_magenta,long al_yellow,long al_black);
//*-----------------------------------------------------------------*/
//*  .NET function : SetCMYKColorStroke
//*   Argument:
//*              Long al_cyan
//*              Long al_magenta
//*              Long al_yellow
//*              Long al_black
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcmykcolorstroke(al_cyan,al_magenta,al_yellow,al_black)
end subroutine

public subroutine  of_setrgbcolorfill(long al_red,long al_green,long al_blue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetRGBColorFill
//*   Argument:
//*              Long al_red
//*              Long al_green
//*              Long al_blue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setrgbcolorfill(al_red,al_green,al_blue)
end subroutine

public function string of_tostring();
//*-----------------------------------------------------------------*/
//*  .NET function : ToString
//*   Return : String
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
String ls_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ls_result)
	Return ls_result
End If

/* Trigger the dotnet function */
ls_result = This.tostring()
Return ls_result
end function

public function boolean of_istagged();
//*-----------------------------------------------------------------*/
//*  .NET function : IsTagged
//*   Return : Boolean
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Boolean lbln_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lbln_result)
	Return lbln_result
End If

/* Trigger the dotnet function */
lbln_result = This.istagged()
Return lbln_result
end function

public function blob of_topdf(dotnetobject anv_writer);
//*-----------------------------------------------------------------*/
//*  .NET function : ToPdf
//*   Argument:
//*              Dotnetobject anv_writer
//*   Return : Blob
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Blob lbyt_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lbyt_result)
	Return lbyt_result
End If

/* Trigger the dotnet function */
lbyt_result = This.topdf(anv_writer)
Return lbyt_result
end function

public subroutine  of_add(dotnetobject anv_other);
//*-----------------------------------------------------------------*/
//*  .NET function : Add
//*   Argument:
//*              Dotnetobject anv_other
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.add(anv_other)
end subroutine

public subroutine  of_setleading(real ar_v);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLeading
//*   Argument:
//*              Real ar_v
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setleading(ar_v)
end subroutine

public subroutine  of_setflatness(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFlatness
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setflatness(ar_value)
end subroutine

public subroutine  of_setflatness(double adb_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFlatness
//*   Argument:
//*              Double adb_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setflatness(adb_value)
end subroutine

public subroutine  of_setlinecap(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLineCap
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlinecap(al_value)
end subroutine

public subroutine  of_setrenderingintent(dotnetobject anv_ri);
//*-----------------------------------------------------------------*/
//*  .NET function : SetRenderingIntent
//*   Argument:
//*              Dotnetobject anv_ri
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setrenderingintent(anv_ri)
end subroutine

public subroutine  of_setlinedash(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLineDash
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlinedash(ar_value)
end subroutine

public subroutine  of_setlinedash(double adb_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLineDash
//*   Argument:
//*              Double adb_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlinedash(adb_value)
end subroutine

public subroutine  of_setlinedash(real ar_unitson,real ar_phase);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLineDash
//*   Argument:
//*              Real ar_unitson
//*              Real ar_phase
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlinedash(ar_unitson,ar_phase)
end subroutine

public subroutine  of_setlinedash(double adb_unitson,double adb_phase);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLineDash
//*   Argument:
//*              Double adb_unitson
//*              Double adb_phase
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlinedash(adb_unitson,adb_phase)
end subroutine

public subroutine  of_setlinedash(real ar_unitson,real ar_unitsoff,real ar_phase);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLineDash
//*   Argument:
//*              Real ar_unitson
//*              Real ar_unitsoff
//*              Real ar_phase
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlinedash(ar_unitson,ar_unitsoff,ar_phase)
end subroutine

public subroutine  of_setlinedash(double adb_unitson,double adb_unitsoff,double adb_phase);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLineDash
//*   Argument:
//*              Double adb_unitson
//*              Double adb_unitsoff
//*              Double adb_phase
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlinedash(adb_unitson,adb_unitsoff,adb_phase)
end subroutine

public subroutine  of_setlinedash(real ar_array[],real ar_phase);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLineDash
//*   Argument:
//*              Real ar_array[]
//*              Real ar_phase
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlinedash(ar_array,ar_phase)
end subroutine

public subroutine  of_setlinedash(double adb_array[],double adb_phase);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLineDash
//*   Argument:
//*              Double adb_array[]
//*              Double adb_phase
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlinedash(adb_array,adb_phase)
end subroutine

public subroutine  of_setlinejoin(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLineJoin
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlinejoin(al_value)
end subroutine

public subroutine  of_setlinewidth(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLineWidth
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlinewidth(ar_value)
end subroutine

public subroutine  of_setlinewidth(double adb_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLineWidth
//*   Argument:
//*              Double adb_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlinewidth(adb_value)
end subroutine

public subroutine  of_setmiterlimit(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMiterLimit
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setmiterlimit(ar_value)
end subroutine

public subroutine  of_setmiterlimit(double adb_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMiterLimit
//*   Argument:
//*              Double adb_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setmiterlimit(adb_value)
end subroutine

public subroutine  of_clip();
//*-----------------------------------------------------------------*/
//*  .NET function : Clip
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.clip()
end subroutine

public subroutine  of_eoclip();
//*-----------------------------------------------------------------*/
//*  .NET function : EoClip
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.eoclip()
end subroutine

public subroutine  of_setgrayfill(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetGrayFill
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setgrayfill(ar_value)
end subroutine

public subroutine  of_resetgrayfill();
//*-----------------------------------------------------------------*/
//*  .NET function : ResetGrayFill
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.resetgrayfill()
end subroutine

public subroutine  of_setgraystroke(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetGrayStroke
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setgraystroke(ar_value)
end subroutine

public subroutine  of_resetgraystroke();
//*-----------------------------------------------------------------*/
//*  .NET function : ResetGrayStroke
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.resetgraystroke()
end subroutine

public subroutine  of_setrgbcolorfillf(real ar_red,real ar_green,real ar_blue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetRGBColorFillF
//*   Argument:
//*              Real ar_red
//*              Real ar_green
//*              Real ar_blue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setrgbcolorfillf(ar_red,ar_green,ar_blue)
end subroutine

public subroutine  of_resetrgbcolorfill();
//*-----------------------------------------------------------------*/
//*  .NET function : ResetRGBColorFill
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.resetrgbcolorfill()
end subroutine

public subroutine  of_setrgbcolorstrokef(real ar_red,real ar_green,real ar_blue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetRGBColorStrokeF
//*   Argument:
//*              Real ar_red
//*              Real ar_green
//*              Real ar_blue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setrgbcolorstrokef(ar_red,ar_green,ar_blue)
end subroutine

public subroutine  of_resetrgbcolorstroke();
//*-----------------------------------------------------------------*/
//*  .NET function : ResetRGBColorStroke
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.resetrgbcolorstroke()
end subroutine

public subroutine  of_setcmykcolorfillf(real ar_cyan,real ar_magenta,real ar_yellow,real ar_black);
//*-----------------------------------------------------------------*/
//*  .NET function : SetCMYKColorFillF
//*   Argument:
//*              Real ar_cyan
//*              Real ar_magenta
//*              Real ar_yellow
//*              Real ar_black
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcmykcolorfillf(ar_cyan,ar_magenta,ar_yellow,ar_black)
end subroutine

public subroutine  of_resetcmykcolorfill();
//*-----------------------------------------------------------------*/
//*  .NET function : ResetCMYKColorFill
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.resetcmykcolorfill()
end subroutine

public subroutine  of_setcmykcolorstrokef(real ar_cyan,real ar_magenta,real ar_yellow,real ar_black);
//*-----------------------------------------------------------------*/
//*  .NET function : SetCMYKColorStrokeF
//*   Argument:
//*              Real ar_cyan
//*              Real ar_magenta
//*              Real ar_yellow
//*              Real ar_black
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcmykcolorstrokef(ar_cyan,ar_magenta,ar_yellow,ar_black)
end subroutine

public subroutine  of_resetcmykcolorstroke();
//*-----------------------------------------------------------------*/
//*  .NET function : ResetCMYKColorStroke
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.resetcmykcolorstroke()
end subroutine

public subroutine  of_moveto(real ar_x,real ar_y);
//*-----------------------------------------------------------------*/
//*  .NET function : MoveTo
//*   Argument:
//*              Real ar_x
//*              Real ar_y
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.moveto(ar_x,ar_y)
end subroutine

public subroutine  of_moveto(double adb_x,double adb_y);
//*-----------------------------------------------------------------*/
//*  .NET function : MoveTo
//*   Argument:
//*              Double adb_x
//*              Double adb_y
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.moveto(adb_x,adb_y)
end subroutine

public subroutine  of_lineto(real ar_x,real ar_y);
//*-----------------------------------------------------------------*/
//*  .NET function : LineTo
//*   Argument:
//*              Real ar_x
//*              Real ar_y
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.lineto(ar_x,ar_y)
end subroutine

public subroutine  of_lineto(double adb_x,double adb_y);
//*-----------------------------------------------------------------*/
//*  .NET function : LineTo
//*   Argument:
//*              Double adb_x
//*              Double adb_y
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.lineto(adb_x,adb_y)
end subroutine

public subroutine  of_curveto(real ar_x1,real ar_y1,real ar_x2,real ar_y2,real ar_x3,real ar_y3);
//*-----------------------------------------------------------------*/
//*  .NET function : CurveTo
//*   Argument:
//*              Real ar_x1
//*              Real ar_y1
//*              Real ar_x2
//*              Real ar_y2
//*              Real ar_x3
//*              Real ar_y3
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.curveto(ar_x1,ar_y1,ar_x2,ar_y2,ar_x3,ar_y3)
end subroutine

public subroutine  of_curveto(double adb_x1,double adb_y1,double adb_x2,double adb_y2,double adb_x3,double adb_y3);
//*-----------------------------------------------------------------*/
//*  .NET function : CurveTo
//*   Argument:
//*              Double adb_x1
//*              Double adb_y1
//*              Double adb_x2
//*              Double adb_y2
//*              Double adb_x3
//*              Double adb_y3
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.curveto(adb_x1,adb_y1,adb_x2,adb_y2,adb_x3,adb_y3)
end subroutine

public subroutine  of_curveto(real ar_x2,real ar_y2,real ar_x3,real ar_y3);
//*-----------------------------------------------------------------*/
//*  .NET function : CurveTo
//*   Argument:
//*              Real ar_x2
//*              Real ar_y2
//*              Real ar_x3
//*              Real ar_y3
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.curveto(ar_x2,ar_y2,ar_x3,ar_y3)
end subroutine

public subroutine  of_curveto(double adb_x2,double adb_y2,double adb_x3,double adb_y3);
//*-----------------------------------------------------------------*/
//*  .NET function : CurveTo
//*   Argument:
//*              Double adb_x2
//*              Double adb_y2
//*              Double adb_x3
//*              Double adb_y3
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.curveto(adb_x2,adb_y2,adb_x3,adb_y3)
end subroutine

public subroutine  of_curvefromto(real ar_x1,real ar_y1,real ar_x3,real ar_y3);
//*-----------------------------------------------------------------*/
//*  .NET function : CurveFromTo
//*   Argument:
//*              Real ar_x1
//*              Real ar_y1
//*              Real ar_x3
//*              Real ar_y3
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.curvefromto(ar_x1,ar_y1,ar_x3,ar_y3)
end subroutine

public subroutine  of_curvefromto(double adb_x1,double adb_y1,double adb_x3,double adb_y3);
//*-----------------------------------------------------------------*/
//*  .NET function : CurveFromTo
//*   Argument:
//*              Double adb_x1
//*              Double adb_y1
//*              Double adb_x3
//*              Double adb_y3
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.curvefromto(adb_x1,adb_y1,adb_x3,adb_y3)
end subroutine

public subroutine  of_circle(real ar_x,real ar_y,real ar_r);
//*-----------------------------------------------------------------*/
//*  .NET function : Circle
//*   Argument:
//*              Real ar_x
//*              Real ar_y
//*              Real ar_r
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.circle(ar_x,ar_y,ar_r)
end subroutine

public subroutine  of_circle(double adb_x,double adb_y,double adb_r);
//*-----------------------------------------------------------------*/
//*  .NET function : Circle
//*   Argument:
//*              Double adb_x
//*              Double adb_y
//*              Double adb_r
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.circle(adb_x,adb_y,adb_r)
end subroutine

public subroutine  of_rectangle(real ar_x,real ar_y,real ar_w,real ar_h);
//*-----------------------------------------------------------------*/
//*  .NET function : Rectangle
//*   Argument:
//*              Real ar_x
//*              Real ar_y
//*              Real ar_w
//*              Real ar_h
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.rectangle(ar_x,ar_y,ar_w,ar_h)
end subroutine

public subroutine  of_rectangle(double adb_x,double adb_y,double adb_w,double adb_h);
//*-----------------------------------------------------------------*/
//*  .NET function : Rectangle
//*   Argument:
//*              Double adb_x
//*              Double adb_y
//*              Double adb_w
//*              Double adb_h
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.rectangle(adb_x,adb_y,adb_w,adb_h)
end subroutine

public subroutine  of_variablerectangle(dotnetobject anv_rect);
//*-----------------------------------------------------------------*/
//*  .NET function : VariableRectangle
//*   Argument:
//*              Dotnetobject anv_rect
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.variablerectangle(anv_rect)
end subroutine

public subroutine  of_rectangle(dotnetobject anv_rectangle);
//*-----------------------------------------------------------------*/
//*  .NET function : Rectangle
//*   Argument:
//*              Dotnetobject anv_rectangle
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.rectangle(anv_rectangle)
end subroutine

public subroutine  of_closepath();
//*-----------------------------------------------------------------*/
//*  .NET function : ClosePath
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.closepath()
end subroutine

public subroutine  of_newpath();
//*-----------------------------------------------------------------*/
//*  .NET function : NewPath
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.newpath()
end subroutine

public subroutine  of_stroke();
//*-----------------------------------------------------------------*/
//*  .NET function : Stroke
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.stroke()
end subroutine

public subroutine  of_closepathstroke();
//*-----------------------------------------------------------------*/
//*  .NET function : ClosePathStroke
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.closepathstroke()
end subroutine

public subroutine  of_fill();
//*-----------------------------------------------------------------*/
//*  .NET function : Fill
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.fill()
end subroutine

public subroutine  of_eofill();
//*-----------------------------------------------------------------*/
//*  .NET function : EoFill
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.eofill()
end subroutine

public subroutine  of_fillstroke();
//*-----------------------------------------------------------------*/
//*  .NET function : FillStroke
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.fillstroke()
end subroutine

public subroutine  of_closepathfillstroke();
//*-----------------------------------------------------------------*/
//*  .NET function : ClosePathFillStroke
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.closepathfillstroke()
end subroutine

public subroutine  of_eofillstroke();
//*-----------------------------------------------------------------*/
//*  .NET function : EoFillStroke
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.eofillstroke()
end subroutine

public subroutine  of_closepatheofillstroke();
//*-----------------------------------------------------------------*/
//*  .NET function : ClosePathEoFillStroke
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.closepatheofillstroke()
end subroutine

public subroutine  of_addimage(dotnetobject anv_image);
//*-----------------------------------------------------------------*/
//*  .NET function : AddImage
//*   Argument:
//*              Dotnetobject anv_image
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addimage(anv_image)
end subroutine

public subroutine  of_addimage(dotnetobject anv_image,boolean abln_inlineimage);
//*-----------------------------------------------------------------*/
//*  .NET function : AddImage
//*   Argument:
//*              Dotnetobject anv_image
//*              Boolean abln_inlineimage
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addimage(anv_image,abln_inlineimage)
end subroutine

public subroutine  of_addimage(dotnetobject anv_image,real ar_a,real ar_b,real ar_c,real ar_d,real ar_e,real ar_f);
//*-----------------------------------------------------------------*/
//*  .NET function : AddImage
//*   Argument:
//*              Dotnetobject anv_image
//*              Real ar_a
//*              Real ar_b
//*              Real ar_c
//*              Real ar_d
//*              Real ar_e
//*              Real ar_f
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addimage(anv_image,ar_a,ar_b,ar_c,ar_d,ar_e,ar_f)
end subroutine

public subroutine  of_addimage(dotnetobject anv_image,double adb_a,double adb_b,double adb_c,double adb_d,double adb_e,double adb_f);
//*-----------------------------------------------------------------*/
//*  .NET function : AddImage
//*   Argument:
//*              Dotnetobject anv_image
//*              Double adb_a
//*              Double adb_b
//*              Double adb_c
//*              Double adb_d
//*              Double adb_e
//*              Double adb_f
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addimage(anv_image,adb_a,adb_b,adb_c,adb_d,adb_e,adb_f)
end subroutine

public subroutine  of_addimage(dotnetobject anv_image,dotnetobject anv_transform);
//*-----------------------------------------------------------------*/
//*  .NET function : AddImage
//*   Argument:
//*              Dotnetobject anv_image
//*              Dotnetobject anv_transform
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addimage(anv_image,anv_transform)
end subroutine

public subroutine  of_addimage1(dotnetobject anv_image,dotnetobject anv_transform);
//*-----------------------------------------------------------------*/
//*  .NET function : AddImage
//*   Argument:
//*              Dotnetobject anv_image
//*              Dotnetobject anv_transform
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addimage(anv_image,anv_transform)
end subroutine

public function boolean get_suppresstagging();
//*-----------------------------------------------------------------*/
//*  .NET property : SuppressTagging
//*   Return : Boolean
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Boolean lbln_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lbln_result)
	Return lbln_result
End If

/* Trigger the dotnet property */
lbln_result = This.suppresstagging
Return lbln_result
end function

public subroutine  set_suppresstagging(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SuppressTagging
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.suppresstagging = abln_value
end subroutine

public function dotnetobject get_internalbuffer();
//*-----------------------------------------------------------------*/
//*  .NET property : InternalBuffer
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet property */
lnv_result = This.internalbuffer
Return lnv_result
end function

public function real get_xtlm();
//*-----------------------------------------------------------------*/
//*  .NET property : XTLM
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet property */
lr_result = This.xtlm
Return lr_result
end function

public function real get_ytlm();
//*-----------------------------------------------------------------*/
//*  .NET property : YTLM
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet property */
lr_result = This.ytlm
Return lr_result
end function

public function real get_characterspacing();
//*-----------------------------------------------------------------*/
//*  .NET property : CharacterSpacing
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet property */
lr_result = This.characterspacing
Return lr_result
end function

public function real get_wordspacing();
//*-----------------------------------------------------------------*/
//*  .NET property : WordSpacing
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet property */
lr_result = This.wordspacing
Return lr_result
end function

public function real get_horizontalscaling();
//*-----------------------------------------------------------------*/
//*  .NET property : HorizontalScaling
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet property */
lr_result = This.horizontalscaling
Return lr_result
end function

public function real get_leading();
//*-----------------------------------------------------------------*/
//*  .NET property : Leading
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet property */
lr_result = This.leading
Return lr_result
end function

public function dotnetobject get_rootoutline();
//*-----------------------------------------------------------------*/
//*  .NET property : RootOutline
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet property */
lnv_result = This.rootoutline
Return lnv_result
end function

public function dotnetobject get_pdfwriter();
//*-----------------------------------------------------------------*/
//*  .NET property : PdfWriter
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet property */
lnv_result = This.pdfwriter
Return lnv_result
end function

public function dotnetobject get_pdfdocument();
//*-----------------------------------------------------------------*/
//*  .NET property : PdfDocument
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet property */
lnv_result = This.pdfdocument
Return lnv_result
end function

public function dotnetobject get_duplicate();
//*-----------------------------------------------------------------*/
//*  .NET property : Duplicate
//*   Return : Dotnetobject
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Dotnetobject lnv_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lnv_result)
	Return lnv_result
End If

/* Trigger the dotnet property */
lnv_result = This.duplicate
Return lnv_result
end function

on nvo_pdfcontentbyte.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfcontentbyte.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

