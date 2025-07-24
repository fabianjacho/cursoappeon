$PBExportHeader$nvo_pdfacroform.sru
forward
global type nvo_pdfacroform from dotnetobject
end type
end forward

global type nvo_pdfacroform from dotnetobject
end type
global nvo_pdfacroform nvo_pdfacroform

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PdfAcroForm"

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
public subroutine  of_addfieldtemplates(dotnetobject anv_ft)
public subroutine  of_adddocumentfield(dotnetobject anv_piref)
public function boolean of_isvalid()
public subroutine  of_addcalculationorder(dotnetobject anv_formfield)
public subroutine  of_addformfield(dotnetobject anv_formfield)
public function dotnetobject of_addhtmlpostbutton(string as_name,string as_caption,string as_value,string as_url,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public function dotnetobject of_addresetbutton(string as_name,string as_caption,string as_value,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public function dotnetobject of_addmap(string as_name,string as_value,string as_url,dotnetobject anv_appearance,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_setbuttonparams(dotnetobject anv_button,long al_characteristics,string as_name,string as_value)
public subroutine  of_drawbutton(dotnetobject anv_button,string as_caption,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public function dotnetobject of_addhiddenfield(string as_name,string as_value)
public function dotnetobject of_addsinglelinetextfield(string as_name,string as_text,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public function dotnetobject of_addmultilinetextfield(string as_name,string as_text,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public function dotnetobject of_addsinglelinepasswordfield(string as_name,string as_text,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_settextfieldparams(dotnetobject anv_field,string as_text,string as_name,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_drawsinglelineoftext(dotnetobject anv_field,string as_text,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_drawmultilineoftext(dotnetobject anv_field,string as_text,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public function dotnetobject of_addcheckbox(string as_name,string as_value,boolean abln_status,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_setcheckboxparams(dotnetobject anv_field,string as_name,string as_value,boolean abln_status,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_drawcheckboxappearences(dotnetobject anv_field,string as_value,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public function dotnetobject of_getradiogroup(string as_name,string as_defaultvalue,boolean abln_notoggletooff)
public subroutine  of_addradiogroup(dotnetobject anv_radiogroup)
public function dotnetobject of_addradiobutton(dotnetobject anv_radiogroup,string as_value,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_drawradioappearences(dotnetobject anv_field,string as_value,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public function dotnetobject of_addselectlist(string as_name,string as_options[],string as_defaultvalue,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public function dotnetobject of_addselectlist(string as_name,any as_options,string as_defaultvalue,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public function dotnetobject of_addcombobox(string as_name,string as_options[],string as_defaultvalue,boolean abln_editable,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public function dotnetobject of_addcombobox(string as_name,any as_options,string as_defaultvalue,boolean abln_editable,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_setchoiceparams(dotnetobject anv_field,string as_name,string as_defaultvalue,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public function dotnetobject of_addsignature(string as_name,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_setsignatureparams(dotnetobject anv_field,string as_name,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_drawsignatureappearences(dotnetobject anv_field,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
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
public subroutine  set_needappearances(boolean abln_value)
public subroutine  set_sigflags(long al_value)
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

public subroutine  of_addfieldtemplates(dotnetobject anv_ft);
//*-----------------------------------------------------------------*/
//*  .NET function : AddFieldTemplates
//*   Argument:
//*              Dotnetobject anv_ft
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addfieldtemplates(anv_ft)
end subroutine

public subroutine  of_adddocumentfield(dotnetobject anv_piref);
//*-----------------------------------------------------------------*/
//*  .NET function : AddDocumentField
//*   Argument:
//*              Dotnetobject anv_piref
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.adddocumentfield(anv_piref)
end subroutine

public function boolean of_isvalid();
//*-----------------------------------------------------------------*/
//*  .NET function : IsValid
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
lbln_result = This.isvalid()
Return lbln_result
end function

public subroutine  of_addcalculationorder(dotnetobject anv_formfield);
//*-----------------------------------------------------------------*/
//*  .NET function : AddCalculationOrder
//*   Argument:
//*              Dotnetobject anv_formfield
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addcalculationorder(anv_formfield)
end subroutine

public subroutine  of_addformfield(dotnetobject anv_formfield);
//*-----------------------------------------------------------------*/
//*  .NET function : AddFormField
//*   Argument:
//*              Dotnetobject anv_formfield
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addformfield(anv_formfield)
end subroutine

public function dotnetobject of_addhtmlpostbutton(string as_name,string as_caption,string as_value,string as_url,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : AddHtmlPostButton
//*   Argument:
//*              String as_name
//*              String as_caption
//*              String as_value
//*              String as_url
//*              Dotnetobject anv_font
//*              Real ar_fontsize
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
lnv_result = This.addhtmlpostbutton(as_name,as_caption,as_value,as_url,anv_font,ar_fontsize,ar_llx,ar_lly,ar_urx,ar_ury)
Return lnv_result
end function

public function dotnetobject of_addresetbutton(string as_name,string as_caption,string as_value,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : AddResetButton
//*   Argument:
//*              String as_name
//*              String as_caption
//*              String as_value
//*              Dotnetobject anv_font
//*              Real ar_fontsize
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
lnv_result = This.addresetbutton(as_name,as_caption,as_value,anv_font,ar_fontsize,ar_llx,ar_lly,ar_urx,ar_ury)
Return lnv_result
end function

public function dotnetobject of_addmap(string as_name,string as_value,string as_url,dotnetobject anv_appearance,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : AddMap
//*   Argument:
//*              String as_name
//*              String as_value
//*              String as_url
//*              Dotnetobject anv_appearance
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
lnv_result = This.addmap(as_name,as_value,as_url,anv_appearance,ar_llx,ar_lly,ar_urx,ar_ury)
Return lnv_result
end function

public subroutine  of_setbuttonparams(dotnetobject anv_button,long al_characteristics,string as_name,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetButtonParams
//*   Argument:
//*              Dotnetobject anv_button
//*              Long al_characteristics
//*              String as_name
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setbuttonparams(anv_button,al_characteristics,as_name,as_value)
end subroutine

public subroutine  of_drawbutton(dotnetobject anv_button,string as_caption,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : DrawButton
//*   Argument:
//*              Dotnetobject anv_button
//*              String as_caption
//*              Dotnetobject anv_font
//*              Real ar_fontsize
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.drawbutton(anv_button,as_caption,anv_font,ar_fontsize,ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public function dotnetobject of_addhiddenfield(string as_name,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : AddHiddenField
//*   Argument:
//*              String as_name
//*              String as_value
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
lnv_result = This.addhiddenfield(as_name,as_value)
Return lnv_result
end function

public function dotnetobject of_addsinglelinetextfield(string as_name,string as_text,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSingleLineTextField
//*   Argument:
//*              String as_name
//*              String as_text
//*              Dotnetobject anv_font
//*              Real ar_fontsize
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
lnv_result = This.addsinglelinetextfield(as_name,as_text,anv_font,ar_fontsize,ar_llx,ar_lly,ar_urx,ar_ury)
Return lnv_result
end function

public function dotnetobject of_addmultilinetextfield(string as_name,string as_text,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : AddMultiLineTextField
//*   Argument:
//*              String as_name
//*              String as_text
//*              Dotnetobject anv_font
//*              Real ar_fontsize
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
lnv_result = This.addmultilinetextfield(as_name,as_text,anv_font,ar_fontsize,ar_llx,ar_lly,ar_urx,ar_ury)
Return lnv_result
end function

public function dotnetobject of_addsinglelinepasswordfield(string as_name,string as_text,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSingleLinePasswordField
//*   Argument:
//*              String as_name
//*              String as_text
//*              Dotnetobject anv_font
//*              Real ar_fontsize
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
lnv_result = This.addsinglelinepasswordfield(as_name,as_text,anv_font,ar_fontsize,ar_llx,ar_lly,ar_urx,ar_ury)
Return lnv_result
end function

public subroutine  of_settextfieldparams(dotnetobject anv_field,string as_text,string as_name,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTextFieldParams
//*   Argument:
//*              Dotnetobject anv_field
//*              String as_text
//*              String as_name
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settextfieldparams(anv_field,as_text,as_name,ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public subroutine  of_drawsinglelineoftext(dotnetobject anv_field,string as_text,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : DrawSingleLineOfText
//*   Argument:
//*              Dotnetobject anv_field
//*              String as_text
//*              Dotnetobject anv_font
//*              Real ar_fontsize
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.drawsinglelineoftext(anv_field,as_text,anv_font,ar_fontsize,ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public subroutine  of_drawmultilineoftext(dotnetobject anv_field,string as_text,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : DrawMultiLineOfText
//*   Argument:
//*              Dotnetobject anv_field
//*              String as_text
//*              Dotnetobject anv_font
//*              Real ar_fontsize
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.drawmultilineoftext(anv_field,as_text,anv_font,ar_fontsize,ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public function dotnetobject of_addcheckbox(string as_name,string as_value,boolean abln_status,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : AddCheckBox
//*   Argument:
//*              String as_name
//*              String as_value
//*              Boolean abln_status
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
lnv_result = This.addcheckbox(as_name,as_value,abln_status,ar_llx,ar_lly,ar_urx,ar_ury)
Return lnv_result
end function

public subroutine  of_setcheckboxparams(dotnetobject anv_field,string as_name,string as_value,boolean abln_status,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : SetCheckBoxParams
//*   Argument:
//*              Dotnetobject anv_field
//*              String as_name
//*              String as_value
//*              Boolean abln_status
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcheckboxparams(anv_field,as_name,as_value,abln_status,ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public subroutine  of_drawcheckboxappearences(dotnetobject anv_field,string as_value,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : DrawCheckBoxAppearences
//*   Argument:
//*              Dotnetobject anv_field
//*              String as_value
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.drawcheckboxappearences(anv_field,as_value,ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public function dotnetobject of_getradiogroup(string as_name,string as_defaultvalue,boolean abln_notoggletooff);
//*-----------------------------------------------------------------*/
//*  .NET function : GetRadioGroup
//*   Argument:
//*              String as_name
//*              String as_defaultvalue
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
lnv_result = This.getradiogroup(as_name,as_defaultvalue,abln_notoggletooff)
Return lnv_result
end function

public subroutine  of_addradiogroup(dotnetobject anv_radiogroup);
//*-----------------------------------------------------------------*/
//*  .NET function : AddRadioGroup
//*   Argument:
//*              Dotnetobject anv_radiogroup
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addradiogroup(anv_radiogroup)
end subroutine

public function dotnetobject of_addradiobutton(dotnetobject anv_radiogroup,string as_value,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : AddRadioButton
//*   Argument:
//*              Dotnetobject anv_radiogroup
//*              String as_value
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
lnv_result = This.addradiobutton(anv_radiogroup,as_value,ar_llx,ar_lly,ar_urx,ar_ury)
Return lnv_result
end function

public subroutine  of_drawradioappearences(dotnetobject anv_field,string as_value,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : DrawRadioAppearences
//*   Argument:
//*              Dotnetobject anv_field
//*              String as_value
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.drawradioappearences(anv_field,as_value,ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public function dotnetobject of_addselectlist(string as_name,string as_options[],string as_defaultvalue,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSelectList
//*   Argument:
//*              String as_name
//*              String as_options[]
//*              String as_defaultvalue
//*              Dotnetobject anv_font
//*              Real ar_fontsize
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
lnv_result = This.addselectlist(as_name,as_options,as_defaultvalue,anv_font,ar_fontsize,ar_llx,ar_lly,ar_urx,ar_ury)
Return lnv_result
end function

public function dotnetobject of_addselectlist(string as_name,any as_options,string as_defaultvalue,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSelectList
//*   Argument:
//*              String as_name
//*              String as_options[,]
//*              String as_defaultvalue
//*              Dotnetobject anv_font
//*              Real ar_fontsize
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
lnv_result = This.addselectlist(as_name,as_options,as_defaultvalue,anv_font,ar_fontsize,ar_llx,ar_lly,ar_urx,ar_ury)
Return lnv_result
end function

public function dotnetobject of_addcombobox(string as_name,string as_options[],string as_defaultvalue,boolean abln_editable,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : AddComboBox
//*   Argument:
//*              String as_name
//*              String as_options[]
//*              String as_defaultvalue
//*              Boolean abln_editable
//*              Dotnetobject anv_font
//*              Real ar_fontsize
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
lnv_result = This.addcombobox(as_name,as_options,as_defaultvalue,abln_editable,anv_font,ar_fontsize,ar_llx,ar_lly,ar_urx,ar_ury)
Return lnv_result
end function

public function dotnetobject of_addcombobox(string as_name,any as_options,string as_defaultvalue,boolean abln_editable,dotnetobject anv_font,real ar_fontsize,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : AddComboBox
//*   Argument:
//*              String as_name
//*              String as_options[,]
//*              String as_defaultvalue
//*              Boolean abln_editable
//*              Dotnetobject anv_font
//*              Real ar_fontsize
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
lnv_result = This.addcombobox(as_name,as_options,as_defaultvalue,abln_editable,anv_font,ar_fontsize,ar_llx,ar_lly,ar_urx,ar_ury)
Return lnv_result
end function

public subroutine  of_setchoiceparams(dotnetobject anv_field,string as_name,string as_defaultvalue,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : SetChoiceParams
//*   Argument:
//*              Dotnetobject anv_field
//*              String as_name
//*              String as_defaultvalue
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setchoiceparams(anv_field,as_name,as_defaultvalue,ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public function dotnetobject of_addsignature(string as_name,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSignature
//*   Argument:
//*              String as_name
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
lnv_result = This.addsignature(as_name,ar_llx,ar_lly,ar_urx,ar_ury)
Return lnv_result
end function

public subroutine  of_setsignatureparams(dotnetobject anv_field,string as_name,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : SetSignatureParams
//*   Argument:
//*              Dotnetobject anv_field
//*              String as_name
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setsignatureparams(anv_field,as_name,ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public subroutine  of_drawsignatureappearences(dotnetobject anv_field,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : DrawSignatureAppearences
//*   Argument:
//*              Dotnetobject anv_field
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.drawsignatureappearences(anv_field,ar_llx,ar_lly,ar_urx,ar_ury)
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

public subroutine  set_needappearances(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : NeedAppearances
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.needappearances = abln_value
end subroutine

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

on nvo_pdfacroform.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfacroform.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

