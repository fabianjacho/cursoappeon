$PBExportHeader$nvo_pdfencryption.sru
forward
global type nvo_pdfencryption from dotnetobject
end type
end forward

global type nvo_pdfencryption from dotnetobject
end type
global nvo_pdfencryption nvo_pdfencryption

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PdfEncryption"

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
public subroutine  of_setcryptomode(long al_mode,long al_kl)
public function long of_getcryptomode()
public function boolean of_ismetadataencrypted()
public function longlong of_getpermissions()
public function boolean of_isembeddedfilesonly()
public subroutine  of_setupallkeys(blob ablo_userpassword,blob ablo_ownerpassword,long al_permissions)
public function boolean of_readkey(dotnetobject anv_enc,blob ablo_password)
public function blob of_createdocumentid()
public subroutine  of_setupbyuserpassword(blob ablo_documentid,blob ablo_userpassword,blob ablo_ownerkey,longlong all_permissions)
public subroutine  of_setupbyownerpassword(blob ablo_documentid,blob ablo_ownerpassword,blob ablo_userkey,blob ablo_ownerkey,longlong all_permissions)
public subroutine  of_setkey(blob ablo_key)
public subroutine  of_setupbyencryptionkey(blob ablo_key,long al_keylength)
public subroutine  of_sethashkey(long al_number,long al_generation)
public function dotnetobject of_createinfoid(blob ablo_id,boolean abln_modified)
public function dotnetobject of_getencryptiondictionary()
public function dotnetobject of_getfileid(boolean abln_modified)
public function dotnetobject of_getencryptionstream(dotnetobject anv_os)
public function long of_calculatestreamsize(long al_n)
public function blob of_encryptbytearray(blob ablo_b)
public function dotnetobject of_getdecryptor()
public function blob of_decryptbytearray(blob ablo_b)
public subroutine  of_addrecipient(dotnetobject anv_cert,long al_permission)
public function blob of_computeuserpassword(blob ablo_ownerpassword)
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

public subroutine  of_setcryptomode(long al_mode,long al_kl);
//*-----------------------------------------------------------------*/
//*  .NET function : SetCryptoMode
//*   Argument:
//*              Long al_mode
//*              Long al_kl
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcryptomode(al_mode,al_kl)
end subroutine

public function long of_getcryptomode();
//*-----------------------------------------------------------------*/
//*  .NET function : GetCryptoMode
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
ll_result = This.getcryptomode()
Return ll_result
end function

public function boolean of_ismetadataencrypted();
//*-----------------------------------------------------------------*/
//*  .NET function : IsMetadataEncrypted
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
lbln_result = This.ismetadataencrypted()
Return lbln_result
end function

public function longlong of_getpermissions();
//*-----------------------------------------------------------------*/
//*  .NET function : GetPermissions
//*   Return : Longlong
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Longlong lll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lll_result)
	Return lll_result
End If

/* Trigger the dotnet function */
lll_result = This.getpermissions()
Return lll_result
end function

public function boolean of_isembeddedfilesonly();
//*-----------------------------------------------------------------*/
//*  .NET function : IsEmbeddedFilesOnly
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
lbln_result = This.isembeddedfilesonly()
Return lbln_result
end function

public subroutine  of_setupallkeys(blob ablo_userpassword,blob ablo_ownerpassword,long al_permissions);
//*-----------------------------------------------------------------*/
//*  .NET function : SetupAllKeys
//*   Argument:
//*              Blob ablo_userpassword
//*              Blob ablo_ownerpassword
//*              Long al_permissions
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setupallkeys(ablo_userpassword,ablo_ownerpassword,al_permissions)
end subroutine

public function boolean of_readkey(dotnetobject anv_enc,blob ablo_password);
//*-----------------------------------------------------------------*/
//*  .NET function : ReadKey
//*   Argument:
//*              Dotnetobject anv_enc
//*              Blob ablo_password
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
lbln_result = This.readkey(anv_enc,ablo_password)
Return lbln_result
end function

public function blob of_createdocumentid();
//*-----------------------------------------------------------------*/
//*  .NET function : CreateDocumentId
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
lbyt_result = This.createdocumentid()
Return lbyt_result
end function

public subroutine  of_setupbyuserpassword(blob ablo_documentid,blob ablo_userpassword,blob ablo_ownerkey,longlong all_permissions);
//*-----------------------------------------------------------------*/
//*  .NET function : SetupByUserPassword
//*   Argument:
//*              Blob ablo_documentid
//*              Blob ablo_userpassword
//*              Blob ablo_ownerkey
//*              Longlong all_permissions
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setupbyuserpassword(ablo_documentid,ablo_userpassword,ablo_ownerkey,all_permissions)
end subroutine

