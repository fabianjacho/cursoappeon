$PBExportHeader$nvo_pdfcopy.sru
forward
global type nvo_pdfcopy from dotnetobject
end type
end forward

global type nvo_pdfcopy from dotnetobject
end type
global nvo_pdfcopy nvo_pdfcopy

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PdfCopy"

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
public subroutine  of_setmergefields()
public function dotnetobject of_getimportedpage(dotnetobject anv_reader,long al_pagenumber)
public function dotnetobject of_getimportedpage(dotnetobject anv_reader,long al_pagenumber,boolean abln_keeptaggedpdfstructure)
public subroutine  of_addpage(dotnetobject anv_ipage)
public subroutine  of_addpage(dotnetobject anv_rect,long al_rotation)
public subroutine  of_adddocument(dotnetobject anv_reader,dotnetobject anv_pagestokeep)
public subroutine  of_copydocumentfields(dotnetobject anv_reader)
public subroutine  of_adddocument(dotnetobject anv_reader)
public function dotnetobject of_addtobody(dotnetobject anv_objecta,dotnetobject anv_refa)
public function dotnetobject of_addtobody(dotnetobject anv_objecta,dotnetobject anv_refa,boolean abln_formbranching)
public subroutine  of_close()
public subroutine  of_addannotation(dotnetobject anv_annot)
public subroutine  of_freereader(dotnetobject anv_reader)
public function dotnetobject of_createpagestamp(dotnetobject anv_ipage)
public function dotnetobject of_createannotation(dotnetobject anv_rect,dotnetobject anv_subtype)
public function dotnetobject of_createannotation(real ar_llx,real ar_lly,real ar_urx,real ar_ury,dotnetobject anv_title,dotnetobject anv_content,dotnetobject anv_subtype)
public function dotnetobject of_createannotation(real ar_llx,real ar_lly,real ar_urx,real ar_ury,dotnetobject anv_action,dotnetobject anv_subtype)
public subroutine  of_checkpdfisoconformance(long al_key,dotnetobject anv_obj1)
public function dotnetobject of_getstandardstructelems()
public function dotnetobject of_initpdfisoconformance()
public function boolean of_ispdfiso()
public function boolean of_ispdfx()
public subroutine  of_setoutputintents(string as_outputconditionidentifier,string as_outputcondition,string as_registryname,string as_info,dotnetobject anv_colorprofile)
public subroutine  of_setoutputintents(string as_outputconditionidentifier,string as_outputcondition,string as_registryname,string as_info,blob ablo_destoutputprofile)
public function boolean of_setoutputintents(dotnetobject anv_reader,boolean abln_checkexistence)
public subroutine  of_setencryption(blob ablo_userpassword,blob ablo_ownerpassword,long al_permissions,long al_encryptiontype)
public subroutine  of_setencryption(blob ablo_userpassword,blob ablo_ownerpassword,long al_permissions,boolean abln_strength128bits)
public subroutine  of_setencryption(boolean abln_strength,string as_userpassword,string as_ownerpassword,long al_permissions)
public subroutine  of_setencryption(long al_encryptiontype,string as_userpassword,string as_ownerpassword,long al_permissions)
public subroutine  of_setfullcompression()
public subroutine  of_releasetemplate(dotnetobject anv_tp)
public subroutine  of_settagged()
public subroutine  of_settagged(long al_taggingmode)
public function boolean of_needtobemarkedincontent(dotnetobject anv_element)
public subroutine  of_checkelementrole(dotnetobject anv_element,dotnetobject anv_parent)
public function boolean of_istagged()
public subroutine  of_addocgradiogroup(dotnetobject anv_group)
public subroutine  of_locklayer(dotnetobject anv_layer)
public subroutine  of_setboxsize(string as_boxname,dotnetobject anv_size)
public function dotnetobject of_getboxsize(string as_boxname)
public function dotnetobject of_getboxsize(string as_boxname,dotnetobject anv_intersectingrectangle)
public subroutine  of_setpageaction(dotnetobject anv_actiontype,dotnetobject anv_action)
public subroutine  of_setdefaultcolorspace(dotnetobject anv_key,dotnetobject anv_cs)
public subroutine  of_cleartextwrap()
public function dotnetobject of_adddirectimagesimple(dotnetobject anv_image)
public function dotnetobject of_adddirectimagesimple(dotnetobject anv_image,dotnetobject anv_fixedref)
public function real of_getverticalposition(boolean abln_ensurenewline)
public function dotnetobject of_addtobody(dotnetobject anv_objecta)
public function dotnetobject of_addtobody(dotnetobject anv_objecta,boolean abln_inobjstm)
public function dotnetobject of_addtobody(dotnetobject anv_objecta,long al_refnumber)
public function dotnetobject of_addtobody(dotnetobject anv_objecta,long al_refnumber,boolean abln_inobjstm)
public subroutine  of_addpagedictentry(dotnetobject anv_key,dotnetobject anv_obj)
public subroutine  of_resetpagedictentries()
public subroutine  of_setlinearpagemode()
public function long of_reorderpages(long al_order[])
public function dotnetobject of_getpagereference(long al_page)
public subroutine  of_setpageviewport(dotnetobject anv_vp)
public subroutine  of_open()
public subroutine  of_setatleastpdfversion(char ach_version)
public subroutine  of_setpdfversion(dotnetobject anv_version)
public subroutine  of_adddeveloperextension(dotnetobject anv_de)
public subroutine  of_addviewerpreference(dotnetobject anv_key,dotnetobject anv_value)
public subroutine  of_addnameddestinations(dotnetobject anv_map,long al_page_offset)
public subroutine  of_addnameddestination(string as_name,long al_page,dotnetobject anv_dest)
public subroutine  of_addjavascript(dotnetobject anv_js)
public subroutine  of_addjavascript(string as_code,boolean abln_unicode)
public subroutine  of_addjavascript(string as_code)
public subroutine  of_addjavascript(string as_name,dotnetobject anv_js)
public subroutine  of_addjavascript(string as_name,string as_code,boolean abln_unicode)
public subroutine  of_addjavascript(string as_name,string as_code)
public subroutine  of_addfileattachment(string as_description,blob ablo_filestore,string as_file,string as_filedisplay)
public subroutine  of_addfileattachment(string as_description,dotnetobject anv_fs)
public subroutine  of_addfileattachment(dotnetobject anv_fs)
public subroutine  of_setopenaction(string as_name)
public subroutine  of_setopenaction(dotnetobject anv_action)
public subroutine  of_setadditionalaction(dotnetobject anv_actiontype,dotnetobject anv_action)
public subroutine  of_addcalculationorder(dotnetobject anv_annot)
public subroutine  of_setlanguage(string as_language)
public subroutine  of_createxmpmetadata()
public function boolean of_add(dotnetobject anv_element)
public function boolean of_setpagesize(dotnetobject anv_pagesize)
public function boolean of_setmargins(real ar_marginleft,real ar_marginright,real ar_margintop,real ar_marginbottom)
public function boolean of_newpage()
public subroutine  of_resetpagecount()
public subroutine  of_pause()
public function boolean of_ispaused()
public subroutine  of_resume()
public subroutine  of_flush()
public function boolean of_setmarginmirroring(boolean abln_marginmirroring)
public function boolean of_setmarginmirroringtopbottom(boolean abln_marginmirroring)
public subroutine  of_dispose()
public subroutine  set_pageevent(dotnetobject anv_value)
public function boolean get_rotatecontents()
public subroutine  set_rotatecontents(boolean abln_value)
public function dotnetobject get_info()
public subroutine  set_initialleading(real ar_value)
public function dotnetobject get_directcontent()
public function dotnetobject get_directcontentunder()
public function dotnetobject get_colorprofile()
public function dotnetobject get_pdfindirectreference()
public function dotnetobject get_os()
public function dotnetobject get_extracatalog()
public function dotnetobject get_pagedictentries()
public function long get_pagenumber()
public function long get_currentpagenumber()
public function dotnetobject get_tabs()
public subroutine  set_tabs(dotnetobject anv_value)
public function dotnetobject get_rootoutline()
public subroutine  set_outlines(dotnetobject anv_value)
public subroutine  set_pdfversion(char ach_value)
public subroutine  set_viewerpreferences(long al_value)
public subroutine  set_pagelabels(dotnetobject anv_value)
public subroutine  set_collection(dotnetobject anv_value)
public function dotnetobject get_acroform()
public subroutine  set_sigflags(long al_value)
public function blob get_xmpmetadata()
public subroutine  set_xmpmetadata(blob ablo_value)
public subroutine  set_pagexmpmetadata(blob ablo_value)
public function dotnetobject get_xmpwriter()
public function long get_pdfxconformance()
public subroutine  set_pdfxconformance(long al_value)
public function boolean get_fullcompression()
public function long get_compressionlevel()
public subroutine  set_compressionlevel(long al_value)
public function longlong get_currentdocumentsize()
public function dotnetobject get_structuretreeroot()
public function dotnetobject get_ocproperties()
public function dotnetobject get_pagesize()
public subroutine  set_cropboxsize(dotnetobject anv_value)
public function boolean get_pageempty()
public subroutine  set_pageempty(boolean abln_value)
public subroutine  set_duration(long al_value)
public subroutine  set_transition(dotnetobject anv_value)
public subroutine  set_thumbnail(dotnetobject anv_value)
public function dotnetobject get_group()
public subroutine  set_group(dotnetobject anv_value)
public function real get_spacecharratio()
public subroutine  set_spacecharratio(real ar_value)
public function long get_rundirection()
public subroutine  set_rundirection(long al_value)
public subroutine  set_userunit(real ar_value)
public function dotnetobject get_defaultcolorspace()
public function boolean get_strictimagesequence()
public subroutine  set_strictimagesequence(boolean abln_value)
public function boolean get_userproperties()
public subroutine  set_userproperties(boolean abln_value)
public function boolean get_rgbtransparencyblending()
public subroutine  set_rgbtransparencyblending(boolean abln_value)
public subroutine  set_pagecount(long al_value)
public function boolean get_closestream()
public subroutine  set_closestream(boolean abln_value)
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

