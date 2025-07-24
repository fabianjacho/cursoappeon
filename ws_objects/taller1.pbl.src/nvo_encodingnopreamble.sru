$PBExportHeader$nvo_encodingnopreamble.sru
forward
global type nvo_encodingnopreamble from dotnetobject
end type
end forward

global type nvo_encodingnopreamble from dotnetobject
end type
global nvo_encodingnopreamble nvo_encodingnopreamble

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.xml.xmp.EncodingNoPreamble"

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
public function long of_getbytecount(char ach_chars[],long al_index,long al_count)
public function long of_getbytes(char ach_chars[],long al_charindex,long al_charcount,blob ablo_bytes,long al_byteindex)
public function long of_getcharcount(blob ablo_bytes,long al_index,long al_count)
public function long of_getchars(blob ablo_bytes,long al_byteindex,long al_bytecount,char ach_chars[],long al_charindex)
public function long of_getmaxbytecount(long al_charcount)
public function long of_getmaxcharcount(long al_bytecount)
public function dotnetobject of_getdecoder()
public function dotnetobject of_getencoder()
public function blob of_getpreamble()
public function string get_bodyname()
public function long get_codepage()
public function string get_encodingname()
public function string get_headername()
public function boolean get_isbrowserdisplay()
public function boolean get_isbrowsersave()
public function boolean get_ismailnewsdisplay()
public function boolean get_ismailnewssave()
public function string get_webname()
public function long get_windowscodepage()
public function boolean get_issinglebyte()
public function dotnetobject get_encoderfallback()
public subroutine  set_encoderfallback(dotnetobject anv_value)
public function dotnetobject get_decoderfallback()
public subroutine  set_decoderfallback(dotnetobject anv_value)
public function boolean get_isreadonly()
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

public function long of_getbytecount(char ach_chars[],long al_index,long al_count);
//*-----------------------------------------------------------------*/
//*  .NET function : GetByteCount
//*   Argument:
//*              Char ach_chars[]
//*              Long al_index
//*              Long al_count
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
ll_result = This.getbytecount(ref ach_chars,al_index,al_count)
Return ll_result
end function

public function long of_getbytes(char ach_chars[],long al_charindex,long al_charcount,blob ablo_bytes,long al_byteindex);
//*-----------------------------------------------------------------*/
//*  .NET function : GetBytes
//*   Argument:
//*              Char ach_chars[]
//*              Long al_charindex
//*              Long al_charcount
//*              Blob ablo_bytes
//*              Long al_byteindex
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
ll_result = This.getbytes(ref ach_chars,al_charindex,al_charcount,ablo_bytes,al_byteindex)
Return ll_result
end function

public function long of_getcharcount(blob ablo_bytes,long al_index,long al_count);
//*-----------------------------------------------------------------*/
//*  .NET function : GetCharCount
//*   Argument:
//*              Blob ablo_bytes
//*              Long al_index
//*              Long al_count
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
ll_result = This.getcharcount(ablo_bytes,al_index,al_count)
Return ll_result
end function

public function long of_getchars(blob ablo_bytes,long al_byteindex,long al_bytecount,char ach_chars[],long al_charindex);
//*-----------------------------------------------------------------*/
//*  .NET function : GetChars
//*   Argument:
//*              Blob ablo_bytes
//*              Long al_byteindex
//*              Long al_bytecount
//*              Char ach_chars[]
//*              Long al_charindex
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
ll_result = This.getchars(ablo_bytes,al_byteindex,al_bytecount,ref ach_chars,al_charindex)
Return ll_result
end function

public function long of_getmaxbytecount(long al_charcount);
//*-----------------------------------------------------------------*/
//*  .NET function : GetMaxByteCount
//*   Argument:
//*              Long al_charcount
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
ll_result = This.getmaxbytecount(al_charcount)
Return ll_result
end function

public function long of_getmaxcharcount(long al_bytecount);
//*-----------------------------------------------------------------*/
//*  .NET function : GetMaxCharCount
//*   Argument:
//*              Long al_bytecount
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
ll_result = This.getmaxcharcount(al_bytecount)
Return ll_result
end function

public function dotnetobject of_getdecoder();
//*-----------------------------------------------------------------*/
//*  .NET function : GetDecoder
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
lnv_result = This.getdecoder()
Return lnv_result
end function

public function dotnetobject of_getencoder();
//*-----------------------------------------------------------------*/
//*  .NET function : GetEncoder
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
lnv_result = This.getencoder()
Return lnv_result
end function

public function blob of_getpreamble();
//*-----------------------------------------------------------------*/
//*  .NET function : GetPreamble
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
lbyt_result = This.getpreamble()
Return lbyt_result
end function

public function string get_bodyname();
//*-----------------------------------------------------------------*/
//*  .NET property : BodyName
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
ls_result = This.bodyname
Return ls_result
end function

public function long get_codepage();
//*-----------------------------------------------------------------*/
//*  .NET property : CodePage
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
ll_result = This.codepage
Return ll_result
end function

public function string get_encodingname();
//*-----------------------------------------------------------------*/
//*  .NET property : EncodingName
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
ls_result = This.encodingname
Return ls_result
end function

public function string get_headername();
//*-----------------------------------------------------------------*/
//*  .NET property : HeaderName
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
ls_result = This.headername
Return ls_result
end function

public function boolean get_isbrowserdisplay();
//*-----------------------------------------------------------------*/
//*  .NET property : IsBrowserDisplay
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
lbln_result = This.isbrowserdisplay
Return lbln_result
end function

public function boolean get_isbrowsersave();
//*-----------------------------------------------------------------*/
//*  .NET property : IsBrowserSave
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
lbln_result = This.isbrowsersave
Return lbln_result
end function

public function boolean get_ismailnewsdisplay();
//*-----------------------------------------------------------------*/
//*  .NET property : IsMailNewsDisplay
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
lbln_result = This.ismailnewsdisplay
Return lbln_result
end function

public function boolean get_ismailnewssave();
//*-----------------------------------------------------------------*/
//*  .NET property : IsMailNewsSave
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
lbln_result = This.ismailnewssave
Return lbln_result
end function

public function string get_webname();
//*-----------------------------------------------------------------*/
//*  .NET property : WebName
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
ls_result = This.webname
Return ls_result
end function

public function long get_windowscodepage();
//*-----------------------------------------------------------------*/
//*  .NET property : WindowsCodePage
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
ll_result = This.windowscodepage
Return ll_result
end function

public function boolean get_issinglebyte();
//*-----------------------------------------------------------------*/
//*  .NET property : IsSingleByte
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
lbln_result = This.issinglebyte
Return lbln_result
end function

public function dotnetobject get_encoderfallback();
//*-----------------------------------------------------------------*/
//*  .NET property : EncoderFallback
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
lnv_result = This.encoderfallback
Return lnv_result
end function

public subroutine  set_encoderfallback(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : EncoderFallback
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.encoderfallback = anv_value
end subroutine

public function dotnetobject get_decoderfallback();
//*-----------------------------------------------------------------*/
//*  .NET property : DecoderFallback
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
lnv_result = This.decoderfallback
Return lnv_result
end function

public subroutine  set_decoderfallback(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : DecoderFallback
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.decoderfallback = anv_value
end subroutine

public function boolean get_isreadonly();
//*-----------------------------------------------------------------*/
//*  .NET property : IsReadOnly
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
lbln_result = This.isreadonly
Return lbln_result
end function

on nvo_encodingnopreamble.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_encodingnopreamble.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

