$PBExportHeader$nvo_utilities.sru
forward
global type nvo_utilities from dotnetobject
end type
end forward

global type nvo_utilities from dotnetobject
end type
global nvo_utilities nvo_utilities

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.Utilities"

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
public function dotnetobject of_getkeyset(dotnetobject anv_table)
public function boolean of_checktrueorfalse(dotnetobject anv_attributes,string as_key)
public function dotnetobject of_tourl(string as_filename)
public function string of_unescapeurl(string as_src)
public subroutine  of_skip(dotnetobject anv_istr,long al_size)
public function real of_millimeterstopoints(real ar_value)
public function real of_millimeterstoinches(real ar_value)
public function real of_pointstomillimeters(real ar_value)
public function real of_pointstoinches(real ar_value)
public function real of_inchestomillimeters(real ar_value)
public function real of_inchestopoints(real ar_value)
public function boolean of_issurrogatehigh(char ach_c)
public function boolean of_issurrogatelow(char ach_c)
public function boolean of_issurrogatepair(string as_text,long al_idx)
public function boolean of_issurrogatepair(char ach_text[],long al_idx)
public function long of_converttoutf32(char ach_highsurrogate,char ach_lowsurrogate)
public function long of_converttoutf32(char ach_text[],long al_idx)
public function long of_converttoutf32(string as_text,long al_idx)
public function string of_convertfromutf32(long al_codepoint)
public function string of_readfiletostring(string as_path)
public function string of_converttohex(blob ablo_bytes)
public function real of_computetabspace(real ar_lx,real ar_rx,real ar_tab)
public function real of_computetabspace(real ar_width,real ar_tab)
public function real of_max(real ar_array[])
public function real of_min(real ar_array[])
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

public function dotnetobject of_getkeyset(dotnetobject anv_table);
//*-----------------------------------------------------------------*/
//*  .NET function : GetKeySet
//*   Argument:
//*              Dotnetobject anv_table
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
lnv_result = This.getkeyset(anv_table)
Return lnv_result
end function

public function boolean of_checktrueorfalse(dotnetobject anv_attributes,string as_key);
//*-----------------------------------------------------------------*/
//*  .NET function : CheckTrueOrFalse
//*   Argument:
//*              Dotnetobject anv_attributes
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
lbln_result = This.checktrueorfalse(anv_attributes,as_key)
Return lbln_result
end function

public function dotnetobject of_tourl(string as_filename);
//*-----------------------------------------------------------------*/
//*  .NET function : ToURL
//*   Argument:
//*              String as_filename
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
lnv_result = This.tourl(as_filename)
Return lnv_result
end function

public function string of_unescapeurl(string as_src);
//*-----------------------------------------------------------------*/
//*  .NET function : UnEscapeURL
//*   Argument:
//*              String as_src
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
ls_result = This.unescapeurl(as_src)
Return ls_result
end function

public subroutine  of_skip(dotnetobject anv_istr,long al_size);
//*-----------------------------------------------------------------*/
//*  .NET function : Skip
//*   Argument:
//*              Dotnetobject anv_istr
//*              Long al_size
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.skip(anv_istr,al_size)
end subroutine

