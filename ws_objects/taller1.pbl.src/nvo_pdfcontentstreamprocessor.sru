$PBExportHeader$nvo_pdfcontentstreamprocessor.sru
forward
global type nvo_pdfcontentstreamprocessor from dotnetobject
end type
end forward

global type nvo_pdfcontentstreamprocessor from dotnetobject
end type
global nvo_pdfcontentstreamprocessor nvo_pdfcontentstreamprocessor

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.parser.PdfContentStreamProcessor"

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
public function dotnetobject of_registerxobjectdohandler(dotnetobject anv_xobjectsubtype,dotnetobject anv_handler)
public function dotnetobject of_registercontentoperator(string as_operatorstring,dotnetobject anv_oper)
public subroutine  of_reset()
public function dotnetobject of_gs()
public subroutine  of_processcontent(blob ablo_contentbytes,dotnetobject anv_resources)
public function dotnetobject get_registeredoperatorstrings()
public function dotnetobject get_renderlistener()
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

public function dotnetobject of_registerxobjectdohandler(dotnetobject anv_xobjectsubtype,dotnetobject anv_handler);
//*-----------------------------------------------------------------*/
//*  .NET function : RegisterXObjectDoHandler
//*   Argument:
//*              Dotnetobject anv_xobjectsubtype
//*              Dotnetobject anv_handler
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
lnv_result = This.registerxobjectdohandler(anv_xobjectsubtype,anv_handler)
Return lnv_result
end function

public function dotnetobject of_registercontentoperator(string as_operatorstring,dotnetobject anv_oper);
//*-----------------------------------------------------------------*/
//*  .NET function : RegisterContentOperator
//*   Argument:
//*              String as_operatorstring
//*              Dotnetobject anv_oper
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
lnv_result = This.registercontentoperator(as_operatorstring,anv_oper)
Return lnv_result
end function

public subroutine  of_reset();
//*-----------------------------------------------------------------*/
//*  .NET function : Reset
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.reset()
end subroutine

public function dotnetobject of_gs();
//*-----------------------------------------------------------------*/
//*  .NET function : Gs
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
lnv_result = This.gs()
Return lnv_result
end function

public subroutine  of_processcontent(blob ablo_contentbytes,dotnetobject anv_resources);
//*-----------------------------------------------------------------*/
//*  .NET function : ProcessContent
//*   Argument:
//*              Blob ablo_contentbytes
//*              Dotnetobject anv_resources
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.processcontent(ablo_contentbytes,anv_resources)
end subroutine

public function dotnetobject get_registeredoperatorstrings();
//*-----------------------------------------------------------------*/
//*  .NET property : RegisteredOperatorStrings
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
lnv_result = This.registeredoperatorstrings
Return lnv_result
end function

public function dotnetobject get_renderlistener();
//*-----------------------------------------------------------------*/
//*  .NET property : RenderListener
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
lnv_result = This.renderlistener
Return lnv_result
end function

on nvo_pdfcontentstreamprocessor.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfcontentstreamprocessor.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