public subroutine  of_setmergefields();
//*-----------------------------------------------------------------*/
//*  .NET function : SetMergeFields
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setmergefields()
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

public function dotnetobject of_getimportedpage(dotnetobject anv_reader,long al_pagenumber,boolean abln_keeptaggedpdfstructure);
//*-----------------------------------------------------------------*/
//*  .NET function : GetImportedPage
//*   Argument:
//*              Dotnetobject anv_reader
//*              Long al_pagenumber
//*              Boolean abln_keeptaggedpdfstructure
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
lnv_result = This.getimportedpage(anv_reader,al_pagenumber,abln_keeptaggedpdfstructure)
Return lnv_result
end function

public subroutine  of_addpage(dotnetobject anv_ipage);
//*-----------------------------------------------------------------*/
//*  .NET function : AddPage
//*   Argument:
//*              Dotnetobject anv_ipage
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addpage(anv_ipage)
end subroutine

public subroutine  of_addpage(dotnetobject anv_rect,long al_rotation);
//*-----------------------------------------------------------------*/
//*  .NET function : AddPage
//*   Argument:
//*              Dotnetobject anv_rect
//*              Long al_rotation
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addpage(anv_rect,al_rotation)
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

public subroutine  of_copydocumentfields(dotnetobject anv_reader);
//*-----------------------------------------------------------------*/
//*  .NET function : CopyDocumentFields
//*   Argument:
//*              Dotnetobject anv_reader
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.copydocumentfields(anv_reader)
end subroutine

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

