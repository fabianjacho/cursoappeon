$PBExportHeader$nvo_pdfschema.sru
forward
global type nvo_pdfschema from dotnetobject
end type
end forward

global type nvo_pdfschema from dotnetobject
end type
global nvo_pdfschema nvo_pdfschema

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.xml.xmp.PdfSchema"

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
public subroutine  of_addkeywords(string as_keywords)
public subroutine  of_addproducer(string as_producer)
public subroutine  of_addversion(string as_version)
public function string of_tostring()
public subroutine  of_addproperty(string as_key,string as_value)
public subroutine  of_setproperty(string as_key,dotnetobject anv_value)
public subroutine  of_setproperty1(string as_key,dotnetobject anv_value)
public function string of_remove(string as_key)
public function boolean of_containskey(string as_key)
public subroutine  of_add(string as_key,string as_value)
public subroutine  of_addall(dotnetobject anv_col)
public subroutine  of_clear()
public subroutine  of_load(dotnetobject anv_instream)
public function string get_xmlns()
public function long get_count()
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

public subroutine  of_addkeywords(string as_keywords);
//*-----------------------------------------------------------------*/
//*  .NET function : AddKeywords
//*   Argument:
//*              String as_keywords
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addkeywords(as_keywords)
end subroutine

public subroutine  of_addproducer(string as_producer);
//*-----------------------------------------------------------------*/
//*  .NET function : AddProducer
//*   Argument:
//*              String as_producer
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addproducer(as_producer)
end subroutine

public subroutine  of_addversion(string as_version);
//*-----------------------------------------------------------------*/
//*  .NET function : AddVersion
//*   Argument:
//*              String as_version
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addversion(as_version)
end subroutine

public function string of_tostring();
//*-----------------------------------------------------------------*/
//*  .NET function : ToString
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
ls_result = This.tostring()
Return ls_result
end function

public subroutine  of_addproperty(string as_key,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : AddProperty
//*   Argument:
//*              String as_key
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addproperty(as_key,as_value)
end subroutine

public subroutine  of_setproperty(string as_key,dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetProperty
//*   Argument:
//*              String as_key
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setproperty(as_key,anv_value)
end subroutine

public subroutine  of_setproperty1(string as_key,dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetProperty
//*   Argument:
//*              String as_key
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setproperty(as_key,anv_value)
end subroutine

public function string of_remove(string as_key);
//*-----------------------------------------------------------------*/
//*  .NET function : Remove
//*   Argument:
//*              String as_key
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
ls_result = This.remove(as_key)
Return ls_result
end function

public function boolean of_containskey(string as_key);
//*-----------------------------------------------------------------*/
//*  .NET function : ContainsKey
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
lbln_result = This.containskey(as_key)
Return lbln_result
end function

public subroutine  of_add(string as_key,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : Add
//*   Argument:
//*              String as_key
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.add(as_key,as_value)
end subroutine

public subroutine  of_addall(dotnetobject anv_col);
//*-----------------------------------------------------------------*/
//*  .NET function : AddAll
//*   Argument:
//*              Dotnetobject anv_col
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addall(anv_col)
end subroutine

public subroutine  of_clear();
//*-----------------------------------------------------------------*/
//*  .NET function : Clear
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.clear()
end subroutine

public subroutine  of_load(dotnetobject anv_instream);
//*-----------------------------------------------------------------*/
//*  .NET function : Load
//*   Argument:
//*              Dotnetobject anv_instream
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.load(anv_instream)
end subroutine

public function string get_xmlns();
//*-----------------------------------------------------------------*/
//*  .NET property : Xmlns
//*   Return : String
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
String ls_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ls_result)
	Return ls_result
End If

/* Trigger the dotnet property */
ls_result = This.xmlns
Return ls_result
end function

public function long get_count();
//*-----------------------------------------------------------------*/
//*  .NET property : Count
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
ll_result = This.count
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

on nvo_pdfschema.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfschema.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

