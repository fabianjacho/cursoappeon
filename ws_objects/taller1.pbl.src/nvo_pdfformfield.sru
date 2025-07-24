$PBExportHeader$nvo_pdfformfield.sru
forward
global type nvo_pdfformfield from dotnetobject
end type
end forward

global type nvo_pdfformfield from dotnetobject
end type
global nvo_pdfformfield nvo_pdfformfield

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PdfFormField"

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
public subroutine  of_setwidget(dotnetobject anv_rect,dotnetobject anv_highlight)
public function dotnetobject of_createempty(dotnetobject anv_writer)
public function dotnetobject of_createpushbutton(dotnetobject anv_writer)
public function dotnetobject of_createcheckbox(dotnetobject anv_writer)
public function dotnetobject of_createradiobutton(dotnetobject anv_writer,boolean abln_notoggletooff)
public function dotnetobject of_createtextfield(dotnetobject anv_writer,boolean abln_multiline,boolean abln_password,long al_maxlen)
public function dotnetobject of_createlist(dotnetobject anv_writer,string as_options[],long al_topindex)
public function dotnetobject of_createlist(dotnetobject anv_writer,any as_options,long al_topindex)
public function dotnetobject of_createcombo(dotnetobject anv_writer,boolean abln_edit,string as_options[],long al_topindex)
public function dotnetobject of_createcombo(dotnetobject anv_writer,boolean abln_edit,any as_options,long al_topindex)
public function dotnetobject of_createsignature(dotnetobject anv_writer)
public subroutine  of_addkid(dotnetobject anv_field)
public function long of_setfieldflags(long al_flags)
public subroutine  of_setused()
public subroutine  of_sethighlighting(dotnetobject anv_highlight)
public subroutine  of_setappearance(dotnetobject anv_ap,dotnetobject anv_template)
public subroutine  of_setappearance(dotnetobject anv_ap,string as_state,dotnetobject anv_template)
public subroutine  of_setadditionalactions(dotnetobject anv_key,dotnetobject anv_action)
public function dotnetobject of_gettemplates()
public function boolean of_isform()
public function boolean of_isannotation()
public subroutine  of_setpage()
public subroutine  of_setmkiconfit(dotnetobject anv_scale,dotnetobject anv_scalingtype,real ar_leftoverleft,real ar_leftoverbottom,boolean abln_fitinbounds)
public subroutine  of_applyctm(dotnetobject anv_ctm)
public subroutine  of_applyctm1(dotnetobject anv_ctm)
public subroutine  of_topdf(dotnetobject anv_writer,dotnetobject anv_os)
public function dotnetobject of_getaccessibleattribute(dotnetobject anv_key)
public subroutine  of_setaccessibleattribute(dotnetobject anv_key,dotnetobject anv_value)
public function dotnetobject of_getaccessibleattributes()
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
public subroutine  set_button(long al_value)
public function dotnetobject get_parent()
public function dotnetobject get_kids()
public subroutine  set_valueasstring(string as_value)
public subroutine  set_valueasname(string as_value)
public subroutine  set_valueassig(dotnetobject anv_value)
public subroutine  set_richvalue(string as_value)
public subroutine  set_defaultvalueasstring(string as_value)
public subroutine  set_defaultvalueasname(string as_value)
public subroutine  set_fieldname(string as_value)
public subroutine  set_username(string as_value)
public subroutine  set_mappingname(string as_value)
public subroutine  set_quadding(long al_value)
public function dotnetobject get_indirectreference()
public subroutine  set_defaultappearancestring(dotnetobject anv_value)
public subroutine  set_flags(long al_value)
public subroutine  set_border(dotnetobject anv_value)
public subroutine  set_borderstyle(dotnetobject anv_value)
public subroutine  set_appearancestate(string as_value)
public subroutine  set_color(dotnetobject anv_value)
public subroutine  set_title(string as_value)
public subroutine  set_popup(dotnetobject anv_value)
public subroutine  set_action(dotnetobject anv_value)
public function dotnetobject get_templates()
public subroutine  set_page(long al_value)
public function long get_placeinpage()
public subroutine  set_placeinpage(long al_value)
public subroutine  set_rotate(long al_value)
public subroutine  set_mkrotation(long al_value)
public subroutine  set_mkbordercolor(dotnetobject anv_value)
public subroutine  set_mkbackgroundcolor(dotnetobject anv_value)
public subroutine  set_mknormalcaption(string as_value)
public subroutine  set_mkrollovercaption(string as_value)
public subroutine  set_mkalternatecaption(string as_value)
public subroutine  set_mknormalicon(dotnetobject anv_value)
public subroutine  set_mkrollovericon(dotnetobject anv_value)
public subroutine  set_mkalternateicon(dotnetobject anv_value)
public subroutine  set_mktextposition(long al_value)
public subroutine  set_layer(dotnetobject anv_value)
public subroutine  set_name(string as_value)
public function dotnetobject get_role()
public subroutine  set_role(dotnetobject anv_value)
public function dotnetobject get_id()
public subroutine  set_id(dotnetobject anv_value)
public function boolean get_isinline()
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