public function dotnetobject of_addtobody(dotnetobject anv_objecta,dotnetobject anv_refa);
//*-----------------------------------------------------------------*/
//*  .NET function : AddToBody
//*   Argument:
//*              Dotnetobject anv_objecta
//*              Dotnetobject anv_refa
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
lnv_result = This.addtobody(anv_objecta,anv_refa)
Return lnv_result
end function

public function dotnetobject of_addtobody(dotnetobject anv_objecta,dotnetobject anv_refa,boolean abln_formbranching);
//*-----------------------------------------------------------------*/
//*  .NET function : AddToBody
//*   Argument:
//*              Dotnetobject anv_objecta
//*              Dotnetobject anv_refa
//*              Boolean abln_formbranching
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
lnv_result = This.addtobody(anv_objecta,anv_refa,abln_formbranching)
Return lnv_result
end function

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

public subroutine  of_addannotation(dotnetobject anv_annot);
//*-----------------------------------------------------------------*/
//*  .NET function : AddAnnotation
//*   Argument:
//*              Dotnetobject anv_annot
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addannotation(anv_annot)
end subroutine

public subroutine  of_freereader(dotnetobject anv_reader);
//*-----------------------------------------------------------------*/
//*  .NET function : FreeReader
//*   Argument:
//*              Dotnetobject anv_reader
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.freereader(anv_reader)
end subroutine

public function dotnetobject of_createpagestamp(dotnetobject anv_ipage);
//*-----------------------------------------------------------------*/
//*  .NET function : CreatePageStamp
//*   Argument:
//*              Dotnetobject anv_ipage
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
lnv_result = This.createpagestamp(anv_ipage)
Return lnv_result
end function

public function dotnetobject of_createannotation(dotnetobject anv_rect,dotnetobject anv_subtype);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateAnnotation
//*   Argument:
//*              Dotnetobject anv_rect
//*              Dotnetobject anv_subtype
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
lnv_result = This.createannotation(anv_rect,anv_subtype)
Return lnv_result
end function

public function dotnetobject of_createannotation(real ar_llx,real ar_lly,real ar_urx,real ar_ury,dotnetobject anv_title,dotnetobject anv_content,dotnetobject anv_subtype);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateAnnotation
//*   Argument:
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*              Dotnetobject anv_title
//*              Dotnetobject anv_content
//*              Dotnetobject anv_subtype
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
lnv_result = This.createannotation(ar_llx,ar_lly,ar_urx,ar_ury,anv_title,anv_content,anv_subtype)
Return lnv_result
end function

public function dotnetobject of_createannotation(real ar_llx,real ar_lly,real ar_urx,real ar_ury,dotnetobject anv_action,dotnetobject anv_subtype);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateAnnotation
//*   Argument:
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*              Dotnetobject anv_action
//*              Dotnetobject anv_subtype
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
lnv_result = This.createannotation(ar_llx,ar_lly,ar_urx,ar_ury,anv_action,anv_subtype)
Return lnv_result
end function

