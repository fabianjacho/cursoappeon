$PBExportHeader$nvo_fdfwriter.sru
forward
global type nvo_fdfwriter from dotnetobject
end type
end forward

global type nvo_fdfwriter from dotnetobject
end type
global nvo_fdfwriter nvo_fdfwriter

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.FdfWriter"

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
public subroutine  of_writeto(dotnetobject anv_os)
public subroutine  of_write()
public function boolean of_removefield(string as_field)
public function dotnetobject of_getfields()
public function string of_getfield(string as_field)
public function boolean of_setfieldasname(string as_field,string as_value)
public function boolean of_setfieldasstring(string as_field,string as_value)
public function boolean of_setfieldasaction(string as_field,dotnetobject anv_action)
public function boolean of_setfieldastemplate(string as_field,dotnetobject anv_template)
public function boolean of_setfieldasimage(string as_field,dotnetobject anv_image)
public function boolean of_setfieldasjavascript(string as_field,dotnetobject anv_jstrigname,string as_js)
public function dotnetobject of_getimportedpage(dotnetobject anv_reader,long al_pagenumber)
public function dotnetobject of_createtemplate(real ar_width,real ar_height)
public subroutine  of_setfields(dotnetobject anv_fdf)
public subroutine  of_setfields1(dotnetobject anv_pdf)
public subroutine  of_setfields2(dotnetobject anv_af)
public function string get_statusmessage()
public subroutine  set_statusmessage(string as_value)
public function string get_file()
public subroutine  set_file(string as_value)
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

public subroutine  of_writeto(dotnetobject anv_os);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteTo
//*   Argument:
//*              Dotnetobject anv_os
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writeto(anv_os)
end subroutine

public subroutine  of_write();
//*-----------------------------------------------------------------*/
//*  .NET function : Write
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.write()
end subroutine

public function boolean of_removefield(string as_field);
//*-----------------------------------------------------------------*/
//*  .NET function : RemoveField
//*   Argument:
//*              String as_field
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
lbln_result = This.removefield(as_field)
Return lbln_result
end function

public function dotnetobject of_getfields();
//*-----------------------------------------------------------------*/
//*  .NET function : GetFields
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
lnv_result = This.getfields()
Return lnv_result
end function

public function string of_getfield(string as_field);
//*-----------------------------------------------------------------*/
//*  .NET function : GetField
//*   Argument:
//*              String as_field
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
ls_result = This.getfield(as_field)
Return ls_result
end function

public function boolean of_setfieldasname(string as_field,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFieldAsName
//*   Argument:
//*              String as_field
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
lbln_result = This.setfieldasname(as_field,as_value)
Return lbln_result
end function

public function boolean of_setfieldasstring(string as_field,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFieldAsString
//*   Argument:
//*              String as_field
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
lbln_result = This.setfieldasstring(as_field,as_value)
Return lbln_result
end function

public function boolean of_setfieldasaction(string as_field,dotnetobject anv_action);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFieldAsAction
//*   Argument:
//*              String as_field
//*              Dotnetobject anv_action
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
lbln_result = This.setfieldasaction(as_field,anv_action)
Return lbln_result
end function

public function boolean of_setfieldastemplate(string as_field,dotnetobject anv_template);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFieldAsTemplate
//*   Argument:
//*              String as_field
//*              Dotnetobject anv_template
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
lbln_result = This.setfieldastemplate(as_field,anv_template)
Return lbln_result
end function

public function boolean of_setfieldasimage(string as_field,dotnetobject anv_image);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFieldAsImage
//*   Argument:
//*              String as_field
//*              Dotnetobject anv_image
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
lbln_result = This.setfieldasimage(as_field,anv_image)
Return lbln_result
end function

public function boolean of_setfieldasjavascript(string as_field,dotnetobject anv_jstrigname,string as_js);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFieldAsJavascript
//*   Argument:
//*              String as_field
//*              Dotnetobject anv_jstrigname
//*              String as_js
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
lbln_result = This.setfieldasjavascript(as_field,anv_jstrigname,as_js)
Return lbln_result
end function

public function dotnetobject of_getimportedpage(dotnetobject anv_reader,long al_pagenumber);
//*-----------------------------------------------------------------*/
//*  .NET function : GetImportedPage
//*   Argument:
//*              Dotnetobject anv_reader
//*              Long al_pagenumber
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
lnv_result = This.getimportedpage(anv_reader,al_pagenumber)
Return lnv_result
end function

public function dotnetobject of_createtemplate(real ar_width,real ar_height);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateTemplate
//*   Argument:
//*              Real ar_width
//*              Real ar_height
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
lnv_result = This.createtemplate(ar_width,ar_height)
Return lnv_result
end function

public subroutine  of_setfields(dotnetobject anv_fdf);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFields
//*   Argument:
//*              Dotnetobject anv_fdf
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setfields(anv_fdf)
end subroutine

public subroutine  of_setfields1(dotnetobject anv_pdf);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFields
//*   Argument:
//*              Dotnetobject anv_pdf
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setfields(anv_pdf)
end subroutine

public subroutine  of_setfields2(dotnetobject anv_af);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFields
//*   Argument:
//*              Dotnetobject anv_af
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setfields(anv_af)
end subroutine

public function string get_statusmessage();
//*-----------------------------------------------------------------*/
//*  .NET property : StatusMessage
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
ls_result = This.statusmessage
Return ls_result
end function

public subroutine  set_statusmessage(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : StatusMessage
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.statusmessage = as_value
end subroutine

public function string get_file();
//*-----------------------------------------------------------------*/
//*  .NET property : File
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
ls_result = This.file
Return ls_result
end function

public subroutine  set_file(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : File
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.file = as_value
end subroutine

on nvo_fdfwriter.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_fdfwriter.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