public subroutine  of_setupbyownerpassword(blob ablo_documentid,blob ablo_ownerpassword,blob ablo_userkey,blob ablo_ownerkey,longlong all_permissions);
//*-----------------------------------------------------------------*/
//*  .NET function : SetupByOwnerPassword
//*   Argument:
//*              Blob ablo_documentid
//*              Blob ablo_ownerpassword
//*              Blob ablo_userkey
//*              Blob ablo_ownerkey
//*              Longlong all_permissions
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setupbyownerpassword(ablo_documentid,ablo_ownerpassword,ablo_userkey,ablo_ownerkey,all_permissions)
end subroutine

public subroutine  of_setkey(blob ablo_key);
//*-----------------------------------------------------------------*/
//*  .NET function : SetKey
//*   Argument:
//*              Blob ablo_key
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setkey(ablo_key)
end subroutine

public subroutine  of_setupbyencryptionkey(blob ablo_key,long al_keylength);
//*-----------------------------------------------------------------*/
//*  .NET function : SetupByEncryptionKey
//*   Argument:
//*              Blob ablo_key
//*              Long al_keylength
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setupbyencryptionkey(ablo_key,al_keylength)
end subroutine

public subroutine  of_sethashkey(long al_number,long al_generation);
//*-----------------------------------------------------------------*/
//*  .NET function : SetHashKey
//*   Argument:
//*              Long al_number
//*              Long al_generation
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.sethashkey(al_number,al_generation)
end subroutine

public function dotnetobject of_createinfoid(blob ablo_id,boolean abln_modified);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateInfoId
//*   Argument:
//*              Blob ablo_id
//*              Boolean abln_modified
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
lnv_result = This.createinfoid(ablo_id,abln_modified)
Return lnv_result
end function

public function dotnetobject of_getencryptiondictionary();
//*-----------------------------------------------------------------*/
//*  .NET function : GetEncryptionDictionary
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
lnv_result = This.getencryptiondictionary()
Return lnv_result
end function

public function dotnetobject of_getfileid(boolean abln_modified);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFileID
//*   Argument:
//*              Boolean abln_modified
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
lnv_result = This.getfileid(abln_modified)
Return lnv_result
end function

public function dotnetobject of_getencryptionstream(dotnetobject anv_os);
//*-----------------------------------------------------------------*/
//*  .NET function : GetEncryptionStream
//*   Argument:
//*              Dotnetobject anv_os
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
lnv_result = This.getencryptionstream(anv_os)
Return lnv_result
end function

public function long of_calculatestreamsize(long al_n);
//*-----------------------------------------------------------------*/
//*  .NET function : CalculateStreamSize
//*   Argument:
//*              Long al_n
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
ll_result = This.calculatestreamsize(al_n)
Return ll_result
end function

public function blob of_encryptbytearray(blob ablo_b);
//*-----------------------------------------------------------------*/
//*  .NET function : EncryptByteArray
//*   Argument:
//*              Blob ablo_b
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
lbyt_result = This.encryptbytearray(ablo_b)
Return lbyt_result
end function

public function dotnetobject of_getdecryptor();
//*-----------------------------------------------------------------*/
//*  .NET function : GetDecryptor
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
lnv_result = This.getdecryptor()
Return lnv_result
end function

public function blob of_decryptbytearray(blob ablo_b);
//*-----------------------------------------------------------------*/
//*  .NET function : DecryptByteArray
//*   Argument:
//*              Blob ablo_b
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
lbyt_result = This.decryptbytearray(ablo_b)
Return lbyt_result
end function

public subroutine  of_addrecipient(dotnetobject anv_cert,long al_permission);
//*-----------------------------------------------------------------*/
//*  .NET function : AddRecipient
//*   Argument:
//*              Dotnetobject anv_cert
//*              Long al_permission
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addrecipient(anv_cert,al_permission)
end subroutine

public function blob of_computeuserpassword(blob ablo_ownerpassword);
//*-----------------------------------------------------------------*/
//*  .NET function : ComputeUserPassword
//*   Argument:
//*              Blob ablo_ownerpassword
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
lbyt_result = This.computeuserpassword(ablo_ownerpassword)
Return lbyt_result
end function

on nvo_pdfencryption.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfencryption.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

