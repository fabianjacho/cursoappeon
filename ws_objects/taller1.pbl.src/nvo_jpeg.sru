$PBExportHeader$nvo_jpeg.sru
forward
global type nvo_jpeg from dotnetobject
end type
end forward

global type nvo_jpeg from dotnetobject
end type
global nvo_jpeg nvo_jpeg

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.Jpeg"

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
public function boolean of_hasiccprofile()
public subroutine  of_simplifycolorspace()
public function dotnetobject of_getaccessibleattribute(dotnetobject anv_key)
public subroutine  of_setaccessibleattribute(dotnetobject anv_key,dotnetobject anv_value)
public function dotnetobject of_getaccessibleattributes()
public subroutine  of_setabsoluteposition(real ar_absolutex,real ar_absolutey)
public subroutine  of_scaleabsolute(dotnetobject anv_rectangle)
public subroutine  of_scaleabsolute(real ar_newwidth,real ar_newheight)
public subroutine  of_scaleabsolutewidth(real ar_newwidth)
public subroutine  of_scaleabsoluteheight(real ar_newheight)
public subroutine  of_scalepercent(real ar_percent)
public subroutine  of_scalepercent(real ar_percentx,real ar_percenty)
public subroutine  of_scaletofit(dotnetobject anv_rectangle)
public subroutine  of_scaletofit(real ar_fitwidth,real ar_fitheight)
public function real of_getimagerotation()
public function boolean of_hasabsoluteposition()
public function boolean of_hasabsolutex()
public function boolean of_isnestable()
public function boolean of_isjpeg()
public function boolean of_isimgraw()
public function boolean of_isimgtemplate()
public function any of_getmatrix()
public function any of_getmatrix(real ar_scalepercentage)
public subroutine  of_setdpi(long al_dpix,long al_dpiy)
public function boolean of_ismaskcandidate()
public subroutine  of_makemask()
public function boolean of_ismask()
public subroutine  of_clonenonpositionparameters(dotnetobject anv_rect)
public subroutine  of_softclonenonpositionparameters(dotnetobject anv_rect)
public function boolean of_process(dotnetobject anv_listener)
public function boolean of_iscontent()
public subroutine  of_normalize()
public function dotnetobject of_getrectangle(real ar_top,real ar_bottom)
public function dotnetobject of_rotate()
public subroutine  of_enableborderside(long al_side)
public subroutine  of_disableborderside(long al_side)
public function real of_getleft(real ar_margin)
public function real of_getright(real ar_margin)
public function real of_gettop(real ar_margin)
public function real of_getbottom(real ar_margin)
public function boolean of_hasborders()
public function boolean of_hasborder(long al_type)
public function string of_tostring()
public function boolean of_equals(dotnetobject anv_obj)
public subroutine  set_rotation(real ar_value)
public subroutine  set_rotationdegrees(real ar_value)
public function dotnetobject get_annotation()
public subroutine  set_annotation(dotnetobject anv_value)
public function long get_bpc()
public function blob get_rawdata()
public function dotnetobject get_templatedata()
public subroutine  set_templatedata(dotnetobject anv_value)
public function real get_absolutex()
public function real get_absolutey()
public function long get_type()
public function dotnetobject get_url()
public subroutine  set_url(dotnetobject anv_value)
public function long get_alignment()
public subroutine  set_alignment(long al_value)
public function string get_alt()
public subroutine  set_alt(string as_value)
public function real get_scaledwidth()
public function real get_scaledheight()
public function long get_colorspace()
public function long get_colortransform()
public subroutine  set_colortransform(long al_value)
public function any get_transparency()
public subroutine  set_transparency(long al_value[])
public function real get_plainwidth()
public function real get_plainheight()
public function longlong get_myserialid()
public function long get_dpix()
public function long get_dpiy()
public function dotnetobject get_imagemask()
public subroutine  set_imagemask(dotnetobject anv_value)
public function boolean get_inverted()
public subroutine  set_inverted(boolean abln_value)
public function boolean get_interpolation()
public subroutine  set_interpolation(boolean abln_value)
public function dotnetobject get_tagicc()
public subroutine  set_tagicc(dotnetobject anv_value)
public function boolean get_deflated()
public subroutine  set_deflated(boolean abln_value)
public function dotnetobject get_additional()
public subroutine  set_additional(dotnetobject anv_value)
public function boolean get_smask()
public subroutine  set_smask(boolean abln_value)
public function real get_xyratio()
public subroutine  set_xyratio(real ar_value)
public function real get_indentationleft()
public subroutine  set_indentationleft(real ar_value)
public function real get_indentationright()
public subroutine  set_indentationright(real ar_value)
public function long get_originaltype()
public subroutine  set_originaltype(long al_value)
public function blob get_originaldata()
public subroutine  set_originaldata(blob ablo_value)
public function real get_spacingbefore()
public subroutine  set_spacingbefore(real ar_value)
public function real get_spacingafter()
public subroutine  set_spacingafter(real ar_value)
public function real get_paddingtop()
public subroutine  set_paddingtop(real ar_value)
public function real get_widthpercentage()
public subroutine  set_widthpercentage(real ar_value)
public function boolean get_scaletofitlinewhenoverflow()
public subroutine  set_scaletofitlinewhenoverflow(boolean abln_value)
public function boolean get_scaletofitheight()
public subroutine  set_scaletofitheight(boolean abln_value)
public function dotnetobject get_layer()
public subroutine  set_layer(dotnetobject anv_value)
public function real get_initialrotation()
public subroutine  set_initialrotation(real ar_value)
public function dotnetobject get_directreference()
public subroutine  set_directreference(dotnetobject anv_value)
public function long get_compressionlevel()
public subroutine  set_compressionlevel(long al_value)
public function dotnetobject get_role()
public subroutine  set_role(dotnetobject anv_value)
public function dotnetobject get_id()
public subroutine  set_id(dotnetobject anv_value)
public function boolean get_isinline()
public function dotnetobject get_chunks()
public function real get_top()
public subroutine  set_top(real ar_value)
public function long get_border()
public subroutine  set_border(long al_value)
public function real get_grayfill()
public subroutine  set_grayfill(real ar_value)
public function real get_left()
public subroutine  set_left(real ar_value)
public function real get_right()
public subroutine  set_right(real ar_value)
public function real get_bottom()
public subroutine  set_bottom(real ar_value)
public function dotnetobject get_bordercolorbottom()
public subroutine  set_bordercolorbottom(dotnetobject anv_value)
public function dotnetobject get_bordercolortop()
public subroutine  set_bordercolortop(dotnetobject anv_value)
public function dotnetobject get_bordercolorleft()
public subroutine  set_bordercolorleft(dotnetobject anv_value)
public function dotnetobject get_bordercolorright()
public subroutine  set_bordercolorright(dotnetobject anv_value)
public function real get_width()
public subroutine  set_width(real ar_value)
public function real get_height()
public function real get_borderwidth()
public subroutine  set_borderwidth(real ar_value)
public function dotnetobject get_bordercolor()
public subroutine  set_bordercolor(dotnetobject anv_value)
public function dotnetobject get_backgroundcolor()
public subroutine  set_backgroundcolor(dotnetobject anv_value)
public function real get_borderwidthleft()
public subroutine  set_borderwidthleft(real ar_value)
public function real get_borderwidthright()
public subroutine  set_borderwidthright(real ar_value)
public function real get_borderwidthtop()
public subroutine  set_borderwidthtop(real ar_value)
public function real get_borderwidthbottom()
public subroutine  set_borderwidthbottom(real ar_value)
public function boolean get_usevariableborders()
public subroutine  set_usevariableborders(boolean abln_value)
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