public subroutine  of_setwidget(dotnetobject anv_rect,dotnetobject anv_highlight);
//*-----------------------------------------------------------------*/
//*  .NET function : SetWidget
//*   Argument:
//*              Dotnetobject anv_rect
//*              Dotnetobject anv_highlight
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setwidget(anv_rect,anv_highlight)
end subroutine

public function dotnetobject of_createempty(dotnetobject anv_writer);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateEmpty
//*   Argument:
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
lnv_result = This.createempty(anv_writer)
Return lnv_result
end function

public function dotnetobject of_createpushbutton(dotnetobject anv_writer);
//*-----------------------------------------------------------------*/
//*  .NET function : CreatePushButton
//*   Argument:
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
lnv_result = This.createpushbutton(anv_writer)
Return lnv_result
end function

public function dotnetobject of_createcheckbox(dotnetobject anv_writer);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateCheckBox
//*   Argument:
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
lnv_result = This.createcheckbox(anv_writer)
Return lnv_result
end function

public function dotnetobject of_createradiobutton(dotnetobject anv_writer,boolean abln_notoggletooff);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateRadioButton
//*   Argument:
//*              Dotnetobject anv_writer
//*              Boolean abln_notoggletooff
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
lnv_result = This.createradiobutton(anv_writer,abln_notoggletooff)
Return lnv_result
end function

public function dotnetobject of_createtextfield(dotnetobject anv_writer,boolean abln_multiline,boolean abln_password,long al_maxlen);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateTextField
//*   Argument:
//*              Dotnetobject anv_writer
//*              Boolean abln_multiline
//*              Boolean abln_password
//*              Long al_maxlen
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
lnv_result = This.createtextfield(anv_writer,abln_multiline,abln_password,al_maxlen)
Return lnv_result
end function

public function dotnetobject of_createlist(dotnetobject anv_writer,string as_options[],long al_topindex);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateList
//*   Argument:
//*              Dotnetobject anv_writer
//*              String as_options[]
//*              Long al_topindex
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
lnv_result = This.createlist(anv_writer,as_options,al_topindex)
Return lnv_result
end function

public function dotnetobject of_createlist(dotnetobject anv_writer,any as_options,long al_topindex);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateList
//*   Argument:
//*              Dotnetobject anv_writer
//*              String as_options[,]
//*              Long al_topindex
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
lnv_result = This.createlist(anv_writer,as_options,al_topindex)
Return lnv_result
end function

public function dotnetobject of_createcombo(dotnetobject anv_writer,boolean abln_edit,string as_options[],long al_topindex);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateCombo
//*   Argument:
//*              Dotnetobject anv_writer
//*              Boolean abln_edit
//*              String as_options[]
//*              Long al_topindex
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
lnv_result = This.createcombo(anv_writer,abln_edit,as_options,al_topindex)
Return lnv_result
end function

public function dotnetobject of_createcombo(dotnetobject anv_writer,boolean abln_edit,any as_options,long al_topindex);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateCombo
//*   Argument:
//*              Dotnetobject anv_writer
//*              Boolean abln_edit
//*              String as_options[,]
//*              Long al_topindex
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
lnv_result = This.createcombo(anv_writer,abln_edit,as_options,al_topindex)
Return lnv_result
end function

public function dotnetobject of_createsignature(dotnetobject anv_writer);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateSignature
//*   Argument:
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
lnv_result = This.createsignature(anv_writer)
Return lnv_result
end function

public subroutine  of_addkid(dotnetobject anv_field);
//*-----------------------------------------------------------------*/
//*  .NET function : AddKid
//*   Argument:
//*              Dotnetobject anv_field
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addkid(anv_field)
end subroutine

