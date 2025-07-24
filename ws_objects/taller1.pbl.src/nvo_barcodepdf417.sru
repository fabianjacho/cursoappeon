$PBExportHeader$nvo_barcodepdf417.sru
forward
global type nvo_barcodepdf417 from dotnetobject
end type
end forward

global type nvo_barcodepdf417 from dotnetobject
end type
global nvo_barcodepdf417 nvo_barcodepdf417

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.BarcodePDF417"

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
public subroutine  of_setdefaultparameters()
public subroutine  of_paintcode()
public function dotnetobject of_getimage()
public subroutine  of_settext(string as_s)
public subroutine  of_placebarcode(dotnetobject anv_cb,dotnetobject anv_foreground,real ar_moduleheight,real ar_modulewidth)
public function dotnetobject of_getbarcodesize()
public subroutine  set_macrosegmentid(long al_value)
public subroutine  set_macrosegmentcount(long al_value)
public subroutine  set_macrofileid(string as_value)
public function blob get_outbits()
public function long get_bitcolumns()
public function long get_coderows()
public subroutine  set_coderows(long al_value)
public function long get_codecolumns()
public subroutine  set_codecolumns(long al_value)
public function any get_codewords()
public function long get_lencodewords()
public subroutine  set_lencodewords(long al_value)
public function long get_errorlevel()
public subroutine  set_errorlevel(long al_value)
public function blob get_text()
public subroutine  set_text(blob ablo_value)
public function long get_options()
public subroutine  set_options(long al_value)
public function real get_aspectratio()
public subroutine  set_aspectratio(real ar_value)
public function real get_yheight()
public subroutine  set_yheight(real ar_value)
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

public subroutine  of_setdefaultparameters();
//*-----------------------------------------------------------------*/
//*  .NET function : SetDefaultParameters
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setdefaultparameters()
end subroutine

public subroutine  of_paintcode();
//*-----------------------------------------------------------------*/
//*  .NET function : PaintCode
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.paintcode()
end subroutine

public function dotnetobject of_getimage();
//*-----------------------------------------------------------------*/
//*  .NET function : GetImage
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
lnv_result = This.getimage()
Return lnv_result
end function

public subroutine  of_settext(string as_s);
//*-----------------------------------------------------------------*/
//*  .NET function : SetText
//*   Argument:
//*              String as_s
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settext(as_s)
end subroutine

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

public function dotnetobject of_getbarcodesize();
//*-----------------------------------------------------------------*/
//*  .NET function : GetBarcodeSize
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
lnv_result = This.getbarcodesize()
Return lnv_result
end function

public subroutine  set_macrosegmentid(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MacroSegmentId
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.macrosegmentid = al_value
end subroutine

public subroutine  set_macrosegmentcount(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MacroSegmentCount
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.macrosegmentcount = al_value
end subroutine

public subroutine  set_macrofileid(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MacroFileId
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.macrofileid = as_value
end subroutine

public function blob get_outbits();
//*-----------------------------------------------------------------*/
//*  .NET property : OutBits
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
lbyt_result = This.outbits
Return lbyt_result
end function

public function long get_bitcolumns();
//*-----------------------------------------------------------------*/
//*  .NET property : BitColumns
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
ll_result = This.bitcolumns
Return ll_result
end function

public function long get_coderows();
//*-----------------------------------------------------------------*/
//*  .NET property : CodeRows
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
ll_result = This.coderows
Return ll_result
end function

public subroutine  set_coderows(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CodeRows
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.coderows = al_value
end subroutine

public function long get_codecolumns();
//*-----------------------------------------------------------------*/
//*  .NET property : CodeColumns
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
ll_result = This.codecolumns
Return ll_result
end function

public subroutine  set_codecolumns(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CodeColumns
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.codecolumns = al_value
end subroutine

public function any get_codewords();
//*-----------------------------------------------------------------*/
//*  .NET property : Codewords
//*   Return : Long[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Any ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet property */
ll_result = This.codewords
Return ll_result
end function

public function long get_lencodewords();
//*-----------------------------------------------------------------*/
//*  .NET property : LenCodewords
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
ll_result = This.lencodewords
Return ll_result
end function

public subroutine  set_lencodewords(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : LenCodewords
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.lencodewords = al_value
end subroutine

public function long get_errorlevel();
//*-----------------------------------------------------------------*/
//*  .NET property : ErrorLevel
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
ll_result = This.errorlevel
Return ll_result
end function

public subroutine  set_errorlevel(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ErrorLevel
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.errorlevel = al_value
end subroutine

public function blob get_text();
//*-----------------------------------------------------------------*/
//*  .NET property : Text
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
lbyt_result = This.text
Return lbyt_result
end function

public subroutine  set_text(blob ablo_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Text
//*   Argument:
//*              Blob ablo_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.text = ablo_value
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

public function real get_aspectratio();
//*-----------------------------------------------------------------*/
//*  .NET property : AspectRatio
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet property */
lr_result = This.aspectratio
Return lr_result
end function

public subroutine  set_aspectratio(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : AspectRatio
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.aspectratio = ar_value
end subroutine

public function real get_yheight();
//*-----------------------------------------------------------------*/
//*  .NET property : YHeight
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet property */
lr_result = This.yheight
Return lr_result
end function

public subroutine  set_yheight(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : YHeight
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.yheight = ar_value
end subroutine

on nvo_barcodepdf417.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_barcodepdf417.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

