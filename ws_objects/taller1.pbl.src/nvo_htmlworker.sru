$PBExportHeader$nvo_htmlworker.sru
forward
global type nvo_htmlworker from dotnetobject
end type
end forward

global type nvo_htmlworker from dotnetobject
end type
global nvo_htmlworker nvo_htmlworker

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.html.simpleparser.HTMLWorker"

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
public subroutine  of_setsupportedtags(dotnetobject anv_tags)
public subroutine  of_setstylesheet(dotnetobject anv_style)
public subroutine  of_parse(dotnetobject anv_reader)
public subroutine  of_startdocument()
public subroutine  of_startelement(string as_tag,dotnetobject anv_attrs)
public subroutine  of_text(string as_content)
public subroutine  of_endelement(string as_tag)
public subroutine  of_enddocument()
public subroutine  of_newline()
public subroutine  of_carriagereturn()
public subroutine  of_flushcontent()
public subroutine  of_pushtostack(dotnetobject anv_element)
public subroutine  of_updatechain(string as_tag,dotnetobject anv_attrs)
public subroutine  of_updatechain(string as_tag)
public subroutine  of_setproviders(dotnetobject anv_providers)
public function dotnetobject of_createchunk(string as_content)
public function dotnetobject of_createparagraph()
public function dotnetobject of_createlist(string as_tag)
public function dotnetobject of_createlistitem()
public function dotnetobject of_createlineseparator(dotnetobject anv_attrs)
public function dotnetobject of_createimage(dotnetobject anv_attrs)
public function dotnetobject of_createcell(string as_tag)
public subroutine  of_processlink()
public subroutine  of_processlist()
public subroutine  of_processlistitem()
public subroutine  of_processimage(dotnetobject anv_img,dotnetobject anv_attrs)
public subroutine  of_processtable()
public subroutine  of_processrow()
public subroutine  of_pushtablestate()
public subroutine  of_poptablestate()
public function boolean of_ispendingtr()
public subroutine  of_setpendingtr(boolean abln_pendingtr)
public function boolean of_ispendingtd()
public subroutine  of_setpendingtd(boolean abln_pendingtd)
public function boolean of_ispendingli()
public subroutine  of_setpendingli(boolean abln_pendingli)
public function boolean of_isinsidepre()
public subroutine  of_setinsidepre(boolean abln_insidepre)
public function boolean of_isskiptext()
public subroutine  of_setskiptext(boolean abln_skiptext)
public function dotnetobject of_parsetolist(dotnetobject anv_reader,dotnetobject anv_style)
public function dotnetobject of_parsetolist(dotnetobject anv_reader,dotnetobject anv_style,dotnetobject anv_providers)
public function dotnetobject of_parsetolist(dotnetobject anv_reader,dotnetobject anv_style,dotnetobject anv_tags,dotnetobject anv_providers)
public function boolean of_add(dotnetobject anv_element)
public subroutine  of_close()
public function boolean of_newpage()
public subroutine  of_open()
public subroutine  of_resetpagecount()
public function boolean of_setmarginmirroring(boolean abln_marginmirroring)
public function boolean of_setmarginmirroringtopbottom(boolean abln_marginmirroring)
public function boolean of_setmargins(real ar_marginleft,real ar_marginright,real ar_margintop,real ar_marginbottom)
public function boolean of_setpagesize(dotnetobject anv_pagesize)
public subroutine  of_setinterfaceprops(dotnetobject anv_providers)
public function dotnetobject of_getinterfaceprops()
public subroutine  of_dispose()
public subroutine  set_pagecount(long al_value)
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

public subroutine  of_setsupportedtags(dotnetobject anv_tags);
//*-----------------------------------------------------------------*/
//*  .NET function : SetSupportedTags
//*   Argument:
//*              Dotnetobject anv_tags
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setsupportedtags(anv_tags)
end subroutine

public subroutine  of_setstylesheet(dotnetobject anv_style);
//*-----------------------------------------------------------------*/
//*  .NET function : SetStyleSheet
//*   Argument:
//*              Dotnetobject anv_style
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setstylesheet(anv_style)
end subroutine

public subroutine  of_parse(dotnetobject anv_reader);
//*-----------------------------------------------------------------*/
//*  .NET function : Parse
//*   Argument:
//*              Dotnetobject anv_reader
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.parse(anv_reader)
end subroutine

public subroutine  of_startdocument();
//*-----------------------------------------------------------------*/
//*  .NET function : StartDocument
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.startdocument()
end subroutine

