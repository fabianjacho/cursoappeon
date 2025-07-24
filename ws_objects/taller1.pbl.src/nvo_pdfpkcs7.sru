$PBExportHeader$nvo_pdfpkcs7.sru
forward
global type nvo_pdfpkcs7 from dotnetobject
end type
end forward

global type nvo_pdfpkcs7 from dotnetobject
end type
global nvo_pdfpkcs7 nvo_pdfpkcs7

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.security.PdfPKCS7"

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
public subroutine  of_setsignaturepolicy(dotnetobject anv_signaturepolicy)
public subroutine  of_setsignaturepolicy1(dotnetobject anv_signaturepolicy)
public function string of_gethashalgorithm()
public function string of_getdigestalgorithm()
public subroutine  of_setexternaldigest(blob ablo_digest,blob ablo_rsadata,string as_digestencryptionalgorithm)
public subroutine  of_update(blob ablo_buf,long al_off,long al_len)
public function blob of_getencodedpkcs1()
public function blob of_getencodedpkcs7()
public function blob of_getencodedpkcs7(blob ablo_seconddigest)
public function blob of_getencodedpkcs7(blob ablo_seconddigest,dotnetobject anv_tsaclient,blob ablo_ocsp,dotnetobject anv_crlbytes,long al_sigtype)
public function blob of_getauthenticatedattributebytes(blob ablo_seconddigest,blob ablo_ocsp,dotnetobject anv_crlbytes,long al_sigtype)
public function boolean of_verify()
public function boolean of_verifytimestampimprint()
public function boolean of_isrevocationvalid()
public function dotnetobject of_getfiltersubtype()
public function string of_getencryptionalgorithm()
public function string get_signname()
public subroutine  set_signname(string as_value)
public function string get_reason()
public subroutine  set_reason(string as_value)
public function string get_location()
public subroutine  set_location(string as_value)
public function datetime get_signdate()
public subroutine  set_signdate(datetime adt_value)
public function long get_version()
public function long get_signinginfoversion()
public function string get_digestalgorithmoid()
public function string get_digestencryptionalgorithmoid()
public function dotnetobject get_signingcertificate()
public function dotnetobject get_crls()
public function dotnetobject get_ocsp()
public function boolean get_istsp()
public function dotnetobject get_timestamptoken()
public function datetime get_timestampdate()
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

public subroutine  of_setsignaturepolicy(dotnetobject anv_signaturepolicy);
//*-----------------------------------------------------------------*/
//*  .NET function : SetSignaturePolicy
//*   Argument:
//*              Dotnetobject anv_signaturepolicy
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setsignaturepolicy(anv_signaturepolicy)
end subroutine

public subroutine  of_setsignaturepolicy1(dotnetobject anv_signaturepolicy);
//*-----------------------------------------------------------------*/
//*  .NET function : SetSignaturePolicy
//*   Argument:
//*              Dotnetobject anv_signaturepolicy
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setsignaturepolicy(anv_signaturepolicy)
end subroutine

public function string of_gethashalgorithm();
//*-----------------------------------------------------------------*/
//*  .NET function : GetHashAlgorithm
//*   Return : String
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
String ls_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ls_result)
	Return ls_result
End If

/* Trigger the dotnet function */
ls_result = This.gethashalgorithm()
Return ls_result
end function

public function string of_getdigestalgorithm();
//*-----------------------------------------------------------------*/
//*  .NET function : GetDigestAlgorithm
//*   Return : String
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
String ls_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ls_result)
	Return ls_result
End If

/* Trigger the dotnet function */
ls_result = This.getdigestalgorithm()
Return ls_result
end function

public subroutine  of_setexternaldigest(blob ablo_digest,blob ablo_rsadata,string as_digestencryptionalgorithm);
//*-----------------------------------------------------------------*/
//*  .NET function : SetExternalDigest
//*   Argument:
//*              Blob ablo_digest
//*              Blob ablo_rsadata
//*              String as_digestencryptionalgorithm
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setexternaldigest(ablo_digest,ablo_rsadata,as_digestencryptionalgorithm)
end subroutine

public subroutine  of_update(blob ablo_buf,long al_off,long al_len);
//*-----------------------------------------------------------------*/
//*  .NET function : Update
//*   Argument:
//*              Blob ablo_buf
//*              Long al_off
//*              Long al_len
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.update(ablo_buf,al_off,al_len)
end subroutine

public function blob of_getencodedpkcs1();
//*-----------------------------------------------------------------*/
//*  .NET function : GetEncodedPKCS1
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
lbyt_result = This.getencodedpkcs1()
Return lbyt_result
end function

public function blob of_getencodedpkcs7();
//*-----------------------------------------------------------------*/
//*  .NET function : GetEncodedPKCS7
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
lbyt_result = This.getencodedpkcs7()
Return lbyt_result
end function

public function blob of_getencodedpkcs7(blob ablo_seconddigest);
//*-----------------------------------------------------------------*/
//*  .NET function : GetEncodedPKCS7
//*   Argument:
//*              Blob ablo_seconddigest
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
lbyt_result = This.getencodedpkcs7(ablo_seconddigest)
Return lbyt_result
end function

public function blob of_getencodedpkcs7(blob ablo_seconddigest,dotnetobject anv_tsaclient,blob ablo_ocsp,dotnetobject anv_crlbytes,long al_sigtype);
//*-----------------------------------------------------------------*/
//*  .NET function : GetEncodedPKCS7
//*   Argument:
//*              Blob ablo_seconddigest
//*              Dotnetobject anv_tsaclient
//*              Blob ablo_ocsp
//*              Dotnetobject anv_crlbytes
//*              Long al_sigtype
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
lbyt_result = This.getencodedpkcs7(ablo_seconddigest,anv_tsaclient,ablo_ocsp,anv_crlbytes,al_sigtype)
Return lbyt_result
end function

