$PBExportHeader$nvo_barcodeean.sru
forward
global type nvo_barcodeean from dotnetobject
end type
end forward

global type nvo_barcodeean from dotnetobject
end type
global nvo_barcodeean nvo_barcodeean

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.BarcodeEAN"

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
public function long of_calculateeanparity(string as_code)
public function string of_convertupcatoupce(string as_text)
public function blob of_getbarsean13(string as__code)
public function blob of_getbarsean8(string as__code)
public function blob of_getbarsupce(string as__code)
public function blob of_getbarssupplemental2(string as__code)
public function blob of_getbarssupplemental5(string as__code)
public function dotnetobject of_placebarcode(dotnetobject anv_cb,dotnetobject anv_barcolor,dotnetobject anv_textcolor)
public function dotnetobject of_createtemplatewithbarcode(dotnetobject anv_cb,dotnetobject anv_barcolor,dotnetobject anv_textcolor)
public function dotnetobject of_createimagewithbarcode(dotnetobject anv_cb,dotnetobject anv_barcolor,dotnetobject anv_textcolor)
public function dotnetobject get_barcodesize()
public function real get_x()
public subroutine  set_x(real ar_value)
public function real get_n()
public subroutine  set_n(real ar_value)
public function dotnetobject get_font()
public subroutine  set_font(dotnetobject anv_value)
public function real get_size()
public subroutine  set_size(real ar_value)
public function real get_baseline()
public subroutine  set_baseline(real ar_value)
public function real get_barheight()
public subroutine  set_barheight(real ar_value)
public function long get_textalignment()
public subroutine  set_textalignment(long al_value)
public function boolean get_generatechecksum()
public subroutine  set_generatechecksum(boolean abln_value)
public function boolean get_checksumtext()
public subroutine  set_checksumtext(boolean abln_value)
public function boolean get_startstoptext()
public subroutine  set_startstoptext(boolean abln_value)
public function boolean get_extended()
public subroutine  set_extended(boolean abln_value)
public function string get_code()
public subroutine  set_code(string as_value)
public function boolean get_guardbars()
public subroutine  set_guardbars(boolean abln_value)
public function long get_codetype()
public subroutine  set_codetype(long al_value)
public function real get_inkspreading()
public subroutine  set_inkspreading(real ar_value)
public function string get_alttext()
public subroutine  set_alttext(string as_value)
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

public function long of_calculateeanparity(string as_code);
//*-----------------------------------------------------------------*/
//*  .NET function : CalculateEANParity
//*   Argument:
//*              String as_code
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
ll_result = This.calculateeanparity(as_code)
Return ll_result
end function

