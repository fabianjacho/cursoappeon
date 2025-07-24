$PBExportHeader$nvo_fdfreader.sru
forward
global type nvo_fdfreader from dotnetobject
end type
end forward

global type nvo_fdfreader from dotnetobject
end type
global nvo_fdfreader nvo_fdfreader

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.FdfReader"

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
public function dotnetobject of_getfield(string as_name)
public function blob of_getattachedfile(string as_name)
public function string of_getfieldvalue(string as_name)
public function boolean of_isnewxreftype()
public function boolean of_ishybridxref()
public function boolean of_hasusagerights()
public subroutine  of_removeusagerights()
public function long of_getcertificationlevel()
public function long of_getcryptomode()
public function boolean of_ismetadataencrypted()
public function blob of_computeuserpassword()
public subroutine  of_dispose()
public function boolean of_isrebuilt()
public function dotnetobject of_getpagen(long al_pagenum)
public function dotnetobject of_getpagenrelease(long al_pagenum)
public subroutine  of_releasepage(long al_pagenum)
public subroutine  of_resetreleasepage()
public function dotnetobject of_getpageorigref(long al_pagenum)
public function blob of_getpagecontent(long al_pagenum,dotnetobject anv_file)
public function dotnetobject of_getpageresources(long al_pagenum)
public function dotnetobject of_getpageresources(dotnetobject anv_pagedict)
public function blob of_getpagecontent(long al_pagenum)
public subroutine  of_setpagecontent(long al_pagenum,blob ablo_content)
public subroutine  of_setpagecontent(long al_pagenum,blob ablo_content,long al_compressionlevel,boolean abln_killoldxrefrecursively)
public subroutine  of_eliminatesharedstreams()
public function boolean of_isencrypted()
public function boolean of_is128key()
public function long of_shufflesubsetnames()
public function long of_createfakefontsubsets()
public function dotnetobject of_getnameddestination()
public function dotnetobject of_getnameddestination(boolean abln_keepnames)
public function dotnetobject of_getnameddestinationfromnames()
public function dotnetobject of_getnameddestinationfromnames(boolean abln_keepnames)
public function dotnetobject of_getnameddestinationfromstrings()
public subroutine  of_removefields()
public subroutine  of_removeannotations()
public function dotnetobject of_getlinks(long al_page)
public subroutine  of_makeremotenameddestinationslocal()
public subroutine  of_consolidatenameddestinations()
public subroutine  of_close()
public function long of_removeunusedobjects()
public function string of_getjavascript(dotnetobject anv_file)
public subroutine  of_selectpages(string as_ranges)
public subroutine  of_selectpages(dotnetobject anv_pagestokeep)
public subroutine  of_addviewerpreference(dotnetobject anv_key,dotnetobject anv_value)
public subroutine  of_setviewerpreferences(dotnetobject anv_vp)
public function long of_getpagerotation(long al_index)
public function dotnetobject of_getpagesizewithrotation(long al_index)
public function dotnetobject of_getpagesizewithrotation(dotnetobject anv_page)
public function dotnetobject of_getpagesize(long al_index)
public function dotnetobject of_getpagesize(dotnetobject anv_page)
public function dotnetobject of_getcropbox(long al_index)
public function dotnetobject of_getboxsize(long al_index,string as_boxname)
public function boolean of_istagged()
public function dotnetobject of_getpdfobjectrelease(long al_idx)
public function dotnetobject of_getpdfobject(long al_idx)
public subroutine  of_resetlastxrefpartial()
public subroutine  of_releaselastxrefpartial()
public function dotnetobject of_addpdfobject(dotnetobject anv_obj)
public function double of_dumpperc()
public function dotnetobject get_fields()
public function string get_filespec()
public function dotnetobject get_safefile()
public function long get_numberofpages()
public function dotnetobject get_catalog()
public function dotnetobject get_acroform()
public function dotnetobject get_info()
public function boolean get_tampered()
public subroutine  set_tampered(boolean abln_value)
public function blob get_metadata()
public function longlong get_lastxref()
public function long get_xrefsize()
public function longlong get_eofpos()
public function char get_pdfversion()
public function longlong get_permissions()
public function dotnetobject get_trailer()
public function dotnetobject get_acrofields()
public function string get_javascript()
public subroutine  set_viewerpreferences(long al_value)
public function long get_simpleviewerpreferences()
public function boolean get_appendable()
public subroutine  set_appendable(boolean abln_value)
public function longlong get_filelength()
public function boolean get_isopenedwithfullpermissions()
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

