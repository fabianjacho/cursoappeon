$PBExportHeader$nvo_tiffwriter.sru
forward
global type nvo_tiffwriter from dotnetobject
end type
end forward

global type nvo_tiffwriter from dotnetobject
end type
global nvo_tiffwriter nvo_tiffwriter

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.codec.TiffWriter"

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
public subroutine  of_addfield(dotnetobject anv_field)
public function long of_getifdsize()
public subroutine  of_writefile(dotnetobject anv_stream)
public subroutine  of_writeshort(long al_v,dotnetobject anv_stream)
public subroutine  of_writelong(long al_v,dotnetobject anv_stream)
public subroutine  of_compresslzw(dotnetobject anv_stream,long al_predictor,blob ablo_b,long al_height,long al_samplesperpixel,long al_stride)
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

public subroutine  of_addfield(dotnetobject anv_field);
//*-----------------------------------------------------------------*/
//*  .NET function : AddField
//*   Argument:
//*              Dotnetobject anv_field
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addfield(anv_field)
end subroutine

public function long of_getifdsize();
//*-----------------------------------------------------------------*/
//*  .NET function : GetIfdSize
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
ll_result = This.getifdsize()
Return ll_result
end function

public subroutine  of_writefile(dotnetobject anv_stream);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteFile
//*   Argument:
//*              Dotnetobject anv_stream
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writefile(anv_stream)
end subroutine

public subroutine  of_writeshort(long al_v,dotnetobject anv_stream);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteShort
//*   Argument:
//*              Long al_v
//*              Dotnetobject anv_stream
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writeshort(al_v,anv_stream)
end subroutine

public subroutine  of_writelong(long al_v,dotnetobject anv_stream);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteLong
//*   Argument:
//*              Long al_v
//*              Dotnetobject anv_stream
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writelong(al_v,anv_stream)
end subroutine

public subroutine  of_compresslzw(dotnetobject anv_stream,long al_predictor,blob ablo_b,long al_height,long al_samplesperpixel,long al_stride);
//*-----------------------------------------------------------------*/
//*  .NET function : CompressLZW
//*   Argument:
//*              Dotnetobject anv_stream
//*              Long al_predictor
//*              Blob ablo_b
//*              Long al_height
//*              Long al_samplesperpixel
//*              Long al_stride
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.compresslzw(anv_stream,al_predictor,ablo_b,al_height,al_samplesperpixel,al_stride)
end subroutine

on nvo_tiffwriter.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_tiffwriter.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

