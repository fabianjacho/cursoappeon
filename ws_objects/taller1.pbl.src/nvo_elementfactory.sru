$PBExportHeader$nvo_elementfactory.sru
forward
global type nvo_elementfactory from dotnetobject
end type
end forward

global type nvo_elementfactory from dotnetobject
end type
global nvo_elementfactory nvo_elementfactory

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.html.simpleparser.ElementFactory"

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
public function dotnetobject of_getfont(dotnetobject anv_chain)
public function dotnetobject of_createchunk(string as_content,dotnetobject anv_chain)
public function dotnetobject of_createparagraph(dotnetobject anv_chain)
public function dotnetobject of_createlistitem(dotnetobject anv_chain)
public function dotnetobject of_gethyphenation(dotnetobject anv_chain)
public function dotnetobject of_createlineseparator(dotnetobject anv_attrs,real ar_offset)
public function dotnetobject of_createimage(string as_src,dotnetobject anv_attrs,dotnetobject anv_chain,dotnetobject anv_document,dotnetobject anv_img_provider,dotnetobject anv_img_store,string as_img_baseurl)
public function dotnetobject of_createlist(string as_tag,dotnetobject anv_chain)
public function dotnetobject get_fontprovider()
public subroutine  set_fontprovider(dotnetobject anv_value)
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

public function dotnetobject of_getfont(dotnetobject anv_chain);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              Dotnetobject anv_chain
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
lnv_result = This.getfont(anv_chain)
Return lnv_result
end function

public function dotnetobject of_createchunk(string as_content,dotnetobject anv_chain);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateChunk
//*   Argument:
//*              String as_content
//*              Dotnetobject anv_chain
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
lnv_result = This.createchunk(as_content,anv_chain)
Return lnv_result
end function

public function dotnetobject of_createparagraph(dotnetobject anv_chain);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateParagraph
//*   Argument:
//*              Dotnetobject anv_chain
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
lnv_result = This.createparagraph(anv_chain)
Return lnv_result
end function

public function dotnetobject of_createlistitem(dotnetobject anv_chain);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateListItem
//*   Argument:
//*              Dotnetobject anv_chain
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
lnv_result = This.createlistitem(anv_chain)
Return lnv_result
end function

public function dotnetobject of_gethyphenation(dotnetobject anv_chain);
//*-----------------------------------------------------------------*/
//*  .NET function : GetHyphenation
//*   Argument:
//*              Dotnetobject anv_chain
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
lnv_result = This.gethyphenation(anv_chain)
Return lnv_result
end function

public function dotnetobject of_createlineseparator(dotnetobject anv_attrs,real ar_offset);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateLineSeparator
//*   Argument:
//*              Dotnetobject anv_attrs
//*              Real ar_offset
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
lnv_result = This.createlineseparator(anv_attrs,ar_offset)
Return lnv_result
end function

public function dotnetobject of_createimage(string as_src,dotnetobject anv_attrs,dotnetobject anv_chain,dotnetobject anv_document,dotnetobject anv_img_provider,dotnetobject anv_img_store,string as_img_baseurl);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateImage
//*   Argument:
//*              String as_src
//*              Dotnetobject anv_attrs
//*              Dotnetobject anv_chain
//*              Dotnetobject anv_document
//*              Dotnetobject anv_img_provider
//*              Dotnetobject anv_img_store
//*              String as_img_baseurl
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
lnv_result = This.createimage(as_src,anv_attrs,anv_chain,anv_document,anv_img_provider,anv_img_store,as_img_baseurl)
Return lnv_result
end function

public function dotnetobject of_createlist(string as_tag,dotnetobject anv_chain);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateList
//*   Argument:
//*              String as_tag
//*              Dotnetobject anv_chain
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
lnv_result = This.createlist(as_tag,anv_chain)
Return lnv_result
end function

public function dotnetobject get_fontprovider();
//*-----------------------------------------------------------------*/
//*  .NET property : FontProvider
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
lnv_result = This.fontprovider
Return lnv_result
end function

public subroutine  set_fontprovider(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : FontProvider
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.fontprovider = anv_value
end subroutine

on nvo_elementfactory.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_elementfactory.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

