$PBExportHeader$nvo_xmpwriter.sru
forward
global type nvo_xmpwriter from dotnetobject
end type
end forward

global type nvo_xmpwriter from dotnetobject
end type
global nvo_xmpwriter nvo_xmpwriter

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.xml.xmp.XmpWriter"

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
public subroutine  of_addrdfdescription(string as_xmlns,string as_content)
public subroutine  of_addrdfdescription(dotnetobject anv_s)
public subroutine  of_setproperty(string as_schemans,string as_propname,dotnetobject anv_value)
public subroutine  of_appendarrayitem(string as_schemans,string as_arrayname,string as_value)
public subroutine  of_appendorderedarrayitem(string as_schemans,string as_arrayname,string as_value)
public subroutine  of_appendalternatearrayitem(string as_schemans,string as_arrayname,string as_value)
public subroutine  of_serialize(dotnetobject anv_externaloutputstream)
public subroutine  of_close()
public subroutine  of_adddocinfoproperty(dotnetobject anv_key,string as_value)
public function dotnetobject get_xmpmeta()
public function boolean get_readonly()
public subroutine  set_readonly(boolean abln_value)
public function string get_about()
public subroutine  set_about(string as_value)
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

public subroutine  of_addrdfdescription(string as_xmlns,string as_content);
//*-----------------------------------------------------------------*/
//*  .NET function : AddRdfDescription
//*   Argument:
//*              String as_xmlns
//*              String as_content
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addrdfdescription(as_xmlns,as_content)
end subroutine

public subroutine  of_addrdfdescription(dotnetobject anv_s);
//*-----------------------------------------------------------------*/
//*  .NET function : AddRdfDescription
//*   Argument:
//*              Dotnetobject anv_s
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addrdfdescription(anv_s)
end subroutine

public subroutine  of_setproperty(string as_schemans,string as_propname,dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetProperty
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setproperty(as_schemans,as_propname,anv_value)
end subroutine

public subroutine  of_appendarrayitem(string as_schemans,string as_arrayname,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : AppendArrayItem
//*   Argument:
//*              String as_schemans
//*              String as_arrayname
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.appendarrayitem(as_schemans,as_arrayname,as_value)
end subroutine

public subroutine  of_appendorderedarrayitem(string as_schemans,string as_arrayname,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : AppendOrderedArrayItem
//*   Argument:
//*              String as_schemans
//*              String as_arrayname
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.appendorderedarrayitem(as_schemans,as_arrayname,as_value)
end subroutine

public subroutine  of_appendalternatearrayitem(string as_schemans,string as_arrayname,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : AppendAlternateArrayItem
//*   Argument:
//*              String as_schemans
//*              String as_arrayname
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.appendalternatearrayitem(as_schemans,as_arrayname,as_value)
end subroutine

public subroutine  of_serialize(dotnetobject anv_externaloutputstream);
//*-----------------------------------------------------------------*/
//*  .NET function : Serialize
//*   Argument:
//*              Dotnetobject anv_externaloutputstream
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.serialize(anv_externaloutputstream)
end subroutine

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

public subroutine  of_adddocinfoproperty(dotnetobject anv_key,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : AddDocInfoProperty
//*   Argument:
//*              Dotnetobject anv_key
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.adddocinfoproperty(anv_key,as_value)
end subroutine

public function dotnetobject get_xmpmeta();
//*-----------------------------------------------------------------*/
//*  .NET property : XmpMeta
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
lnv_result = This.xmpmeta
Return lnv_result
end function

public function boolean get_readonly();
//*-----------------------------------------------------------------*/
//*  .NET property : ReadOnly
//*   Return : Boolean
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Boolean lbln_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lbln_result)
	Return lbln_result
End If

/* Trigger the dotnet property */
lbln_result = This.readonly
Return lbln_result
end function

public subroutine  set_readonly(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ReadOnly
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.readonly = abln_value
end subroutine

public function string get_about();
//*-----------------------------------------------------------------*/
//*  .NET property : About
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
ls_result = This.about
Return ls_result
end function

public subroutine  set_about(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : About
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.about = as_value
end subroutine

on nvo_xmpwriter.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_xmpwriter.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