public subroutine  of_startelement(string as_tag,dotnetobject anv_attrs);
//*-----------------------------------------------------------------*/
//*  .NET function : StartElement
//*   Argument:
//*              String as_tag
//*              Dotnetobject anv_attrs
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.startelement(as_tag,anv_attrs)
end subroutine

public subroutine  of_text(string as_content);
//*-----------------------------------------------------------------*/
//*  .NET function : Text
//*   Argument:
//*              String as_content
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.text(as_content)
end subroutine

public subroutine  of_endelement(string as_tag);
//*-----------------------------------------------------------------*/
//*  .NET function : EndElement
//*   Argument:
//*              String as_tag
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.endelement(as_tag)
end subroutine

public subroutine  of_enddocument();
//*-----------------------------------------------------------------*/
//*  .NET function : EndDocument
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.enddocument()
end subroutine

public subroutine  of_newline();
//*-----------------------------------------------------------------*/
//*  .NET function : NewLine
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.newline()
end subroutine

public subroutine  of_carriagereturn();
//*-----------------------------------------------------------------*/
//*  .NET function : CarriageReturn
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.carriagereturn()
end subroutine

public subroutine  of_flushcontent();
//*-----------------------------------------------------------------*/
//*  .NET function : FlushContent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.flushcontent()
end subroutine

public subroutine  of_pushtostack(dotnetobject anv_element);
//*-----------------------------------------------------------------*/
//*  .NET function : PushToStack
//*   Argument:
//*              Dotnetobject anv_element
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.pushtostack(anv_element)
end subroutine

public subroutine  of_updatechain(string as_tag,dotnetobject anv_attrs);
//*-----------------------------------------------------------------*/
//*  .NET function : UpdateChain
//*   Argument:
//*              String as_tag
//*              Dotnetobject anv_attrs
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.updatechain(as_tag,anv_attrs)
end subroutine

public subroutine  of_updatechain(string as_tag);
//*-----------------------------------------------------------------*/
//*  .NET function : UpdateChain
//*   Argument:
//*              String as_tag
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.updatechain(as_tag)
end subroutine

public subroutine  of_setproviders(dotnetobject anv_providers);
//*-----------------------------------------------------------------*/
//*  .NET function : SetProviders
//*   Argument:
//*              Dotnetobject anv_providers
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setproviders(anv_providers)
end subroutine

public function dotnetobject of_createchunk(string as_content);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateChunk
//*   Argument:
//*              String as_content
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
lnv_result = This.createchunk(as_content)
Return lnv_result
end function

public function dotnetobject of_createparagraph();
//*-----------------------------------------------------------------*/
//*  .NET function : CreateParagraph
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
lnv_result = This.createparagraph()
Return lnv_result
end function

public function dotnetobject of_createlist(string as_tag);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateList
//*   Argument:
//*              String as_tag
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
lnv_result = This.createlist(as_tag)
Return lnv_result
end function

public function dotnetobject of_createlistitem();
//*-----------------------------------------------------------------*/
//*  .NET function : CreateListItem
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
lnv_result = This.createlistitem()
Return lnv_result
end function

public function dotnetobject of_createlineseparator(dotnetobject anv_attrs);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateLineSeparator
//*   Argument:
//*              Dotnetobject anv_attrs
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
lnv_result = This.createlineseparator(anv_attrs)
Return lnv_result
end function

public function dotnetobject of_createimage(dotnetobject anv_attrs);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateImage
//*   Argument:
//*              Dotnetobject anv_attrs
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
lnv_result = This.createimage(anv_attrs)
Return lnv_result
end function

public function dotnetobject of_createcell(string as_tag);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateCell
//*   Argument:
//*              String as_tag
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
lnv_result = This.createcell(as_tag)
Return lnv_result
end function

public subroutine  of_processlink();
//*-----------------------------------------------------------------*/
//*  .NET function : ProcessLink
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.processlink()
end subroutine

public subroutine  of_processlist();
//*-----------------------------------------------------------------*/
//*  .NET function : ProcessList
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.processlist()
end subroutine

public subroutine  of_processlistitem();
//*-----------------------------------------------------------------*/
//*  .NET function : ProcessListItem
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.processlistitem()
end subroutine

public subroutine  of_processimage(dotnetobject anv_img,dotnetobject anv_attrs);
//*-----------------------------------------------------------------*/
//*  .NET function : ProcessImage
//*   Argument:
//*              Dotnetobject anv_img
//*              Dotnetobject anv_attrs
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.processimage(anv_img,anv_attrs)
end subroutine