public function long of_setfieldflags(long al_flags);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFieldFlags
//*   Argument:
//*              Long al_flags
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
ll_result = This.setfieldflags(al_flags)
Return ll_result
end function

public subroutine  of_setused();
//*-----------------------------------------------------------------*/
//*  .NET function : SetUsed
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setused()
end subroutine

public subroutine  of_sethighlighting(dotnetobject anv_highlight);
//*-----------------------------------------------------------------*/
//*  .NET function : SetHighlighting
//*   Argument:
//*              Dotnetobject anv_highlight
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.sethighlighting(anv_highlight)
end subroutine

public subroutine  of_setappearance(dotnetobject anv_ap,dotnetobject anv_template);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAppearance
//*   Argument:
//*              Dotnetobject anv_ap
//*              Dotnetobject anv_template
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setappearance(anv_ap,anv_template)
end subroutine

public subroutine  of_setappearance(dotnetobject anv_ap,string as_state,dotnetobject anv_template);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAppearance
//*   Argument:
//*              Dotnetobject anv_ap
//*              String as_state
//*              Dotnetobject anv_template
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setappearance(anv_ap,as_state,anv_template)
end subroutine

public subroutine  of_setadditionalactions(dotnetobject anv_key,dotnetobject anv_action);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAdditionalActions
//*   Argument:
//*              Dotnetobject anv_key
//*              Dotnetobject anv_action
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setadditionalactions(anv_key,anv_action)
end subroutine

public function dotnetobject of_gettemplates();
//*-----------------------------------------------------------------*/
//*  .NET function : GetTemplates
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
lnv_result = This.gettemplates()
Return lnv_result
end function

public function boolean of_isform();
//*-----------------------------------------------------------------*/
//*  .NET function : IsForm
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
lbln_result = This.isform()
Return lbln_result
end function

public function boolean of_isannotation();
//*-----------------------------------------------------------------*/
//*  .NET function : IsAnnotation
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
lbln_result = This.isannotation()
Return lbln_result
end function

public subroutine  of_setpage();
//*-----------------------------------------------------------------*/
//*  .NET function : SetPage
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpage()
end subroutine

public subroutine  of_setmkiconfit(dotnetobject anv_scale,dotnetobject anv_scalingtype,real ar_leftoverleft,real ar_leftoverbottom,boolean abln_fitinbounds);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMKIconFit
//*   Argument:
//*              Dotnetobject anv_scale
//*              Dotnetobject anv_scalingtype
//*              Real ar_leftoverleft
//*              Real ar_leftoverbottom
//*              Boolean abln_fitinbounds
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setmkiconfit(anv_scale,anv_scalingtype,ar_leftoverleft,ar_leftoverbottom,abln_fitinbounds)
end subroutine

public subroutine  of_applyctm(dotnetobject anv_ctm);
//*-----------------------------------------------------------------*/
//*  .NET function : ApplyCTM
//*   Argument:
//*              Dotnetobject anv_ctm
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.applyctm(anv_ctm)
end subroutine

public subroutine  of_applyctm1(dotnetobject anv_ctm);
//*-----------------------------------------------------------------*/
//*  .NET function : ApplyCTM
//*   Argument:
//*              Dotnetobject anv_ctm
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.applyctm(anv_ctm)
end subroutine

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

