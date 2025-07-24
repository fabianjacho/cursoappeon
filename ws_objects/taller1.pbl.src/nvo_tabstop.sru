$PBExportHeader$nvo_tabstop.sru
forward
global type nvo_tabstop from dotnetobject
end type
end forward

global type nvo_tabstop from dotnetobject
end type
global nvo_tabstop nvo_tabstop

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.TabStop"

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
public function dotnetobject of_newinstance(real ar_currentposition,real ar_tabinterval)
public function real of_getposition(real ar_tabposition,real ar_currentposition,real ar_anchorposition)
public function real get_position()
public subroutine  set_position(real ar_value)
public function long get_align()
public subroutine  set_align(long al_value)
public function dotnetobject get_leader()
public subroutine  set_leader(dotnetobject anv_value)
public function char get_anchorchar()
public subroutine  set_anchorchar(char ach_value)
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

public function dotnetobject of_newinstance(real ar_currentposition,real ar_tabinterval);
//*-----------------------------------------------------------------*/
//*  .NET function : NewInstance
//*   Argument:
//*              Real ar_currentposition
//*              Real ar_tabinterval
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
lnv_result = This.newinstance(ar_currentposition,ar_tabinterval)
Return lnv_result
end function

public function real of_getposition(real ar_tabposition,real ar_currentposition,real ar_anchorposition);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPosition
//*   Argument:
//*              Real ar_tabposition
//*              Real ar_currentposition
//*              Real ar_anchorposition
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
lr_result = This.getposition(ar_tabposition,ar_currentposition,ar_anchorposition)
Return lr_result
end function

public function real get_position();
//*-----------------------------------------------------------------*/
//*  .NET property : Position
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
lr_result = This.position
Return lr_result
end function

public subroutine  set_position(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Position
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.position = ar_value
end subroutine

public function long get_align();
//*-----------------------------------------------------------------*/
//*  .NET property : Align
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
ll_result = This.align
Return ll_result
end function

public subroutine  set_align(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Align
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.align = al_value
end subroutine

public function dotnetobject get_leader();
//*-----------------------------------------------------------------*/
//*  .NET property : Leader
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
lnv_result = This.leader
Return lnv_result
end function

public subroutine  set_leader(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Leader
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.leader = anv_value
end subroutine

public function char get_anchorchar();
//*-----------------------------------------------------------------*/
//*  .NET property : AnchorChar
//*   Return : Char
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Char lch_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lch_result)
	Return lch_result
End If

/* Trigger the dotnet property */
lch_result = This.anchorchar
Return lch_result
end function

public subroutine  set_anchorchar(char ach_value);
//*-----------------------------------------------------------------*/
//*  .NET property : AnchorChar
//*   Argument:
//*              Char ach_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.anchorchar = ach_value
end subroutine

on nvo_tabstop.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_tabstop.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

