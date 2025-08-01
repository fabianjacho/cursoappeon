﻿$PBExportHeader$nvo_xml2som.sru
forward
global type nvo_xml2som from dotnetobject
end type
end forward

global type nvo_xml2som from dotnetobject
end type
global nvo_xml2som nvo_xml2som

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.XfaForm+Xml2Som"

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
public function string of_escapesom(string as_s)
public function string of_unescapesom(string as_s)
public function string of_getshortname(string as_s)
public subroutine  of_inversesearchadd(string as_unstack)
public subroutine  of_inversesearchadd(dotnetobject anv_inversesearch,dotnetobject anv_stack,string as_unstack)
public function string of_inversesearchglobal(dotnetobject anv_parts)
public function dotnetobject of_splitparts(string as_name)
public function dotnetobject get_order()
public subroutine  set_order(dotnetobject anv_value)
public function dotnetobject get_name2node()
public subroutine  set_name2node(dotnetobject anv_value)
public function dotnetobject get_inversesearch()
public subroutine  set_inversesearch(dotnetobject anv_value)
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

public function string of_escapesom(string as_s);
//*-----------------------------------------------------------------*/
//*  .NET function : EscapeSom
//*   Argument:
//*              String as_s
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
ls_result = This.escapesom(as_s)
Return ls_result
end function

public function string of_unescapesom(string as_s);
//*-----------------------------------------------------------------*/
//*  .NET function : UnescapeSom
//*   Argument:
//*              String as_s
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
ls_result = This.unescapesom(as_s)
Return ls_result
end function

public function string of_getshortname(string as_s);
//*-----------------------------------------------------------------*/
//*  .NET function : GetShortName
//*   Argument:
//*              String as_s
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
ls_result = This.getshortname(as_s)
Return ls_result
end function

public subroutine  of_inversesearchadd(string as_unstack);
//*-----------------------------------------------------------------*/
//*  .NET function : InverseSearchAdd
//*   Argument:
//*              String as_unstack
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.inversesearchadd(as_unstack)
end subroutine

public subroutine  of_inversesearchadd(dotnetobject anv_inversesearch,dotnetobject anv_stack,string as_unstack);
//*-----------------------------------------------------------------*/
//*  .NET function : InverseSearchAdd
//*   Argument:
//*              Dotnetobject anv_inversesearch
//*              Dotnetobject anv_stack
//*              String as_unstack
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.inversesearchadd(anv_inversesearch,anv_stack,as_unstack)
end subroutine

public function string of_inversesearchglobal(dotnetobject anv_parts);
//*-----------------------------------------------------------------*/
//*  .NET function : InverseSearchGlobal
//*   Argument:
//*              Dotnetobject anv_parts
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
ls_result = This.inversesearchglobal(anv_parts)
Return ls_result
end function

public function dotnetobject of_splitparts(string as_name);
//*-----------------------------------------------------------------*/
//*  .NET function : SplitParts
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
lnv_result = This.splitparts(as_name)
Return lnv_result
end function

public function dotnetobject get_order();
//*-----------------------------------------------------------------*/
//*  .NET property : Order
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
lnv_result = This.order
Return lnv_result
end function

public subroutine  set_order(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Order
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.order = anv_value
end subroutine

public function dotnetobject get_name2node();
//*-----------------------------------------------------------------*/
//*  .NET property : Name2Node
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
lnv_result = This.name2node
Return lnv_result
end function

public subroutine  set_name2node(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Name2Node
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.name2node = anv_value
end subroutine

public function dotnetobject get_inversesearch();
//*-----------------------------------------------------------------*/
//*  .NET property : InverseSearch
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
lnv_result = This.inversesearch
Return lnv_result
end function

public subroutine  set_inversesearch(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : InverseSearch
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.inversesearch = anv_value
end subroutine

on nvo_xml2som.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_xml2som.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