public function dotnetobject of_getfield(string as_name);
//*-----------------------------------------------------------------*/
//*  .NET function : GetField
//*   Argument:
//*              String as_name
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
lnv_result = This.getfield(as_name)
Return lnv_result
end function

public function blob of_getattachedfile(string as_name);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAttachedFile
//*   Argument:
//*              String as_name
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
lbyt_result = This.getattachedfile(as_name)
Return lbyt_result
end function

public function string of_getfieldvalue(string as_name);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFieldValue
//*   Argument:
//*              String as_name
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
ls_result = This.getfieldvalue(as_name)
Return ls_result
end function

public function boolean of_isnewxreftype();
//*-----------------------------------------------------------------*/
//*  .NET function : IsNewXrefType
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
lbln_result = This.isnewxreftype()
Return lbln_result
end function

public function boolean of_ishybridxref();
//*-----------------------------------------------------------------*/
//*  .NET function : IsHybridXref
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
lbln_result = This.ishybridxref()
Return lbln_result
end function

public function boolean of_hasusagerights();
//*-----------------------------------------------------------------*/
//*  .NET function : HasUsageRights
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
lbln_result = This.hasusagerights()
Return lbln_result
end function

public subroutine  of_removeusagerights();
//*-----------------------------------------------------------------*/
//*  .NET function : RemoveUsageRights
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.removeusagerights()
end subroutine

public function long of_getcertificationlevel();
//*-----------------------------------------------------------------*/
//*  .NET function : GetCertificationLevel
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
ll_result = This.getcertificationlevel()
Return ll_result
end function

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

public function blob of_computeuserpassword();
//*-----------------------------------------------------------------*/
//*  .NET function : ComputeUserPassword
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
lbyt_result = This.computeuserpassword()
Return lbyt_result
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

public function boolean of_isrebuilt();
//*-----------------------------------------------------------------*/
//*  .NET function : IsRebuilt
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
lbln_result = This.isrebuilt()
Return lbln_result
end function

public function dotnetobject of_getpagen(long al_pagenum);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPageN
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
lnv_result = This.getpagen(al_pagenum)
Return lnv_result
end function

public function dotnetobject of_getpagenrelease(long al_pagenum);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPageNRelease
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
lnv_result = This.getpagenrelease(al_pagenum)
Return lnv_result
end function

public subroutine  of_releasepage(long al_pagenum);
//*-----------------------------------------------------------------*/
//*  .NET function : ReleasePage
//*   Argument:
//*              Long al_pagenum
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.releasepage(al_pagenum)
end subroutine

public subroutine  of_resetreleasepage();
//*-----------------------------------------------------------------*/
//*  .NET function : ResetReleasePage
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.resetreleasepage()
end subroutine

public function dotnetobject of_getpageorigref(long al_pagenum);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPageOrigRef
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
lnv_result = This.getpageorigref(al_pagenum)
Return lnv_result
end function

public function blob of_getpagecontent(long al_pagenum,dotnetobject anv_file);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPageContent
//*   Argument:
//*              Long al_pagenum
//*              Dotnetobject anv_file
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
lbyt_result = This.getpagecontent(al_pagenum,anv_file)
Return lbyt_result
end function

public function dotnetobject of_getpageresources(long al_pagenum);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPageResources
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
lnv_result = This.getpageresources(al_pagenum)
Return lnv_result
end function

