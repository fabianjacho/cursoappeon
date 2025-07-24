$PBExportHeader$nvo_graphicsstate.sru
forward
global type nvo_graphicsstate from dotnetobject
end type
end forward

global type nvo_graphicsstate from dotnetobject
end type
global nvo_graphicsstate nvo_graphicsstate

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.parser.GraphicsState"

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
public function dotnetobject of_getctm()
public function real of_getcharacterspacing()
public function real of_getwordspacing()
public function real of_gethorizontalscaling()
public function real of_getleading()
public function dotnetobject of_getfont()
public function real of_getfontsize()
public function long of_getrendermode()
public function real of_getrise()
public function boolean of_isknockout()
public function dotnetobject of_getlinedashpattern()
public subroutine  of_setlinedashpattern(dotnetobject anv_linedashpattern)
public function real get_characterspacing()
public function real get_wordspacing()
public function real get_horizontalscaling()
public function dotnetobject get_font()
public function real get_fontsize()
public function dotnetobject get_colorspacefill()
public function dotnetobject get_colorspacestroke()
public function dotnetobject get_fillcolor()
public function dotnetobject get_strokecolor()
public function real get_linewidth()
public subroutine  set_linewidth(real ar_value)
public function long get_linecapstyle()
public subroutine  set_linecapstyle(long al_value)
public function long get_linejoinstyle()
public subroutine  set_linejoinstyle(long al_value)
public function real get_miterlimit()
public subroutine  set_miterlimit(real ar_value)
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

public function dotnetobject of_getctm();
//*-----------------------------------------------------------------*/
//*  .NET function : GetCtm
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
lnv_result = This.getctm()
Return lnv_result
end function

public function real of_getcharacterspacing();
//*-----------------------------------------------------------------*/
//*  .NET function : GetCharacterSpacing
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
lr_result = This.getcharacterspacing()
Return lr_result
end function

public function real of_getwordspacing();
//*-----------------------------------------------------------------*/
//*  .NET function : GetWordSpacing
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
lr_result = This.getwordspacing()
Return lr_result
end function

public function real of_gethorizontalscaling();
//*-----------------------------------------------------------------*/
//*  .NET function : GetHorizontalScaling
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
lr_result = This.gethorizontalscaling()
Return lr_result
end function

public function real of_getleading();
//*-----------------------------------------------------------------*/
//*  .NET function : GetLeading
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
lr_result = This.getleading()
Return lr_result
end function

public function dotnetobject of_getfont();
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
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
lnv_result = This.getfont()
Return lnv_result
end function

public function real of_getfontsize();
//*-----------------------------------------------------------------*/
//*  .NET function : GetFontSize
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
lr_result = This.getfontsize()
Return lr_result
end function

public function long of_getrendermode();
//*-----------------------------------------------------------------*/
//*  .NET function : GetRenderMode
//*   Return : Long
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Long ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet function */
ll_result = This.getrendermode()
Return ll_result
end function

public function real of_getrise();
//*-----------------------------------------------------------------*/
//*  .NET function : GetRise
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
lr_result = This.getrise()
Return lr_result
end function

public function boolean of_isknockout();
//*-----------------------------------------------------------------*/
//*  .NET function : IsKnockout
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
lbln_result = This.isknockout()
Return lbln_result
end function

public function dotnetobject of_getlinedashpattern();
//*-----------------------------------------------------------------*/
//*  .NET function : GetLineDashPattern
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
lnv_result = This.getlinedashpattern()
Return lnv_result
end function

public subroutine  of_setlinedashpattern(dotnetobject anv_linedashpattern);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLineDashPattern
//*   Argument:
//*              Dotnetobject anv_linedashpattern
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlinedashpattern(anv_linedashpattern)
end subroutine

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

public function dotnetobject get_colorspacefill();
//*-----------------------------------------------------------------*/
//*  .NET property : ColorSpaceFill
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
lnv_result = This.colorspacefill
Return lnv_result
end function

public function dotnetobject get_colorspacestroke();
//*-----------------------------------------------------------------*/
//*  .NET property : ColorSpaceStroke
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
lnv_result = This.colorspacestroke
Return lnv_result
end function

public function dotnetobject get_fillcolor();
//*-----------------------------------------------------------------*/
//*  .NET property : FillColor
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
lnv_result = This.fillcolor
Return lnv_result
end function

public function dotnetobject get_strokecolor();
//*-----------------------------------------------------------------*/
//*  .NET property : StrokeColor
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
lnv_result = This.strokecolor
Return lnv_result
end function

public function real get_linewidth();
//*-----------------------------------------------------------------*/
//*  .NET property : LineWidth
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
lr_result = This.linewidth
Return lr_result
end function

public subroutine  set_linewidth(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : LineWidth
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.linewidth = ar_value
end subroutine

public function long get_linecapstyle();
//*-----------------------------------------------------------------*/
//*  .NET property : LineCapStyle
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
ll_result = This.linecapstyle
Return ll_result
end function

public subroutine  set_linecapstyle(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : LineCapStyle
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.linecapstyle = al_value
end subroutine

public function long get_linejoinstyle();
//*-----------------------------------------------------------------*/
//*  .NET property : LineJoinStyle
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
ll_result = This.linejoinstyle
Return ll_result
end function

public subroutine  set_linejoinstyle(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : LineJoinStyle
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.linejoinstyle = al_value
end subroutine

public function real get_miterlimit();
//*-----------------------------------------------------------------*/
//*  .NET property : MiterLimit
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
lr_result = This.miterlimit
Return lr_result
end function

public subroutine  set_miterlimit(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MiterLimit
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.miterlimit = ar_value
end subroutine

on nvo_graphicsstate.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_graphicsstate.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

