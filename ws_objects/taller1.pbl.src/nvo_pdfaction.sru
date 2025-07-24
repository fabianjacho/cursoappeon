$PBExportHeader$nvo_pdfaction.sru
forward
global type nvo_pdfaction from dotnetobject
end type
end forward

global type nvo_pdfaction from dotnetobject
end type
global nvo_pdfaction nvo_pdfaction

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PdfAction"

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
public function dotnetobject of_createlaunch(string as_application,string as_parameters,string as_operation,string as_defaultdir)
public function dotnetobject of_rendition(string as_file,dotnetobject anv_fs,string as_mimetype,dotnetobject anv_refi)
public function dotnetobject of_javascript(string as_code,dotnetobject anv_writer,boolean abln_unicode)
public function dotnetobject of_javascript(string as_code,dotnetobject anv_writer)
public function dotnetobject of_createhide(dotnetobject anv_annot,boolean abln_hide)
public function dotnetobject of_createhide(string as_name,boolean abln_hide)
public function dotnetobject of_createimportdata(string as_file)
public subroutine  of_next(dotnetobject anv_na)
public function dotnetobject of_gotolocalpage(long al_page,dotnetobject anv_dest,dotnetobject anv_writer)
public function dotnetobject of_gotolocalpage(string as_dest,boolean abln_isname)
public function dotnetobject of_gotoremotepage(string as_filename,string as_dest,boolean abln_isname,boolean abln_newwindow)
public function dotnetobject of_gotoembedded(string as_filename,dotnetobject anv_target,string as_dest,boolean abln_isname,boolean abln_newwindow)
public function dotnetobject of_gotoembedded(string as_filename,dotnetobject anv_target,dotnetobject anv_dest,boolean abln_newwindow)
public function dotnetobject of_setocgstate(dotnetobject anv_state,boolean abln_preserverb)
public subroutine  of_topdf(dotnetobject anv_writer,dotnetobject anv_os)
public subroutine  of_put(dotnetobject anv_key,dotnetobject anv_value)
public subroutine  of_putex(dotnetobject anv_key,dotnetobject anv_value)
public subroutine  of_putall(dotnetobject anv_dic)
public subroutine  of_remove(dotnetobject anv_key)
public subroutine  of_clear()
public function dotnetobject of_get(dotnetobject anv_key)
public function boolean of_isfont()
public function boolean of_ispage()
public function boolean of_ispages()
public function boolean of_iscatalog()
public function boolean of_isoutlinetree()
public function boolean of_checktype(dotnetobject anv_type)
public subroutine  of_merge(dotnetobject anv_other)
public subroutine  of_mergedifferent(dotnetobject anv_other)
public function boolean of_contains(dotnetobject anv_key)
public function string of_tostring()
public function dotnetobject of_getdirectobject(dotnetobject anv_key)
public function dotnetobject of_getasdict(dotnetobject anv_key)
public function dotnetobject of_getasarray(dotnetobject anv_key)
public function dotnetobject of_getasstream(dotnetobject anv_key)
public function dotnetobject of_getasstring(dotnetobject anv_key)
public function dotnetobject of_getasnumber(dotnetobject anv_key)
public function dotnetobject of_getasname(dotnetobject anv_key)
public function dotnetobject of_getasboolean(dotnetobject anv_key)
public function dotnetobject of_getasindirectobject(dotnetobject anv_key)
public function blob of_getbytes()
public function boolean of_canbeinobjstm()
public function boolean of_isnull()
public function boolean of_isboolean()
public function boolean of_isnumber()
public function boolean of_isstring()
public function boolean of_isname()
public function boolean of_isarray()
public function boolean of_isdictionary()
public function boolean of_isstream()
public function boolean of_isindirect()
public function long of_compareto(dotnetobject anv_obj)
public function long of_gethashcode()
public function boolean of_equals(dotnetobject anv_obj)
public function dotnetobject get_keys()
public function long get_size()
public function long get_length()
public function long get_type()
public function dotnetobject get_indref()
public subroutine  set_indref(dotnetobject anv_value)
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

public function dotnetobject of_createlaunch(string as_application,string as_parameters,string as_operation,string as_defaultdir);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateLaunch
//*   Argument:
//*              String as_application
//*              String as_parameters
//*              String as_operation
//*              String as_defaultdir
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
lnv_result = This.createlaunch(as_application,as_parameters,as_operation,as_defaultdir)
Return lnv_result
end function