public function real of_millimeterstopoints(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : MillimetersToPoints
//*   Argument:
//*              Real ar_value
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.millimeterstopoints(ar_value)
Return lr_result
end function

public function real of_millimeterstoinches(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : MillimetersToInches
//*   Argument:
//*              Real ar_value
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.millimeterstoinches(ar_value)
Return lr_result
end function

public function real of_pointstomillimeters(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : PointsToMillimeters
//*   Argument:
//*              Real ar_value
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.pointstomillimeters(ar_value)
Return lr_result
end function

public function real of_pointstoinches(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : PointsToInches
//*   Argument:
//*              Real ar_value
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.pointstoinches(ar_value)
Return lr_result
end function

public function real of_inchestomillimeters(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : InchesToMillimeters
//*   Argument:
//*              Real ar_value
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.inchestomillimeters(ar_value)
Return lr_result
end function

public function real of_inchestopoints(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : InchesToPoints
//*   Argument:
//*              Real ar_value
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.inchestopoints(ar_value)
Return lr_result
end function

public function boolean of_issurrogatehigh(char ach_c);
//*-----------------------------------------------------------------*/
//*  .NET function : IsSurrogateHigh
//*   Argument:
//*              Char ach_c
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
lbln_result = This.issurrogatehigh(ref ach_c)
Return lbln_result
end function

public function boolean of_issurrogatelow(char ach_c);
//*-----------------------------------------------------------------*/
//*  .NET function : IsSurrogateLow
//*   Argument:
//*              Char ach_c
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
lbln_result = This.issurrogatelow(ref ach_c)
Return lbln_result
end function

public function boolean of_issurrogatepair(string as_text,long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : IsSurrogatePair
//*   Argument:
//*              String as_text
//*              Long al_idx
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
lbln_result = This.issurrogatepair(as_text,al_idx)
Return lbln_result
end function

public function boolean of_issurrogatepair(char ach_text[],long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : IsSurrogatePair
//*   Argument:
//*              Char ach_text[]
//*              Long al_idx
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
lbln_result = This.issurrogatepair(ref ach_text,al_idx)
Return lbln_result
end function

public function long of_converttoutf32(char ach_highsurrogate,char ach_lowsurrogate);
//*-----------------------------------------------------------------*/
//*  .NET function : ConvertToUtf32
//*   Argument:
//*              Char ach_highsurrogate
//*              Char ach_lowsurrogate
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
ll_result = This.converttoutf32(ref ach_highsurrogate,ref ach_lowsurrogate)
Return ll_result
end function

public function long of_converttoutf32(char ach_text[],long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : ConvertToUtf32
//*   Argument:
//*              Char ach_text[]
//*              Long al_idx
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
ll_result = This.converttoutf32(ref ach_text,al_idx)
Return ll_result
end function

public function long of_converttoutf32(string as_text,long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : ConvertToUtf32
//*   Argument:
//*              String as_text
//*              Long al_idx
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
ll_result = This.converttoutf32(as_text,al_idx)
Return ll_result
end function

public function string of_convertfromutf32(long al_codepoint);
//*-----------------------------------------------------------------*/
//*  .NET function : ConvertFromUtf32
//*   Argument:
//*              Long al_codepoint
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
ls_result = This.convertfromutf32(al_codepoint)
Return ls_result
end function

public function string of_readfiletostring(string as_path);
//*-----------------------------------------------------------------*/
//*  .NET function : ReadFileToString
//*   Argument:
//*              String as_path
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
ls_result = This.readfiletostring(as_path)
Return ls_result
end function

public function string of_converttohex(blob ablo_bytes);
//*-----------------------------------------------------------------*/
//*  .NET function : ConvertToHex
//*   Argument:
//*              Blob ablo_bytes
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
ls_result = This.converttohex(ablo_bytes)
Return ls_result
end function

public function real of_computetabspace(real ar_lx,real ar_rx,real ar_tab);
//*-----------------------------------------------------------------*/
//*  .NET function : ComputeTabSpace
//*   Argument:
//*              Real ar_lx
//*              Real ar_rx
//*              Real ar_tab
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.computetabspace(ar_lx,ar_rx,ar_tab)
Return lr_result
end function

public function real of_computetabspace(real ar_width,real ar_tab);
//*-----------------------------------------------------------------*/
//*  .NET function : ComputeTabSpace
//*   Argument:
//*              Real ar_width
//*              Real ar_tab
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.computetabspace(ar_width,ar_tab)
Return lr_result
end function

public function real of_max(real ar_array[]);
//*-----------------------------------------------------------------*/
//*  .NET function : Max
//*   Argument:
//*              Real ar_array[]
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.max(ar_array)
Return lr_result
end function

public function real of_min(real ar_array[]);
//*-----------------------------------------------------------------*/
//*  .NET function : Min
//*   Argument:
//*              Real ar_array[]
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.min(ar_array)
Return lr_result
end function

on nvo_utilities.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_utilities.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