public subroutine  of_checkpdfisoconformance(long al_key,dotnetobject anv_obj1);
//*-----------------------------------------------------------------*/
//*  .NET function : CheckPdfIsoConformance
//*   Argument:
//*              Long al_key
//*              Dotnetobject anv_obj1
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.checkpdfisoconformance(al_key,anv_obj1)
end subroutine

public function dotnetobject of_getstandardstructelems();
//*-----------------------------------------------------------------*/
//*  .NET function : GetStandardStructElems
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
lnv_result = This.getstandardstructelems()
Return lnv_result
end function

public function dotnetobject of_initpdfisoconformance();
//*-----------------------------------------------------------------*/
//*  .NET function : InitPdfIsoConformance
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
lnv_result = This.initpdfisoconformance()
Return lnv_result
end function

public function boolean of_ispdfiso();
//*-----------------------------------------------------------------*/
//*  .NET function : IsPdfIso
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
lbln_result = This.ispdfiso()
Return lbln_result
end function

public function boolean of_ispdfx();
//*-----------------------------------------------------------------*/
//*  .NET function : IsPdfX
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
lbln_result = This.ispdfx()
Return lbln_result
end function

public subroutine  of_setoutputintents(string as_outputconditionidentifier,string as_outputcondition,string as_registryname,string as_info,dotnetobject anv_colorprofile);
//*-----------------------------------------------------------------*/
//*  .NET function : SetOutputIntents
//*   Argument:
//*              String as_outputconditionidentifier
//*              String as_outputcondition
//*              String as_registryname
//*              String as_info
//*              Dotnetobject anv_colorprofile
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setoutputintents(as_outputconditionidentifier,as_outputcondition,as_registryname,as_info,anv_colorprofile)
end subroutine

public subroutine  of_setoutputintents(string as_outputconditionidentifier,string as_outputcondition,string as_registryname,string as_info,blob ablo_destoutputprofile);
//*-----------------------------------------------------------------*/
//*  .NET function : SetOutputIntents
//*   Argument:
//*              String as_outputconditionidentifier
//*              String as_outputcondition
//*              String as_registryname
//*              String as_info
//*              Blob ablo_destoutputprofile
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setoutputintents(as_outputconditionidentifier,as_outputcondition,as_registryname,as_info,ablo_destoutputprofile)
end subroutine

public function boolean of_setoutputintents(dotnetobject anv_reader,boolean abln_checkexistence);
//*-----------------------------------------------------------------*/
//*  .NET function : SetOutputIntents
//*   Argument:
//*              Dotnetobject anv_reader
//*              Boolean abln_checkexistence
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
lbln_result = This.setoutputintents(anv_reader,abln_checkexistence)
Return lbln_result
end function

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

public subroutine  of_releasetemplate(dotnetobject anv_tp);
//*-----------------------------------------------------------------*/
//*  .NET function : ReleaseTemplate
//*   Argument:
//*              Dotnetobject anv_tp
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.releasetemplate(anv_tp)
end subroutine

public subroutine  of_settagged();
//*-----------------------------------------------------------------*/
//*  .NET function : SetTagged
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settagged()
end subroutine

public subroutine  of_settagged(long al_taggingmode);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTagged
//*   Argument:
//*              Long al_taggingmode
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settagged(al_taggingmode)
end subroutine

public function boolean of_needtobemarkedincontent(dotnetobject anv_element);
//*-----------------------------------------------------------------*/
//*  .NET function : NeedToBeMarkedInContent
//*   Argument:
//*              Dotnetobject anv_element
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
lbln_result = This.needtobemarkedincontent(anv_element)
Return lbln_result
end function

public subroutine  of_checkelementrole(dotnetobject anv_element,dotnetobject anv_parent);
//*-----------------------------------------------------------------*/
//*  .NET function : CheckElementRole
//*   Argument:
//*              Dotnetobject anv_element
//*              Dotnetobject anv_parent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.checkelementrole(anv_element,anv_parent)
end subroutine

public function boolean of_istagged();
//*-----------------------------------------------------------------*/
//*  .NET function : IsTagged
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
lbln_result = This.istagged()
Return lbln_result
end function

public subroutine  of_addocgradiogroup(dotnetobject anv_group);
//*-----------------------------------------------------------------*/
//*  .NET function : AddOCGRadioGroup
//*   Argument:
//*              Dotnetobject anv_group
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addocgradiogroup(anv_group)
end subroutine

public subroutine  of_locklayer(dotnetobject anv_layer);
//*-----------------------------------------------------------------*/
//*  .NET function : LockLayer
//*   Argument:
//*              Dotnetobject anv_layer
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.locklayer(anv_layer)
end subroutine

public subroutine  of_setboxsize(string as_boxname,dotnetobject anv_size);
//*-----------------------------------------------------------------*/
//*  .NET function : SetBoxSize
//*   Argument:
//*              String as_boxname
//*              Dotnetobject anv_size
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setboxsize(as_boxname,anv_size)
end subroutine