public function dotnetobject of_rendition(string as_file,dotnetobject anv_fs,string as_mimetype,dotnetobject anv_refi);
//*-----------------------------------------------------------------*/
//*  .NET function : Rendition
//*   Argument:
//*              String as_file
//*              Dotnetobject anv_fs
//*              String as_mimetype
//*              Dotnetobject anv_refi
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
lnv_result = This.rendition(as_file,anv_fs,as_mimetype,anv_refi)
Return lnv_result
end function

public function dotnetobject of_javascript(string as_code,dotnetobject anv_writer,boolean abln_unicode);
//*-----------------------------------------------------------------*/
//*  .NET function : JavaScript
//*   Argument:
//*              String as_code
//*              Dotnetobject anv_writer
//*              Boolean abln_unicode
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
lnv_result = This.javascript(as_code,anv_writer,abln_unicode)
Return lnv_result
end function

public function dotnetobject of_javascript(string as_code,dotnetobject anv_writer);
//*-----------------------------------------------------------------*/
//*  .NET function : JavaScript
//*   Argument:
//*              String as_code
//*              Dotnetobject anv_writer
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
lnv_result = This.javascript(as_code,anv_writer)
Return lnv_result
end function

public function dotnetobject of_createhide(dotnetobject anv_annot,boolean abln_hide);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateHide
//*   Argument:
//*              Dotnetobject anv_annot
//*              Boolean abln_hide
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
lnv_result = This.createhide(anv_annot,abln_hide)
Return lnv_result
end function

public function dotnetobject of_createhide(string as_name,boolean abln_hide);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateHide
//*   Argument:
//*              String as_name
//*              Boolean abln_hide
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
lnv_result = This.createhide(as_name,abln_hide)
Return lnv_result
end function

public function dotnetobject of_createimportdata(string as_file);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateImportData
//*   Argument:
//*              String as_file
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
lnv_result = This.createimportdata(as_file)
Return lnv_result
end function

public subroutine  of_next(dotnetobject anv_na);
//*-----------------------------------------------------------------*/
//*  .NET function : Next
//*   Argument:
//*              Dotnetobject anv_na
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.next(anv_na)
end subroutine

public function dotnetobject of_gotolocalpage(long al_page,dotnetobject anv_dest,dotnetobject anv_writer);
//*-----------------------------------------------------------------*/
//*  .NET function : GotoLocalPage
//*   Argument:
//*              Long al_page
//*              Dotnetobject anv_dest
//*              Dotnetobject anv_writer
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
lnv_result = This.gotolocalpage(al_page,anv_dest,anv_writer)
Return lnv_result
end function

public function dotnetobject of_gotolocalpage(string as_dest,boolean abln_isname);
//*-----------------------------------------------------------------*/
//*  .NET function : GotoLocalPage
//*   Argument:
//*              String as_dest
//*              Boolean abln_isname
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
lnv_result = This.gotolocalpage(as_dest,abln_isname)
Return lnv_result
end function

public function dotnetobject of_gotoremotepage(string as_filename,string as_dest,boolean abln_isname,boolean abln_newwindow);
//*-----------------------------------------------------------------*/
//*  .NET function : GotoRemotePage
//*   Argument:
//*              String as_filename
//*              String as_dest
//*              Boolean abln_isname
//*              Boolean abln_newwindow
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
lnv_result = This.gotoremotepage(as_filename,as_dest,abln_isname,abln_newwindow)
Return lnv_result
end function

public function dotnetobject of_gotoembedded(string as_filename,dotnetobject anv_target,string as_dest,boolean abln_isname,boolean abln_newwindow);
//*-----------------------------------------------------------------*/
//*  .NET function : GotoEmbedded
//*   Argument:
//*              String as_filename
//*              Dotnetobject anv_target
//*              String as_dest
//*              Boolean abln_isname
//*              Boolean abln_newwindow
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
lnv_result = This.gotoembedded(as_filename,anv_target,as_dest,abln_isname,abln_newwindow)
Return lnv_result
end function

public function dotnetobject of_gotoembedded(string as_filename,dotnetobject anv_target,dotnetobject anv_dest,boolean abln_newwindow);
//*-----------------------------------------------------------------*/
//*  .NET function : GotoEmbedded
//*   Argument:
//*              String as_filename
//*              Dotnetobject anv_target
//*              Dotnetobject anv_dest
//*              Boolean abln_newwindow
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
lnv_result = This.gotoembedded(as_filename,anv_target,anv_dest,abln_newwindow)
Return lnv_result
end function