public function dotnetobject of_getpageresources(dotnetobject anv_pagedict);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPageResources
//*   Argument:
//*              Dotnetobject anv_pagedict
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
lnv_result = This.getpageresources(anv_pagedict)
Return lnv_result
end function

public function blob of_getpagecontent(long al_pagenum);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPageContent
//*   Argument:
//*              Long al_pagenum
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
lbyt_result = This.getpagecontent(al_pagenum)
Return lbyt_result
end function

public subroutine  of_setpagecontent(long al_pagenum,blob ablo_content);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPageContent
//*   Argument:
//*              Long al_pagenum
//*              Blob ablo_content
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpagecontent(al_pagenum,ablo_content)
end subroutine

public subroutine  of_setpagecontent(long al_pagenum,blob ablo_content,long al_compressionlevel,boolean abln_killoldxrefrecursively);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPageContent
//*   Argument:
//*              Long al_pagenum
//*              Blob ablo_content
//*              Long al_compressionlevel
//*              Boolean abln_killoldxrefrecursively
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpagecontent(al_pagenum,ablo_content,al_compressionlevel,abln_killoldxrefrecursively)
end subroutine

public subroutine  of_eliminatesharedstreams();
//*-----------------------------------------------------------------*/
//*  .NET function : EliminateSharedStreams
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.eliminatesharedstreams()
end subroutine

public function boolean of_isencrypted();
//*-----------------------------------------------------------------*/
//*  .NET function : IsEncrypted
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
lbln_result = This.isencrypted()
Return lbln_result
end function

public function boolean of_is128key();
//*-----------------------------------------------------------------*/
//*  .NET function : Is128Key
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
lbln_result = This.is128key()
Return lbln_result
end function

public function long of_shufflesubsetnames();
//*-----------------------------------------------------------------*/
//*  .NET function : ShuffleSubsetNames
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
ll_result = This.shufflesubsetnames()
Return ll_result
end function

public function long of_createfakefontsubsets();
//*-----------------------------------------------------------------*/
//*  .NET function : CreateFakeFontSubsets
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
ll_result = This.createfakefontsubsets()
Return ll_result
end function

public function dotnetobject of_getnameddestination();
//*-----------------------------------------------------------------*/
//*  .NET function : GetNamedDestination
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
lnv_result = This.getnameddestination()
Return lnv_result
end function

public function dotnetobject of_getnameddestination(boolean abln_keepnames);
//*-----------------------------------------------------------------*/
//*  .NET function : GetNamedDestination
//*   Argument:
//*              Boolean abln_keepnames
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
lnv_result = This.getnameddestination(abln_keepnames)
Return lnv_result
end function

public function dotnetobject of_getnameddestinationfromnames();
//*-----------------------------------------------------------------*/
//*  .NET function : GetNamedDestinationFromNames
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
lnv_result = This.getnameddestinationfromnames()
Return lnv_result
end function

public function dotnetobject of_getnameddestinationfromnames(boolean abln_keepnames);
//*-----------------------------------------------------------------*/
//*  .NET function : GetNamedDestinationFromNames
//*   Argument:
//*              Boolean abln_keepnames
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
lnv_result = This.getnameddestinationfromnames(abln_keepnames)
Return lnv_result
end function

public function dotnetobject of_getnameddestinationfromstrings();
//*-----------------------------------------------------------------*/
//*  .NET function : GetNamedDestinationFromStrings
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
lnv_result = This.getnameddestinationfromstrings()
Return lnv_result
end function

public subroutine  of_removefields();
//*-----------------------------------------------------------------*/
//*  .NET function : RemoveFields
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.removefields()
end subroutine

public subroutine  of_removeannotations();
//*-----------------------------------------------------------------*/
//*  .NET function : RemoveAnnotations
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.removeannotations()
end subroutine

public function dotnetobject of_getlinks(long al_page);
//*-----------------------------------------------------------------*/
//*  .NET function : GetLinks
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
lnv_result = This.getlinks(al_page)
Return lnv_result
end function