public function dotnetobject of_getboxsize(string as_boxname);
//*-----------------------------------------------------------------*/
//*  .NET function : GetBoxSize
//*   Argument:
//*              String as_boxname
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
lnv_result = This.getboxsize(as_boxname)
Return lnv_result
end function

public function dotnetobject of_getboxsize(string as_boxname,dotnetobject anv_intersectingrectangle);
//*-----------------------------------------------------------------*/
//*  .NET function : GetBoxSize
//*   Argument:
//*              String as_boxname
//*              Dotnetobject anv_intersectingrectangle
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
lnv_result = This.getboxsize(as_boxname,anv_intersectingrectangle)
Return lnv_result
end function

public subroutine  of_setpageaction(dotnetobject anv_actiontype,dotnetobject anv_action);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPageAction
//*   Argument:
//*              Dotnetobject anv_actiontype
//*              Dotnetobject anv_action
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpageaction(anv_actiontype,anv_action)
end subroutine

public subroutine  of_setdefaultcolorspace(dotnetobject anv_key,dotnetobject anv_cs);
//*-----------------------------------------------------------------*/
//*  .NET function : SetDefaultColorspace
//*   Argument:
//*              Dotnetobject anv_key
//*              Dotnetobject anv_cs
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setdefaultcolorspace(anv_key,anv_cs)
end subroutine

public subroutine  of_cleartextwrap();
//*-----------------------------------------------------------------*/
//*  .NET function : ClearTextWrap
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.cleartextwrap()
end subroutine

public function dotnetobject of_adddirectimagesimple(dotnetobject anv_image);
//*-----------------------------------------------------------------*/
//*  .NET function : AddDirectImageSimple
//*   Argument:
//*              Dotnetobject anv_image
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
lnv_result = This.adddirectimagesimple(anv_image)
Return lnv_result
end function

public function dotnetobject of_adddirectimagesimple(dotnetobject anv_image,dotnetobject anv_fixedref);
//*-----------------------------------------------------------------*/
//*  .NET function : AddDirectImageSimple
//*   Argument:
//*              Dotnetobject anv_image
//*              Dotnetobject anv_fixedref
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
lnv_result = This.adddirectimagesimple(anv_image,anv_fixedref)
Return lnv_result
end function

public function real of_getverticalposition(boolean abln_ensurenewline);
//*-----------------------------------------------------------------*/
//*  .NET function : GetVerticalPosition
//*   Argument:
//*              Boolean abln_ensurenewline
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.getverticalposition(abln_ensurenewline)
Return lr_result
end function

public function dotnetobject of_addtobody(dotnetobject anv_objecta);
//*-----------------------------------------------------------------*/
//*  .NET function : AddToBody
//*   Argument:
//*              Dotnetobject anv_objecta
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
lnv_result = This.addtobody(anv_objecta)
Return lnv_result
end function

public function dotnetobject of_addtobody(dotnetobject anv_objecta,boolean abln_inobjstm);
//*-----------------------------------------------------------------*/
//*  .NET function : AddToBody
//*   Argument:
//*              Dotnetobject anv_objecta
//*              Boolean abln_inobjstm
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
lnv_result = This.addtobody(anv_objecta,abln_inobjstm)
Return lnv_result
end function

public function dotnetobject of_addtobody(dotnetobject anv_objecta,long al_refnumber);
//*-----------------------------------------------------------------*/
//*  .NET function : AddToBody
//*   Argument:
//*              Dotnetobject anv_objecta
//*              Long al_refnumber
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
lnv_result = This.addtobody(anv_objecta,al_refnumber)
Return lnv_result
end function

public function dotnetobject of_addtobody(dotnetobject anv_objecta,long al_refnumber,boolean abln_inobjstm);
//*-----------------------------------------------------------------*/
//*  .NET function : AddToBody
//*   Argument:
//*              Dotnetobject anv_objecta
//*              Long al_refnumber
//*              Boolean abln_inobjstm
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
lnv_result = This.addtobody(anv_objecta,al_refnumber,abln_inobjstm)
Return lnv_result
end function

public subroutine  of_addpagedictentry(dotnetobject anv_key,dotnetobject anv_obj);
//*-----------------------------------------------------------------*/
//*  .NET function : AddPageDictEntry
//*   Argument:
//*              Dotnetobject anv_key
//*              Dotnetobject anv_obj
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addpagedictentry(anv_key,anv_obj)
end subroutine

public subroutine  of_resetpagedictentries();
//*-----------------------------------------------------------------*/
//*  .NET function : ResetPageDictEntries
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.resetpagedictentries()
end subroutine

public subroutine  of_setlinearpagemode();
//*-----------------------------------------------------------------*/
//*  .NET function : SetLinearPageMode
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlinearpagemode()
end subroutine

public function long of_reorderpages(long al_order[]);
//*-----------------------------------------------------------------*/
//*  .NET function : ReorderPages
//*   Argument:
//*              Long al_order[]
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
ll_result = This.reorderpages(al_order)
Return ll_result
end function