public function blob of_getauthenticatedattributebytes(blob ablo_seconddigest,blob ablo_ocsp,dotnetobject anv_crlbytes,long al_sigtype);
//*-----------------------------------------------------------------*/
//*  .NET function : getAuthenticatedAttributeBytes
//*   Argument:
//*              Blob ablo_seconddigest
//*              Blob ablo_ocsp
//*              Dotnetobject anv_crlbytes
//*              Long al_sigtype
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
lbyt_result = This.getauthenticatedattributebytes(ablo_seconddigest,ablo_ocsp,anv_crlbytes,al_sigtype)
Return lbyt_result
end function

public function boolean of_verify();
//*-----------------------------------------------------------------*/
//*  .NET function : Verify
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
lbln_result = This.verify()
Return lbln_result
end function

public function boolean of_verifytimestampimprint();
//*-----------------------------------------------------------------*/
//*  .NET function : VerifyTimestampImprint
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
lbln_result = This.verifytimestampimprint()
Return lbln_result
end function

public function boolean of_isrevocationvalid();
//*-----------------------------------------------------------------*/
//*  .NET function : IsRevocationValid
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
lbln_result = This.isrevocationvalid()
Return lbln_result
end function

public function dotnetobject of_getfiltersubtype();
//*-----------------------------------------------------------------*/
//*  .NET function : GetFilterSubtype
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
lnv_result = This.getfiltersubtype()
Return lnv_result
end function

public function string of_getencryptionalgorithm();
//*-----------------------------------------------------------------*/
//*  .NET function : GetEncryptionAlgorithm
//*   Return : String
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
String ls_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ls_result)
	Return ls_result
End If

/* Trigger the dotnet function */
ls_result = This.getencryptionalgorithm()
Return ls_result
end function

public function string get_signname();
//*-----------------------------------------------------------------*/
//*  .NET property : SignName
//*   Return : String
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
String ls_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ls_result)
	Return ls_result
End If

/* Trigger the dotnet property */
ls_result = This.signname
Return ls_result
end function

public subroutine  set_signname(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SignName
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.signname = as_value
end subroutine

public function string get_reason();
//*-----------------------------------------------------------------*/
//*  .NET property : Reason
//*   Return : String
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
String ls_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ls_result)
	Return ls_result
End If

/* Trigger the dotnet property */
ls_result = This.reason
Return ls_result
end function

public subroutine  set_reason(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Reason
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.reason = as_value
end subroutine

public function string get_location();
//*-----------------------------------------------------------------*/
//*  .NET property : Location
//*   Return : String
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
String ls_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ls_result)
	Return ls_result
End If

/* Trigger the dotnet property */
ls_result = This.location
Return ls_result
end function

public subroutine  set_location(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Location
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.location = as_value
end subroutine

public function datetime get_signdate();
//*-----------------------------------------------------------------*/
//*  .NET property : SignDate
//*   Return : Datetime
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Datetime ldt_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ldt_result)
	Return ldt_result
End If

/* Trigger the dotnet property */
ldt_result = This.signdate
Return ldt_result
end function

public subroutine  set_signdate(datetime adt_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SignDate
//*   Argument:
//*              Datetime adt_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.signdate = adt_value
end subroutine

public function long get_version();
//*-----------------------------------------------------------------*/
//*  .NET property : Version
//*   Return : Long
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Long ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet property */
ll_result = This.version
Return ll_result
end function

public function long get_signinginfoversion();
//*-----------------------------------------------------------------*/
//*  .NET property : SigningInfoVersion
//*   Return : Long
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Long ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet property */
ll_result = This.signinginfoversion
Return ll_result
end function

public function string get_digestalgorithmoid();
//*-----------------------------------------------------------------*/
//*  .NET property : DigestAlgorithmOid
//*   Return : String
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
String ls_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ls_result)
	Return ls_result
End If

/* Trigger the dotnet property */
ls_result = This.digestalgorithmoid
Return ls_result
end function

public function string get_digestencryptionalgorithmoid();
//*-----------------------------------------------------------------*/
//*  .NET property : DigestEncryptionAlgorithmOid
//*   Return : String
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
String ls_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ls_result)
	Return ls_result
End If

/* Trigger the dotnet property */
ls_result = This.digestencryptionalgorithmoid
Return ls_result
end function

public function dotnetobject get_signingcertificate();
//*-----------------------------------------------------------------*/
//*  .NET property : SigningCertificate
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
lnv_result = This.signingcertificate
Return lnv_result
end function

public function dotnetobject get_crls();
//*-----------------------------------------------------------------*/
//*  .NET property : CRLs
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
lnv_result = This.crls
Return lnv_result
end function

public function dotnetobject get_ocsp();
//*-----------------------------------------------------------------*/
//*  .NET property : Ocsp
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
lnv_result = This.ocsp
Return lnv_result
end function

public function boolean get_istsp();
//*-----------------------------------------------------------------*/
//*  .NET property : IsTsp
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
lbln_result = This.istsp
Return lbln_result
end function

public function dotnetobject get_timestamptoken();
//*-----------------------------------------------------------------*/
//*  .NET property : TimeStampToken
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
lnv_result = This.timestamptoken
Return lnv_result
end function

public function datetime get_timestampdate();
//*-----------------------------------------------------------------*/
//*  .NET property : TimeStampDate
//*   Return : Datetime
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Datetime ldt_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ldt_result)
	Return ldt_result
End If

/* Trigger the dotnet property */
ldt_result = This.timestampdate
Return ldt_result
end function

on nvo_pdfpkcs7.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfpkcs7.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

