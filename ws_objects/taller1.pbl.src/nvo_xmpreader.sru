$PBExportHeader$nvo_xmpreader.sru
forward
global type nvo_xmpreader from dotnetobject
end type
end forward

global type nvo_xmpreader from dotnetobject
end type
global nvo_xmpreader nvo_xmpreader

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.xml.xmp.XmpReader"

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
public function boolean of_replacenode(string as_namespaceuri,string as_localname,string as_value)
public function boolean of_replacedescriptionattribute(string as_namespaceuri,string as_localname,string as_value)
public function boolean of_add(string as_parent,string as_namespaceuri,string as_localname,string as_value)
public function boolean of_setnodetext(dotnetobject anv_domdocument,dotnetobject anv_n,string as_value)
public function blob of_serializedoc()
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

public function boolean of_replacenode(string as_namespaceuri,string as_localname,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : ReplaceNode
//*   Argument:
//*              String as_namespaceuri
//*              String as_localname
//*              String as_value
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
lbln_result = This.replacenode(as_namespaceuri,as_localname,as_value)
Return lbln_result
end function

public function boolean of_replacedescriptionattribute(string as_namespaceuri,string as_localname,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : ReplaceDescriptionAttribute
//*   Argument:
//*              String as_namespaceuri
//*              String as_localname
//*              String as_value
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
lbln_result = This.replacedescriptionattribute(as_namespaceuri,as_localname,as_value)
Return lbln_result
end function

public function boolean of_add(string as_parent,string as_namespaceuri,string as_localname,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : Add
//*   Argument:
//*              String as_parent
//*              String as_namespaceuri
//*              String as_localname
//*              String as_value
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
lbln_result = This.add(as_parent,as_namespaceuri,as_localname,as_value)
Return lbln_result
end function

public function boolean of_setnodetext(dotnetobject anv_domdocument,dotnetobject anv_n,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetNodeText
//*   Argument:
//*              Dotnetobject anv_domdocument
//*              Dotnetobject anv_n
//*              String as_value
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
lbln_result = This.setnodetext(anv_domdocument,anv_n,as_value)
Return lbln_result
end function

public function blob of_serializedoc();
//*-----------------------------------------------------------------*/
//*  .NET function : SerializeDoc
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
lbyt_result = This.serializedoc()
Return lbyt_result
end function

on nvo_xmpreader.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_xmpreader.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

