$PBExportHeader$nvo_cmaptounicode.sru
forward
global type nvo_cmaptounicode from dotnetobject
end type
end forward

global type nvo_cmaptounicode from dotnetobject
end type
global nvo_cmaptounicode nvo_cmaptounicode

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.fonts.cmaps.CMapToUnicode"

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
public function boolean of_hasonebytemappings()
public function boolean of_hastwobytemappings()
public function string of_lookup(blob ablo_code,long al_offset,long al_length)
public function dotnetobject of_createreversemapping()
public function dotnetobject of_createdirectmapping()
public function dotnetobject of_getidentity()
public function string of_decodestringtounicode(dotnetobject anv_ps)
public function long get_supplement()
public subroutine  set_supplement(long al_value)
public function string get_name()
public subroutine  set_name(string as_value)
public function string get_ordering()
public subroutine  set_ordering(string as_value)
public function string get_registry()
public subroutine  set_registry(string as_value)
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

public function boolean of_hasonebytemappings();
//*-----------------------------------------------------------------*/
//*  .NET function : HasOneByteMappings
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
lbln_result = This.hasonebytemappings()
Return lbln_result
end function

public function boolean of_hastwobytemappings();
//*-----------------------------------------------------------------*/
//*  .NET function : HasTwoByteMappings
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
lbln_result = This.hastwobytemappings()
Return lbln_result
end function

public function string of_lookup(blob ablo_code,long al_offset,long al_length);
//*-----------------------------------------------------------------*/
//*  .NET function : Lookup
//*   Argument:
//*              Blob ablo_code
//*              Long al_offset
//*              Long al_length
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
ls_result = This.lookup(ablo_code,al_offset,al_length)
Return ls_result
end function

public function dotnetobject of_createreversemapping();
//*-----------------------------------------------------------------*/
//*  .NET function : CreateReverseMapping
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
lnv_result = This.createreversemapping()
Return lnv_result
end function

public function dotnetobject of_createdirectmapping();
//*-----------------------------------------------------------------*/
//*  .NET function : CreateDirectMapping
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
lnv_result = This.createdirectmapping()
Return lnv_result
end function

public function dotnetobject of_getidentity();
//*-----------------------------------------------------------------*/
//*  .NET function : GetIdentity
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
lnv_result = This.getidentity()
Return lnv_result
end function

public function string of_decodestringtounicode(dotnetobject anv_ps);
//*-----------------------------------------------------------------*/
//*  .NET function : DecodeStringToUnicode
//*   Argument:
//*              Dotnetobject anv_ps
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
ls_result = This.decodestringtounicode(anv_ps)
Return ls_result
end function

public function long get_supplement();
//*-----------------------------------------------------------------*/
//*  .NET property : Supplement
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
ll_result = This.supplement
Return ll_result
end function

public subroutine  set_supplement(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Supplement
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.supplement = al_value
end subroutine

public function string get_name();
//*-----------------------------------------------------------------*/
//*  .NET property : Name
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
ls_result = This.name
Return ls_result
end function

public subroutine  set_name(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Name
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.name = as_value
end subroutine

public function string get_ordering();
//*-----------------------------------------------------------------*/
//*  .NET property : Ordering
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
ls_result = This.ordering
Return ls_result
end function

public subroutine  set_ordering(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Ordering
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.ordering = as_value
end subroutine

public function string get_registry();
//*-----------------------------------------------------------------*/
//*  .NET property : Registry
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
ls_result = This.registry
Return ls_result
end function

public subroutine  set_registry(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Registry
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.registry = as_value
end subroutine

on nvo_cmaptounicode.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_cmaptounicode.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

