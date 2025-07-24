$PBExportHeader$nvo_pdfpcell.sru
forward
global type nvo_pdfpcell from dotnetobject
end type
end forward

global type nvo_pdfpcell from dotnetobject
end type
global nvo_pdfpcell nvo_pdfpcell

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PdfPCell"

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
public subroutine  of_addheader(dotnetobject anv_header)
public subroutine  of_addelement(dotnetobject anv_element)
public subroutine  of_setleading(real ar_fixedleading,real ar_multipliedleading)
public function boolean of_hascalculatedheight()
public function boolean of_hasfixedheight()
public function boolean of_hascachedmaxheight()
public function boolean of_hasminimumheight()
public function real of_getmaxheight()
public function dotnetobject of_getaccessibleattribute(dotnetobject anv_key)
public subroutine  of_setaccessibleattribute(dotnetobject anv_key,dotnetobject anv_value)
public function dotnetobject of_getaccessibleattributes()
public subroutine  of_clonenonpositionparameters(dotnetobject anv_rect)
public subroutine  of_softclonenonpositionparameters(dotnetobject anv_rect)
public function boolean of_process(dotnetobject anv_listener)
public function boolean of_iscontent()
public function boolean of_isnestable()
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
public function dotnetobject get_phrase()
public subroutine  set_phrase(dotnetobject anv_value)
public function long get_horizontalalignment()
public subroutine  set_horizontalalignment(long al_value)
public function long get_verticalalignment()
public subroutine  set_verticalalignment(long al_value)
public function real get_effectivepaddingleft()
public function real get_paddingleft()
public subroutine  set_paddingleft(real ar_value)
public function real get_effectivepaddingright()
public function real get_paddingright()
public subroutine  set_paddingright(real ar_value)
public function real get_effectivepaddingtop()
public function real get_paddingtop()
public subroutine  set_paddingtop(real ar_value)
public function real get_effectivepaddingbottom()
public function real get_paddingbottom()
public subroutine  set_paddingbottom(real ar_value)
public subroutine  set_padding(real ar_value)
public function boolean get_useborderpadding()
public subroutine  set_useborderpadding(boolean abln_value)
public function real get_leading()
public function real get_multipliedleading()
public function real get_indent()
public subroutine  set_indent(real ar_value)
public function real get_extraparagraphspace()
public subroutine  set_extraparagraphspace(real ar_value)
public function real get_calculatedheight()
public subroutine  set_calculatedheight(real ar_value)
public function real get_fixedheight()
public subroutine  set_fixedheight(real ar_value)
public function real get_cachedmaxheight()
public function boolean get_nowrap()
public subroutine  set_nowrap(boolean abln_value)
public function dotnetobject get_table()
public subroutine  set_table(dotnetobject anv_value)
public function real get_minimumheight()
public subroutine  set_minimumheight(real ar_value)
public function long get_colspan()
public subroutine  set_colspan(long al_value)
public function long get_rowspan()
public subroutine  set_rowspan(long al_value)
public function real get_followingindent()
public subroutine  set_followingindent(real ar_value)
public function real get_rightindent()
public subroutine  set_rightindent(real ar_value)
public function real get_spacecharratio()
public subroutine  set_spacecharratio(real ar_value)
public function long get_rundirection()
public subroutine  set_rundirection(long al_value)
public function dotnetobject get_image()
public subroutine  set_image(dotnetobject anv_value)
public function dotnetobject get_cellevent()
public subroutine  set_cellevent(dotnetobject anv_value)
public function long get_arabicoptions()
public subroutine  set_arabicoptions(long al_value)
public function boolean get_useascender()
public subroutine  set_useascender(boolean abln_value)
public function boolean get_usedescender()
public subroutine  set_usedescender(boolean abln_value)
public function dotnetobject get_column()
public subroutine  set_column(dotnetobject anv_value)
public function dotnetobject get_compositeelements()
public function long get_rotation()
public subroutine  set_rotation(long al_value)
public function dotnetobject get_role()
public subroutine  set_role(dotnetobject anv_value)
public function dotnetobject get_id()
public subroutine  set_id(dotnetobject anv_value)
public function boolean get_isinline()
public function dotnetobject get_headers()
public function long get_type()
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

public subroutine  of_addheader(dotnetobject anv_header);
//*-----------------------------------------------------------------*/
//*  .NET function : AddHeader
//*   Argument:
//*              Dotnetobject anv_header
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addheader(anv_header)
end subroutine

public subroutine  of_addelement(dotnetobject anv_element);
//*-----------------------------------------------------------------*/
//*  .NET function : AddElement
//*   Argument:
//*              Dotnetobject anv_element
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addelement(anv_element)
end subroutine

public subroutine  of_setleading(real ar_fixedleading,real ar_multipliedleading);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLeading
//*   Argument:
//*              Real ar_fixedleading
//*              Real ar_multipliedleading
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setleading(ar_fixedleading,ar_multipliedleading)
end subroutine

