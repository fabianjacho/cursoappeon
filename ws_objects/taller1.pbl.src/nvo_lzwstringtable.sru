$PBExportHeader$nvo_lzwstringtable.sru
forward
global type nvo_lzwstringtable from dotnetobject
end type
end forward

global type nvo_lzwstringtable from dotnetobject
end type
global nvo_lzwstringtable nvo_lzwstringtable

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.codec.LZWStringTable"

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
public function long of_addcharstring(int ai_index,byte abyt_b)
public function int of_findcharstring(int ai_index,byte abyt_b)
public subroutine  of_cleartable(long al_codesize)
public function long of_hash(int ai_index,byte abyt_lastbyte)
public function long of_expandcode(blob ablo_buf,long al_offset,int ai_code,long al_skiphead)
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

public function long of_addcharstring(int ai_index,byte abyt_b);
//*-----------------------------------------------------------------*/
//*  .NET function : AddCharString
//*   Argument:
//*              Int ai_index
//*              Byte abyt_b
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
ll_result = This.addcharstring(ai_index,abyt_b)
Return ll_result
end function

public function int of_findcharstring(int ai_index,byte abyt_b);
//*-----------------------------------------------------------------*/
//*  .NET function : FindCharString
//*   Argument:
//*              Int ai_index
//*              Byte abyt_b
//*   Return : Int
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Int li_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(li_result)
	Return li_result
End If

/* Trigger the dotnet function */
li_result = This.findcharstring(ai_index,abyt_b)
Return li_result
end function

public subroutine  of_cleartable(long al_codesize);
//*-----------------------------------------------------------------*/
//*  .NET function : ClearTable
//*   Argument:
//*              Long al_codesize
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.cleartable(al_codesize)
end subroutine

public function long of_hash(int ai_index,byte abyt_lastbyte);
//*-----------------------------------------------------------------*/
//*  .NET function : Hash
//*   Argument:
//*              Int ai_index
//*              Byte abyt_lastbyte
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
ll_result = This.hash(ai_index,abyt_lastbyte)
Return ll_result
end function

public function long of_expandcode(blob ablo_buf,long al_offset,int ai_code,long al_skiphead);
//*-----------------------------------------------------------------*/
//*  .NET function : ExpandCode
//*   Argument:
//*              Blob ablo_buf
//*              Long al_offset
//*              Int ai_code
//*              Long al_skiphead
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
ll_result = This.expandcode(ablo_buf,al_offset,ai_code,al_skiphead)
Return ll_result
end function

on nvo_lzwstringtable.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_lzwstringtable.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