public subroutine  of_processtable();
//*-----------------------------------------------------------------*/
//*  .NET function : ProcessTable
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.processtable()
end subroutine

public subroutine  of_processrow();
//*-----------------------------------------------------------------*/
//*  .NET function : ProcessRow
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.processrow()
end subroutine

public subroutine  of_pushtablestate();
//*-----------------------------------------------------------------*/
//*  .NET function : PushTableState
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.pushtablestate()
end subroutine

public subroutine  of_poptablestate();
//*-----------------------------------------------------------------*/
//*  .NET function : PopTableState
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.poptablestate()
end subroutine

public function boolean of_ispendingtr();
//*-----------------------------------------------------------------*/
//*  .NET function : IsPendingTR
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
lbln_result = This.ispendingtr()
Return lbln_result
end function

public subroutine  of_setpendingtr(boolean abln_pendingtr);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPendingTR
//*   Argument:
//*              Boolean abln_pendingtr
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpendingtr(abln_pendingtr)
end subroutine

public function boolean of_ispendingtd();
//*-----------------------------------------------------------------*/
//*  .NET function : IsPendingTD
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
lbln_result = This.ispendingtd()
Return lbln_result
end function

public subroutine  of_setpendingtd(boolean abln_pendingtd);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPendingTD
//*   Argument:
//*              Boolean abln_pendingtd
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpendingtd(abln_pendingtd)
end subroutine

public function boolean of_ispendingli();
//*-----------------------------------------------------------------*/
//*  .NET function : IsPendingLI
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
lbln_result = This.ispendingli()
Return lbln_result
end function

public subroutine  of_setpendingli(boolean abln_pendingli);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPendingLI
//*   Argument:
//*              Boolean abln_pendingli
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpendingli(abln_pendingli)
end subroutine

public function boolean of_isinsidepre();
//*-----------------------------------------------------------------*/
//*  .NET function : IsInsidePRE
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
lbln_result = This.isinsidepre()
Return lbln_result
end function

public subroutine  of_setinsidepre(boolean abln_insidepre);
//*-----------------------------------------------------------------*/
//*  .NET function : SetInsidePRE
//*   Argument:
//*              Boolean abln_insidepre
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setinsidepre(abln_insidepre)
end subroutine

public function boolean of_isskiptext();
//*-----------------------------------------------------------------*/
//*  .NET function : IsSkipText
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
lbln_result = This.isskiptext()
Return lbln_result
end function

public subroutine  of_setskiptext(boolean abln_skiptext);
//*-----------------------------------------------------------------*/
//*  .NET function : SetSkipText
//*   Argument:
//*              Boolean abln_skiptext
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setskiptext(abln_skiptext)
end subroutine

public function dotnetobject of_parsetolist(dotnetobject anv_reader,dotnetobject anv_style);
//*-----------------------------------------------------------------*/
//*  .NET function : ParseToList
//*   Argument:
//*              Dotnetobject anv_reader
//*              Dotnetobject anv_style
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
lnv_result = This.parsetolist(anv_reader,anv_style)
Return lnv_result
end function

public function dotnetobject of_parsetolist(dotnetobject anv_reader,dotnetobject anv_style,dotnetobject anv_providers);
//*-----------------------------------------------------------------*/
//*  .NET function : ParseToList
//*   Argument:
//*              Dotnetobject anv_reader
//*              Dotnetobject anv_style
//*              Dotnetobject anv_providers
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
lnv_result = This.parsetolist(anv_reader,anv_style,anv_providers)
Return lnv_result
end function

public function dotnetobject of_parsetolist(dotnetobject anv_reader,dotnetobject anv_style,dotnetobject anv_tags,dotnetobject anv_providers);
//*-----------------------------------------------------------------*/
//*  .NET function : ParseToList
//*   Argument:
//*              Dotnetobject anv_reader
//*              Dotnetobject anv_style
//*              Dotnetobject anv_tags
//*              Dotnetobject anv_providers
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
lnv_result = This.parsetolist(anv_reader,anv_style,anv_tags,anv_providers)
Return lnv_result
end function

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

public subroutine  of_setinterfaceprops(dotnetobject anv_providers);
//*-----------------------------------------------------------------*/
//*  .NET function : SetInterfaceProps
//*   Argument:
//*              Dotnetobject anv_providers
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setinterfaceprops(anv_providers)
end subroutine

public function dotnetobject of_getinterfaceprops();
//*-----------------------------------------------------------------*/
//*  .NET function : GetInterfaceProps
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
lnv_result = This.getinterfaceprops()
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

on nvo_htmlworker.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_htmlworker.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

