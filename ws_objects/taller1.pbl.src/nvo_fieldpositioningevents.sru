$PBExportHeader$nvo_fieldpositioningevents.sru
forward
global type nvo_fieldpositioningevents from dotnetobject
end type
end forward

global type nvo_fieldpositioningevents from dotnetobject
end type
global nvo_fieldpositioningevents nvo_fieldpositioningevents

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.events.FieldPositioningEvents"

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
public subroutine  of_addfield(string as_text,dotnetobject anv_field)
public subroutine  of_ongenerictag(dotnetobject anv_writer,dotnetobject anv_document,dotnetobject anv_rect,string as_text)
public subroutine  of_onopendocument(dotnetobject anv_writer,dotnetobject anv_document)
public subroutine  of_onstartpage(dotnetobject anv_writer,dotnetobject anv_document)
public subroutine  of_onendpage(dotnetobject anv_writer,dotnetobject anv_document)
public subroutine  of_onclosedocument(dotnetobject anv_writer,dotnetobject anv_document)
public subroutine  of_onparagraph(dotnetobject anv_writer,dotnetobject anv_document,real ar_paragraphposition)
public subroutine  of_onparagraphend(dotnetobject anv_writer,dotnetobject anv_document,real ar_paragraphposition)
public subroutine  of_onchapter(dotnetobject anv_writer,dotnetobject anv_document,real ar_paragraphposition,dotnetobject anv_title)
public subroutine  of_onchapterend(dotnetobject anv_writer,dotnetobject anv_document,real ar_position)
public subroutine  of_onsection(dotnetobject anv_writer,dotnetobject anv_document,real ar_paragraphposition,long al_depth,dotnetobject anv_title)
public subroutine  of_onsectionend(dotnetobject anv_writer,dotnetobject anv_document,real ar_position)
public function real get_padding()
public subroutine  set_padding(real ar_value)
public function dotnetobject get_parent()
public subroutine  set_parent(dotnetobject anv_value)
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

public subroutine  of_addfield(string as_text,dotnetobject anv_field);
//*-----------------------------------------------------------------*/
//*  .NET function : AddField
//*   Argument:
//*              String as_text
//*              Dotnetobject anv_field
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addfield(as_text,anv_field)
end subroutine

public subroutine  of_ongenerictag(dotnetobject anv_writer,dotnetobject anv_document,dotnetobject anv_rect,string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : OnGenericTag
//*   Argument:
//*              Dotnetobject anv_writer
//*              Dotnetobject anv_document
//*              Dotnetobject anv_rect
//*              String as_text
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.ongenerictag(anv_writer,anv_document,anv_rect,as_text)
end subroutine

public subroutine  of_onopendocument(dotnetobject anv_writer,dotnetobject anv_document);
//*-----------------------------------------------------------------*/
//*  .NET function : OnOpenDocument
//*   Argument:
//*              Dotnetobject anv_writer
//*              Dotnetobject anv_document
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.onopendocument(anv_writer,anv_document)
end subroutine

public subroutine  of_onstartpage(dotnetobject anv_writer,dotnetobject anv_document);
//*-----------------------------------------------------------------*/
//*  .NET function : OnStartPage
//*   Argument:
//*              Dotnetobject anv_writer
//*              Dotnetobject anv_document
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.onstartpage(anv_writer,anv_document)
end subroutine

public subroutine  of_onendpage(dotnetobject anv_writer,dotnetobject anv_document);
//*-----------------------------------------------------------------*/
//*  .NET function : OnEndPage
//*   Argument:
//*              Dotnetobject anv_writer
//*              Dotnetobject anv_document
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.onendpage(anv_writer,anv_document)
end subroutine

public subroutine  of_onclosedocument(dotnetobject anv_writer,dotnetobject anv_document);
//*-----------------------------------------------------------------*/
//*  .NET function : OnCloseDocument
//*   Argument:
//*              Dotnetobject anv_writer
//*              Dotnetobject anv_document
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.onclosedocument(anv_writer,anv_document)
end subroutine

public subroutine  of_onparagraph(dotnetobject anv_writer,dotnetobject anv_document,real ar_paragraphposition);
//*-----------------------------------------------------------------*/
//*  .NET function : OnParagraph
//*   Argument:
//*              Dotnetobject anv_writer
//*              Dotnetobject anv_document
//*              Real ar_paragraphposition
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.onparagraph(anv_writer,anv_document,ar_paragraphposition)
end subroutine

public subroutine  of_onparagraphend(dotnetobject anv_writer,dotnetobject anv_document,real ar_paragraphposition);
//*-----------------------------------------------------------------*/
//*  .NET function : OnParagraphEnd
//*   Argument:
//*              Dotnetobject anv_writer
//*              Dotnetobject anv_document
//*              Real ar_paragraphposition
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.onparagraphend(anv_writer,anv_document,ar_paragraphposition)
end subroutine

public subroutine  of_onchapter(dotnetobject anv_writer,dotnetobject anv_document,real ar_paragraphposition,dotnetobject anv_title);
//*-----------------------------------------------------------------*/
//*  .NET function : OnChapter
//*   Argument:
//*              Dotnetobject anv_writer
//*              Dotnetobject anv_document
//*              Real ar_paragraphposition
//*              Dotnetobject anv_title
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.onchapter(anv_writer,anv_document,ar_paragraphposition,anv_title)
end subroutine

public subroutine  of_onchapterend(dotnetobject anv_writer,dotnetobject anv_document,real ar_position);
//*-----------------------------------------------------------------*/
//*  .NET function : OnChapterEnd
//*   Argument:
//*              Dotnetobject anv_writer
//*              Dotnetobject anv_document
//*              Real ar_position
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.onchapterend(anv_writer,anv_document,ar_position)
end subroutine

public subroutine  of_onsection(dotnetobject anv_writer,dotnetobject anv_document,real ar_paragraphposition,long al_depth,dotnetobject anv_title);
//*-----------------------------------------------------------------*/
//*  .NET function : OnSection
//*   Argument:
//*              Dotnetobject anv_writer
//*              Dotnetobject anv_document
//*              Real ar_paragraphposition
//*              Long al_depth
//*              Dotnetobject anv_title
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.onsection(anv_writer,anv_document,ar_paragraphposition,al_depth,anv_title)
end subroutine

public subroutine  of_onsectionend(dotnetobject anv_writer,dotnetobject anv_document,real ar_position);
//*-----------------------------------------------------------------*/
//*  .NET function : OnSectionEnd
//*   Argument:
//*              Dotnetobject anv_writer
//*              Dotnetobject anv_document
//*              Real ar_position
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.onsectionend(anv_writer,anv_document,ar_position)
end subroutine

public function real get_padding();
//*-----------------------------------------------------------------*/
//*  .NET property : Padding
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
lr_result = This.padding
Return lr_result
end function

public subroutine  set_padding(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Padding
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.padding = ar_value
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

public subroutine  set_parent(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Parent
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.parent = anv_value
end subroutine

on nvo_fieldpositioningevents.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_fieldpositioningevents.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