public function dotnetobject of_setocgstate(dotnetobject anv_state,boolean abln_preserverb);
//*-----------------------------------------------------------------*/
//*  .NET function : SetOCGstate
//*   Argument:
//*              Dotnetobject anv_state
//*              Boolean abln_preserverb
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
lnv_result = This.setocgstate(anv_state,abln_preserverb)
Return lnv_result
end function

public subroutine  of_topdf(dotnetobject anv_writer,dotnetobject anv_os);
//*-----------------------------------------------------------------*/
//*  .NET function : ToPdf
//*   Argument:
//*              Dotnetobject anv_writer
//*              Dotnetobject anv_os
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.topdf(anv_writer,anv_os)
end subroutine

public subroutine  of_put(dotnetobject anv_key,dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET function : Put
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
This.put(anv_key,anv_value)
end subroutine

public subroutine  of_putex(dotnetobject anv_key,dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET function : PutEx
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
This.putex(anv_key,anv_value)
end subroutine

public subroutine  of_putall(dotnetobject anv_dic);
//*-----------------------------------------------------------------*/
//*  .NET function : PutAll
//*   Argument:
//*              Dotnetobject anv_dic
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.putall(anv_dic)
end subroutine

public subroutine  of_remove(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : Remove
//*   Argument:
//*              Dotnetobject anv_key
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.remove(anv_key)
end subroutine

public subroutine  of_clear();
//*-----------------------------------------------------------------*/
//*  .NET function : Clear
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.clear()
end subroutine

public function dotnetobject of_get(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : Get
//*   Argument:
//*              Dotnetobject anv_key
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
lnv_result = This.get(anv_key)
Return lnv_result
end function

public function boolean of_isfont();
//*-----------------------------------------------------------------*/
//*  .NET function : IsFont
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
lbln_result = This.isfont()
Return lbln_result
end function

public function boolean of_ispage();
//*-----------------------------------------------------------------*/
//*  .NET function : IsPage
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
lbln_result = This.ispage()
Return lbln_result
end function

public function boolean of_ispages();
//*-----------------------------------------------------------------*/
//*  .NET function : IsPages
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
lbln_result = This.ispages()
Return lbln_result
end function

public function boolean of_iscatalog();
//*-----------------------------------------------------------------*/
//*  .NET function : IsCatalog
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
lbln_result = This.iscatalog()
Return lbln_result
end function

public function boolean of_isoutlinetree();
//*-----------------------------------------------------------------*/
//*  .NET function : IsOutlineTree
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
lbln_result = This.isoutlinetree()
Return lbln_result
end function

public function boolean of_checktype(dotnetobject anv_type);
//*-----------------------------------------------------------------*/
//*  .NET function : CheckType
//*   Argument:
//*              Dotnetobject anv_type
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
lbln_result = This.checktype(anv_type)
Return lbln_result
end function

public subroutine  of_merge(dotnetobject anv_other);
//*-----------------------------------------------------------------*/
//*  .NET function : Merge
//*   Argument:
//*              Dotnetobject anv_other
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.merge(anv_other)
end subroutine

public subroutine  of_mergedifferent(dotnetobject anv_other);
//*-----------------------------------------------------------------*/
//*  .NET function : MergeDifferent
//*   Argument:
//*              Dotnetobject anv_other
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.mergedifferent(anv_other)
end subroutine

public function boolean of_contains(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : Contains
//*   Argument:
//*              Dotnetobject anv_key
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
lbln_result = This.contains(anv_key)
Return lbln_result
end function

public function string of_tostring();
//*-----------------------------------------------------------------*/
//*  .NET function : ToString
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
ls_result = This.tostring()
Return ls_result
end function

public function dotnetobject of_getdirectobject(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : GetDirectObject
//*   Argument:
//*              Dotnetobject anv_key
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
lnv_result = This.getdirectobject(anv_key)
Return lnv_result
end function

public function dotnetobject of_getasdict(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsDict
//*   Argument:
//*              Dotnetobject anv_key
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
lnv_result = This.getasdict(anv_key)
Return lnv_result
end function

public function dotnetobject of_getasarray(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsArray
//*   Argument:
//*              Dotnetobject anv_key
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
lnv_result = This.getasarray(anv_key)
Return lnv_result
end function

public function dotnetobject of_getasstream(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsStream
//*   Argument:
//*              Dotnetobject anv_key
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
lnv_result = This.getasstream(anv_key)
Return lnv_result
end function

public function dotnetobject of_getasstring(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsString
//*   Argument:
//*              Dotnetobject anv_key
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
lnv_result = This.getasstring(anv_key)
Return lnv_result
end function

public function dotnetobject of_getasnumber(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsNumber
//*   Argument:
//*              Dotnetobject anv_key
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
lnv_result = This.getasnumber(anv_key)
Return lnv_result
end function

public function dotnetobject of_getasname(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsName
//*   Argument:
//*              Dotnetobject anv_key
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
lnv_result = This.getasname(anv_key)
Return lnv_result
end function

public function dotnetobject of_getasboolean(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsBoolean
//*   Argument:
//*              Dotnetobject anv_key
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
lnv_result = This.getasboolean(anv_key)
Return lnv_result
end function

public function dotnetobject of_getasindirectobject(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsIndirectObject
//*   Argument:
//*              Dotnetobject anv_key
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
lnv_result = This.getasindirectobject(anv_key)
Return lnv_result
end function

public function blob of_getbytes();
//*-----------------------------------------------------------------*/
//*  .NET function : GetBytes
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
lbyt_result = This.getbytes()
Return lbyt_result
end function

public function boolean of_canbeinobjstm();
//*-----------------------------------------------------------------*/
//*  .NET function : CanBeInObjStm
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
lbln_result = This.canbeinobjstm()
Return lbln_result
end function

public function boolean of_isnull();
//*-----------------------------------------------------------------*/
//*  .NET function : IsNull
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
lbln_result = This.isnull()
Return lbln_result
end function

public function boolean of_isboolean();
//*-----------------------------------------------------------------*/
//*  .NET function : IsBoolean
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
lbln_result = This.isboolean()
Return lbln_result
end function

public function boolean of_isnumber();
//*-----------------------------------------------------------------*/
//*  .NET function : IsNumber
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
lbln_result = This.isnumber()
Return lbln_result
end function

public function boolean of_isstring();
//*-----------------------------------------------------------------*/
//*  .NET function : IsString
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
lbln_result = This.isstring()
Return lbln_result
end function

public function boolean of_isname();
//*-----------------------------------------------------------------*/
//*  .NET function : IsName
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
lbln_result = This.isname()
Return lbln_result
end function

public function boolean of_isarray();
//*-----------------------------------------------------------------*/
//*  .NET function : IsArray
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
lbln_result = This.isarray()
Return lbln_result
end function

public function boolean of_isdictionary();
//*-----------------------------------------------------------------*/
//*  .NET function : IsDictionary
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
lbln_result = This.isdictionary()
Return lbln_result
end function

public function boolean of_isstream();
//*-----------------------------------------------------------------*/
//*  .NET function : IsStream
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
lbln_result = This.isstream()
Return lbln_result
end function

public function boolean of_isindirect();
//*-----------------------------------------------------------------*/
//*  .NET function : IsIndirect
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
lbln_result = This.isindirect()
Return lbln_result
end function

public function long of_compareto(dotnetobject anv_obj);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareTo
//*   Argument:
//*              Dotnetobject anv_obj
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
ll_result = This.compareto(anv_obj)
Return ll_result
end function

public function long of_gethashcode();
//*-----------------------------------------------------------------*/
//*  .NET function : GetHashCode
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
ll_result = This.gethashcode()
Return ll_result
end function

public function boolean of_equals(dotnetobject anv_obj);
//*-----------------------------------------------------------------*/
//*  .NET function : Equals
//*   Argument:
//*              Dotnetobject anv_obj
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
lbln_result = This.equals(anv_obj)
Return lbln_result
end function

public function dotnetobject get_keys();
//*-----------------------------------------------------------------*/
//*  .NET property : Keys
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
lnv_result = This.keys
Return lnv_result
end function

public function long get_size();
//*-----------------------------------------------------------------*/
//*  .NET property : Size
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
ll_result = This.size
Return ll_result
end function

public function long get_length();
//*-----------------------------------------------------------------*/
//*  .NET property : Length
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
ll_result = This.length
Return ll_result
end function

public function long get_type();
//*-----------------------------------------------------------------*/
//*  .NET property : Type
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
ll_result = This.type
Return ll_result
end function

public function dotnetobject get_indref();
//*-----------------------------------------------------------------*/
//*  .NET property : IndRef
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
lnv_result = This.indref
Return lnv_result
end function

public subroutine  set_indref(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : IndRef
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.indref = anv_value
end subroutine

on nvo_pdfaction.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfaction.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

