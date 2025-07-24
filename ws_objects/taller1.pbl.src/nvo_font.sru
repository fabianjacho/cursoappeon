$PBExportHeader$nvo_font.sru
forward
global type nvo_font from dotnetobject
end type
end forward

global type nvo_font from dotnetobject
end type
global nvo_font nvo_font

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.Font"

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
public function long of_compareto(dotnetobject anv_font)
public subroutine  of_setfamily(string as_family)
public function long of_getfamilyindex(string as_family)
public function real of_getcalculatedleading(real ar_multipliedleading)
public function boolean of_isbold()
public function boolean of_isitalic()
public function boolean of_isunderlined()
public function boolean of_isstrikethru()
public subroutine  of_setstyle(string as_style)
public subroutine  of_setstyle(long al_style)
public function long of_getstylevalue(string as_style)
public subroutine  of_setcolor(long al_red,long al_green,long al_blue)
public function dotnetobject of_getcalculatedbasefont(boolean abln_specialencoding)
public function boolean of_isstandardfont()
public function dotnetobject of_difference(dotnetobject anv_font)
public function long get_family()
public function string get_familyname()
public function real get_size()
public subroutine  set_size(real ar_value)
public function real get_calculatedsize()
public function long get_style()
public function long get_calculatedstyle()
public function dotnetobject get_color()
public subroutine  set_color(dotnetobject anv_value)
public function dotnetobject get_basefont()
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

public function long of_compareto(dotnetobject anv_font);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareTo
//*   Argument:
//*              Dotnetobject anv_font
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
ll_result = This.compareto(anv_font)
Return ll_result
end function

public subroutine  of_setfamily(string as_family);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFamily
//*   Argument:
//*              String as_family
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setfamily(as_family)
end subroutine

public function long of_getfamilyindex(string as_family);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFamilyIndex
//*   Argument:
//*              String as_family
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
ll_result = This.getfamilyindex(as_family)
Return ll_result
end function

public function real of_getcalculatedleading(real ar_multipliedleading);
//*-----------------------------------------------------------------*/
//*  .NET function : GetCalculatedLeading
//*   Argument:
//*              Real ar_multipliedleading
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
lr_result = This.getcalculatedleading(ar_multipliedleading)
Return lr_result
end function

public function boolean of_isbold();
//*-----------------------------------------------------------------*/
//*  .NET function : IsBold
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
lbln_result = This.isbold()
Return lbln_result
end function

public function boolean of_isitalic();
//*-----------------------------------------------------------------*/
//*  .NET function : IsItalic
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
lbln_result = This.isitalic()
Return lbln_result
end function

public function boolean of_isunderlined();
//*-----------------------------------------------------------------*/
//*  .NET function : IsUnderlined
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
lbln_result = This.isunderlined()
Return lbln_result
end function

public function boolean of_isstrikethru();
//*-----------------------------------------------------------------*/
//*  .NET function : IsStrikethru
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
lbln_result = This.isstrikethru()
Return lbln_result
end function

public subroutine  of_setstyle(string as_style);
//*-----------------------------------------------------------------*/
//*  .NET function : SetStyle
//*   Argument:
//*              String as_style
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setstyle(as_style)
end subroutine

public subroutine  of_setstyle(long al_style);
//*-----------------------------------------------------------------*/
//*  .NET function : SetStyle
//*   Argument:
//*              Long al_style
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setstyle(al_style)
end subroutine

public function long of_getstylevalue(string as_style);
//*-----------------------------------------------------------------*/
//*  .NET function : GetStyleValue
//*   Argument:
//*              String as_style
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
ll_result = This.getstylevalue(as_style)
Return ll_result
end function

public subroutine  of_setcolor(long al_red,long al_green,long al_blue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetColor
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
This.setcolor(al_red,al_green,al_blue)
end subroutine

public function dotnetobject of_getcalculatedbasefont(boolean abln_specialencoding);
//*-----------------------------------------------------------------*/
//*  .NET function : GetCalculatedBaseFont
//*   Argument:
//*              Boolean abln_specialencoding
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
lnv_result = This.getcalculatedbasefont(abln_specialencoding)
Return lnv_result
end function

public function boolean of_isstandardfont();
//*-----------------------------------------------------------------*/
//*  .NET function : IsStandardFont
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
lbln_result = This.isstandardfont()
Return lbln_result
end function

public function dotnetobject of_difference(dotnetobject anv_font);
//*-----------------------------------------------------------------*/
//*  .NET function : Difference
//*   Argument:
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
lnv_result = This.difference(anv_font)
Return lnv_result
end function

public function long get_family();
//*-----------------------------------------------------------------*/
//*  .NET property : Family
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
ll_result = This.family
Return ll_result
end function

public function string get_familyname();
//*-----------------------------------------------------------------*/
//*  .NET property : Familyname
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
ls_result = This.familyname
Return ls_result
end function

public function real get_size();
//*-----------------------------------------------------------------*/
//*  .NET property : Size
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
lr_result = This.size
Return lr_result
end function

public subroutine  set_size(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Size
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.size = ar_value
end subroutine

public function real get_calculatedsize();
//*-----------------------------------------------------------------*/
//*  .NET property : CalculatedSize
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
lr_result = This.calculatedsize
Return lr_result
end function

public function long get_style();
//*-----------------------------------------------------------------*/
//*  .NET property : Style
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
ll_result = This.style
Return ll_result
end function

public function long get_calculatedstyle();
//*-----------------------------------------------------------------*/
//*  .NET property : CalculatedStyle
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
ll_result = This.calculatedstyle
Return ll_result
end function

public function dotnetobject get_color();
//*-----------------------------------------------------------------*/
//*  .NET property : Color
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
lnv_result = This.color
Return lnv_result
end function

public subroutine  set_color(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Color
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.color = anv_value
end subroutine

public function dotnetobject get_basefont();
//*-----------------------------------------------------------------*/
//*  .NET property : BaseFont
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
lnv_result = This.basefont
Return lnv_result
end function

on nvo_font.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_font.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

