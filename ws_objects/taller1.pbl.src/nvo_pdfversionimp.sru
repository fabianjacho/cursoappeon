$PBExportHeader$nvo_pdfversionimp.sru
forward
global type nvo_pdfversionimp from dotnetobject
end type
end forward

global type nvo_pdfversionimp from dotnetobject
end type
global nvo_pdfversionimp nvo_pdfversionimp

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.intern.PdfVersionImp"

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
public subroutine  of_setatleastpdfversion(char ach_version)
public subroutine  of_setpdfversion(dotnetobject anv_version)
public subroutine  of_setappendmode(boolean abln_appendmode)
public subroutine  of_writeheader(dotnetobject anv_os)
public function dotnetobject of_getversionasname(char ach_version)
public function blob of_getversionasbytearray(char ach_version)
public subroutine  of_addtocatalog(dotnetobject anv_catalog)
public subroutine  of_adddeveloperextension(dotnetobject anv_de)
public subroutine  set_pdfversion(char ach_value)
public function char get_version()
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

public subroutine  of_setatleastpdfversion(char ach_version);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAtLeastPdfVersion
//*   Argument:
//*              Char ach_version
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setatleastpdfversion(ref ach_version)
end subroutine

public subroutine  of_setpdfversion(dotnetobject anv_version);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPdfVersion
//*   Argument:
//*              Dotnetobject anv_version
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpdfversion(anv_version)
end subroutine

public subroutine  of_setappendmode(boolean abln_appendmode);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAppendmode
//*   Argument:
//*              Boolean abln_appendmode
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setappendmode(abln_appendmode)
end subroutine

public subroutine  of_writeheader(dotnetobject anv_os);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteHeader
//*   Argument:
//*              Dotnetobject anv_os
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writeheader(anv_os)
end subroutine

public function dotnetobject of_getversionasname(char ach_version);
//*-----------------------------------------------------------------*/
//*  .NET function : GetVersionAsName
//*   Argument:
//*              Char ach_version
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
lnv_result = This.getversionasname(ref ach_version)
Return lnv_result
end function

public function blob of_getversionasbytearray(char ach_version);
//*-----------------------------------------------------------------*/
//*  .NET function : GetVersionAsByteArray
//*   Argument:
//*              Char ach_version
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
lbyt_result = This.getversionasbytearray(ref ach_version)
Return lbyt_result
end function

public subroutine  of_addtocatalog(dotnetobject anv_catalog);
//*-----------------------------------------------------------------*/
//*  .NET function : AddToCatalog
//*   Argument:
//*              Dotnetobject anv_catalog
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtocatalog(anv_catalog)
end subroutine

public subroutine  of_adddeveloperextension(dotnetobject anv_de);
//*-----------------------------------------------------------------*/
//*  .NET function : AddDeveloperExtension
//*   Argument:
//*              Dotnetobject anv_de
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.adddeveloperextension(anv_de)
end subroutine

public subroutine  set_pdfversion(char ach_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PdfVersion
//*   Argument:
//*              Char ach_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.pdfversion = ach_value
end subroutine

public function char get_version();
//*-----------------------------------------------------------------*/
//*  .NET property : Version
//*   Return : Char
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Char lch_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lch_result)
	Return lch_result
End If

/* Trigger the dotnet property */
lch_result = This.version
Return lch_result
end function

on nvo_pdfversionimp.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfversionimp.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

