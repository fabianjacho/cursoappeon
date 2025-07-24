$PBExportHeader$nvo_ocspverifier.sru
forward
global type nvo_ocspverifier from dotnetobject
end type
end forward

global type nvo_ocspverifier from dotnetobject
end type
global nvo_ocspverifier nvo_ocspverifier

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.security.OcspVerifier"

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
public function dotnetobject of_verify(dotnetobject anv_signcert,dotnetobject anv_issuercert,datetime adt_signdate)
public function boolean of_verify(dotnetobject anv_ocspresp,dotnetobject anv_signcert,dotnetobject anv_issuercert,datetime adt_signdate)
public subroutine  of_isvalidresponse(dotnetobject anv_ocspresp,dotnetobject anv_issuercert)
public function boolean of_verifyresponse(dotnetobject anv_ocspresp,dotnetobject anv_issuercert)
public function boolean of_issignaturevalid(dotnetobject anv_ocspresp,dotnetobject anv_respondercert)
public function dotnetobject of_getocspresponse(dotnetobject anv_signcert,dotnetobject anv_issuercert)
public subroutine  set_certificates(dotnetobject anv_value)
public subroutine  set_onlinecheckingallowed(boolean abln_value)
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

public function dotnetobject of_verify(dotnetobject anv_signcert,dotnetobject anv_issuercert,datetime adt_signdate);
//*-----------------------------------------------------------------*/
//*  .NET function : Verify
//*   Argument:
//*              Dotnetobject anv_signcert
//*              Dotnetobject anv_issuercert
//*              Datetime adt_signdate
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
lnv_result = This.verify(anv_signcert,anv_issuercert,adt_signdate)
Return lnv_result
end function

public function boolean of_verify(dotnetobject anv_ocspresp,dotnetobject anv_signcert,dotnetobject anv_issuercert,datetime adt_signdate);
//*-----------------------------------------------------------------*/
//*  .NET function : Verify
//*   Argument:
//*              Dotnetobject anv_ocspresp
//*              Dotnetobject anv_signcert
//*              Dotnetobject anv_issuercert
//*              Datetime adt_signdate
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
lbln_result = This.verify(anv_ocspresp,anv_signcert,anv_issuercert,adt_signdate)
Return lbln_result
end function

public subroutine  of_isvalidresponse(dotnetobject anv_ocspresp,dotnetobject anv_issuercert);
//*-----------------------------------------------------------------*/
//*  .NET function : IsValidResponse
//*   Argument:
//*              Dotnetobject anv_ocspresp
//*              Dotnetobject anv_issuercert
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.isvalidresponse(anv_ocspresp,anv_issuercert)
end subroutine

public function boolean of_verifyresponse(dotnetobject anv_ocspresp,dotnetobject anv_issuercert);
//*-----------------------------------------------------------------*/
//*  .NET function : VerifyResponse
//*   Argument:
//*              Dotnetobject anv_ocspresp
//*              Dotnetobject anv_issuercert
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
lbln_result = This.verifyresponse(anv_ocspresp,anv_issuercert)
Return lbln_result
end function

public function boolean of_issignaturevalid(dotnetobject anv_ocspresp,dotnetobject anv_respondercert);
//*-----------------------------------------------------------------*/
//*  .NET function : IsSignatureValid
//*   Argument:
//*              Dotnetobject anv_ocspresp
//*              Dotnetobject anv_respondercert
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
lbln_result = This.issignaturevalid(anv_ocspresp,anv_respondercert)
Return lbln_result
end function

public function dotnetobject of_getocspresponse(dotnetobject anv_signcert,dotnetobject anv_issuercert);
//*-----------------------------------------------------------------*/
//*  .NET function : GetOcspResponse
//*   Argument:
//*              Dotnetobject anv_signcert
//*              Dotnetobject anv_issuercert
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
lnv_result = This.getocspresponse(anv_signcert,anv_issuercert)
Return lnv_result
end function

public subroutine  set_certificates(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Certificates
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.certificates = anv_value
end subroutine

public subroutine  set_onlinecheckingallowed(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : OnlineCheckingAllowed
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.onlinecheckingallowed = abln_value
end subroutine

on nvo_ocspverifier.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_ocspverifier.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