public subroutine  of_makeremotenameddestinationslocal();
//*-----------------------------------------------------------------*/
//*  .NET function : MakeRemoteNamedDestinationsLocal
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.makeremotenameddestinationslocal()
end subroutine

public subroutine  of_consolidatenameddestinations();
//*-----------------------------------------------------------------*/
//*  .NET function : ConsolidateNamedDestinations
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.consolidatenameddestinations()
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

public function long of_removeunusedobjects();
//*-----------------------------------------------------------------*/
//*  .NET function : RemoveUnusedObjects
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
ll_result = This.removeunusedobjects()
Return ll_result
end function

public function string of_getjavascript(dotnetobject anv_file);
//*-----------------------------------------------------------------*/
//*  .NET function : GetJavaScript
//*   Argument:
//*              Dotnetobject anv_file
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
ls_result = This.getjavascript(anv_file)
Return ls_result
end function

public subroutine  of_selectpages(string as_ranges);
//*-----------------------------------------------------------------*/
//*  .NET function : SelectPages
//*   Argument:
//*              String as_ranges
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.selectpages(as_ranges)
end subroutine

public subroutine  of_selectpages(dotnetobject anv_pagestokeep);
//*-----------------------------------------------------------------*/
//*  .NET function : SelectPages
//*   Argument:
//*              Dotnetobject anv_pagestokeep
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.selectpages(anv_pagestokeep)
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

public subroutine  of_setviewerpreferences(dotnetobject anv_vp);
//*-----------------------------------------------------------------*/
//*  .NET function : SetViewerPreferences
//*   Argument:
//*              Dotnetobject anv_vp
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setviewerpreferences(anv_vp)
end subroutine

