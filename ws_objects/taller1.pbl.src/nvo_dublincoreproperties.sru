$PBExportHeader$nvo_dublincoreproperties.sru
forward
global type nvo_dublincoreproperties from dotnetobject
end type
end forward

global type nvo_dublincoreproperties from dotnetobject
end type
global nvo_dublincoreproperties nvo_dublincoreproperties

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.xml.xmp.DublinCoreProperties"

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
public subroutine  of_addtitle(dotnetobject anv_xmpmeta,string as_title)
public subroutine  of_settitle(dotnetobject anv_xmpmeta,string as_title,string as_genericlang,string as_specificlang)
public subroutine  of_adddescription(dotnetobject anv_xmpmeta,string as_desc)
public subroutine  of_setdescription(dotnetobject anv_xmpmeta,string as_desc,string as_genericlang,string as_specificlang)
public subroutine  of_addsubject(dotnetobject anv_xmpmeta,string as_subject)
public subroutine  of_setsubject(dotnetobject anv_xmpmeta,string as_subject[])
public subroutine  of_addauthor(dotnetobject anv_xmpmeta,string as_author)
public subroutine  of_setauthor(dotnetobject anv_xmpmeta,string as_author[])
public subroutine  of_addpublisher(dotnetobject anv_xmpmeta,string as_publisher)
public subroutine  of_setpublisher(dotnetobject anv_xmpmeta,string as_publisher[])
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

public subroutine  of_addtitle(dotnetobject anv_xmpmeta,string as_title);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTitle
//*   Argument:
//*              Dotnetobject anv_xmpmeta
//*              String as_title
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtitle(anv_xmpmeta,as_title)
end subroutine

public subroutine  of_settitle(dotnetobject anv_xmpmeta,string as_title,string as_genericlang,string as_specificlang);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTitle
//*   Argument:
//*              Dotnetobject anv_xmpmeta
//*              String as_title
//*              String as_genericlang
//*              String as_specificlang
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settitle(anv_xmpmeta,as_title,as_genericlang,as_specificlang)
end subroutine

public subroutine  of_adddescription(dotnetobject anv_xmpmeta,string as_desc);
//*-----------------------------------------------------------------*/
//*  .NET function : AddDescription
//*   Argument:
//*              Dotnetobject anv_xmpmeta
//*              String as_desc
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.adddescription(anv_xmpmeta,as_desc)
end subroutine

public subroutine  of_setdescription(dotnetobject anv_xmpmeta,string as_desc,string as_genericlang,string as_specificlang);
//*-----------------------------------------------------------------*/
//*  .NET function : SetDescription
//*   Argument:
//*              Dotnetobject anv_xmpmeta
//*              String as_desc
//*              String as_genericlang
//*              String as_specificlang
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setdescription(anv_xmpmeta,as_desc,as_genericlang,as_specificlang)
end subroutine

public subroutine  of_addsubject(dotnetobject anv_xmpmeta,string as_subject);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSubject
//*   Argument:
//*              Dotnetobject anv_xmpmeta
//*              String as_subject
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addsubject(anv_xmpmeta,as_subject)
end subroutine

public subroutine  of_setsubject(dotnetobject anv_xmpmeta,string as_subject[]);
//*-----------------------------------------------------------------*/
//*  .NET function : SetSubject
//*   Argument:
//*              Dotnetobject anv_xmpmeta
//*              String as_subject[]
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setsubject(anv_xmpmeta,as_subject)
end subroutine

public subroutine  of_addauthor(dotnetobject anv_xmpmeta,string as_author);
//*-----------------------------------------------------------------*/
//*  .NET function : AddAuthor
//*   Argument:
//*              Dotnetobject anv_xmpmeta
//*              String as_author
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addauthor(anv_xmpmeta,as_author)
end subroutine

public subroutine  of_setauthor(dotnetobject anv_xmpmeta,string as_author[]);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAuthor
//*   Argument:
//*              Dotnetobject anv_xmpmeta
//*              String as_author[]
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setauthor(anv_xmpmeta,as_author)
end subroutine

public subroutine  of_addpublisher(dotnetobject anv_xmpmeta,string as_publisher);
//*-----------------------------------------------------------------*/
//*  .NET function : AddPublisher
//*   Argument:
//*              Dotnetobject anv_xmpmeta
//*              String as_publisher
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addpublisher(anv_xmpmeta,as_publisher)
end subroutine

public subroutine  of_setpublisher(dotnetobject anv_xmpmeta,string as_publisher[]);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPublisher
//*   Argument:
//*              Dotnetobject anv_xmpmeta
//*              String as_publisher[]
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpublisher(anv_xmpmeta,as_publisher)
end subroutine

on nvo_dublincoreproperties.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_dublincoreproperties.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

