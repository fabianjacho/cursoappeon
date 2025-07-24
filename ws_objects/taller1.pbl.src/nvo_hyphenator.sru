$PBExportHeader$nvo_hyphenator.sru
forward
global type nvo_hyphenator from dotnetobject
end type
end forward

global type nvo_hyphenator from dotnetobject
end type
global nvo_hyphenator nvo_hyphenator

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.hyphenation.Hyphenator"

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
public function dotnetobject of_gethyphenationtree(string as_lang,string as_country)
public function dotnetobject of_getresourcehyphenationtree(string as_key)
public function dotnetobject of_hyphenate(string as_lang,string as_country,string as_word,long al_leftmin,long al_rightmin)
public function dotnetobject of_hyphenate(string as_lang,string as_country,char ach_word[],long al_offset,long al_len,long al_leftmin,long al_rightmin)
public subroutine  of_setminremaincharcount(long al_min)
public subroutine  of_setminpushcharcount(long al_min)
public subroutine  of_setlanguage(string as_lang,string as_country)
public function dotnetobject of_hyphenate(char ach_word[],long al_offset,long al_len)
public function dotnetobject of_hyphenate(string as_word)
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

public function dotnetobject of_gethyphenationtree(string as_lang,string as_country);
//*-----------------------------------------------------------------*/
//*  .NET function : GetHyphenationTree
//*   Argument:
//*              String as_lang
//*              String as_country
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
lnv_result = This.gethyphenationtree(as_lang,as_country)
Return lnv_result
end function

public function dotnetobject of_getresourcehyphenationtree(string as_key);
//*-----------------------------------------------------------------*/
//*  .NET function : GetResourceHyphenationTree
//*   Argument:
//*              String as_key
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
lnv_result = This.getresourcehyphenationtree(as_key)
Return lnv_result
end function

public function dotnetobject of_hyphenate(string as_lang,string as_country,string as_word,long al_leftmin,long al_rightmin);
//*-----------------------------------------------------------------*/
//*  .NET function : Hyphenate
//*   Argument:
//*              String as_lang
//*              String as_country
//*              String as_word
//*              Long al_leftmin
//*              Long al_rightmin
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
lnv_result = This.hyphenate(as_lang,as_country,as_word,al_leftmin,al_rightmin)
Return lnv_result
end function

public function dotnetobject of_hyphenate(string as_lang,string as_country,char ach_word[],long al_offset,long al_len,long al_leftmin,long al_rightmin);
//*-----------------------------------------------------------------*/
//*  .NET function : Hyphenate
//*   Argument:
//*              String as_lang
//*              String as_country
//*              Char ach_word[]
//*              Long al_offset
//*              Long al_len
//*              Long al_leftmin
//*              Long al_rightmin
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
lnv_result = This.hyphenate(as_lang,as_country,ref ach_word,al_offset,al_len,al_leftmin,al_rightmin)
Return lnv_result
end function

public subroutine  of_setminremaincharcount(long al_min);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMinRemainCharCount
//*   Argument:
//*              Long al_min
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setminremaincharcount(al_min)
end subroutine

public subroutine  of_setminpushcharcount(long al_min);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMinPushCharCount
//*   Argument:
//*              Long al_min
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setminpushcharcount(al_min)
end subroutine

public subroutine  of_setlanguage(string as_lang,string as_country);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLanguage
//*   Argument:
//*              String as_lang
//*              String as_country
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlanguage(as_lang,as_country)
end subroutine

public function dotnetobject of_hyphenate(char ach_word[],long al_offset,long al_len);
//*-----------------------------------------------------------------*/
//*  .NET function : Hyphenate
//*   Argument:
//*              Char ach_word[]
//*              Long al_offset
//*              Long al_len
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
lnv_result = This.hyphenate(ref ach_word,al_offset,al_len)
Return lnv_result
end function

public function dotnetobject of_hyphenate(string as_word);
//*-----------------------------------------------------------------*/
//*  .NET function : Hyphenate
//*   Argument:
//*              String as_word
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
lnv_result = This.hyphenate(as_word)
Return lnv_result
end function

on nvo_hyphenator.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_hyphenator.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

