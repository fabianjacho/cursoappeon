﻿$PBExportHeader$nvo_tifffaxdecoder.sru
forward
global type nvo_tifffaxdecoder from dotnetobject
end type
end forward

global type nvo_tifffaxdecoder from dotnetobject
end type
global nvo_tifffaxdecoder nvo_tifffaxdecoder

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.codec.TIFFFaxDecoder"

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
public subroutine  of_reversebits(blob ablo_b)
public subroutine  of_decode1d(blob ablo_buffer,blob ablo_compdata,long al_startx,long al_height)
public subroutine  of_decodenextscanline(blob ablo_buffer,long al_lineoffset,long al_bitoffset)
public subroutine  of_decode2d(blob ablo_buffer,blob ablo_compdata,long al_startx,long al_height,longlong all_tifft4options)
public subroutine  of_decodet6(blob ablo_buffer,blob ablo_compdata,long al_startx,long al_height,longlong all_tifft6options)
public subroutine  set_recoverfromimageerror(boolean abln_value)
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

public subroutine  of_reversebits(blob ablo_b);
//*-----------------------------------------------------------------*/
//*  .NET function : ReverseBits
//*   Argument:
//*              Blob ablo_b
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.reversebits(ablo_b)
end subroutine

public subroutine  of_decode1d(blob ablo_buffer,blob ablo_compdata,long al_startx,long al_height);
//*-----------------------------------------------------------------*/
//*  .NET function : Decode1D
//*   Argument:
//*              Blob ablo_buffer
//*              Blob ablo_compdata
//*              Long al_startx
//*              Long al_height
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.decode1d(ablo_buffer,ablo_compdata,al_startx,al_height)
end subroutine

public subroutine  of_decodenextscanline(blob ablo_buffer,long al_lineoffset,long al_bitoffset);
//*-----------------------------------------------------------------*/
//*  .NET function : DecodeNextScanline
//*   Argument:
//*              Blob ablo_buffer
//*              Long al_lineoffset
//*              Long al_bitoffset
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.decodenextscanline(ablo_buffer,al_lineoffset,al_bitoffset)
end subroutine

public subroutine  of_decode2d(blob ablo_buffer,blob ablo_compdata,long al_startx,long al_height,longlong all_tifft4options);
//*-----------------------------------------------------------------*/
//*  .NET function : Decode2D
//*   Argument:
//*              Blob ablo_buffer
//*              Blob ablo_compdata
//*              Long al_startx
//*              Long al_height
//*              Longlong all_tifft4options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.decode2d(ablo_buffer,ablo_compdata,al_startx,al_height,all_tifft4options)
end subroutine

public subroutine  of_decodet6(blob ablo_buffer,blob ablo_compdata,long al_startx,long al_height,longlong all_tifft6options);
//*-----------------------------------------------------------------*/
//*  .NET function : DecodeT6
//*   Argument:
//*              Blob ablo_buffer
//*              Blob ablo_compdata
//*              Long al_startx
//*              Long al_height
//*              Longlong all_tifft6options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.decodet6(ablo_buffer,ablo_compdata,al_startx,al_height,all_tifft6options)
end subroutine

public subroutine  set_recoverfromimageerror(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : RecoverFromImageError
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.recoverfromimageerror = abln_value
end subroutine

on nvo_tifffaxdecoder.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_tifffaxdecoder.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

