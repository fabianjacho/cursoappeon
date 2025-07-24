$PBExportHeader$nvo_cmapawaredocumentfont.sru
forward
global type nvo_cmapawaredocumentfont from dotnetobject
end type
end forward

global type nvo_cmapawaredocumentfont from dotnetobject
end type
global nvo_cmapawaredocumentfont nvo_cmapawaredocumentfont

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.CMapAwareDocumentFont"

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
public function long of_getwidth(long al_char1)
public function string of_decode(blob ablo_cidbytes,long al_offset,long al_len)
public function string of_decodesinglecharacter(blob ablo_cidbytes,long al_offset,long al_len)
public function string of_encode(blob ablo_bytes,long al_offset,long al_len)
public function real of_getfontdescriptor(long al_key,real ar_fontsize)
public function long of_getkerning(long al_char1,long al_char2)
public function boolean of_haskernpairs()
public function dotnetobject of_getfullfontstream()
public function long of_getwidth(string as_text)
public function blob of_converttobytes(string as_text)
public function boolean of_charexists(long al_c)
public function any of_getfontmatrix()
public function boolean of_setkerning(long al_char1,long al_char2,long al_kern)
public function any of_getcharbbox(long al_c)
public function boolean of_isvertical()
public function long of_getdescent(string as_text)
public function long of_getascent(string as_text)
public function real of_getdescentpoint(string as_text,real ar_fontsize)
public function real of_getascentpoint(string as_text,real ar_fontsize)
public function real of_getwidthpointkerned(string as_text,real ar_fontsize)
public function real of_getwidthpoint(string as_text,real ar_fontsize)
public function real of_getwidthpoint(long al_char1,real ar_fontsize)
public subroutine  of_setfontdescriptor(long al_key,real ar_value)
public function boolean of_isembedded()
public function boolean of_isfontspecific()
public function long of_getunicodeequivalent(long al_c)
public function long of_getcidcode(long al_c)
public function boolean of_setcharadvance(long al_c,long al_advance)
public subroutine  of_correctarabicadvance()
public subroutine  of_addsubsetrange(long al_range[])
public function dotnetobject get_fontdictionary()
public function string get_postscriptfontname()
public subroutine  set_postscriptfontname(string as_value)
public function dotnetobject get_subsetranges()
public function string get_encoding()
public function long get_fonttype()
public subroutine  set_fonttype(long al_value)
public function string get_subfamily()
public function any get_codepagessupported()
public function any get_widths()
public function any get_differences()
public function any get_unicodedifferences()
public function boolean get_forcewidthsoutput()
public subroutine  set_forcewidthsoutput(boolean abln_value)
public function boolean get_directtexttobyte()
public subroutine  set_directtexttobyte(boolean abln_value)
public function boolean get_subset()
public subroutine  set_subset(boolean abln_value)
public function long get_compressionlevel()
public subroutine  set_compressionlevel(long al_value)
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

public function long of_getwidth(long al_char1);
//*-----------------------------------------------------------------*/
//*  .NET function : GetWidth
//*   Argument:
//*              Long al_char1
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
ll_result = This.getwidth(al_char1)
Return ll_result
end function

public function string of_decode(blob ablo_cidbytes,long al_offset,long al_len);
//*-----------------------------------------------------------------*/
//*  .NET function : Decode
//*   Argument:
//*              Blob ablo_cidbytes
//*              Long al_offset
//*              Long al_len
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
ls_result = This.decode(ablo_cidbytes,al_offset,al_len)
Return ls_result
end function

public function string of_decodesinglecharacter(blob ablo_cidbytes,long al_offset,long al_len);
//*-----------------------------------------------------------------*/
//*  .NET function : DecodeSingleCharacter
//*   Argument:
//*              Blob ablo_cidbytes
//*              Long al_offset
//*              Long al_len
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
ls_result = This.decodesinglecharacter(ablo_cidbytes,al_offset,al_len)
Return ls_result
end function

public function string of_encode(blob ablo_bytes,long al_offset,long al_len);
//*-----------------------------------------------------------------*/
//*  .NET function : Encode
//*   Argument:
//*              Blob ablo_bytes
//*              Long al_offset
//*              Long al_len
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
ls_result = This.encode(ablo_bytes,al_offset,al_len)
Return ls_result
end function

public function real of_getfontdescriptor(long al_key,real ar_fontsize);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFontDescriptor
//*   Argument:
//*              Long al_key
//*              Real ar_fontsize
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
lr_result = This.getfontdescriptor(al_key,ar_fontsize)
Return lr_result
end function