public function long of_getpagerotation(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPageRotation
//*   Argument:
//*              Long al_index
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
ll_result = This.getpagerotation(al_index)
Return ll_result
end function

public function dotnetobject of_getpagesizewithrotation(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPageSizeWithRotation
//*   Argument:
//*              Long al_index
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
lnv_result = This.getpagesizewithrotation(al_index)
Return lnv_result
end function

public function dotnetobject of_getpagesizewithrotation(dotnetobject anv_page);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPageSizeWithRotation
//*   Argument:
//*              Dotnetobject anv_page
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
lnv_result = This.getpagesizewithrotation(anv_page)
Return lnv_result
end function

public function dotnetobject of_getpagesize(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPageSize
//*   Argument:
//*              Long al_index
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
lnv_result = This.getpagesize(al_index)
Return lnv_result
end function

public function dotnetobject of_getpagesize(dotnetobject anv_page);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPageSize
//*   Argument:
//*              Dotnetobject anv_page
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
lnv_result = This.getpagesize(anv_page)
Return lnv_result
end function

public function dotnetobject of_getcropbox(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetCropBox
//*   Argument:
//*              Long al_index
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
lnv_result = This.getcropbox(al_index)
Return lnv_result
end function

public function dotnetobject of_getboxsize(long al_index,string as_boxname);
//*-----------------------------------------------------------------*/
//*  .NET function : GetBoxSize
//*   Argument:
//*              Long al_index
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
lnv_result = This.getboxsize(al_index,as_boxname)
Return lnv_result
end function

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

public function dotnetobject of_getpdfobjectrelease(long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPdfObjectRelease
//*   Argument:
//*              Long al_idx
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
lnv_result = This.getpdfobjectrelease(al_idx)
Return lnv_result
end function

public function dotnetobject of_getpdfobject(long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPdfObject
//*   Argument:
//*              Long al_idx
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
lnv_result = This.getpdfobject(al_idx)
Return lnv_result
end function

public subroutine  of_resetlastxrefpartial();
//*-----------------------------------------------------------------*/
//*  .NET function : ResetLastXrefPartial
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.resetlastxrefpartial()
end subroutine

public subroutine  of_releaselastxrefpartial();
//*-----------------------------------------------------------------*/
//*  .NET function : ReleaseLastXrefPartial
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.releaselastxrefpartial()
end subroutine

public function dotnetobject of_addpdfobject(dotnetobject anv_obj);
//*-----------------------------------------------------------------*/
//*  .NET function : AddPdfObject
//*   Argument:
//*              Dotnetobject anv_obj
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
lnv_result = This.addpdfobject(anv_obj)
Return lnv_result
end function

public function double of_dumpperc();
//*-----------------------------------------------------------------*/
//*  .NET function : DumpPerc
//*   Return : Double
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Double ldb_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ldb_result)
	Return ldb_result
End If

/* Trigger the dotnet function */
ldb_result = This.dumpperc()
Return ldb_result
end function

public function dotnetobject get_fields();
//*-----------------------------------------------------------------*/
//*  .NET property : Fields
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
lnv_result = This.fields
Return lnv_result
end function

public function string get_filespec();
//*-----------------------------------------------------------------*/
//*  .NET property : FileSpec
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
ls_result = This.filespec
Return ls_result
end function

public function dotnetobject get_safefile();
//*-----------------------------------------------------------------*/
//*  .NET property : SafeFile
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
lnv_result = This.safefile
Return lnv_result
end function

public function long get_numberofpages();
//*-----------------------------------------------------------------*/
//*  .NET property : NumberOfPages
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
ll_result = This.numberofpages
Return ll_result
end function

public function dotnetobject get_catalog();
//*-----------------------------------------------------------------*/
//*  .NET property : Catalog
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
lnv_result = This.catalog
Return lnv_result
end function

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

public function boolean get_tampered();
//*-----------------------------------------------------------------*/
//*  .NET property : Tampered
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
lbln_result = This.tampered
Return lbln_result
end function

public subroutine  set_tampered(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Tampered
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.tampered = abln_value
end subroutine

public function blob get_metadata();
//*-----------------------------------------------------------------*/
//*  .NET property : Metadata
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
lbyt_result = This.metadata
Return lbyt_result
end function

public function longlong get_lastxref();
//*-----------------------------------------------------------------*/
//*  .NET property : LastXref
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
lll_result = This.lastxref
Return lll_result
end function

public function long get_xrefsize();
//*-----------------------------------------------------------------*/
//*  .NET property : XrefSize
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
ll_result = This.xrefsize
Return ll_result
end function

public function longlong get_eofpos();
//*-----------------------------------------------------------------*/
//*  .NET property : EofPos
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
lll_result = This.eofpos
Return lll_result
end function

public function char get_pdfversion();
//*-----------------------------------------------------------------*/
//*  .NET property : PdfVersion
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
lch_result = This.pdfversion
Return lch_result
end function

public function longlong get_permissions();
//*-----------------------------------------------------------------*/
//*  .NET property : Permissions
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
lll_result = This.permissions
Return lll_result
end function

public function dotnetobject get_trailer();
//*-----------------------------------------------------------------*/
//*  .NET property : Trailer
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
lnv_result = This.trailer
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

public function string get_javascript();
//*-----------------------------------------------------------------*/
//*  .NET property : JavaScript
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
ls_result = This.javascript
Return ls_result
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

public function long get_simpleviewerpreferences();
//*-----------------------------------------------------------------*/
//*  .NET property : SimpleViewerPreferences
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
ll_result = This.simpleviewerpreferences
Return ll_result
end function

public function boolean get_appendable();
//*-----------------------------------------------------------------*/
//*  .NET property : Appendable
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
lbln_result = This.appendable
Return lbln_result
end function

public subroutine  set_appendable(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Appendable
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.appendable = abln_value
end subroutine

public function longlong get_filelength();
//*-----------------------------------------------------------------*/
//*  .NET property : FileLength
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
lll_result = This.filelength
Return lll_result
end function

public function boolean get_isopenedwithfullpermissions();
//*-----------------------------------------------------------------*/
//*  .NET property : IsOpenedWithFullPermissions
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
lbln_result = This.isopenedwithfullpermissions
Return lbln_result
end function

on nvo_fdfreader.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_fdfreader.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