public function dotnetobject of_getpagereference(long al_page);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPageReference
//*   Argument:
//*              Long al_page
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
lnv_result = This.getpagereference(al_page)
Return lnv_result
end function

public subroutine  of_setpageviewport(dotnetobject anv_vp);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPageViewport
//*   Argument:
//*              Dotnetobject anv_vp
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpageviewport(anv_vp)
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

public subroutine  of_addnameddestinations(dotnetobject anv_map,long al_page_offset);
//*-----------------------------------------------------------------*/
//*  .NET function : AddNamedDestinations
//*   Argument:
//*              Dotnetobject anv_map
//*              Long al_page_offset
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addnameddestinations(anv_map,al_page_offset)
end subroutine

public subroutine  of_addnameddestination(string as_name,long al_page,dotnetobject anv_dest);
//*-----------------------------------------------------------------*/
//*  .NET function : AddNamedDestination
//*   Argument:
//*              String as_name
//*              Long al_page
//*              Dotnetobject anv_dest
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addnameddestination(as_name,al_page,anv_dest)
end subroutine

public subroutine  of_addjavascript(dotnetobject anv_js);
//*-----------------------------------------------------------------*/
//*  .NET function : AddJavaScript
//*   Argument:
//*              Dotnetobject anv_js
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addjavascript(anv_js)
end subroutine

public subroutine  of_addjavascript(string as_code,boolean abln_unicode);
//*-----------------------------------------------------------------*/
//*  .NET function : AddJavaScript
//*   Argument:
//*              String as_code
//*              Boolean abln_unicode
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addjavascript(as_code,abln_unicode)
end subroutine

public subroutine  of_addjavascript(string as_code);
//*-----------------------------------------------------------------*/
//*  .NET function : AddJavaScript
//*   Argument:
//*              String as_code
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addjavascript(as_code)
end subroutine

public subroutine  of_addjavascript(string as_name,dotnetobject anv_js);
//*-----------------------------------------------------------------*/
//*  .NET function : AddJavaScript
//*   Argument:
//*              String as_name
//*              Dotnetobject anv_js
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addjavascript(as_name,anv_js)
end subroutine

public subroutine  of_addjavascript(string as_name,string as_code,boolean abln_unicode);
//*-----------------------------------------------------------------*/
//*  .NET function : AddJavaScript
//*   Argument:
//*              String as_name
//*              String as_code
//*              Boolean abln_unicode
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addjavascript(as_name,as_code,abln_unicode)
end subroutine

public subroutine  of_addjavascript(string as_name,string as_code);
//*-----------------------------------------------------------------*/
//*  .NET function : AddJavaScript
//*   Argument:
//*              String as_name
//*              String as_code
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addjavascript(as_name,as_code)
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

public subroutine  of_addfileattachment(dotnetobject anv_fs);
//*-----------------------------------------------------------------*/
//*  .NET function : AddFileAttachment
//*   Argument:
//*              Dotnetobject anv_fs
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addfileattachment(anv_fs)
end subroutine

public subroutine  of_setopenaction(string as_name);
//*-----------------------------------------------------------------*/
//*  .NET function : SetOpenAction
//*   Argument:
//*              String as_name
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setopenaction(as_name)
end subroutine

public subroutine  of_setopenaction(dotnetobject anv_action);
//*-----------------------------------------------------------------*/
//*  .NET function : SetOpenAction
//*   Argument:
//*              Dotnetobject anv_action
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setopenaction(anv_action)
end subroutine

public subroutine  of_setadditionalaction(dotnetobject anv_actiontype,dotnetobject anv_action);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAdditionalAction
//*   Argument:
//*              Dotnetobject anv_actiontype
//*              Dotnetobject anv_action
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setadditionalaction(anv_actiontype,anv_action)
end subroutine

public subroutine  of_addcalculationorder(dotnetobject anv_annot);
//*-----------------------------------------------------------------*/
//*  .NET function : AddCalculationOrder
//*   Argument:
//*              Dotnetobject anv_annot
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addcalculationorder(anv_annot)
end subroutine

public subroutine  of_setlanguage(string as_language);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLanguage
//*   Argument:
//*              String as_language
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlanguage(as_language)
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

public function boolean of_add(dotnetobject anv_element);
//*-----------------------------------------------------------------*/
//*  .NET function : Add
//*   Argument:
//*              Dotnetobject anv_element
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
lbln_result = This.add(anv_element)
Return lbln_result
end function

public function boolean of_setpagesize(dotnetobject anv_pagesize);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPageSize
//*   Argument:
//*              Dotnetobject anv_pagesize
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
lbln_result = This.setpagesize(anv_pagesize)
Return lbln_result
end function