public function boolean of_hascalculatedheight();
//*-----------------------------------------------------------------*/
//*  .NET function : HasCalculatedHeight
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
lbln_result = This.hascalculatedheight()
Return lbln_result
end function

public function boolean of_hasfixedheight();
//*-----------------------------------------------------------------*/
//*  .NET function : HasFixedHeight
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
lbln_result = This.hasfixedheight()
Return lbln_result
end function

public function boolean of_hascachedmaxheight();
//*-----------------------------------------------------------------*/
//*  .NET function : HasCachedMaxHeight
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
lbln_result = This.hascachedmaxheight()
Return lbln_result
end function

public function boolean of_hasminimumheight();
//*-----------------------------------------------------------------*/
//*  .NET function : HasMinimumHeight
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
lbln_result = This.hasminimumheight()
Return lbln_result
end function

public function real of_getmaxheight();
//*-----------------------------------------------------------------*/
//*  .NET function : GetMaxHeight
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
lr_result = This.getmaxheight()
Return lr_result
end function

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

public function dotnetobject get_phrase();
//*-----------------------------------------------------------------*/
//*  .NET property : Phrase
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
lnv_result = This.phrase
Return lnv_result
end function

public subroutine  set_phrase(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Phrase
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.phrase = anv_value
end subroutine

public function long get_horizontalalignment();
//*-----------------------------------------------------------------*/
//*  .NET property : HorizontalAlignment
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
ll_result = This.horizontalalignment
Return ll_result
end function

public subroutine  set_horizontalalignment(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : HorizontalAlignment
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.horizontalalignment = al_value
end subroutine

public function long get_verticalalignment();
//*-----------------------------------------------------------------*/
//*  .NET property : VerticalAlignment
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
ll_result = This.verticalalignment
Return ll_result
end function

public subroutine  set_verticalalignment(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : VerticalAlignment
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.verticalalignment = al_value
end subroutine

public function real get_effectivepaddingleft();
//*-----------------------------------------------------------------*/
//*  .NET property : EffectivePaddingLeft
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
lr_result = This.effectivepaddingleft
Return lr_result
end function

public function real get_paddingleft();
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingLeft
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
lr_result = This.paddingleft
Return lr_result
end function

public subroutine  set_paddingleft(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingLeft
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.paddingleft = ar_value
end subroutine

public function real get_effectivepaddingright();
//*-----------------------------------------------------------------*/
//*  .NET property : EffectivePaddingRight
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
lr_result = This.effectivepaddingright
Return lr_result
end function

public function real get_paddingright();
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingRight
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
lr_result = This.paddingright
Return lr_result
end function

public subroutine  set_paddingright(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingRight
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.paddingright = ar_value
end subroutine

public function real get_effectivepaddingtop();
//*-----------------------------------------------------------------*/
//*  .NET property : EffectivePaddingTop
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
lr_result = This.effectivepaddingtop
Return lr_result
end function

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

public function real get_effectivepaddingbottom();
//*-----------------------------------------------------------------*/
//*  .NET property : EffectivePaddingBottom
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
lr_result = This.effectivepaddingbottom
Return lr_result
end function

public function real get_paddingbottom();
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingBottom
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
lr_result = This.paddingbottom
Return lr_result
end function

public subroutine  set_paddingbottom(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingBottom
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.paddingbottom = ar_value
end subroutine

public subroutine  set_padding(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Padding
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.padding = ar_value
end subroutine

public function boolean get_useborderpadding();
//*-----------------------------------------------------------------*/
//*  .NET property : UseBorderPadding
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
lbln_result = This.useborderpadding
Return lbln_result
end function

public subroutine  set_useborderpadding(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : UseBorderPadding
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.useborderpadding = abln_value
end subroutine

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

public function real get_multipliedleading();
//*-----------------------------------------------------------------*/
//*  .NET property : MultipliedLeading
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
lr_result = This.multipliedleading
Return lr_result
end function

public function real get_indent();
//*-----------------------------------------------------------------*/
//*  .NET property : Indent
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
lr_result = This.indent
Return lr_result
end function

public subroutine  set_indent(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Indent
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.indent = ar_value
end subroutine

public function real get_extraparagraphspace();
//*-----------------------------------------------------------------*/
//*  .NET property : ExtraParagraphSpace
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
lr_result = This.extraparagraphspace
Return lr_result
end function

public subroutine  set_extraparagraphspace(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ExtraParagraphSpace
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.extraparagraphspace = ar_value
end subroutine

public function real get_calculatedheight();
//*-----------------------------------------------------------------*/
//*  .NET property : CalculatedHeight
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
lr_result = This.calculatedheight
Return lr_result
end function

public subroutine  set_calculatedheight(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CalculatedHeight
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.calculatedheight = ar_value
end subroutine

public function real get_fixedheight();
//*-----------------------------------------------------------------*/
//*  .NET property : FixedHeight
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
lr_result = This.fixedheight
Return lr_result
end function

public subroutine  set_fixedheight(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : FixedHeight
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.fixedheight = ar_value
end subroutine

public function real get_cachedmaxheight();
//*-----------------------------------------------------------------*/
//*  .NET property : CachedMaxHeight
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
lr_result = This.cachedmaxheight
Return lr_result
end function

public function boolean get_nowrap();
//*-----------------------------------------------------------------*/
//*  .NET property : NoWrap
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
lbln_result = This.nowrap
Return lbln_result
end function

public subroutine  set_nowrap(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : NoWrap
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.nowrap = abln_value
end subroutine

public function dotnetobject get_table();
//*-----------------------------------------------------------------*/
//*  .NET property : Table
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
lnv_result = This.table
Return lnv_result
end function

public subroutine  set_table(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Table
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.table = anv_value
end subroutine

public function real get_minimumheight();
//*-----------------------------------------------------------------*/
//*  .NET property : MinimumHeight
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
lr_result = This.minimumheight
Return lr_result
end function

public subroutine  set_minimumheight(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MinimumHeight
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.minimumheight = ar_value
end subroutine

public function long get_colspan();
//*-----------------------------------------------------------------*/
//*  .NET property : Colspan
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
ll_result = This.colspan
Return ll_result
end function

public subroutine  set_colspan(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Colspan
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.colspan = al_value
end subroutine

public function long get_rowspan();
//*-----------------------------------------------------------------*/
//*  .NET property : Rowspan
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
ll_result = This.rowspan
Return ll_result
end function

public subroutine  set_rowspan(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Rowspan
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.rowspan = al_value
end subroutine

public function real get_followingindent();
//*-----------------------------------------------------------------*/
//*  .NET property : FollowingIndent
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
lr_result = This.followingindent
Return lr_result
end function

public subroutine  set_followingindent(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : FollowingIndent
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.followingindent = ar_value
end subroutine

public function real get_rightindent();
//*-----------------------------------------------------------------*/
//*  .NET property : RightIndent
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
lr_result = This.rightindent
Return lr_result
end function

public subroutine  set_rightindent(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : RightIndent
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.rightindent = ar_value
end subroutine

public function real get_spacecharratio();
//*-----------------------------------------------------------------*/
//*  .NET property : SpaceCharRatio
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
lr_result = This.spacecharratio
Return lr_result
end function

public subroutine  set_spacecharratio(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SpaceCharRatio
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.spacecharratio = ar_value
end subroutine

public function long get_rundirection();
//*-----------------------------------------------------------------*/
//*  .NET property : RunDirection
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
ll_result = This.rundirection
Return ll_result
end function

public subroutine  set_rundirection(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : RunDirection
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.rundirection = al_value
end subroutine

public function dotnetobject get_image();
//*-----------------------------------------------------------------*/
//*  .NET property : Image
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
lnv_result = This.image
Return lnv_result
end function

public subroutine  set_image(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Image
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.image = anv_value
end subroutine

public function dotnetobject get_cellevent();
//*-----------------------------------------------------------------*/
//*  .NET property : CellEvent
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
lnv_result = This.cellevent
Return lnv_result
end function

public subroutine  set_cellevent(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CellEvent
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.cellevent = anv_value
end subroutine

public function long get_arabicoptions();
//*-----------------------------------------------------------------*/
//*  .NET property : ArabicOptions
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
ll_result = This.arabicoptions
Return ll_result
end function

public subroutine  set_arabicoptions(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ArabicOptions
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.arabicoptions = al_value
end subroutine

public function boolean get_useascender();
//*-----------------------------------------------------------------*/
//*  .NET property : UseAscender
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
lbln_result = This.useascender
Return lbln_result
end function

public subroutine  set_useascender(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : UseAscender
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.useascender = abln_value
end subroutine

public function boolean get_usedescender();
//*-----------------------------------------------------------------*/
//*  .NET property : UseDescender
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
lbln_result = This.usedescender
Return lbln_result
end function

public subroutine  set_usedescender(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : UseDescender
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.usedescender = abln_value
end subroutine

public function dotnetobject get_column();
//*-----------------------------------------------------------------*/
//*  .NET property : Column
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
lnv_result = This.column
Return lnv_result
end function

public subroutine  set_column(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Column
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.column = anv_value
end subroutine

public function dotnetobject get_compositeelements();
//*-----------------------------------------------------------------*/
//*  .NET property : CompositeElements
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
lnv_result = This.compositeelements
Return lnv_result
end function

public function long get_rotation();
//*-----------------------------------------------------------------*/
//*  .NET property : Rotation
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
ll_result = This.rotation
Return ll_result
end function

public subroutine  set_rotation(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Rotation
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.rotation = al_value
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

public function dotnetobject get_headers();
//*-----------------------------------------------------------------*/
//*  .NET property : Headers
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
lnv_result = This.headers
Return lnv_result
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

on nvo_pdfpcell.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfpcell.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

