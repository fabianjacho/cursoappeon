$PBExportHeader$nvo_barcodedatamatrix.sru
forward
global type nvo_barcodedatamatrix from dotnetobject
end type
end forward

global type nvo_barcodedatamatrix from dotnetobject
end type
global nvo_barcodedatamatrix nvo_barcodedatamatrix

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.BarcodeDatamatrix"

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
public function long of_generate(string as_text)
public function long of_generate(string as_text,string as_encoding)
public function long of_generate(blob ablo_text,long al_textoffset,long al_textsize)
public subroutine  of_placebarcode(dotnetobject anv_cb,dotnetobject anv_foreground,real ar_moduleheight,real ar_modulewidth)
public function dotnetobject of_createimage()
public function blob get_bitimage()
public function long get_height()
public subroutine  set_height(long al_value)
public function long get_width()
public subroutine  set_width(long al_value)
public function long get_ws()
public subroutine  set_ws(long al_value)
public function long get_options()
public subroutine  set_options(long al_value)
public subroutine  set_forcesquaresize(boolean abln_value)
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

public function long of_generate(string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : Generate
//*   Argument:
//*              String as_text
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
ll_result = This.generate(as_text)
Return ll_result
end function

public function long of_generate(string as_text,string as_encoding);
//*-----------------------------------------------------------------*/
//*  .NET function : Generate
//*   Argument:
//*              String as_text
//*              String as_encoding
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
ll_result = This.generate(as_text,as_encoding)
Return ll_result
end function

public function long of_generate(blob ablo_text,long al_textoffset,long al_textsize);
//*-----------------------------------------------------------------*/
//*  .NET function : Generate
//*   Argument:
//*              Blob ablo_text
//*              Long al_textoffset
//*              Long al_textsize
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
ll_result = This.generate(ablo_text,al_textoffset,al_textsize)
Return ll_result
end function

public subroutine  of_placebarcode(dotnetobject anv_cb,dotnetobject anv_foreground,real ar_moduleheight,real ar_modulewidth);
//*-----------------------------------------------------------------*/
//*  .NET function : PlaceBarcode
//*   Argument:
//*              Dotnetobject anv_cb
//*              Dotnetobject anv_foreground
//*              Real ar_moduleheight
//*              Real ar_modulewidth
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.placebarcode(anv_cb,anv_foreground,ar_moduleheight,ar_modulewidth)
end subroutine

public function dotnetobject of_createimage();
//*-----------------------------------------------------------------*/
//*  .NET function : CreateImage
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
lnv_result = This.createimage()
Return lnv_result
end function

public function blob get_bitimage();
//*-----------------------------------------------------------------*/
//*  .NET property : BitImage
//*   Return : Blob
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Blob lbyt_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lbyt_result)
	Return lbyt_result
End If

/* Trigger the dotnet property */
lbyt_result = This.bitimage
Return lbyt_result
end function

public function long get_height();
//*-----------------------------------------------------------------*/
//*  .NET property : Height
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
ll_result = This.height
Return ll_result
end function

public subroutine  set_height(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Height
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.height = al_value
end subroutine

public function long get_width();
//*-----------------------------------------------------------------*/
//*  .NET property : Width
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
ll_result = This.width
Return ll_result
end function

public subroutine  set_width(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Width
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.width = al_value
end subroutine

public function long get_ws();
//*-----------------------------------------------------------------*/
//*  .NET property : Ws
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
ll_result = This.ws
Return ll_result
end function

public subroutine  set_ws(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Ws
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.ws = al_value
end subroutine

public function long get_options();
//*-----------------------------------------------------------------*/
//*  .NET property : Options
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
ll_result = This.options
Return ll_result
end function

public subroutine  set_options(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Options
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.options = al_value
end subroutine

public subroutine  set_forcesquaresize(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ForceSquareSize
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.forcesquaresize = abln_value
end subroutine

on nvo_barcodedatamatrix.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_barcodedatamatrix.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