public function boolean of_setmargins(real ar_marginleft,real ar_marginright,real ar_margintop,real ar_marginbottom);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMargins
//*   Argument:
//*              Real ar_marginleft
//*              Real ar_marginright
//*              Real ar_margintop
//*              Real ar_marginbottom
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
lbln_result = This.setmargins(ar_marginleft,ar_marginright,ar_margintop,ar_marginbottom)
Return lbln_result
end function

public function boolean of_newpage();
//*-----------------------------------------------------------------*/
//*  .NET function : NewPage
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
lbln_result = This.newpage()
Return lbln_result
end function

public subroutine  of_resetpagecount();
//*-----------------------------------------------------------------*/
//*  .NET function : ResetPageCount
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.resetpagecount()
end subroutine

public subroutine  of_pause();
//*-----------------------------------------------------------------*/
//*  .NET function : Pause
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.pause()
end subroutine

public function boolean of_ispaused();
//*-----------------------------------------------------------------*/
//*  .NET function : IsPaused
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
lbln_result = This.ispaused()
Return lbln_result
end function

public subroutine  of_resume();
//*-----------------------------------------------------------------*/
//*  .NET function : Resume
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.resume()
end subroutine

public subroutine  of_flush();
//*-----------------------------------------------------------------*/
//*  .NET function : Flush
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.flush()
end subroutine

public function boolean of_setmarginmirroring(boolean abln_marginmirroring);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMarginMirroring
//*   Argument:
//*              Boolean abln_marginmirroring
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
lbln_result = This.setmarginmirroring(abln_marginmirroring)
Return lbln_result
end function

public function boolean of_setmarginmirroringtopbottom(boolean abln_marginmirroring);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMarginMirroringTopBottom
//*   Argument:
//*              Boolean abln_marginmirroring
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
lbln_result = This.setmarginmirroringtopbottom(abln_marginmirroring)
Return lbln_result
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

