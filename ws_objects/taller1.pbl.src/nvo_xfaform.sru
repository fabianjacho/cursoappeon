$PBExportHeader$nvo_xfaform.sru
forward
global type nvo_xfaform from dotnetobject
end type
end forward

global type nvo_xfaform from dotnetobject
end type
global nvo_xfaform nvo_xfaform

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.XfaForm"

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
public function dotnetobject of_getxfaobject(dotnetobject anv_reader)
public function dotnetobject of_extractxfanodes(dotnetobject anv_domdocument)
public subroutine  of_setxfa(dotnetobject anv_form,dotnetobject anv_reader,dotnetobject anv_writer)
public subroutine  of_setxfa(dotnetobject anv_writer)
public function blob of_serializedoc(dotnetobject anv_n)
public function string of_findfieldname(string as_name,dotnetobject anv_af)
public function string of_finddatasetsname(string as_name)
public function dotnetobject of_finddatasetsnode(string as_name)
public function string of_getnodetext(dotnetobject anv_n)
public subroutine  of_setnodetext(dotnetobject anv_n,string as_text)
public subroutine  of_fillxfaform(string as_file)
public subroutine  of_fillxfaform(dotnetobject anv_stream)
public subroutine  of_fillxfaform(dotnetobject anv_stream,boolean abln_readonly)
public subroutine  of_fillxfaform1(dotnetobject anv_reader)
public subroutine  of_fillxfaform1(dotnetobject anv_reader,boolean abln_readonly)
public subroutine  of_fillxfaform2(dotnetobject anv_node)
public subroutine  of_fillxfaform2(dotnetobject anv_node,boolean abln_readonly)
public function boolean get_xfapresent()
public subroutine  set_xfapresent(boolean abln_value)
public function dotnetobject get_domdocument()
public subroutine  set_domdocument(dotnetobject anv_value)
public function dotnetobject get_reader()
public subroutine  set_reader(dotnetobject anv_value)
public function boolean get_changed()
public subroutine  set_changed(boolean abln_value)
public function dotnetobject get_templatesom()
public subroutine  set_templatesom(dotnetobject anv_value)
public function dotnetobject get_datasetssom()
public subroutine  set_datasetssom(dotnetobject anv_value)
public function dotnetobject get_acrofieldssom()
public subroutine  set_acrofieldssom(dotnetobject anv_value)
public function dotnetobject get_datasetsnode()
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

public function dotnetobject of_getxfaobject(dotnetobject anv_reader);
//*-----------------------------------------------------------------*/
//*  .NET function : GetXfaObject
//*   Argument:
//*              Dotnetobject anv_reader
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
lnv_result = This.getxfaobject(anv_reader)
Return lnv_result
end function

public function dotnetobject of_extractxfanodes(dotnetobject anv_domdocument);
//*-----------------------------------------------------------------*/
//*  .NET function : ExtractXFANodes
//*   Argument:
//*              Dotnetobject anv_domdocument
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
lnv_result = This.extractxfanodes(anv_domdocument)
Return lnv_result
end function

public subroutine  of_setxfa(dotnetobject anv_form,dotnetobject anv_reader,dotnetobject anv_writer);
//*-----------------------------------------------------------------*/
//*  .NET function : SetXfa
//*   Argument:
//*              Dotnetobject anv_form
//*              Dotnetobject anv_reader
//*              Dotnetobject anv_writer
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setxfa(anv_form,anv_reader,anv_writer)
end subroutine

public subroutine  of_setxfa(dotnetobject anv_writer);
//*-----------------------------------------------------------------*/
//*  .NET function : SetXfa
//*   Argument:
//*              Dotnetobject anv_writer
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setxfa(anv_writer)
end subroutine

public function blob of_serializedoc(dotnetobject anv_n);
//*-----------------------------------------------------------------*/
//*  .NET function : SerializeDoc
//*   Argument:
//*              Dotnetobject anv_n
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
lbyt_result = This.serializedoc(anv_n)
Return lbyt_result
end function

public function string of_findfieldname(string as_name,dotnetobject anv_af);
//*-----------------------------------------------------------------*/
//*  .NET function : FindFieldName
//*   Argument:
//*              String as_name
//*              Dotnetobject anv_af
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
ls_result = This.findfieldname(as_name,anv_af)
Return ls_result
end function

public function string of_finddatasetsname(string as_name);
//*-----------------------------------------------------------------*/
//*  .NET function : FindDatasetsName
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
ls_result = This.finddatasetsname(as_name)
Return ls_result
end function

public function dotnetobject of_finddatasetsnode(string as_name);
//*-----------------------------------------------------------------*/
//*  .NET function : FindDatasetsNode
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
lnv_result = This.finddatasetsnode(as_name)
Return lnv_result
end function

