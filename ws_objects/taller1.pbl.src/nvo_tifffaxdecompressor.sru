$PBExportHeader$nvo_tifffaxdecompressor.sru
forward
global type nvo_tifffaxdecompressor from dotnetobject
end type
end forward

global type nvo_tifffaxdecompressor from dotnetobject
end type
global nvo_tifffaxdecompressor nvo_tifffaxdecompressor

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.codec.TIFFFaxDecompressor"

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
public subroutine  of_setoptions(long al_fillorder,long al_compression,long al_t4options,long al_t6options)
public subroutine  of_decoderaw(blob ablo_buffer,blob ablo_compdata,long al_w,long al_h)
public subroutine  of_decoderle()
public subroutine  of_decodenextscanline()
public subroutine  of_decodet4()
public subroutine  of_decodet6()
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

public subroutine  of_setoptions(long al_fillorder,long al_compression,long al_t4options,long al_t6options);
//*-----------------------------------------------------------------*/
//*  .NET function : SetOptions
//*   Argument:
//*              Long al_fillorder
//*              Long al_compression
//*              Long al_t4options
//*              Long al_t6options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setoptions(al_fillorder,al_compression,al_t4options,al_t6options)
end subroutine

public subroutine  of_decoderaw(blob ablo_buffer,blob ablo_compdata,long al_w,long al_h);
//*-----------------------------------------------------------------*/
//*  .NET function : DecodeRaw
//*   Argument:
//*              Blob ablo_buffer
//*              Blob ablo_compdata
//*              Long al_w
//*              Long al_h
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.decoderaw(ablo_buffer,ablo_compdata,al_w,al_h)
end subroutine

public subroutine  of_decoderle();
//*-----------------------------------------------------------------*/
//*  .NET function : DecodeRLE
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.decoderle()
end subroutine

public subroutine  of_decodenextscanline();
//*-----------------------------------------------------------------*/
//*  .NET function : DecodeNextScanline
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.decodenextscanline()
end subroutine

public subroutine  of_decodet4();
//*-----------------------------------------------------------------*/
//*  .NET function : DecodeT4
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.decodet4()
end subroutine

public subroutine  of_decodet6();
//*-----------------------------------------------------------------*/
//*  .NET function : DecodeT6
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.decodet6()
end subroutine

on nvo_tifffaxdecompressor.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_tifffaxdecompressor.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

