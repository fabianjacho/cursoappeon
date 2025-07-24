$PBExportHeader$nvo_verticaltext.sru
forward
global type nvo_verticaltext from dotnetobject
end type
end forward

global type nvo_verticaltext from dotnetobject
end type
global nvo_verticaltext nvo_verticaltext

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.VerticalText"

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
public subroutine  of_addtext(dotnetobject anv_phrase)
public subroutine  of_addtext1(dotnetobject anv_chunk)
public subroutine  of_setverticallayout(real ar_startx,real ar_starty,real ar_height,long al_maxlines,real ar_leading)
public function long of_go()
public function long of_go(boolean abln_simulate)
public subroutine  of_setorigin(real ar_startx,real ar_starty)
public function real get_leading()
public subroutine  set_leading(real ar_value)
public function real get_originx()
public function real get_originy()
public function long get_maxlines()
public subroutine  set_maxlines(long al_value)
public function real get_height()
public subroutine  set_height(real ar_value)
public function long get_alignment()
public subroutine  set_alignment(long al_value)
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

public subroutine  of_addtext(dotnetobject anv_phrase);
//*-----------------------------------------------------------------*/
//*  .NET function : AddText
//*   Argument:
//*              Dotnetobject anv_phrase
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtext(anv_phrase)
end subroutine

public subroutine  of_addtext1(dotnetobject anv_chunk);
//*-----------------------------------------------------------------*/
//*  .NET function : AddText
//*   Argument:
//*              Dotnetobject anv_chunk
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtext(anv_chunk)
end subroutine

public subroutine  of_setverticallayout(real ar_startx,real ar_starty,real ar_height,long al_maxlines,real ar_leading);
//*-----------------------------------------------------------------*/
//*  .NET function : SetVerticalLayout
//*   Argument:
//*              Real ar_startx
//*              Real ar_starty
//*              Real ar_height
//*              Long al_maxlines
//*              Real ar_leading
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setverticallayout(ar_startx,ar_starty,ar_height,al_maxlines,ar_leading)
end subroutine

public function long of_go();
//*-----------------------------------------------------------------*/
//*  .NET function : Go
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
ll_result = This.go()
Return ll_result
end function

public function long of_go(boolean abln_simulate);
//*-----------------------------------------------------------------*/
//*  .NET function : Go
//*   Argument:
//*              Boolean abln_simulate
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
ll_result = This.go(abln_simulate)
Return ll_result
end function

public subroutine  of_setorigin(real ar_startx,real ar_starty);
//*-----------------------------------------------------------------*/
//*  .NET function : SetOrigin
//*   Argument:
//*              Real ar_startx
//*              Real ar_starty
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setorigin(ar_startx,ar_starty)
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

public subroutine  set_leading(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Leading
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.leading = ar_value
end subroutine

public function real get_originx();
//*-----------------------------------------------------------------*/
//*  .NET property : OriginX
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
lr_result = This.originx
Return lr_result
end function

public function real get_originy();
//*-----------------------------------------------------------------*/
//*  .NET property : OriginY
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
lr_result = This.originy
Return lr_result
end function

public function long get_maxlines();
//*-----------------------------------------------------------------*/
//*  .NET property : MaxLines
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
ll_result = This.maxlines
Return ll_result
end function

public subroutine  set_maxlines(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MaxLines
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.maxlines = al_value
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

public subroutine  set_height(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Height
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.height = ar_value
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

on nvo_verticaltext.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_verticaltext.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

