﻿$PBExportHeader$nvo_xmpserializerhelper.sru
forward
global type nvo_xmpserializerhelper from dotnetobject
end type
end forward

global type nvo_xmpserializerhelper from dotnetobject
end type
global nvo_xmpserializerhelper nvo_xmpserializerhelper

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.xmp.impl.XmpSerializerHelper"

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
public subroutine  of_serialize(dotnetobject anv_xmp,dotnetobject anv_out,dotnetobject anv_options)
public function string of_serializetostring(dotnetobject anv_xmp,dotnetobject anv_options)
public function blob of_serializetobuffer(dotnetobject anv_xmp,dotnetobject anv_options)
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

public subroutine  of_serialize(dotnetobject anv_xmp,dotnetobject anv_out,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : Serialize
//*   Argument:
//*              Dotnetobject anv_xmp
//*              Dotnetobject anv_out
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.serialize(anv_xmp,anv_out,anv_options)
end subroutine

public function string of_serializetostring(dotnetobject anv_xmp,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : SerializeToString
//*   Argument:
//*              Dotnetobject anv_xmp
//*              Dotnetobject anv_options
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
ls_result = This.serializetostring(anv_xmp,anv_options)
Return ls_result
end function

public function blob of_serializetobuffer(dotnetobject anv_xmp,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : SerializeToBuffer
//*   Argument:
//*              Dotnetobject anv_xmp
//*              Dotnetobject anv_options
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
lbyt_result = This.serializetobuffer(anv_xmp,anv_options)
Return lbyt_result
end function

on nvo_xmpserializerhelper.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_xmpserializerhelper.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

