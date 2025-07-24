$PBExportHeader$nvo_pushbuttonfield.sru
forward
global type nvo_pushbuttonfield from dotnetobject
end type
end forward

global type nvo_pushbuttonfield from dotnetobject
end type
global nvo_pushbuttonfield nvo_pushbuttonfield

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PushbuttonField"

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
public function dotnetobject of_getappearance()
public subroutine  of_setrotationfrompage(dotnetobject anv_page)
public function long get_layout()
public subroutine  set_layout(long al_value)
public function dotnetobject get_image()
public subroutine  set_image(dotnetobject anv_value)
public function dotnetobject get_template()
public subroutine  set_template(dotnetobject anv_value)
public function long get_scaleicon()
public subroutine  set_scaleicon(long al_value)
public function boolean get_proportionalicon()
public subroutine  set_proportionalicon(boolean abln_value)
public function real get_iconverticaladjustment()
public subroutine  set_iconverticaladjustment(real ar_value)
public function real get_iconhorizontaladjustment()
public subroutine  set_iconhorizontaladjustment(real ar_value)
public function dotnetobject get_field()
public function boolean get_iconfittobounds()
public subroutine  set_iconfittobounds(boolean abln_value)
public function dotnetobject get_iconreference()
public subroutine  set_iconreference(dotnetobject anv_value)
public function real get_borderwidth()
public subroutine  set_borderwidth(real ar_value)
public function long get_borderstyle()
public subroutine  set_borderstyle(long al_value)
public function dotnetobject get_bordercolor()
public subroutine  set_bordercolor(dotnetobject anv_value)
public function dotnetobject get_backgroundcolor()
public subroutine  set_backgroundcolor(dotnetobject anv_value)
public function dotnetobject get_textcolor()
public subroutine  set_textcolor(dotnetobject anv_value)
public function dotnetobject get_font()
public subroutine  set_font(dotnetobject anv_value)
public function real get_fontsize()
public subroutine  set_fontsize(real ar_value)
public function long get_alignment()
public subroutine  set_alignment(long al_value)
public function string get_text()
public subroutine  set_text(string as_value)
public function dotnetobject get_box()
public subroutine  set_box(dotnetobject anv_value)
public function long get_rotation()
public subroutine  set_rotation(long al_value)
public function long get_visibility()
public subroutine  set_visibility(long al_value)
public function string get_fieldname()
public subroutine  set_fieldname(string as_value)
public function long get_options()
public subroutine  set_options(long al_value)
public function long get_maxcharacterlength()
public subroutine  set_maxcharacterlength(long al_value)
public function dotnetobject get_writer()
public subroutine  set_writer(dotnetobject anv_value)
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

public function dotnetobject of_getappearance();
//*-----------------------------------------------------------------*/
//*  .NET function : GetAppearance
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
lnv_result = This.getappearance()
Return lnv_result
end function

public subroutine  of_setrotationfrompage(dotnetobject anv_page);
//*-----------------------------------------------------------------*/
//*  .NET function : SetRotationFromPage
//*   Argument:
//*              Dotnetobject anv_page
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setrotationfrompage(anv_page)
end subroutine

public function long get_layout();
//*-----------------------------------------------------------------*/
//*  .NET property : Layout
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
ll_result = This.layout
Return ll_result
end function