public function boolean of_hasiccprofile();
//*-----------------------------------------------------------------*/
//*  .NET function : HasICCProfile
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
lbln_result = This.hasiccprofile()
Return lbln_result
end function

public subroutine  of_simplifycolorspace();
//*-----------------------------------------------------------------*/
//*  .NET function : SimplifyColorspace
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.simplifycolorspace()
end subroutine

public function dotnetobject of_getaccessibleattribute(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAccessibleAttribute
//*   Argument:
//*              Dotnetobject anv_key
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
lnv_result = This.getaccessibleattribute(anv_key)
Return lnv_result
end function

public subroutine  of_setaccessibleattribute(dotnetobject anv_key,dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAccessibleAttribute
//*   Argument:
//*              Dotnetobject anv_key
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setaccessibleattribute(anv_key,anv_value)
end subroutine

public function dotnetobject of_getaccessibleattributes();
//*-----------------------------------------------------------------*/
//*  .NET function : GetAccessibleAttributes
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
lnv_result = This.getaccessibleattributes()
Return lnv_result
end function

public subroutine  of_setabsoluteposition(real ar_absolutex,real ar_absolutey);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAbsolutePosition
//*   Argument:
//*              Real ar_absolutex
//*              Real ar_absolutey
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setabsoluteposition(ar_absolutex,ar_absolutey)
end subroutine

public subroutine  of_scaleabsolute(dotnetobject anv_rectangle);
//*-----------------------------------------------------------------*/
//*  .NET function : ScaleAbsolute
//*   Argument:
//*              Dotnetobject anv_rectangle
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.scaleabsolute(anv_rectangle)
end subroutine

public subroutine  of_scaleabsolute(real ar_newwidth,real ar_newheight);
//*-----------------------------------------------------------------*/
//*  .NET function : ScaleAbsolute
//*   Argument:
//*              Real ar_newwidth
//*              Real ar_newheight
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.scaleabsolute(ar_newwidth,ar_newheight)
end subroutine

public subroutine  of_scaleabsolutewidth(real ar_newwidth);
//*-----------------------------------------------------------------*/
//*  .NET function : ScaleAbsoluteWidth
//*   Argument:
//*              Real ar_newwidth
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.scaleabsolutewidth(ar_newwidth)
end subroutine

public subroutine  of_scaleabsoluteheight(real ar_newheight);
//*-----------------------------------------------------------------*/
//*  .NET function : ScaleAbsoluteHeight
//*   Argument:
//*              Real ar_newheight
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.scaleabsoluteheight(ar_newheight)
end subroutine

public subroutine  of_scalepercent(real ar_percent);
//*-----------------------------------------------------------------*/
//*  .NET function : ScalePercent
//*   Argument:
//*              Real ar_percent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.scalepercent(ar_percent)
end subroutine

public subroutine  of_scalepercent(real ar_percentx,real ar_percenty);
//*-----------------------------------------------------------------*/
//*  .NET function : ScalePercent
//*   Argument:
//*              Real ar_percentx
//*              Real ar_percenty
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.scalepercent(ar_percentx,ar_percenty)
end subroutine

public subroutine  of_scaletofit(dotnetobject anv_rectangle);
//*-----------------------------------------------------------------*/
//*  .NET function : ScaleToFit
//*   Argument:
//*              Dotnetobject anv_rectangle
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.scaletofit(anv_rectangle)
end subroutine

public subroutine  of_scaletofit(real ar_fitwidth,real ar_fitheight);
//*-----------------------------------------------------------------*/
//*  .NET function : ScaleToFit
//*   Argument:
//*              Real ar_fitwidth
//*              Real ar_fitheight
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.scaletofit(ar_fitwidth,ar_fitheight)
end subroutine

public function real of_getimagerotation();
//*-----------------------------------------------------------------*/
//*  .NET function : GetImageRotation
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
lr_result = This.getimagerotation()
Return lr_result
end function

public function boolean of_hasabsoluteposition();
//*-----------------------------------------------------------------*/
//*  .NET function : HasAbsolutePosition
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
lbln_result = This.hasabsoluteposition()
Return lbln_result
end function

public function boolean of_hasabsolutex();
//*-----------------------------------------------------------------*/
//*  .NET function : HasAbsoluteX
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
lbln_result = This.hasabsolutex()
Return lbln_result
end function

public function boolean of_isnestable();
//*-----------------------------------------------------------------*/
//*  .NET function : IsNestable
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
lbln_result = This.isnestable()
Return lbln_result
end function

public function boolean of_isjpeg();
//*-----------------------------------------------------------------*/
//*  .NET function : IsJpeg
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
lbln_result = This.isjpeg()
Return lbln_result
end function

public function boolean of_isimgraw();
//*-----------------------------------------------------------------*/
//*  .NET function : IsImgRaw
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
lbln_result = This.isimgraw()
Return lbln_result
end function

public function boolean of_isimgtemplate();
//*-----------------------------------------------------------------*/
//*  .NET function : IsImgTemplate
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
lbln_result = This.isimgtemplate()
Return lbln_result
end function

public function any of_getmatrix();
//*-----------------------------------------------------------------*/
//*  .NET function : GetMatrix
//*   Return : Real[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Any lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.getmatrix()
Return lr_result
end function

public function any of_getmatrix(real ar_scalepercentage);
//*-----------------------------------------------------------------*/
//*  .NET function : GetMatrix
//*   Argument:
//*              Real ar_scalepercentage
//*   Return : Real[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Any lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.getmatrix(ar_scalepercentage)
Return lr_result
end function

public subroutine  of_setdpi(long al_dpix,long al_dpiy);
//*-----------------------------------------------------------------*/
//*  .NET function : SetDpi
//*   Argument:
//*              Long al_dpix
//*              Long al_dpiy
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setdpi(al_dpix,al_dpiy)
end subroutine

public function boolean of_ismaskcandidate();
//*-----------------------------------------------------------------*/
//*  .NET function : IsMaskCandidate
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
lbln_result = This.ismaskcandidate()
Return lbln_result
end function

public subroutine  of_makemask();
//*-----------------------------------------------------------------*/
//*  .NET function : MakeMask
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.makemask()
end subroutine

public function boolean of_ismask();
//*-----------------------------------------------------------------*/
//*  .NET function : IsMask
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
lbln_result = This.ismask()
Return lbln_result
end function

public subroutine  of_clonenonpositionparameters(dotnetobject anv_rect);
//*-----------------------------------------------------------------*/
//*  .NET function : CloneNonPositionParameters
//*   Argument:
//*              Dotnetobject anv_rect
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.clonenonpositionparameters(anv_rect)
end subroutine

public subroutine  of_softclonenonpositionparameters(dotnetobject anv_rect);
//*-----------------------------------------------------------------*/
//*  .NET function : SoftCloneNonPositionParameters
//*   Argument:
//*              Dotnetobject anv_rect
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.softclonenonpositionparameters(anv_rect)
end subroutine

public function boolean of_process(dotnetobject anv_listener);
//*-----------------------------------------------------------------*/
//*  .NET function : Process
//*   Argument:
//*              Dotnetobject anv_listener
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
lbln_result = This.process(anv_listener)
Return lbln_result
end function

public function boolean of_iscontent();
//*-----------------------------------------------------------------*/
//*  .NET function : IsContent
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
lbln_result = This.iscontent()
Return lbln_result
end function

public subroutine  of_normalize();
//*-----------------------------------------------------------------*/
//*  .NET function : Normalize
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.normalize()
end subroutine

public function dotnetobject of_getrectangle(real ar_top,real ar_bottom);
//*-----------------------------------------------------------------*/
//*  .NET function : GetRectangle
//*   Argument:
//*              Real ar_top
//*              Real ar_bottom
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
lnv_result = This.getrectangle(ar_top,ar_bottom)
Return lnv_result
end function

public function dotnetobject of_rotate();
//*-----------------------------------------------------------------*/
//*  .NET function : Rotate
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
lnv_result = This.rotate()
Return lnv_result
end function

public subroutine  of_enableborderside(long al_side);
//*-----------------------------------------------------------------*/
//*  .NET function : EnableBorderSide
//*   Argument:
//*              Long al_side
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.enableborderside(al_side)
end subroutine

public subroutine  of_disableborderside(long al_side);
//*-----------------------------------------------------------------*/
//*  .NET function : DisableBorderSide
//*   Argument:
//*              Long al_side
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.disableborderside(al_side)
end subroutine

public function real of_getleft(real ar_margin);
//*-----------------------------------------------------------------*/
//*  .NET function : GetLeft
//*   Argument:
//*              Real ar_margin
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
lr_result = This.getleft(ar_margin)
Return lr_result
end function

public function real of_getright(real ar_margin);
//*-----------------------------------------------------------------*/
//*  .NET function : GetRight
//*   Argument:
//*              Real ar_margin
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
lr_result = This.getright(ar_margin)
Return lr_result
end function

public function real of_gettop(real ar_margin);
//*-----------------------------------------------------------------*/
//*  .NET function : GetTop
//*   Argument:
//*              Real ar_margin
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
lr_result = This.gettop(ar_margin)
Return lr_result
end function

public function real of_getbottom(real ar_margin);
//*-----------------------------------------------------------------*/
//*  .NET function : GetBottom
//*   Argument:
//*              Real ar_margin
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
lr_result = This.getbottom(ar_margin)
Return lr_result
end function

public function boolean of_hasborders();
//*-----------------------------------------------------------------*/
//*  .NET function : HasBorders
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
lbln_result = This.hasborders()
Return lbln_result
end function

public function boolean of_hasborder(long al_type);
//*-----------------------------------------------------------------*/
//*  .NET function : HasBorder
//*   Argument:
//*              Long al_type
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
lbln_result = This.hasborder(al_type)
Return lbln_result
end function

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

public function boolean of_equals(dotnetobject anv_obj);
//*-----------------------------------------------------------------*/
//*  .NET function : Equals
//*   Argument:
//*              Dotnetobject anv_obj
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
lbln_result = This.equals(anv_obj)
Return lbln_result
end function

public subroutine  set_rotation(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Rotation
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.rotation = ar_value
end subroutine

public subroutine  set_rotationdegrees(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : RotationDegrees
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.rotationdegrees = ar_value
end subroutine

public function dotnetobject get_annotation();
//*-----------------------------------------------------------------*/
//*  .NET property : Annotation
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
lnv_result = This.annotation
Return lnv_result
end function

public subroutine  set_annotation(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Annotation
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.annotation = anv_value
end subroutine

public function long get_bpc();
//*-----------------------------------------------------------------*/
//*  .NET property : Bpc
//*   Return : Long
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Long ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet property */
ll_result = This.bpc
Return ll_result
end function

public function blob get_rawdata();
//*-----------------------------------------------------------------*/
//*  .NET property : RawData
//*   Return : Blob
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Blob lbyt_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lbyt_result)
	Return lbyt_result
End If

/* Trigger the dotnet property */
lbyt_result = This.rawdata
Return lbyt_result
end function

public function dotnetobject get_templatedata();
//*-----------------------------------------------------------------*/
//*  .NET property : TemplateData
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
lnv_result = This.templatedata
Return lnv_result
end function

public subroutine  set_templatedata(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : TemplateData
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.templatedata = anv_value
end subroutine

public function real get_absolutex();
//*-----------------------------------------------------------------*/
//*  .NET property : AbsoluteX
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
lr_result = This.absolutex
Return lr_result
end function

public function real get_absolutey();
//*-----------------------------------------------------------------*/
//*  .NET property : AbsoluteY
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
lr_result = This.absolutey
Return lr_result
end function

public function long get_type();
//*-----------------------------------------------------------------*/
//*  .NET property : Type
//*   Return : Long
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Long ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet property */
ll_result = This.type
Return ll_result
end function

public function dotnetobject get_url();
//*-----------------------------------------------------------------*/
//*  .NET property : Url
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
lnv_result = This.url
Return lnv_result
end function

public subroutine  set_url(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Url
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.url = anv_value
end subroutine

public function long get_alignment();
//*-----------------------------------------------------------------*/
//*  .NET property : Alignment
//*   Return : Long
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Long ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet property */
ll_result = This.alignment
Return ll_result
end function

public subroutine  set_alignment(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Alignment
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.alignment = al_value
end subroutine

public function string get_alt();
//*-----------------------------------------------------------------*/
//*  .NET property : Alt
//*   Return : String
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
String ls_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ls_result)
	Return ls_result
End If

/* Trigger the dotnet property */
ls_result = This.alt
Return ls_result
end function

public subroutine  set_alt(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Alt
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.alt = as_value
end subroutine

public function real get_scaledwidth();
//*-----------------------------------------------------------------*/
//*  .NET property : ScaledWidth
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
lr_result = This.scaledwidth
Return lr_result
end function

public function real get_scaledheight();
//*-----------------------------------------------------------------*/
//*  .NET property : ScaledHeight
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
lr_result = This.scaledheight
Return lr_result
end function

public function long get_colorspace();
//*-----------------------------------------------------------------*/
//*  .NET property : Colorspace
//*   Return : Long
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Long ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet property */
ll_result = This.colorspace
Return ll_result
end function

public function long get_colortransform();
//*-----------------------------------------------------------------*/
//*  .NET property : ColorTransform
//*   Return : Long
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Long ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet property */
ll_result = This.colortransform
Return ll_result
end function

public subroutine  set_colortransform(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ColorTransform
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.colortransform = al_value
end subroutine

public function any get_transparency();
//*-----------------------------------------------------------------*/
//*  .NET property : Transparency
//*   Return : Long[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Any ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet property */
ll_result = This.transparency
Return ll_result
end function

public subroutine  set_transparency(long al_value[]);
//*-----------------------------------------------------------------*/
//*  .NET property : Transparency
//*   Argument:
//*              Long al_value[]
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.transparency = al_value
end subroutine

public function real get_plainwidth();
//*-----------------------------------------------------------------*/
//*  .NET property : PlainWidth
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
lr_result = This.plainwidth
Return lr_result
end function

public function real get_plainheight();
//*-----------------------------------------------------------------*/
//*  .NET property : PlainHeight
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
lr_result = This.plainheight
Return lr_result
end function

public function longlong get_myserialid();
//*-----------------------------------------------------------------*/
//*  .NET property : MySerialId
//*   Return : Longlong
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Longlong lll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lll_result)
	Return lll_result
End If

/* Trigger the dotnet property */
lll_result = This.myserialid
Return lll_result
end function

public function long get_dpix();
//*-----------------------------------------------------------------*/
//*  .NET property : DpiX
//*   Return : Long
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Long ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet property */
ll_result = This.dpix
Return ll_result
end function

public function long get_dpiy();
//*-----------------------------------------------------------------*/
//*  .NET property : DpiY
//*   Return : Long
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Long ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet property */
ll_result = This.dpiy
Return ll_result
end function

public function dotnetobject get_imagemask();
//*-----------------------------------------------------------------*/
//*  .NET property : ImageMask
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
lnv_result = This.imagemask
Return lnv_result
end function

public subroutine  set_imagemask(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ImageMask
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.imagemask = anv_value
end subroutine

public function boolean get_inverted();
//*-----------------------------------------------------------------*/
//*  .NET property : Inverted
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
lbln_result = This.inverted
Return lbln_result
end function

public subroutine  set_inverted(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Inverted
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.inverted = abln_value
end subroutine

public function boolean get_interpolation();
//*-----------------------------------------------------------------*/
//*  .NET property : Interpolation
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
lbln_result = This.interpolation
Return lbln_result
end function

public subroutine  set_interpolation(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Interpolation
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.interpolation = abln_value
end subroutine

public function dotnetobject get_tagicc();
//*-----------------------------------------------------------------*/
//*  .NET property : TagICC
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
lnv_result = This.tagicc
Return lnv_result
end function

public subroutine  set_tagicc(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : TagICC
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.tagicc = anv_value
end subroutine

public function boolean get_deflated();
//*-----------------------------------------------------------------*/
//*  .NET property : Deflated
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
lbln_result = This.deflated
Return lbln_result
end function

public subroutine  set_deflated(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Deflated
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.deflated = abln_value
end subroutine

public function dotnetobject get_additional();
//*-----------------------------------------------------------------*/
//*  .NET property : Additional
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
lnv_result = This.additional
Return lnv_result
end function

public subroutine  set_additional(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Additional
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.additional = anv_value
end subroutine

public function boolean get_smask();
//*-----------------------------------------------------------------*/
//*  .NET property : Smask
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
lbln_result = This.smask
Return lbln_result
end function

public subroutine  set_smask(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Smask
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.smask = abln_value
end subroutine

public function real get_xyratio();
//*-----------------------------------------------------------------*/
//*  .NET property : XYRatio
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
lr_result = This.xyratio
Return lr_result
end function

public subroutine  set_xyratio(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : XYRatio
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.xyratio = ar_value
end subroutine

public function real get_indentationleft();
//*-----------------------------------------------------------------*/
//*  .NET property : IndentationLeft
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
lr_result = This.indentationleft
Return lr_result
end function

public subroutine  set_indentationleft(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : IndentationLeft
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.indentationleft = ar_value
end subroutine

public function real get_indentationright();
//*-----------------------------------------------------------------*/
//*  .NET property : IndentationRight
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
lr_result = This.indentationright
Return lr_result
end function

public subroutine  set_indentationright(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : IndentationRight
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.indentationright = ar_value
end subroutine

public function long get_originaltype();
//*-----------------------------------------------------------------*/
//*  .NET property : OriginalType
//*   Return : Long
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Long ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet property */
ll_result = This.originaltype
Return ll_result
end function

public subroutine  set_originaltype(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : OriginalType
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.originaltype = al_value
end subroutine

public function blob get_originaldata();
//*-----------------------------------------------------------------*/
//*  .NET property : OriginalData
//*   Return : Blob
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Blob lbyt_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lbyt_result)
	Return lbyt_result
End If

/* Trigger the dotnet property */
lbyt_result = This.originaldata
Return lbyt_result
end function

public subroutine  set_originaldata(blob ablo_value);
//*-----------------------------------------------------------------*/
//*  .NET property : OriginalData
//*   Argument:
//*              Blob ablo_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.originaldata = ablo_value
end subroutine

public function real get_spacingbefore();
//*-----------------------------------------------------------------*/
//*  .NET property : SpacingBefore
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
lr_result = This.spacingbefore
Return lr_result
end function

public subroutine  set_spacingbefore(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SpacingBefore
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.spacingbefore = ar_value
end subroutine

public function real get_spacingafter();
//*-----------------------------------------------------------------*/
//*  .NET property : SpacingAfter
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
lr_result = This.spacingafter
Return lr_result
end function

public subroutine  set_spacingafter(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SpacingAfter
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.spacingafter = ar_value
end subroutine

public function real get_paddingtop();
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingTop
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
lr_result = This.paddingtop
Return lr_result
end function

public subroutine  set_paddingtop(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingTop
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.paddingtop = ar_value
end subroutine

public function real get_widthpercentage();
//*-----------------------------------------------------------------*/
//*  .NET property : WidthPercentage
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
lr_result = This.widthpercentage
Return lr_result
end function

public subroutine  set_widthpercentage(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : WidthPercentage
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.widthpercentage = ar_value
end subroutine

public function boolean get_scaletofitlinewhenoverflow();
//*-----------------------------------------------------------------*/
//*  .NET property : ScaleToFitLineWhenOverflow
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
lbln_result = This.scaletofitlinewhenoverflow
Return lbln_result
end function

public subroutine  set_scaletofitlinewhenoverflow(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ScaleToFitLineWhenOverflow
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.scaletofitlinewhenoverflow = abln_value
end subroutine

public function boolean get_scaletofitheight();
//*-----------------------------------------------------------------*/
//*  .NET property : ScaleToFitHeight
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
lbln_result = This.scaletofitheight
Return lbln_result
end function

public subroutine  set_scaletofitheight(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ScaleToFitHeight
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.scaletofitheight = abln_value
end subroutine

public function dotnetobject get_layer();
//*-----------------------------------------------------------------*/
//*  .NET property : Layer
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
lnv_result = This.layer
Return lnv_result
end function

public subroutine  set_layer(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Layer
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.layer = anv_value
end subroutine

public function real get_initialrotation();
//*-----------------------------------------------------------------*/
//*  .NET property : InitialRotation
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
lr_result = This.initialrotation
Return lr_result
end function

public subroutine  set_initialrotation(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : InitialRotation
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.initialrotation = ar_value
end subroutine

public function dotnetobject get_directreference();
//*-----------------------------------------------------------------*/
//*  .NET property : DirectReference
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
lnv_result = This.directreference
Return lnv_result
end function

public subroutine  set_directreference(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : DirectReference
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.directreference = anv_value
end subroutine

public function long get_compressionlevel();
//*-----------------------------------------------------------------*/
//*  .NET property : CompressionLevel
//*   Return : Long
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Long ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet property */
ll_result = This.compressionlevel
Return ll_result
end function

public subroutine  set_compressionlevel(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CompressionLevel
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.compressionlevel = al_value
end subroutine

public function dotnetobject get_role();
//*-----------------------------------------------------------------*/
//*  .NET property : Role
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
lnv_result = This.role
Return lnv_result
end function

public subroutine  set_role(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Role
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.role = anv_value
end subroutine

public function dotnetobject get_id();
//*-----------------------------------------------------------------*/
//*  .NET property : ID
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
lnv_result = This.id
Return lnv_result
end function

public subroutine  set_id(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ID
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.id = anv_value
end subroutine

public function boolean get_isinline();
//*-----------------------------------------------------------------*/
//*  .NET property : IsInline
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
lbln_result = This.isinline
Return lbln_result
end function

public function dotnetobject get_chunks();
//*-----------------------------------------------------------------*/
//*  .NET property : Chunks
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
lnv_result = This.chunks
Return lnv_result
end function

public function real get_top();
//*-----------------------------------------------------------------*/
//*  .NET property : Top
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
lr_result = This.top
Return lr_result
end function

public subroutine  set_top(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Top
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.top = ar_value
end subroutine

public function long get_border();
//*-----------------------------------------------------------------*/
//*  .NET property : Border
//*   Return : Long
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Long ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet property */
ll_result = This.border
Return ll_result
end function

public subroutine  set_border(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Border
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.border = al_value
end subroutine

public function real get_grayfill();
//*-----------------------------------------------------------------*/
//*  .NET property : GrayFill
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
lr_result = This.grayfill
Return lr_result
end function

public subroutine  set_grayfill(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : GrayFill
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.grayfill = ar_value
end subroutine

public function real get_left();
//*-----------------------------------------------------------------*/
//*  .NET property : Left
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
lr_result = This.left
Return lr_result
end function

public subroutine  set_left(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Left
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.left = ar_value
end subroutine

public function real get_right();
//*-----------------------------------------------------------------*/
//*  .NET property : Right
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
lr_result = This.right
Return lr_result
end function

public subroutine  set_right(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Right
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.right = ar_value
end subroutine

public function real get_bottom();
//*-----------------------------------------------------------------*/
//*  .NET property : Bottom
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
lr_result = This.bottom
Return lr_result
end function

public subroutine  set_bottom(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Bottom
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.bottom = ar_value
end subroutine

public function dotnetobject get_bordercolorbottom();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorBottom
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
lnv_result = This.bordercolorbottom
Return lnv_result
end function

public subroutine  set_bordercolorbottom(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorBottom
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.bordercolorbottom = anv_value
end subroutine

public function dotnetobject get_bordercolortop();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorTop
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
lnv_result = This.bordercolortop
Return lnv_result
end function

public subroutine  set_bordercolortop(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorTop
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.bordercolortop = anv_value
end subroutine

public function dotnetobject get_bordercolorleft();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorLeft
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
lnv_result = This.bordercolorleft
Return lnv_result
end function

public subroutine  set_bordercolorleft(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorLeft
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.bordercolorleft = anv_value
end subroutine

public function dotnetobject get_bordercolorright();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorRight
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
lnv_result = This.bordercolorright
Return lnv_result
end function

public subroutine  set_bordercolorright(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorRight
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.bordercolorright = anv_value
end subroutine

public function real get_width();
//*-----------------------------------------------------------------*/
//*  .NET property : Width
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
lr_result = This.width
Return lr_result
end function

public subroutine  set_width(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Width
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.width = ar_value
end subroutine

public function real get_height();
//*-----------------------------------------------------------------*/
//*  .NET property : Height
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
lr_result = This.height
Return lr_result
end function

public function real get_borderwidth();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidth
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
lr_result = This.borderwidth
Return lr_result
end function

public subroutine  set_borderwidth(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidth
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.borderwidth = ar_value
end subroutine

public function dotnetobject get_bordercolor();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColor
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
lnv_result = This.bordercolor
Return lnv_result
end function

public subroutine  set_bordercolor(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColor
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.bordercolor = anv_value
end subroutine

public function dotnetobject get_backgroundcolor();
//*-----------------------------------------------------------------*/
//*  .NET property : BackgroundColor
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
lnv_result = This.backgroundcolor
Return lnv_result
end function

public subroutine  set_backgroundcolor(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BackgroundColor
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.backgroundcolor = anv_value
end subroutine

public function real get_borderwidthleft();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthLeft
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
lr_result = This.borderwidthleft
Return lr_result
end function

public subroutine  set_borderwidthleft(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthLeft
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.borderwidthleft = ar_value
end subroutine

public function real get_borderwidthright();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthRight
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
lr_result = This.borderwidthright
Return lr_result
end function

public subroutine  set_borderwidthright(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthRight
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.borderwidthright = ar_value
end subroutine

public function real get_borderwidthtop();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthTop
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
lr_result = This.borderwidthtop
Return lr_result
end function

public subroutine  set_borderwidthtop(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthTop
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.borderwidthtop = ar_value
end subroutine

public function real get_borderwidthbottom();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthBottom
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
lr_result = This.borderwidthbottom
Return lr_result
end function

public subroutine  set_borderwidthbottom(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthBottom
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.borderwidthbottom = ar_value
end subroutine

public function boolean get_usevariableborders();
//*-----------------------------------------------------------------*/
//*  .NET property : UseVariableBorders
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
lbln_result = This.usevariableborders
Return lbln_result
end function

public subroutine  set_usevariableborders(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : UseVariableBorders
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.usevariableborders = abln_value
end subroutine

on nvo_jpeg.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_jpeg.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

