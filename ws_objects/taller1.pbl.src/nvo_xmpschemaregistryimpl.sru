$PBExportHeader$nvo_xmpschemaregistryimpl.sru
forward
global type nvo_xmpschemaregistryimpl from dotnetobject
end type
end forward

global type nvo_xmpschemaregistryimpl from dotnetobject
end type
global nvo_xmpschemaregistryimpl nvo_xmpschemaregistryimpl

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.xmp.impl.XmpSchemaRegistryImpl"

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
public function string of_registernamespace(string as_namespaceuri,string as_suggestedprefix)
public subroutine  of_deletenamespace(string as_namespaceuri)
public function string of_getnamespaceprefix(string as_namespaceuri)
public function string of_getnamespaceuri(string as_namespaceprefix)
public function dotnetobject of_resolvealias(string as_aliasns,string as_aliasprop)
public function dotnetobject of_findalias(string as_qname)
public function dotnetobject of_getnamespaces()
public function dotnetobject of_getprefixes()
public function dotnetobject of_getaliases()
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

public function string of_registernamespace(string as_namespaceuri,string as_suggestedprefix);
//*-----------------------------------------------------------------*/
//*  .NET function : RegisterNamespace
//*   Argument:
//*              String as_namespaceuri
//*              String as_suggestedprefix
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
ls_result = This.registernamespace(as_namespaceuri,as_suggestedprefix)
Return ls_result
end function

public subroutine  of_deletenamespace(string as_namespaceuri);
//*-----------------------------------------------------------------*/
//*  .NET function : DeleteNamespace
//*   Argument:
//*              String as_namespaceuri
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.deletenamespace(as_namespaceuri)
end subroutine

public function string of_getnamespaceprefix(string as_namespaceuri);
//*-----------------------------------------------------------------*/
//*  .NET function : GetNamespacePrefix
//*   Argument:
//*              String as_namespaceuri
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
ls_result = This.getnamespaceprefix(as_namespaceuri)
Return ls_result
end function

public function string of_getnamespaceuri(string as_namespaceprefix);
//*-----------------------------------------------------------------*/
//*  .NET function : GetNamespaceUri
//*   Argument:
//*              String as_namespaceprefix
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
ls_result = This.getnamespaceuri(as_namespaceprefix)
Return ls_result
end function

public function dotnetobject of_resolvealias(string as_aliasns,string as_aliasprop);
//*-----------------------------------------------------------------*/
//*  .NET function : ResolveAlias
//*   Argument:
//*              String as_aliasns
//*              String as_aliasprop
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
lnv_result = This.resolvealias(as_aliasns,as_aliasprop)
Return lnv_result
end function

public function dotnetobject of_findalias(string as_qname);
//*-----------------------------------------------------------------*/
//*  .NET function : FindAlias
//*   Argument:
//*              String as_qname
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
lnv_result = This.findalias(as_qname)
Return lnv_result
end function

public function dotnetobject of_getnamespaces();
//*-----------------------------------------------------------------*/
//*  .NET function : GetNamespaces
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
lnv_result = This.getnamespaces()
Return lnv_result
end function

public function dotnetobject of_getprefixes();
//*-----------------------------------------------------------------*/
//*  .NET function : GetPrefixes
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
lnv_result = This.getprefixes()
Return lnv_result
end function

public function dotnetobject of_getaliases();
//*-----------------------------------------------------------------*/
//*  .NET function : GetAliases
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
lnv_result = This.getaliases()
Return lnv_result
end function

on nvo_xmpschemaregistryimpl.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_xmpschemaregistryimpl.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

