$PBExportHeader$nvo_htmlutilities.sru
forward
global type nvo_htmlutilities from dotnetobject
end type
end forward

global type nvo_htmlutilities from dotnetobject
end type
global nvo_htmlutilities nvo_htmlutilities

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.html.HtmlUtilities"

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
public function real of_parselength(string as_str)
public function real of_parselength(string as_str,real ar_actualfontsize)
public function dotnetobject of_decodecolor(string as_s)
public function dotnetobject of_parseattributes(string as_str)
public function string of_removecomment(string as_str,string as_startcomment,string as_endcomment)
public function string of_eliminatewhitespace(string as_content)
public function long of_getindexedfontsize(string as_value,string as_previous)
public function long of_alignmentvalue(string as_alignment)
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

public function real of_parselength(string as_str);
//*-----------------------------------------------------------------*/
//*  .NET function : ParseLength
//*   Argument:
//*              String as_str
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
lr_result = This.parselength(as_str)
Return lr_result
end function

public function real of_parselength(string as_str,real ar_actualfontsize);
//*-----------------------------------------------------------------*/
//*  .NET function : ParseLength
//*   Argument:
//*              String as_str
//*              Real ar_actualfontsize
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
lr_result = This.parselength(as_str,ar_actualfontsize)
Return lr_result
end function

public function dotnetobject of_decodecolor(string as_s);
//*-----------------------------------------------------------------*/
//*  .NET function : DecodeColor
//*   Argument:
//*              String as_s
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
lnv_result = This.decodecolor(as_s)
Return lnv_result
end function

public function dotnetobject of_parseattributes(string as_str);
//*-----------------------------------------------------------------*/
//*  .NET function : ParseAttributes
//*   Argument:
//*              String as_str
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
lnv_result = This.parseattributes(as_str)
Return lnv_result
end function

public function string of_removecomment(string as_str,string as_startcomment,string as_endcomment);
//*-----------------------------------------------------------------*/
//*  .NET function : RemoveComment
//*   Argument:
//*              String as_str
//*              String as_startcomment
//*              String as_endcomment
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
ls_result = This.removecomment(as_str,as_startcomment,as_endcomment)
Return ls_result
end function

public function string of_eliminatewhitespace(string as_content);
//*-----------------------------------------------------------------*/
//*  .NET function : EliminateWhiteSpace
//*   Argument:
//*              String as_content
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
ls_result = This.eliminatewhitespace(as_content)
Return ls_result
end function

public function long of_getindexedfontsize(string as_value,string as_previous);
//*-----------------------------------------------------------------*/
//*  .NET function : GetIndexedFontSize
//*   Argument:
//*              String as_value
//*              String as_previous
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
ll_result = This.getindexedfontsize(as_value,as_previous)
Return ll_result
end function

public function long of_alignmentvalue(string as_alignment);
//*-----------------------------------------------------------------*/
//*  .NET function : AlignmentValue
//*   Argument:
//*              String as_alignment
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
ll_result = This.alignmentvalue(as_alignment)
Return ll_result
end function

on nvo_htmlutilities.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_htmlutilities.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

