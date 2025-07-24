$PBExportHeader$nvo_bytebuffer.sru
forward
global type nvo_bytebuffer from dotnetobject
end type
end forward

global type nvo_bytebuffer from dotnetobject
end type
global nvo_bytebuffer nvo_bytebuffer

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.xmp.impl.ByteBuffer"

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
public function byte of_byteat(long al_index)
public function long of_charat(long al_index)
public subroutine  of_append(byte abyt_b)
public subroutine  of_append(blob ablo_bytes,long al_offset,long al_len)
public subroutine  of_append(blob ablo_bytes)
public subroutine  of_append(dotnetobject anv_anotherbuffer)
public function dotnetobject get_bytestream()
public function long get_length()
public function string get_encoding()
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

public function byte of_byteat(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : ByteAt
//*   Argument:
//*              Long al_index
//*   Return : Byte
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Byte lbyt_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lbyt_result)
	Return lbyt_result
End If

/* Trigger the dotnet function */
lbyt_result = This.byteat(al_index)
Return lbyt_result
end function

public function long of_charat(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : CharAt
//*   Argument:
//*              Long al_index
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
ll_result = This.charat(al_index)
Return ll_result
end function

public subroutine  of_append(byte abyt_b);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              Byte abyt_b
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.append(abyt_b)
end subroutine

public subroutine  of_append(blob ablo_bytes,long al_offset,long al_len);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              Blob ablo_bytes
//*              Long al_offset
//*              Long al_len
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.append(ablo_bytes,al_offset,al_len)
end subroutine

public subroutine  of_append(blob ablo_bytes);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              Blob ablo_bytes
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.append(ablo_bytes)
end subroutine

public subroutine  of_append(dotnetobject anv_anotherbuffer);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              Dotnetobject anv_anotherbuffer
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.append(anv_anotherbuffer)
end subroutine

public function dotnetobject get_bytestream();
//*-----------------------------------------------------------------*/
//*  .NET property : ByteStream
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
lnv_result = This.bytestream
Return lnv_result
end function

public function long get_length();
//*-----------------------------------------------------------------*/
//*  .NET property : Length
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
ll_result = This.length
Return ll_result
end function

public function string get_encoding();
//*-----------------------------------------------------------------*/
//*  .NET property : Encoding
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
ls_result = This.encoding
Return ls_result
end function

on nvo_bytebuffer.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_bytebuffer.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

