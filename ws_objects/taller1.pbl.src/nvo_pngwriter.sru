$PBExportHeader$nvo_pngwriter.sru
forward
global type nvo_pngwriter from dotnetobject
end type
end forward

global type nvo_pngwriter from dotnetobject
end type
global nvo_pngwriter nvo_pngwriter

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.codec.PngWriter"

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
public subroutine  of_writeheader(long al_width,long al_height,long al_bitdepth,long al_colortype)
public subroutine  of_writeend()
public subroutine  of_writedata(blob ablo_data,long al_stride)
public subroutine  of_writepalette(blob ablo_data)
public subroutine  of_writeiccprofile(blob ablo_data)
public subroutine  of_outputint(long al_n)
public subroutine  of_outputint(long al_n,dotnetobject anv_s)
public subroutine  of_writechunk(blob ablo_chunktype,blob ablo_data)
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

public subroutine  of_writeheader(long al_width,long al_height,long al_bitdepth,long al_colortype);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteHeader
//*   Argument:
//*              Long al_width
//*              Long al_height
//*              Long al_bitdepth
//*              Long al_colortype
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writeheader(al_width,al_height,al_bitdepth,al_colortype)
end subroutine

public subroutine  of_writeend();
//*-----------------------------------------------------------------*/
//*  .NET function : WriteEnd
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writeend()
end subroutine

public subroutine  of_writedata(blob ablo_data,long al_stride);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteData
//*   Argument:
//*              Blob ablo_data
//*              Long al_stride
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writedata(ablo_data,al_stride)
end subroutine

public subroutine  of_writepalette(blob ablo_data);
//*-----------------------------------------------------------------*/
//*  .NET function : WritePalette
//*   Argument:
//*              Blob ablo_data
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writepalette(ablo_data)
end subroutine

public subroutine  of_writeiccprofile(blob ablo_data);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteIccProfile
//*   Argument:
//*              Blob ablo_data
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writeiccprofile(ablo_data)
end subroutine

public subroutine  of_outputint(long al_n);
//*-----------------------------------------------------------------*/
//*  .NET function : OutputInt
//*   Argument:
//*              Long al_n
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.outputint(al_n)
end subroutine

public subroutine  of_outputint(long al_n,dotnetobject anv_s);
//*-----------------------------------------------------------------*/
//*  .NET function : OutputInt
//*   Argument:
//*              Long al_n
//*              Dotnetobject anv_s
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.outputint(al_n,anv_s)
end subroutine

public subroutine  of_writechunk(blob ablo_chunktype,blob ablo_data);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteChunk
//*   Argument:
//*              Blob ablo_chunktype
//*              Blob ablo_data
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writechunk(ablo_chunktype,ablo_data)
end subroutine

on nvo_pngwriter.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pngwriter.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

