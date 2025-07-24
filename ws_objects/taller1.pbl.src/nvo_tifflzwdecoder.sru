$PBExportHeader$nvo_tifflzwdecoder.sru
forward
global type nvo_tifflzwdecoder from dotnetobject
end type
end forward

global type nvo_tifflzwdecoder from dotnetobject
end type
global nvo_tifflzwdecoder nvo_tifflzwdecoder

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.codec.TIFFLZWDecoder"

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
public function blob of_decode(blob ablo_data,blob ablo_uncompdata,long al_h)
public subroutine  of_initializestringtable()
public subroutine  of_writestring(blob ablo_strn)
public subroutine  of_addstringtotable(blob ablo_oldstring,byte abyt_newstring)
public subroutine  of_addstringtotable(blob ablo_strn)
public function blob of_composestring(blob ablo_oldstring,byte abyt_newstring)
public function long of_getnextcode()
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

public function blob of_decode(blob ablo_data,blob ablo_uncompdata,long al_h);
//*-----------------------------------------------------------------*/
//*  .NET function : Decode
//*   Argument:
//*              Blob ablo_data
//*              Blob ablo_uncompdata
//*              Long al_h
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
lbyt_result = This.decode(ablo_data,ablo_uncompdata,al_h)
Return lbyt_result
end function

public subroutine  of_initializestringtable();
//*-----------------------------------------------------------------*/
//*  .NET function : InitializeStringTable
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.initializestringtable()
end subroutine

public subroutine  of_writestring(blob ablo_strn);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteString
//*   Argument:
//*              Blob ablo_strn
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writestring(ablo_strn)
end subroutine

public subroutine  of_addstringtotable(blob ablo_oldstring,byte abyt_newstring);
//*-----------------------------------------------------------------*/
//*  .NET function : AddStringToTable
//*   Argument:
//*              Blob ablo_oldstring
//*              Byte abyt_newstring
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addstringtotable(ablo_oldstring,abyt_newstring)
end subroutine

public subroutine  of_addstringtotable(blob ablo_strn);
//*-----------------------------------------------------------------*/
//*  .NET function : AddStringToTable
//*   Argument:
//*              Blob ablo_strn
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addstringtotable(ablo_strn)
end subroutine

public function blob of_composestring(blob ablo_oldstring,byte abyt_newstring);
//*-----------------------------------------------------------------*/
//*  .NET function : ComposeString
//*   Argument:
//*              Blob ablo_oldstring
//*              Byte abyt_newstring
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
lbyt_result = This.composestring(ablo_oldstring,abyt_newstring)
Return lbyt_result
end function

public function long of_getnextcode();
//*-----------------------------------------------------------------*/
//*  .NET function : GetNextCode
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
ll_result = This.getnextcode()
Return ll_result
end function

on nvo_tifflzwdecoder.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_tifflzwdecoder.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