public function string of_convertupcatoupce(string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : ConvertUPCAtoUPCE
//*   Argument:
//*              String as_text
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
ls_result = This.convertupcatoupce(as_text)
Return ls_result
end function

public function blob of_getbarsean13(string as__code);
//*-----------------------------------------------------------------*/
//*  .NET function : GetBarsEAN13
//*   Argument:
//*              String as__code
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
lbyt_result = This.getbarsean13(as__code)
Return lbyt_result
end function

public function blob of_getbarsean8(string as__code);
//*-----------------------------------------------------------------*/
//*  .NET function : GetBarsEAN8
//*   Argument:
//*              String as__code
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
lbyt_result = This.getbarsean8(as__code)
Return lbyt_result
end function

public function blob of_getbarsupce(string as__code);
//*-----------------------------------------------------------------*/
//*  .NET function : GetBarsUPCE
//*   Argument:
//*              String as__code
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
lbyt_result = This.getbarsupce(as__code)
Return lbyt_result
end function

public function blob of_getbarssupplemental2(string as__code);
//*-----------------------------------------------------------------*/
//*  .NET function : GetBarsSupplemental2
//*   Argument:
//*              String as__code
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
lbyt_result = This.getbarssupplemental2(as__code)
Return lbyt_result
end function

public function blob of_getbarssupplemental5(string as__code);
//*-----------------------------------------------------------------*/
//*  .NET function : GetBarsSupplemental5
//*   Argument:
//*              String as__code
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
lbyt_result = This.getbarssupplemental5(as__code)
Return lbyt_result
end function

public function dotnetobject of_placebarcode(dotnetobject anv_cb,dotnetobject anv_barcolor,dotnetobject anv_textcolor);
//*-----------------------------------------------------------------*/
//*  .NET function : PlaceBarcode
//*   Argument:
//*              Dotnetobject anv_cb
//*              Dotnetobject anv_barcolor
//*              Dotnetobject anv_textcolor
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
lnv_result = This.placebarcode(anv_cb,anv_barcolor,anv_textcolor)
Return lnv_result
end function

public function dotnetobject of_createtemplatewithbarcode(dotnetobject anv_cb,dotnetobject anv_barcolor,dotnetobject anv_textcolor);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateTemplateWithBarcode
//*   Argument:
//*              Dotnetobject anv_cb
//*              Dotnetobject anv_barcolor
//*              Dotnetobject anv_textcolor
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
lnv_result = This.createtemplatewithbarcode(anv_cb,anv_barcolor,anv_textcolor)
Return lnv_result
end function

public function dotnetobject of_createimagewithbarcode(dotnetobject anv_cb,dotnetobject anv_barcolor,dotnetobject anv_textcolor);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateImageWithBarcode
//*   Argument:
//*              Dotnetobject anv_cb
//*              Dotnetobject anv_barcolor
//*              Dotnetobject anv_textcolor
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
lnv_result = This.createimagewithbarcode(anv_cb,anv_barcolor,anv_textcolor)
Return lnv_result
end function

public function dotnetobject get_barcodesize();
//*-----------------------------------------------------------------*/
//*  .NET property : BarcodeSize
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
lnv_result = This.barcodesize
Return lnv_result
end function

public function real get_x();
//*-----------------------------------------------------------------*/
//*  .NET property : X
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
lr_result = This.x
Return lr_result
end function

public subroutine  set_x(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : X
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.x = ar_value
end subroutine

public function real get_n();
//*-----------------------------------------------------------------*/
//*  .NET property : N
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
lr_result = This.n
Return lr_result
end function

public subroutine  set_n(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : N
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.n = ar_value
end subroutine

public function dotnetobject get_font();
//*-----------------------------------------------------------------*/
//*  .NET property : Font
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
lnv_result = This.font
Return lnv_result
end function

public subroutine  set_font(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Font
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.font = anv_value
end subroutine

public function real get_size();
//*-----------------------------------------------------------------*/
//*  .NET property : Size
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
lr_result = This.size
Return lr_result
end function

public subroutine  set_size(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Size
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.size = ar_value
end subroutine

public function real get_baseline();
//*-----------------------------------------------------------------*/
//*  .NET property : Baseline
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
lr_result = This.baseline
Return lr_result
end function

public subroutine  set_baseline(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Baseline
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.baseline = ar_value
end subroutine

public function real get_barheight();
//*-----------------------------------------------------------------*/
//*  .NET property : BarHeight
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
lr_result = This.barheight
Return lr_result
end function

public subroutine  set_barheight(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BarHeight
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.barheight = ar_value
end subroutine

public function long get_textalignment();
//*-----------------------------------------------------------------*/
//*  .NET property : TextAlignment
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
ll_result = This.textalignment
Return ll_result
end function

public subroutine  set_textalignment(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : TextAlignment
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.textalignment = al_value
end subroutine

public function boolean get_generatechecksum();
//*-----------------------------------------------------------------*/
//*  .NET property : GenerateChecksum
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
lbln_result = This.generatechecksum
Return lbln_result
end function

public subroutine  set_generatechecksum(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : GenerateChecksum
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.generatechecksum = abln_value
end subroutine

public function boolean get_checksumtext();
//*-----------------------------------------------------------------*/
//*  .NET property : ChecksumText
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
lbln_result = This.checksumtext
Return lbln_result
end function

public subroutine  set_checksumtext(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ChecksumText
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.checksumtext = abln_value
end subroutine

public function boolean get_startstoptext();
//*-----------------------------------------------------------------*/
//*  .NET property : StartStopText
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
lbln_result = This.startstoptext
Return lbln_result
end function

public subroutine  set_startstoptext(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : StartStopText
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.startstoptext = abln_value
end subroutine

public function boolean get_extended();
//*-----------------------------------------------------------------*/
//*  .NET property : Extended
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
lbln_result = This.extended
Return lbln_result
end function

public subroutine  set_extended(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Extended
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.extended = abln_value
end subroutine

public function string get_code();
//*-----------------------------------------------------------------*/
//*  .NET property : Code
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
ls_result = This.code
Return ls_result
end function

public subroutine  set_code(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Code
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.code = as_value
end subroutine

public function boolean get_guardbars();
//*-----------------------------------------------------------------*/
//*  .NET property : GuardBars
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
lbln_result = This.guardbars
Return lbln_result
end function

public subroutine  set_guardbars(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : GuardBars
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.guardbars = abln_value
end subroutine

public function long get_codetype();
//*-----------------------------------------------------------------*/
//*  .NET property : CodeType
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
ll_result = This.codetype
Return ll_result
end function

public subroutine  set_codetype(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CodeType
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.codetype = al_value
end subroutine

public function real get_inkspreading();
//*-----------------------------------------------------------------*/
//*  .NET property : InkSpreading
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
lr_result = This.inkspreading
Return lr_result
end function

public subroutine  set_inkspreading(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : InkSpreading
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.inkspreading = ar_value
end subroutine

public function string get_alttext();
//*-----------------------------------------------------------------*/
//*  .NET property : AltText
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
ls_result = This.alttext
Return ls_result
end function

public subroutine  set_alttext(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : AltText
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.alttext = as_value
end subroutine

on nvo_barcodeean.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_barcodeean.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

