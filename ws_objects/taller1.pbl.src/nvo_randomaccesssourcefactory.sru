$PBExportHeader$nvo_randomaccesssourcefactory.sru
forward
global type nvo_randomaccesssourcefactory from dotnetobject
end type
end forward

global type nvo_randomaccesssourcefactory from dotnetobject
end type
global nvo_randomaccesssourcefactory nvo_randomaccesssourcefactory

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.io.RandomAccessSourceFactory"

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
public function dotnetobject of_setforceread(boolean abln_forceread)
public function dotnetobject of_setexclusivelylockfile(boolean abln_exclusivelylockfile)
public function dotnetobject of_createsource(blob ablo_data)
public function dotnetobject of_createsource(dotnetobject anv_raf)
public function dotnetobject of_createsource1(dotnetobject anv_url)
public function dotnetobject of_createsource2(dotnetobject anv_inp)
public function dotnetobject of_createbestsource(string as_filename)
public function dotnetobject of_createranged(dotnetobject anv_source,dotnetobject anv_ranges)
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

public function dotnetobject of_setforceread(boolean abln_forceread);
//*-----------------------------------------------------------------*/
//*  .NET function : SetForceRead
//*   Argument:
//*              Boolean abln_forceread
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
lnv_result = This.setforceread(abln_forceread)
Return lnv_result
end function

public function dotnetobject of_setexclusivelylockfile(boolean abln_exclusivelylockfile);
//*-----------------------------------------------------------------*/
//*  .NET function : SetExclusivelyLockFile
//*   Argument:
//*              Boolean abln_exclusivelylockfile
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
lnv_result = This.setexclusivelylockfile(abln_exclusivelylockfile)
Return lnv_result
end function

public function dotnetobject of_createsource(blob ablo_data);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateSource
//*   Argument:
//*              Blob ablo_data
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
lnv_result = This.createsource(ablo_data)
Return lnv_result
end function

public function dotnetobject of_createsource(dotnetobject anv_raf);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateSource
//*   Argument:
//*              Dotnetobject anv_raf
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
lnv_result = This.createsource(anv_raf)
Return lnv_result
end function

public function dotnetobject of_createsource1(dotnetobject anv_url);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateSource
//*   Argument:
//*              Dotnetobject anv_url
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
lnv_result = This.createsource(anv_url)
Return lnv_result
end function

public function dotnetobject of_createsource2(dotnetobject anv_inp);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateSource
//*   Argument:
//*              Dotnetobject anv_inp
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
lnv_result = This.createsource(anv_inp)
Return lnv_result
end function

public function dotnetobject of_createbestsource(string as_filename);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateBestSource
//*   Argument:
//*              String as_filename
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
lnv_result = This.createbestsource(as_filename)
Return lnv_result
end function

public function dotnetobject of_createranged(dotnetobject anv_source,dotnetobject anv_ranges);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateRanged
//*   Argument:
//*              Dotnetobject anv_source
//*              Dotnetobject anv_ranges
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
lnv_result = This.createranged(anv_source,anv_ranges)
Return lnv_result
end function

on nvo_randomaccesssourcefactory.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_randomaccesssourcefactory.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

