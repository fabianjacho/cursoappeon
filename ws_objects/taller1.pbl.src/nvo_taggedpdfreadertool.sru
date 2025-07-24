$PBExportHeader$nvo_taggedpdfreadertool.sru
forward
global type nvo_taggedpdfreadertool from dotnetobject
end type
end forward

global type nvo_taggedpdfreadertool from dotnetobject
end type
global nvo_taggedpdfreadertool nvo_taggedpdfreadertool

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.parser.TaggedPdfReaderTool"

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
public subroutine  of_converttoxml(dotnetobject anv_reader,dotnetobject anv_os,dotnetobject anv_encoding)
public subroutine  of_converttoxml(dotnetobject anv_reader,dotnetobject anv_os)
public subroutine  of_inspectchild(dotnetobject anv_k)
public subroutine  of_inspectchildarray(dotnetobject anv_k)
public subroutine  of_inspectchilddictionary(dotnetobject anv_k)
public subroutine  of_inspectchilddictionary(dotnetobject anv_k,boolean abln_inspectattributes)
public subroutine  of_parsetag(string as_tag,dotnetobject anv_obj,dotnetobject anv_page)
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

public subroutine  of_converttoxml(dotnetobject anv_reader,dotnetobject anv_os,dotnetobject anv_encoding);
//*-----------------------------------------------------------------*/
//*  .NET function : ConvertToXml
//*   Argument:
//*              Dotnetobject anv_reader
//*              Dotnetobject anv_os
//*              Dotnetobject anv_encoding
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.converttoxml(anv_reader,anv_os,anv_encoding)
end subroutine

public subroutine  of_converttoxml(dotnetobject anv_reader,dotnetobject anv_os);
//*-----------------------------------------------------------------*/
//*  .NET function : ConvertToXml
//*   Argument:
//*              Dotnetobject anv_reader
//*              Dotnetobject anv_os
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.converttoxml(anv_reader,anv_os)
end subroutine

public subroutine  of_inspectchild(dotnetobject anv_k);
//*-----------------------------------------------------------------*/
//*  .NET function : InspectChild
//*   Argument:
//*              Dotnetobject anv_k
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.inspectchild(anv_k)
end subroutine

public subroutine  of_inspectchildarray(dotnetobject anv_k);
//*-----------------------------------------------------------------*/
//*  .NET function : InspectChildArray
//*   Argument:
//*              Dotnetobject anv_k
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.inspectchildarray(anv_k)
end subroutine

public subroutine  of_inspectchilddictionary(dotnetobject anv_k);
//*-----------------------------------------------------------------*/
//*  .NET function : InspectChildDictionary
//*   Argument:
//*              Dotnetobject anv_k
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.inspectchilddictionary(anv_k)
end subroutine

public subroutine  of_inspectchilddictionary(dotnetobject anv_k,boolean abln_inspectattributes);
//*-----------------------------------------------------------------*/
//*  .NET function : InspectChildDictionary
//*   Argument:
//*              Dotnetobject anv_k
//*              Boolean abln_inspectattributes
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.inspectchilddictionary(anv_k,abln_inspectattributes)
end subroutine

public subroutine  of_parsetag(string as_tag,dotnetobject anv_obj,dotnetobject anv_page);
//*-----------------------------------------------------------------*/
//*  .NET function : ParseTag
//*   Argument:
//*              String as_tag
//*              Dotnetobject anv_obj
//*              Dotnetobject anv_page
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.parsetag(as_tag,anv_obj,anv_page)
end subroutine

on nvo_taggedpdfreadertool.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_taggedpdfreadertool.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