public function dotnetobject of_getaccessibleattribute(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAccessibleAttribute
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
lnv_result = This.getaccessibleattribute(anv_key)
Return lnv_result
end function

public subroutine  of_setaccessibleattribute(dotnetobject anv_key,dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAccessibleAttribute
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
This.setaccessibleattribute(anv_key,anv_value)
end subroutine

public function dotnetobject of_getaccessibleattributes();
//*-----------------------------------------------------------------*/
//*  .NET function : GetAccessibleAttributes
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
lnv_result = This.getaccessibleattributes()
Return lnv_result
end function

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

public subroutine  set_button(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Button
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.button = al_value
end subroutine

public function dotnetobject get_parent();
//*-----------------------------------------------------------------*/
//*  .NET property : Parent
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
lnv_result = This.parent
Return lnv_result
end function

public function dotnetobject get_kids();
//*-----------------------------------------------------------------*/
//*  .NET property : Kids
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
lnv_result = This.kids
Return lnv_result
end function

public subroutine  set_valueasstring(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ValueAsString
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.valueasstring = as_value
end subroutine

public subroutine  set_valueasname(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ValueAsName
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.valueasname = as_value
end subroutine

public subroutine  set_valueassig(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ValueAsSig
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.valueassig = anv_value
end subroutine

public subroutine  set_richvalue(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : RichValue
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.richvalue = as_value
end subroutine

public subroutine  set_defaultvalueasstring(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : DefaultValueAsString
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.defaultvalueasstring = as_value
end subroutine

public subroutine  set_defaultvalueasname(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : DefaultValueAsName
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.defaultvalueasname = as_value
end subroutine

public subroutine  set_fieldname(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : FieldName
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.fieldname = as_value
end subroutine

public subroutine  set_username(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : UserName
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.username = as_value
end subroutine

public subroutine  set_mappingname(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MappingName
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.mappingname = as_value
end subroutine

public subroutine  set_quadding(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Quadding
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.quadding = al_value
end subroutine

public function dotnetobject get_indirectreference();
//*-----------------------------------------------------------------*/
//*  .NET property : IndirectReference
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
lnv_result = This.indirectreference
Return lnv_result
end function

public subroutine  set_defaultappearancestring(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : DefaultAppearanceString
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.defaultappearancestring = anv_value
end subroutine

public subroutine  set_flags(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Flags
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.flags = al_value
end subroutine

public subroutine  set_border(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Border
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.border = anv_value
end subroutine

public subroutine  set_borderstyle(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderStyle
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.borderstyle = anv_value
end subroutine

public subroutine  set_appearancestate(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : AppearanceState
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.appearancestate = as_value
end subroutine

public subroutine  set_color(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Color
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.color = anv_value
end subroutine

public subroutine  set_title(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Title
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.title = as_value
end subroutine

public subroutine  set_popup(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Popup
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.popup = anv_value
end subroutine

public subroutine  set_action(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Action
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.action = anv_value
end subroutine

public function dotnetobject get_templates();
//*-----------------------------------------------------------------*/
//*  .NET property : Templates
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
lnv_result = This.templates
Return lnv_result
end function

public subroutine  set_page(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Page
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.page = al_value
end subroutine

public function long get_placeinpage();
//*-----------------------------------------------------------------*/
//*  .NET property : PlaceInPage
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
ll_result = This.placeinpage
Return ll_result
end function

public subroutine  set_placeinpage(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PlaceInPage
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.placeinpage = al_value
end subroutine

public subroutine  set_rotate(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Rotate
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.rotate = al_value
end subroutine

public subroutine  set_mkrotation(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MKRotation
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.mkrotation = al_value
end subroutine

public subroutine  set_mkbordercolor(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MKBorderColor
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.mkbordercolor = anv_value
end subroutine

public subroutine  set_mkbackgroundcolor(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MKBackgroundColor
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.mkbackgroundcolor = anv_value
end subroutine

public subroutine  set_mknormalcaption(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MKNormalCaption
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.mknormalcaption = as_value
end subroutine

public subroutine  set_mkrollovercaption(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MKRolloverCaption
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.mkrollovercaption = as_value
end subroutine

public subroutine  set_mkalternatecaption(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MKAlternateCaption
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.mkalternatecaption = as_value
end subroutine

public subroutine  set_mknormalicon(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MKNormalIcon
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.mknormalicon = anv_value
end subroutine

public subroutine  set_mkrollovericon(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MKRolloverIcon
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.mkrollovericon = anv_value
end subroutine

public subroutine  set_mkalternateicon(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MKAlternateIcon
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.mkalternateicon = anv_value
end subroutine

public subroutine  set_mktextposition(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MKTextPosition
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.mktextposition = al_value
end subroutine

public subroutine  set_layer(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Layer
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.layer = anv_value
end subroutine

public subroutine  set_name(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Name
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.name = as_value
end subroutine

public function dotnetobject get_role();
//*-----------------------------------------------------------------*/
//*  .NET property : Role
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
lnv_result = This.role
Return lnv_result
end function

public subroutine  set_role(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Role
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.role = anv_value
end subroutine

public function dotnetobject get_id();
//*-----------------------------------------------------------------*/
//*  .NET property : ID
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
lnv_result = This.id
Return lnv_result
end function

public subroutine  set_id(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ID
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.id = anv_value
end subroutine

public function boolean get_isinline();
//*-----------------------------------------------------------------*/
//*  .NET property : IsInline
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
lbln_result = This.isinline
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

on nvo_pdfformfield.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfformfield.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