public subroutine  set_layout(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Layout
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.layout = al_value
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

public function dotnetobject get_template();
//*-----------------------------------------------------------------*/
//*  .NET property : Template
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
lnv_result = This.template
Return lnv_result
end function

public subroutine  set_template(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Template
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.template = anv_value
end subroutine

public function long get_scaleicon();
//*-----------------------------------------------------------------*/
//*  .NET property : ScaleIcon
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
ll_result = This.scaleicon
Return ll_result
end function

public subroutine  set_scaleicon(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ScaleIcon
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.scaleicon = al_value
end subroutine

public function boolean get_proportionalicon();
//*-----------------------------------------------------------------*/
//*  .NET property : ProportionalIcon
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
lbln_result = This.proportionalicon
Return lbln_result
end function

public subroutine  set_proportionalicon(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ProportionalIcon
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.proportionalicon = abln_value
end subroutine

public function real get_iconverticaladjustment();
//*-----------------------------------------------------------------*/
//*  .NET property : IconVerticalAdjustment
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
lr_result = This.iconverticaladjustment
Return lr_result
end function

public subroutine  set_iconverticaladjustment(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : IconVerticalAdjustment
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.iconverticaladjustment = ar_value
end subroutine

public function real get_iconhorizontaladjustment();
//*-----------------------------------------------------------------*/
//*  .NET property : IconHorizontalAdjustment
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
lr_result = This.iconhorizontaladjustment
Return lr_result
end function

public subroutine  set_iconhorizontaladjustment(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : IconHorizontalAdjustment
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.iconhorizontaladjustment = ar_value
end subroutine

public function dotnetobject get_field();
//*-----------------------------------------------------------------*/
//*  .NET property : Field
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
lnv_result = This.field
Return lnv_result
end function

public function boolean get_iconfittobounds();
//*-----------------------------------------------------------------*/
//*  .NET property : IconFitToBounds
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
lbln_result = This.iconfittobounds
Return lbln_result
end function

public subroutine  set_iconfittobounds(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : IconFitToBounds
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.iconfittobounds = abln_value
end subroutine

public function dotnetobject get_iconreference();
//*-----------------------------------------------------------------*/
//*  .NET property : IconReference
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
lnv_result = This.iconreference
Return lnv_result
end function

public subroutine  set_iconreference(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : IconReference
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.iconreference = anv_value
end subroutine

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

public function long get_borderstyle();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderStyle
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
ll_result = This.borderstyle
Return ll_result
end function

public subroutine  set_borderstyle(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderStyle
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.borderstyle = al_value
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

public function dotnetobject get_textcolor();
//*-----------------------------------------------------------------*/
//*  .NET property : TextColor
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
lnv_result = This.textcolor
Return lnv_result
end function

public subroutine  set_textcolor(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : TextColor
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.textcolor = anv_value
end subroutine

public function dotnetobject get_font();
//*-----------------------------------------------------------------*/
//*  .NET property : Font
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
lnv_result = This.font
Return lnv_result
end function

public subroutine  set_font(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Font
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.font = anv_value
end subroutine

public function real get_fontsize();
//*-----------------------------------------------------------------*/
//*  .NET property : FontSize
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
lr_result = This.fontsize
Return lr_result
end function

public subroutine  set_fontsize(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : FontSize
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.fontsize = ar_value
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

public function string get_text();
//*-----------------------------------------------------------------*/
//*  .NET property : Text
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
ls_result = This.text
Return ls_result
end function

public subroutine  set_text(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Text
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.text = as_value
end subroutine

public function dotnetobject get_box();
//*-----------------------------------------------------------------*/
//*  .NET property : Box
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
lnv_result = This.box
Return lnv_result
end function

public subroutine  set_box(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Box
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.box = anv_value
end subroutine

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

public function long get_visibility();
//*-----------------------------------------------------------------*/
//*  .NET property : Visibility
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
ll_result = This.visibility
Return ll_result
end function

public subroutine  set_visibility(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Visibility
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.visibility = al_value
end subroutine

public function string get_fieldname();
//*-----------------------------------------------------------------*/
//*  .NET property : FieldName
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
ls_result = This.fieldname
Return ls_result
end function

public subroutine  set_fieldname(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : FieldName
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.fieldname = as_value
end subroutine

public function long get_options();
//*-----------------------------------------------------------------*/
//*  .NET property : Options
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
ll_result = This.options
Return ll_result
end function

public subroutine  set_options(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Options
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.options = al_value
end subroutine

public function long get_maxcharacterlength();
//*-----------------------------------------------------------------*/
//*  .NET property : MaxCharacterLength
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
ll_result = This.maxcharacterlength
Return ll_result
end function

public subroutine  set_maxcharacterlength(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MaxCharacterLength
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.maxcharacterlength = al_value
end subroutine

public function dotnetobject get_writer();
//*-----------------------------------------------------------------*/
//*  .NET property : Writer
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
lnv_result = This.writer
Return lnv_result
end function

public subroutine  set_writer(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Writer
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.writer = anv_value
end subroutine

on nvo_pushbuttonfield.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pushbuttonfield.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