public function string of_getnodetext(dotnetobject anv_n);
//*-----------------------------------------------------------------*/
//*  .NET function : GetNodeText
//*   Argument:
//*              Dotnetobject anv_n
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
ls_result = This.getnodetext(anv_n)
Return ls_result
end function

public subroutine  of_setnodetext(dotnetobject anv_n,string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : SetNodeText
//*   Argument:
//*              Dotnetobject anv_n
//*              String as_text
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setnodetext(anv_n,as_text)
end subroutine

public subroutine  of_fillxfaform(string as_file);
//*-----------------------------------------------------------------*/
//*  .NET function : FillXfaForm
//*   Argument:
//*              String as_file
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.fillxfaform(as_file)
end subroutine

public subroutine  of_fillxfaform(dotnetobject anv_stream);
//*-----------------------------------------------------------------*/
//*  .NET function : FillXfaForm
//*   Argument:
//*              Dotnetobject anv_stream
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.fillxfaform(anv_stream)
end subroutine

public subroutine  of_fillxfaform(dotnetobject anv_stream,boolean abln_readonly);
//*-----------------------------------------------------------------*/
//*  .NET function : FillXfaForm
//*   Argument:
//*              Dotnetobject anv_stream
//*              Boolean abln_readonly
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.fillxfaform(anv_stream,abln_readonly)
end subroutine

public subroutine  of_fillxfaform1(dotnetobject anv_reader);
//*-----------------------------------------------------------------*/
//*  .NET function : FillXfaForm
//*   Argument:
//*              Dotnetobject anv_reader
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.fillxfaform(anv_reader)
end subroutine

public subroutine  of_fillxfaform1(dotnetobject anv_reader,boolean abln_readonly);
//*-----------------------------------------------------------------*/
//*  .NET function : FillXfaForm
//*   Argument:
//*              Dotnetobject anv_reader
//*              Boolean abln_readonly
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.fillxfaform(anv_reader,abln_readonly)
end subroutine

public subroutine  of_fillxfaform2(dotnetobject anv_node);
//*-----------------------------------------------------------------*/
//*  .NET function : FillXfaForm
//*   Argument:
//*              Dotnetobject anv_node
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.fillxfaform(anv_node)
end subroutine

public subroutine  of_fillxfaform2(dotnetobject anv_node,boolean abln_readonly);
//*-----------------------------------------------------------------*/
//*  .NET function : FillXfaForm
//*   Argument:
//*              Dotnetobject anv_node
//*              Boolean abln_readonly
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.fillxfaform(anv_node,abln_readonly)
end subroutine

public function boolean get_xfapresent();
//*-----------------------------------------------------------------*/
//*  .NET property : XfaPresent
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
lbln_result = This.xfapresent
Return lbln_result
end function

public subroutine  set_xfapresent(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : XfaPresent
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.xfapresent = abln_value
end subroutine

public function dotnetobject get_domdocument();
//*-----------------------------------------------------------------*/
//*  .NET property : DomDocument
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
lnv_result = This.domdocument
Return lnv_result
end function

public subroutine  set_domdocument(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : DomDocument
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.domdocument = anv_value
end subroutine

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

public subroutine  set_reader(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Reader
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.reader = anv_value
end subroutine

public function boolean get_changed();
//*-----------------------------------------------------------------*/
//*  .NET property : Changed
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
lbln_result = This.changed
Return lbln_result
end function

public subroutine  set_changed(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Changed
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.changed = abln_value
end subroutine

public function dotnetobject get_templatesom();
//*-----------------------------------------------------------------*/
//*  .NET property : TemplateSom
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
lnv_result = This.templatesom
Return lnv_result
end function

public subroutine  set_templatesom(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : TemplateSom
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.templatesom = anv_value
end subroutine

public function dotnetobject get_datasetssom();
//*-----------------------------------------------------------------*/
//*  .NET property : DatasetsSom
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
lnv_result = This.datasetssom
Return lnv_result
end function

public subroutine  set_datasetssom(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : DatasetsSom
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.datasetssom = anv_value
end subroutine

public function dotnetobject get_acrofieldssom();
//*-----------------------------------------------------------------*/
//*  .NET property : AcroFieldsSom
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
lnv_result = This.acrofieldssom
Return lnv_result
end function

public subroutine  set_acrofieldssom(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : AcroFieldsSom
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.acrofieldssom = anv_value
end subroutine

public function dotnetobject get_datasetsnode();
//*-----------------------------------------------------------------*/
//*  .NET property : DatasetsNode
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
lnv_result = This.datasetsnode
Return lnv_result
end function

on nvo_xfaform.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_xfaform.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

