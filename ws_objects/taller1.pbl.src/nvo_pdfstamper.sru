$PBExportHeader$nvo_pdfstamper.sru
forward
global type nvo_pdfstamper from dotnetobject
end type
end forward

global type nvo_pdfstamper from dotnetobject
end type
global nvo_pdfstamper nvo_pdfstamper

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PdfStamper"

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
public subroutine  of_replacepage(dotnetobject anv_r,long al_pageimported,long al_pagereplaced)
public subroutine  of_insertpage(long al_pagenumber,dotnetobject anv_mediabox)
public subroutine  of_close()
public function dotnetobject of_getundercontent(long al_pagenum)
public function dotnetobject of_getovercontent(long al_pagenum)
public subroutine  of_setencryption(blob ablo_userpassword,blob ablo_ownerpassword,long al_permissions,boolean abln_strength128bits)
public subroutine  of_setencryption(blob ablo_userpassword,blob ablo_ownerpassword,long al_permissions,long al_encryptiontype)
public subroutine  of_setencryption(boolean abln_strength,string as_userpassword,string as_ownerpassword,long al_permissions)
public subroutine  of_setencryption(long al_encryptiontype,string as_userpassword,string as_ownerpassword,long al_permissions)
public function dotnetobject of_getimportedpage(dotnetobject anv_reader,long al_pagenumber)
public subroutine  of_addannotation(dotnetobject anv_annot,long al_page)
public function dotnetobject of_addsignature(string as_name,long al_page,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_addcomments(dotnetobject anv_fdf)
public subroutine  of_setthumbnail(dotnetobject anv_image,long al_page)
public function boolean of_partialformflattening(string as_name)
public subroutine  of_addjavascript(string as_name,string as_js)
public subroutine  of_addfileattachment(string as_description,blob ablo_filestore,string as_file,string as_filedisplay)
public subroutine  of_addfileattachment(string as_description,dotnetobject anv_fs)
public subroutine  of_makepackage(dotnetobject anv_initialview)
public subroutine  of_makepackage1(dotnetobject anv_collection)
public subroutine  of_addviewerpreference(dotnetobject anv_key,dotnetobject anv_value)
public subroutine  of_createxmpmetadata()
public subroutine  of_setfullcompression()
public subroutine  of_setpageaction(dotnetobject anv_actiontype,dotnetobject anv_action,long al_page)
public subroutine  of_setduration(long al_seconds,long al_page)
public subroutine  of_settransition(dotnetobject anv_transition,long al_page)
public function dotnetobject of_createsignature(dotnetobject anv_reader,dotnetobject anv_os,char ach_pdfversion,string as_tempfile,boolean abln_append)
public function dotnetobject of_createsignature(dotnetobject anv_reader,dotnetobject anv_os,char ach_pdfversion)
public function dotnetobject of_createsignature(dotnetobject anv_reader,dotnetobject anv_os,char ach_pdfversion,string as_tempfile)
public function dotnetobject of_createxmlsignature(dotnetobject anv_reader,dotnetobject anv_os)
public function dotnetobject of_getpdflayers()
public subroutine  of_dispose()
public subroutine  of_markused(dotnetobject anv_obj)
public function dotnetobject get_moreinfo()
public subroutine  set_moreinfo(dotnetobject anv_value)
public function dotnetobject get_signatureappearance()
public function dotnetobject get_xmlsignatureappearance()
public function boolean get_rotatecontents()
public subroutine  set_rotatecontents(boolean abln_value)
public function dotnetobject get_writer()
public function dotnetobject get_reader()
public function dotnetobject get_acrofields()
public subroutine  set_formflattening(boolean abln_value)
public subroutine  set_freetextflattening(boolean abln_value)
public subroutine  set_annotationflattening(boolean abln_value)
public subroutine  set_outlines(dotnetobject anv_value)
public subroutine  set_javascript(string as_value)
public subroutine  set_viewerpreferences(long al_value)
public subroutine  set_xmpmetadata(blob ablo_value)
public function dotnetobject get_xmpwriter()
public function boolean get_fullcompression()
public function dotnetobject get_ltvverification()
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

public subroutine  of_replacepage(dotnetobject anv_r,long al_pageimported,long al_pagereplaced);
//*-----------------------------------------------------------------*/
//*  .NET function : ReplacePage
//*   Argument:
//*              Dotnetobject anv_r
//*              Long al_pageimported
//*              Long al_pagereplaced
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.replacepage(anv_r,al_pageimported,al_pagereplaced)
end subroutine

public subroutine  of_insertpage(long al_pagenumber,dotnetobject anv_mediabox);
//*-----------------------------------------------------------------*/
//*  .NET function : InsertPage
//*   Argument:
//*              Long al_pagenumber
//*              Dotnetobject anv_mediabox
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.insertpage(al_pagenumber,anv_mediabox)
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

public function dotnetobject of_getundercontent(long al_pagenum);
//*-----------------------------------------------------------------*/
//*  .NET function : GetUnderContent
//*   Argument:
//*              Long al_pagenum
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
lnv_result = This.getundercontent(al_pagenum)
Return lnv_result
end function

public function dotnetobject of_getovercontent(long al_pagenum);
//*-----------------------------------------------------------------*/
//*  .NET function : GetOverContent
//*   Argument:
//*              Long al_pagenum
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
lnv_result = This.getovercontent(al_pagenum)
Return lnv_result
end function

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

public subroutine  of_setencryption(long al_encryptiontype,string as_userpassword,string as_ownerpassword,long al_permissions);
//*-----------------------------------------------------------------*/
//*  .NET function : SetEncryption
//*   Argument:
//*              Long al_encryptiontype
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
This.setencryption(al_encryptiontype,as_userpassword,as_ownerpassword,al_permissions)
end subroutine

public function dotnetobject of_getimportedpage(dotnetobject anv_reader,long al_pagenumber);
//*-----------------------------------------------------------------*/
//*  .NET function : GetImportedPage
//*   Argument:
//*              Dotnetobject anv_reader
//*              Long al_pagenumber
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
lnv_result = This.getimportedpage(anv_reader,al_pagenumber)
Return lnv_result
end function

public subroutine  of_addannotation(dotnetobject anv_annot,long al_page);
//*-----------------------------------------------------------------*/
//*  .NET function : AddAnnotation
//*   Argument:
//*              Dotnetobject anv_annot
//*              Long al_page
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addannotation(anv_annot,al_page)
end subroutine

public function dotnetobject of_addsignature(string as_name,long al_page,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSignature
//*   Argument:
//*              String as_name
//*              Long al_page
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
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
lnv_result = This.addsignature(as_name,al_page,ar_llx,ar_lly,ar_urx,ar_ury)
Return lnv_result
end function

public subroutine  of_addcomments(dotnetobject anv_fdf);
//*-----------------------------------------------------------------*/
//*  .NET function : AddComments
//*   Argument:
//*              Dotnetobject anv_fdf
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addcomments(anv_fdf)
end subroutine

public subroutine  of_setthumbnail(dotnetobject anv_image,long al_page);
//*-----------------------------------------------------------------*/
//*  .NET function : SetThumbnail
//*   Argument:
//*              Dotnetobject anv_image
//*              Long al_page
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setthumbnail(anv_image,al_page)
end subroutine

public function boolean of_partialformflattening(string as_name);
//*-----------------------------------------------------------------*/
//*  .NET function : PartialFormFlattening
//*   Argument:
//*              String as_name
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
lbln_result = This.partialformflattening(as_name)
Return lbln_result
end function

public subroutine  of_addjavascript(string as_name,string as_js);
//*-----------------------------------------------------------------*/
//*  .NET function : AddJavaScript
//*   Argument:
//*              String as_name
//*              String as_js
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addjavascript(as_name,as_js)
end subroutine

public subroutine  of_addfileattachment(string as_description,blob ablo_filestore,string as_file,string as_filedisplay);
//*-----------------------------------------------------------------*/
//*  .NET function : AddFileAttachment
//*   Argument:
//*              String as_description
//*              Blob ablo_filestore
//*              String as_file
//*              String as_filedisplay
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addfileattachment(as_description,ablo_filestore,as_file,as_filedisplay)
end subroutine

public subroutine  of_addfileattachment(string as_description,dotnetobject anv_fs);
//*-----------------------------------------------------------------*/
//*  .NET function : AddFileAttachment
//*   Argument:
//*              String as_description
//*              Dotnetobject anv_fs
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addfileattachment(as_description,anv_fs)
end subroutine

public subroutine  of_makepackage(dotnetobject anv_initialview);
//*-----------------------------------------------------------------*/
//*  .NET function : MakePackage
//*   Argument:
//*              Dotnetobject anv_initialview
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.makepackage(anv_initialview)
end subroutine

public subroutine  of_makepackage1(dotnetobject anv_collection);
//*-----------------------------------------------------------------*/
//*  .NET function : MakePackage
//*   Argument:
//*              Dotnetobject anv_collection
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.makepackage(anv_collection)
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

public subroutine  of_createxmpmetadata();
//*-----------------------------------------------------------------*/
//*  .NET function : CreateXmpMetadata
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.createxmpmetadata()
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

public subroutine  of_setpageaction(dotnetobject anv_actiontype,dotnetobject anv_action,long al_page);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPageAction
//*   Argument:
//*              Dotnetobject anv_actiontype
//*              Dotnetobject anv_action
//*              Long al_page
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpageaction(anv_actiontype,anv_action,al_page)
end subroutine

public subroutine  of_setduration(long al_seconds,long al_page);
//*-----------------------------------------------------------------*/
//*  .NET function : SetDuration
//*   Argument:
//*              Long al_seconds
//*              Long al_page
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setduration(al_seconds,al_page)
end subroutine

public subroutine  of_settransition(dotnetobject anv_transition,long al_page);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTransition
//*   Argument:
//*              Dotnetobject anv_transition
//*              Long al_page
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settransition(anv_transition,al_page)
end subroutine

public function dotnetobject of_createsignature(dotnetobject anv_reader,dotnetobject anv_os,char ach_pdfversion,string as_tempfile,boolean abln_append);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateSignature
//*   Argument:
//*              Dotnetobject anv_reader
//*              Dotnetobject anv_os
//*              Char ach_pdfversion
//*              String as_tempfile
//*              Boolean abln_append
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
lnv_result = This.createsignature(anv_reader,anv_os,ref ach_pdfversion,as_tempfile,abln_append)
Return lnv_result
end function

public function dotnetobject of_createsignature(dotnetobject anv_reader,dotnetobject anv_os,char ach_pdfversion);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateSignature
//*   Argument:
//*              Dotnetobject anv_reader
//*              Dotnetobject anv_os
//*              Char ach_pdfversion
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
lnv_result = This.createsignature(anv_reader,anv_os,ref ach_pdfversion)
Return lnv_result
end function

public function dotnetobject of_createsignature(dotnetobject anv_reader,dotnetobject anv_os,char ach_pdfversion,string as_tempfile);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateSignature
//*   Argument:
//*              Dotnetobject anv_reader
//*              Dotnetobject anv_os
//*              Char ach_pdfversion
//*              String as_tempfile
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
lnv_result = This.createsignature(anv_reader,anv_os,ref ach_pdfversion,as_tempfile)
Return lnv_result
end function

public function dotnetobject of_createxmlsignature(dotnetobject anv_reader,dotnetobject anv_os);
//*-----------------------------------------------------------------*/
//*  .NET function : createXmlSignature
//*   Argument:
//*              Dotnetobject anv_reader
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
lnv_result = This.createxmlsignature(anv_reader,anv_os)
Return lnv_result
end function

public function dotnetobject of_getpdflayers();
//*-----------------------------------------------------------------*/
//*  .NET function : GetPdfLayers
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
lnv_result = This.getpdflayers()
Return lnv_result
end function

public subroutine  of_dispose();
//*-----------------------------------------------------------------*/
//*  .NET function : Dispose
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.dispose()
end subroutine

public subroutine  of_markused(dotnetobject anv_obj);
//*-----------------------------------------------------------------*/
//*  .NET function : MarkUsed
//*   Argument:
//*              Dotnetobject anv_obj
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.markused(anv_obj)
end subroutine

public function dotnetobject get_moreinfo();
//*-----------------------------------------------------------------*/
//*  .NET property : MoreInfo
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
lnv_result = This.moreinfo
Return lnv_result
end function

public subroutine  set_moreinfo(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MoreInfo
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.moreinfo = anv_value
end subroutine

public function dotnetobject get_signatureappearance();
//*-----------------------------------------------------------------*/
//*  .NET property : SignatureAppearance
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
lnv_result = This.signatureappearance
Return lnv_result
end function

public function dotnetobject get_xmlsignatureappearance();
//*-----------------------------------------------------------------*/
//*  .NET property : XmlSignatureAppearance
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
lnv_result = This.xmlsignatureappearance
Return lnv_result
end function

public function boolean get_rotatecontents();
//*-----------------------------------------------------------------*/
//*  .NET property : RotateContents
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
lbln_result = This.rotatecontents
Return lbln_result
end function

public subroutine  set_rotatecontents(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : RotateContents
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.rotatecontents = abln_value
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

public function dotnetobject get_reader();
//*-----------------------------------------------------------------*/
//*  .NET property : Reader
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
lnv_result = This.reader
Return lnv_result
end function

public function dotnetobject get_acrofields();
//*-----------------------------------------------------------------*/
//*  .NET property : AcroFields
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
lnv_result = This.acrofields
Return lnv_result
end function

public subroutine  set_formflattening(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : FormFlattening
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.formflattening = abln_value
end subroutine

public subroutine  set_freetextflattening(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : FreeTextFlattening
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.freetextflattening = abln_value
end subroutine

public subroutine  set_annotationflattening(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : AnnotationFlattening
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.annotationflattening = abln_value
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

public subroutine  set_javascript(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : JavaScript
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.javascript = as_value
end subroutine

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

public subroutine  set_xmpmetadata(blob ablo_value);
//*-----------------------------------------------------------------*/
//*  .NET property : XmpMetadata
//*   Argument:
//*              Blob ablo_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.xmpmetadata = ablo_value
end subroutine

public function dotnetobject get_xmpwriter();
//*-----------------------------------------------------------------*/
//*  .NET property : XmpWriter
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
lnv_result = This.xmpwriter
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

public function dotnetobject get_ltvverification();
//*-----------------------------------------------------------------*/
//*  .NET property : LtvVerification
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
lnv_result = This.ltvverification
Return lnv_result
end function

on nvo_pdfstamper.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfstamper.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