public function long of_getkerning(long al_char1,long al_char2);
//*-----------------------------------------------------------------*/
//*  .NET function : GetKerning
//*   Argument:
//*              Long al_char1
//*              Long al_char2
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
ll_result = This.getkerning(al_char1,al_char2)
Return ll_result
end function

public function boolean of_haskernpairs();
//*-----------------------------------------------------------------*/
//*  .NET function : HasKernPairs
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
lbln_result = This.haskernpairs()
Return lbln_result
end function

public function dotnetobject of_getfullfontstream();
//*-----------------------------------------------------------------*/
//*  .NET function : GetFullFontStream
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
lnv_result = This.getfullfontstream()
Return lnv_result
end function

public function long of_getwidth(string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : GetWidth
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
ll_result = This.getwidth(as_text)
Return ll_result
end function

public function blob of_converttobytes(string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : ConvertToBytes
//*   Argument:
//*              String as_text
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
lbyt_result = This.converttobytes(as_text)
Return lbyt_result
end function

public function boolean of_charexists(long al_c);
//*-----------------------------------------------------------------*/
//*  .NET function : CharExists
//*   Argument:
//*              Long al_c
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
lbln_result = This.charexists(al_c)
Return lbln_result
end function

public function any of_getfontmatrix();
//*-----------------------------------------------------------------*/
//*  .NET function : GetFontMatrix
//*   Return : Double[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Any ldb_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ldb_result)
	Return ldb_result
End If

/* Trigger the dotnet function */
ldb_result = This.getfontmatrix()
Return ldb_result
end function

public function boolean of_setkerning(long al_char1,long al_char2,long al_kern);
//*-----------------------------------------------------------------*/
//*  .NET function : SetKerning
//*   Argument:
//*              Long al_char1
//*              Long al_char2
//*              Long al_kern
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
lbln_result = This.setkerning(al_char1,al_char2,al_kern)
Return lbln_result
end function

public function any of_getcharbbox(long al_c);
//*-----------------------------------------------------------------*/
//*  .NET function : GetCharBBox
//*   Argument:
//*              Long al_c
//*   Return : Long[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Any ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet function */
ll_result = This.getcharbbox(al_c)
Return ll_result
end function

public function boolean of_isvertical();
//*-----------------------------------------------------------------*/
//*  .NET function : IsVertical
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
lbln_result = This.isvertical()
Return lbln_result
end function

public function long of_getdescent(string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : GetDescent
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
ll_result = This.getdescent(as_text)
Return ll_result
end function

public function long of_getascent(string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAscent
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
ll_result = This.getascent(as_text)
Return ll_result
end function

public function real of_getdescentpoint(string as_text,real ar_fontsize);
//*-----------------------------------------------------------------*/
//*  .NET function : GetDescentPoint
//*   Argument:
//*              String as_text
//*              Real ar_fontsize
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
lr_result = This.getdescentpoint(as_text,ar_fontsize)
Return lr_result
end function

public function real of_getascentpoint(string as_text,real ar_fontsize);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAscentPoint
//*   Argument:
//*              String as_text
//*              Real ar_fontsize
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
lr_result = This.getascentpoint(as_text,ar_fontsize)
Return lr_result
end function

public function real of_getwidthpointkerned(string as_text,real ar_fontsize);
//*-----------------------------------------------------------------*/
//*  .NET function : GetWidthPointKerned
//*   Argument:
//*              String as_text
//*              Real ar_fontsize
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
lr_result = This.getwidthpointkerned(as_text,ar_fontsize)
Return lr_result
end function

public function real of_getwidthpoint(string as_text,real ar_fontsize);
//*-----------------------------------------------------------------*/
//*  .NET function : GetWidthPoint
//*   Argument:
//*              String as_text
//*              Real ar_fontsize
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
lr_result = This.getwidthpoint(as_text,ar_fontsize)
Return lr_result
end function

public function real of_getwidthpoint(long al_char1,real ar_fontsize);
//*-----------------------------------------------------------------*/
//*  .NET function : GetWidthPoint
//*   Argument:
//*              Long al_char1
//*              Real ar_fontsize
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
lr_result = This.getwidthpoint(al_char1,ar_fontsize)
Return lr_result
end function

public subroutine  of_setfontdescriptor(long al_key,real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFontDescriptor
//*   Argument:
//*              Long al_key
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setfontdescriptor(al_key,ar_value)
end subroutine

public function boolean of_isembedded();
//*-----------------------------------------------------------------*/
//*  .NET function : IsEmbedded
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
lbln_result = This.isembedded()
Return lbln_result
end function

public function boolean of_isfontspecific();
//*-----------------------------------------------------------------*/
//*  .NET function : IsFontSpecific
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
lbln_result = This.isfontspecific()
Return lbln_result
end function

public function long of_getunicodeequivalent(long al_c);
//*-----------------------------------------------------------------*/
//*  .NET function : GetUnicodeEquivalent
//*   Argument:
//*              Long al_c
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
ll_result = This.getunicodeequivalent(al_c)
Return ll_result
end function

public function long of_getcidcode(long al_c);
//*-----------------------------------------------------------------*/
//*  .NET function : GetCidCode
//*   Argument:
//*              Long al_c
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
ll_result = This.getcidcode(al_c)
Return ll_result
end function

public function boolean of_setcharadvance(long al_c,long al_advance);
//*-----------------------------------------------------------------*/
//*  .NET function : SetCharAdvance
//*   Argument:
//*              Long al_c
//*              Long al_advance
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
lbln_result = This.setcharadvance(al_c,al_advance)
Return lbln_result
end function

public subroutine  of_correctarabicadvance();
//*-----------------------------------------------------------------*/
//*  .NET function : CorrectArabicAdvance
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.correctarabicadvance()
end subroutine

public subroutine  of_addsubsetrange(long al_range[]);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSubsetRange
//*   Argument:
//*              Long al_range[]
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addsubsetrange(al_range)
end subroutine

public function dotnetobject get_fontdictionary();
//*-----------------------------------------------------------------*/
//*  .NET property : FontDictionary
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
lnv_result = This.fontdictionary
Return lnv_result
end function

public function string get_postscriptfontname();
//*-----------------------------------------------------------------*/
//*  .NET property : PostscriptFontName
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
ls_result = This.postscriptfontname
Return ls_result
end function

public subroutine  set_postscriptfontname(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PostscriptFontName
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.postscriptfontname = as_value
end subroutine

public function dotnetobject get_subsetranges();
//*-----------------------------------------------------------------*/
//*  .NET property : SubsetRanges
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
lnv_result = This.subsetranges
Return lnv_result
end function

public function string get_encoding();
//*-----------------------------------------------------------------*/
//*  .NET property : Encoding
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
ls_result = This.encoding
Return ls_result
end function

public function long get_fonttype();
//*-----------------------------------------------------------------*/
//*  .NET property : FontType
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
ll_result = This.fonttype
Return ll_result
end function

public subroutine  set_fonttype(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : FontType
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.fonttype = al_value
end subroutine

public function string get_subfamily();
//*-----------------------------------------------------------------*/
//*  .NET property : Subfamily
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
ls_result = This.subfamily
Return ls_result
end function

public function any get_codepagessupported();
//*-----------------------------------------------------------------*/
//*  .NET property : CodePagesSupported
//*   Return : String[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Any ls_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ls_result)
	Return ls_result
End If

/* Trigger the dotnet property */
ls_result = This.codepagessupported
Return ls_result
end function

public function any get_widths();
//*-----------------------------------------------------------------*/
//*  .NET property : Widths
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
ll_result = This.widths
Return ll_result
end function

public function any get_differences();
//*-----------------------------------------------------------------*/
//*  .NET property : Differences
//*   Return : String[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Any ls_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ls_result)
	Return ls_result
End If

/* Trigger the dotnet property */
ls_result = This.differences
Return ls_result
end function

public function any get_unicodedifferences();
//*-----------------------------------------------------------------*/
//*  .NET property : UnicodeDifferences
//*   Return : Char[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Any lch_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lch_result)
	Return lch_result
End If

/* Trigger the dotnet property */
lch_result = This.unicodedifferences
Return lch_result
end function

public function boolean get_forcewidthsoutput();
//*-----------------------------------------------------------------*/
//*  .NET property : ForceWidthsOutput
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
lbln_result = This.forcewidthsoutput
Return lbln_result
end function

public subroutine  set_forcewidthsoutput(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ForceWidthsOutput
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.forcewidthsoutput = abln_value
end subroutine

public function boolean get_directtexttobyte();
//*-----------------------------------------------------------------*/
//*  .NET property : DirectTextToByte
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
lbln_result = This.directtexttobyte
Return lbln_result
end function

public subroutine  set_directtexttobyte(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : DirectTextToByte
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.directtexttobyte = abln_value
end subroutine

public function boolean get_subset();
//*-----------------------------------------------------------------*/
//*  .NET property : Subset
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
lbln_result = This.subset
Return lbln_result
end function

public subroutine  set_subset(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Subset
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.subset = abln_value
end subroutine

public function long get_compressionlevel();
//*-----------------------------------------------------------------*/
//*  .NET property : CompressionLevel
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
ll_result = This.compressionlevel
Return ll_result
end function

public subroutine  set_compressionlevel(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CompressionLevel
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.compressionlevel = al_value
end subroutine

on nvo_cmapawaredocumentfont.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_cmapawaredocumentfont.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