public subroutine  set_pageevent(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PageEvent
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.pageevent = anv_value
end subroutine

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

public function dotnetobject get_info();
//*-----------------------------------------------------------------*/
//*  .NET property : Info
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
lnv_result = This.info
Return lnv_result
end function

public subroutine  set_initialleading(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : InitialLeading
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.initialleading = ar_value
end subroutine

public function dotnetobject get_directcontent();
//*-----------------------------------------------------------------*/
//*  .NET property : DirectContent
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
lnv_result = This.directcontent
Return lnv_result
end function

public function dotnetobject get_directcontentunder();
//*-----------------------------------------------------------------*/
//*  .NET property : DirectContentUnder
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
lnv_result = This.directcontentunder
Return lnv_result
end function

public function dotnetobject get_colorprofile();
//*-----------------------------------------------------------------*/
//*  .NET property : ColorProfile
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
lnv_result = This.colorprofile
Return lnv_result
end function

public function dotnetobject get_pdfindirectreference();
//*-----------------------------------------------------------------*/
//*  .NET property : PdfIndirectReference
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
lnv_result = This.pdfindirectreference
Return lnv_result
end function

public function dotnetobject get_os();
//*-----------------------------------------------------------------*/
//*  .NET property : Os
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
lnv_result = This.os
Return lnv_result
end function

public function dotnetobject get_extracatalog();
//*-----------------------------------------------------------------*/
//*  .NET property : ExtraCatalog
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
lnv_result = This.extracatalog
Return lnv_result
end function

public function dotnetobject get_pagedictentries();
//*-----------------------------------------------------------------*/
//*  .NET property : PageDictEntries
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
lnv_result = This.pagedictentries
Return lnv_result
end function

public function long get_pagenumber();
//*-----------------------------------------------------------------*/
//*  .NET property : PageNumber
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
ll_result = This.pagenumber
Return ll_result
end function

public function long get_currentpagenumber();
//*-----------------------------------------------------------------*/
//*  .NET property : CurrentPageNumber
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
ll_result = This.currentpagenumber
Return ll_result
end function

public function dotnetobject get_tabs();
//*-----------------------------------------------------------------*/
//*  .NET property : Tabs
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
lnv_result = This.tabs
Return lnv_result
end function

public subroutine  set_tabs(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Tabs
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.tabs = anv_value
end subroutine

public function dotnetobject get_rootoutline();
//*-----------------------------------------------------------------*/
//*  .NET property : RootOutline
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
lnv_result = This.rootoutline
Return lnv_result
end function

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

public subroutine  set_pagelabels(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PageLabels
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.pagelabels = anv_value
end subroutine

public subroutine  set_collection(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Collection
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.collection = anv_value
end subroutine

public function dotnetobject get_acroform();
//*-----------------------------------------------------------------*/
//*  .NET property : AcroForm
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
lnv_result = This.acroform
Return lnv_result
end function

public subroutine  set_sigflags(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SigFlags
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.sigflags = al_value
end subroutine

public function blob get_xmpmetadata();
//*-----------------------------------------------------------------*/
//*  .NET property : XmpMetadata
//*   Return : Blob
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Blob lbyt_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lbyt_result)
	Return lbyt_result
End If

/* Trigger the dotnet property */
lbyt_result = This.xmpmetadata
Return lbyt_result
end function

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

public subroutine  set_pagexmpmetadata(blob ablo_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PageXmpMetadata
//*   Argument:
//*              Blob ablo_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.pagexmpmetadata = ablo_value
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

public function long get_pdfxconformance();
//*-----------------------------------------------------------------*/
//*  .NET property : PDFXConformance
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
ll_result = This.pdfxconformance
Return ll_result
end function

public subroutine  set_pdfxconformance(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PDFXConformance
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.pdfxconformance = al_value
end subroutine

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

public function long get_compressionlevel();
//*-----------------------------------------------------------------*/
//*  .NET property : CompressionLevel
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
ll_result = This.compressionlevel
Return ll_result
end function

public subroutine  set_compressionlevel(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CompressionLevel
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.compressionlevel = al_value
end subroutine

public function longlong get_currentdocumentsize();
//*-----------------------------------------------------------------*/
//*  .NET property : CurrentDocumentSize
//*   Return : Longlong
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Longlong lll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lll_result)
	Return lll_result
End If

/* Trigger the dotnet property */
lll_result = This.currentdocumentsize
Return lll_result
end function

public function dotnetobject get_structuretreeroot();
//*-----------------------------------------------------------------*/
//*  .NET property : StructureTreeRoot
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
lnv_result = This.structuretreeroot
Return lnv_result
end function

public function dotnetobject get_ocproperties();
//*-----------------------------------------------------------------*/
//*  .NET property : OCProperties
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
lnv_result = This.ocproperties
Return lnv_result
end function

public function dotnetobject get_pagesize();
//*-----------------------------------------------------------------*/
//*  .NET property : PageSize
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
lnv_result = This.pagesize
Return lnv_result
end function

public subroutine  set_cropboxsize(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CropBoxSize
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.cropboxsize = anv_value
end subroutine

public function boolean get_pageempty();
//*-----------------------------------------------------------------*/
//*  .NET property : PageEmpty
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
lbln_result = This.pageempty
Return lbln_result
end function

public subroutine  set_pageempty(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PageEmpty
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.pageempty = abln_value
end subroutine

public subroutine  set_duration(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Duration
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.duration = al_value
end subroutine

public subroutine  set_transition(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Transition
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.transition = anv_value
end subroutine

public subroutine  set_thumbnail(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Thumbnail
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.thumbnail = anv_value
end subroutine

public function dotnetobject get_group();
//*-----------------------------------------------------------------*/
//*  .NET property : Group
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
lnv_result = This.group
Return lnv_result
end function

public subroutine  set_group(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Group
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.group = anv_value
end subroutine

public function real get_spacecharratio();
//*-----------------------------------------------------------------*/
//*  .NET property : SpaceCharRatio
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet property */
lr_result = This.spacecharratio
Return lr_result
end function

public subroutine  set_spacecharratio(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SpaceCharRatio
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.spacecharratio = ar_value
end subroutine

public function long get_rundirection();
//*-----------------------------------------------------------------*/
//*  .NET property : RunDirection
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
ll_result = This.rundirection
Return ll_result
end function

public subroutine  set_rundirection(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : RunDirection
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.rundirection = al_value
end subroutine

public subroutine  set_userunit(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Userunit
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.userunit = ar_value
end subroutine

public function dotnetobject get_defaultcolorspace();
//*-----------------------------------------------------------------*/
//*  .NET property : DefaultColorspace
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
lnv_result = This.defaultcolorspace
Return lnv_result
end function

public function boolean get_strictimagesequence();
//*-----------------------------------------------------------------*/
//*  .NET property : StrictImageSequence
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
lbln_result = This.strictimagesequence
Return lbln_result
end function

public subroutine  set_strictimagesequence(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : StrictImageSequence
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.strictimagesequence = abln_value
end subroutine

public function boolean get_userproperties();
//*-----------------------------------------------------------------*/
//*  .NET property : UserProperties
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
lbln_result = This.userproperties
Return lbln_result
end function

public subroutine  set_userproperties(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : UserProperties
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.userproperties = abln_value
end subroutine

public function boolean get_rgbtransparencyblending();
//*-----------------------------------------------------------------*/
//*  .NET property : RgbTransparencyBlending
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
lbln_result = This.rgbtransparencyblending
Return lbln_result
end function

public subroutine  set_rgbtransparencyblending(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : RgbTransparencyBlending
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.rgbtransparencyblending = abln_value
end subroutine

public subroutine  set_pagecount(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PageCount
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.pagecount = al_value
end subroutine

public function boolean get_closestream();
//*-----------------------------------------------------------------*/
//*  .NET property : CloseStream
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
lbln_result = This.closestream
Return lbln_result
end function

public subroutine  set_closestream(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CloseStream
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.closestream = abln_value
end subroutine

on nvo_pdfcopy.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfcopy.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

