$PBExportHeader$nvo_hyphenationtree.sru
forward
global type nvo_hyphenationtree from dotnetobject
end type
end forward

global type nvo_hyphenationtree from dotnetobject
end type
global nvo_hyphenationtree nvo_hyphenationtree

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.hyphenation.HyphenationTree"

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
public subroutine  of_loadsimplepatterns(dotnetobject anv_stream)
public function string of_findpattern(string as_pat)
public function dotnetobject of_hyphenate(string as_word,long al_remaincharcount,long al_pushcharcount)
public function dotnetobject of_hyphenate(char ach_w[],long al_offset,long al_len,long al_remaincharcount,long al_pushcharcount)
public subroutine  of_addclass(string as_chargroup)
public subroutine  of_addexception(string as_word,dotnetobject anv_hyphenatedword)
public subroutine  of_addpattern(string as_pattern,string as_ivalue)
public subroutine  of_printstats()
public subroutine  of_insert(string as_key,char ach_val)
public subroutine  of_insert(char ach_key[],long al_start,char ach_val)
public function long of_find(string as_key)
public function long of_find(char ach_key[],long al_start)
public function boolean of_knows(string as_key)
public function dotnetobject of_clone()
public subroutine  of_balance()
public subroutine  of_trimtosize()
public function long get_size()
public function dotnetobject get_keys()
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

public subroutine  of_loadsimplepatterns(dotnetobject anv_stream);
//*-----------------------------------------------------------------*/
//*  .NET function : LoadSimplePatterns
//*   Argument:
//*              Dotnetobject anv_stream
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.loadsimplepatterns(anv_stream)
end subroutine

public function string of_findpattern(string as_pat);
//*-----------------------------------------------------------------*/
//*  .NET function : FindPattern
//*   Argument:
//*              String as_pat
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
ls_result = This.findpattern(as_pat)
Return ls_result
end function

public function dotnetobject of_hyphenate(string as_word,long al_remaincharcount,long al_pushcharcount);
//*-----------------------------------------------------------------*/
//*  .NET function : Hyphenate
//*   Argument:
//*              String as_word
//*              Long al_remaincharcount
//*              Long al_pushcharcount
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
lnv_result = This.hyphenate(as_word,al_remaincharcount,al_pushcharcount)
Return lnv_result
end function

public function dotnetobject of_hyphenate(char ach_w[],long al_offset,long al_len,long al_remaincharcount,long al_pushcharcount);
//*-----------------------------------------------------------------*/
//*  .NET function : Hyphenate
//*   Argument:
//*              Char ach_w[]
//*              Long al_offset
//*              Long al_len
//*              Long al_remaincharcount
//*              Long al_pushcharcount
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
lnv_result = This.hyphenate(ref ach_w,al_offset,al_len,al_remaincharcount,al_pushcharcount)
Return lnv_result
end function

public subroutine  of_addclass(string as_chargroup);
//*-----------------------------------------------------------------*/
//*  .NET function : AddClass
//*   Argument:
//*              String as_chargroup
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addclass(as_chargroup)
end subroutine

public subroutine  of_addexception(string as_word,dotnetobject anv_hyphenatedword);
//*-----------------------------------------------------------------*/
//*  .NET function : AddException
//*   Argument:
//*              String as_word
//*              Dotnetobject anv_hyphenatedword
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addexception(as_word,anv_hyphenatedword)
end subroutine

public subroutine  of_addpattern(string as_pattern,string as_ivalue);
//*-----------------------------------------------------------------*/
//*  .NET function : AddPattern
//*   Argument:
//*              String as_pattern
//*              String as_ivalue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addpattern(as_pattern,as_ivalue)
end subroutine

public subroutine  of_printstats();
//*-----------------------------------------------------------------*/
//*  .NET function : PrintStats
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.printstats()
end subroutine

public subroutine  of_insert(string as_key,char ach_val);
//*-----------------------------------------------------------------*/
//*  .NET function : Insert
//*   Argument:
//*              String as_key
//*              Char ach_val
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.insert(as_key,ref ach_val)
end subroutine

public subroutine  of_insert(char ach_key[],long al_start,char ach_val);
//*-----------------------------------------------------------------*/
//*  .NET function : Insert
//*   Argument:
//*              Char ach_key[]
//*              Long al_start
//*              Char ach_val
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.insert(ref ach_key,al_start,ref ach_val)
end subroutine

public function long of_find(string as_key);
//*-----------------------------------------------------------------*/
//*  .NET function : Find
//*   Argument:
//*              String as_key
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
ll_result = This.find(as_key)
Return ll_result
end function

public function long of_find(char ach_key[],long al_start);
//*-----------------------------------------------------------------*/
//*  .NET function : Find
//*   Argument:
//*              Char ach_key[]
//*              Long al_start
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
ll_result = This.find(ref ach_key,al_start)
Return ll_result
end function

public function boolean of_knows(string as_key);
//*-----------------------------------------------------------------*/
//*  .NET function : Knows
//*   Argument:
//*              String as_key
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
lbln_result = This.knows(as_key)
Return lbln_result
end function

public function dotnetobject of_clone();
//*-----------------------------------------------------------------*/
//*  .NET function : Clone
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
lnv_result = This.clone()
Return lnv_result
end function

public subroutine  of_balance();
//*-----------------------------------------------------------------*/
//*  .NET function : Balance
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.balance()
end subroutine

public subroutine  of_trimtosize();
//*-----------------------------------------------------------------*/
//*  .NET function : TrimToSize
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.trimtosize()
end subroutine

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

on nvo_hyphenationtree.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_hyphenationtree.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

