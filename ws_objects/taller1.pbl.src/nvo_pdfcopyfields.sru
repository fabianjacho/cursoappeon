$PBExportHeader$nvo_pdfcopyfields.sru
forward
global type nvo_pdfcopyfields from dotnetobject
end type
end forward

global type nvo_pdfcopyfields from dotnetobject
end type
global nvo_pdfcopyfields nvo_pdfcopyfields

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PdfCopyFields"

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
public subroutine  of_adddocument(dotnetobject anv_reader)
public subroutine  of_adddocument(dotnetobject anv_reader,dotnetobject anv_pagestokeep)
public subroutine  of_adddocument(dotnetobject anv_reader,string as_ranges)
public subroutine  of_setencryption(blob ablo_userpassword,blob ablo_ownerpassword,long al_permissions,boolean abln_strength128bits)
public subroutine  of_setencryption(boolean abln_strength,string as_userpassword,string as_ownerpassword,long al_permissions)
public subroutine  of_close()
public subroutine  of_open()
public subroutine  of_addjavascript(string as_js)
public subroutine  of_setfullcompression()
public subroutine  of_setencryption(blob ablo_userpassword,blob ablo_ownerpassword,long al_permissions,long al_encryptiontype)
public subroutine  of_addviewerpreference(dotnetobject anv_key,dotnetobject anv_value)
public subroutine  set_outlines(dotnetobject anv_value)
public function dotnetobject get_writer()
public function boolean get_fullcompression()
public subroutine  set_viewerpreferences(long al_value)
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

public subroutine  of_adddocument(dotnetobject anv_reader);
//*-----------------------------------------------------------------*/
//*  .NET function : AddDocument
//*   Argument:
//*              Dotnetobject anv_reader
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.adddocument(anv_reader)
end subroutine

public subroutine  of_adddocument(dotnetobject anv_reader,dotnetobject anv_pagestokeep);
//*-----------------------------------------------------------------*/
//*  .NET function : AddDocument
//*   Argument:
//*              Dotnetobject anv_reader
//*              Dotnetobject anv_pagestokeep
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.adddocument(anv_reader,anv_pagestokeep)
end subroutine

public subroutine  of_adddocument(dotnetobject anv_reader,string as_ranges);
//*-----------------------------------------------------------------*/
//*  .NET function : AddDocument
//*   Argument:
//*              Dotnetobject anv_reader
//*              String as_ranges
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.adddocument(anv_reader,as_ranges)
end subroutine

public subroutine  of_setencryption(blob ablo_userpassword,blob ablo_ownerpassword,long al_permissions,boolean abln_strength128bits);
//*-----------------------------------------------------------------*/
//*  .NET function : SetEncryption
//*   Argument:
//*              Blob ablo_userpassword
//*              Blob ablo_ownerpassword
//*              Long al_permissions
//*              Boolean abln_strength128bits
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setencryption(ablo_userpassword,ablo_ownerpassword,al_permissions,abln_strength128bits)
end subroutine

public subroutine  of_setencryption(boolean abln_strength,string as_userpassword,string as_ownerpassword,long al_permissions);
//*-----------------------------------------------------------------*/
//*  .NET function : SetEncryption
//*   Argument:
//*              Boolean abln_strength
//*              String as_userpassword
//*              String as_ownerpassword
//*              Long al_permissions
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setencryption(abln_strength,as_userpassword,as_ownerpassword,al_permissions)
end subroutine

public subroutine  of_close();
//*-----------------------------------------------------------------*/
//*  .NET function : Close
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.close()
end subroutine

public subroutine  of_open();
//*-----------------------------------------------------------------*/
//*  .NET function : Open
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.open()
end subroutine

public subroutine  of_addjavascript(string as_js);
//*-----------------------------------------------------------------*/
//*  .NET function : AddJavaScript
//*   Argument:
//*              String as_js
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addjavascript(as_js)
end subroutine

public subroutine  of_setfullcompression();
//*-----------------------------------------------------------------*/
//*  .NET function : SetFullCompression
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setfullcompression()
end subroutine

public subroutine  of_setencryption(blob ablo_userpassword,blob ablo_ownerpassword,long al_permissions,long al_encryptiontype);
//*-----------------------------------------------------------------*/
//*  .NET function : SetEncryption
//*   Argument:
//*              Blob ablo_userpassword
//*              Blob ablo_ownerpassword
//*              Long al_permissions
//*              Long al_encryptiontype
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setencryption(ablo_userpassword,ablo_ownerpassword,al_permissions,al_encryptiontype)
end subroutine

public subroutine  of_addviewerpreference(dotnetobject anv_key,dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET function : AddViewerPreference
//*   Argument:
//*              Dotnetobject anv_key
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addviewerpreference(anv_key,anv_value)
end subroutine

public subroutine  set_outlines(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Outlines
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.outlines = anv_value
end subroutine

public function dotnetobject get_writer();
//*-----------------------------------------------------------------*/
//*  .NET property : Writer
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
lnv_result = This.writer
Return lnv_result
end function

public function boolean get_fullcompression();
//*-----------------------------------------------------------------*/
//*  .NET property : FullCompression
//*   Return : Boolean
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Boolean lbln_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lbln_result)
	Return lbln_result
End If

/* Trigger the dotnet property */
lbln_result = This.fullcompression
Return lbln_result
end function

public subroutine  set_viewerpreferences(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ViewerPreferences
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.viewerpreferences = al_value
end subroutine

on nvo_pdfcopyfields.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfcopyfields.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

