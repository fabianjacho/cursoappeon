$PBExportHeader$nvo_metado.sru
forward
global type nvo_metado from dotnetobject
end type
end forward

global type nvo_metado from dotnetobject
end type
global nvo_metado nvo_metado

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.codec.wmf.MetaDo"

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
public subroutine  of_readall()
public subroutine  of_outputtext(long al_x,long al_y,long al_flag,long al_x1,long al_y1,long al_x2,long al_y2,string as_text)
public function boolean of_isnullstrokefill(boolean abln_isrectangle)
public subroutine  of_strokeandfill()
public function blob of_wrapbmp(dotnetobject anv_image)
public subroutine  of_writeword(dotnetobject anv_os,long al_v)
public subroutine  of_writedword(dotnetobject anv_os,long al_v)
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

public subroutine  of_readall();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadAll
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.readall()
end subroutine

public subroutine  of_outputtext(long al_x,long al_y,long al_flag,long al_x1,long al_y1,long al_x2,long al_y2,string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : OutputText
//*   Argument:
//*              Long al_x
//*              Long al_y
//*              Long al_flag
//*              Long al_x1
//*              Long al_y1
//*              Long al_x2
//*              Long al_y2
//*              String as_text
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.outputtext(al_x,al_y,al_flag,al_x1,al_y1,al_x2,al_y2,as_text)
end subroutine

public function boolean of_isnullstrokefill(boolean abln_isrectangle);
//*-----------------------------------------------------------------*/
//*  .NET function : IsNullStrokeFill
//*   Argument:
//*              Boolean abln_isrectangle
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
lbln_result = This.isnullstrokefill(abln_isrectangle)
Return lbln_result
end function

public subroutine  of_strokeandfill();
//*-----------------------------------------------------------------*/
//*  .NET function : StrokeAndFill
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.strokeandfill()
end subroutine

public function blob of_wrapbmp(dotnetobject anv_image);
//*-----------------------------------------------------------------*/
//*  .NET function : WrapBMP
//*   Argument:
//*              Dotnetobject anv_image
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
lbyt_result = This.wrapbmp(anv_image)
Return lbyt_result
end function

public subroutine  of_writeword(dotnetobject anv_os,long al_v);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteWord
//*   Argument:
//*              Dotnetobject anv_os
//*              Long al_v
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writeword(anv_os,al_v)
end subroutine

public subroutine  of_writedword(dotnetobject anv_os,long al_v);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteDWord
//*   Argument:
//*              Dotnetobject anv_os
//*              Long al_v
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writedword(anv_os,al_v)
end subroutine

on nvo_metado.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_metado.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

