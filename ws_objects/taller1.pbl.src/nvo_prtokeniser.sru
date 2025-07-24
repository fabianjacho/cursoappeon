$PBExportHeader$nvo_prtokeniser.sru
forward
global type nvo_prtokeniser from dotnetobject
end type
end forward

global type nvo_prtokeniser from dotnetobject
end type
global nvo_prtokeniser nvo_prtokeniser

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PRTokeniser"

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
public subroutine  of_seek(longlong all_pos)
public subroutine  of_close()
public function long of_read()
public function string of_readstring(long al_size)
public function boolean of_iswhitespace(long al_ch)
public function boolean of_iswhitespace(long al_ch,boolean abln_iswhitespace)
public function boolean of_isdelimiter(long al_ch)
public subroutine  of_backoneposition(long al_ch)
public subroutine  of_throwerror(string as_error)
public function long of_getheaderoffset()
public function char of_checkpdfheader()
public subroutine  of_checkfdfheader()
public function longlong of_getstartxref()
public function long of_gethex(long al_v)
public subroutine  of_nextvalidtoken()
public function boolean of_nexttoken()
public function boolean of_readlinesegment(blob ablo_input)
public function boolean of_readlinesegment(blob ablo_input,boolean abln_isnullwhitespace)
public function any of_checkobjectstart(blob ablo_line)
public function boolean of_ishexstring()
public function longlong get_filepointer()
public function longlong get_length()
public function dotnetobject get_safefile()
public function dotnetobject get_file()
public function long get_tokentype()
public function string get_stringvalue()
public function long get_reference()
public function long get_generation()
public function longlong get_longvalue()
public function long get_intvalue()
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

public subroutine  of_seek(longlong all_pos);
//*-----------------------------------------------------------------*/
//*  .NET function : Seek
//*   Argument:
//*              Longlong all_pos
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.seek(all_pos)
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

public function long of_read();
//*-----------------------------------------------------------------*/
//*  .NET function : Read
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
ll_result = This.read()
Return ll_result
end function

public function string of_readstring(long al_size);
//*-----------------------------------------------------------------*/
//*  .NET function : ReadString
//*   Argument:
//*              Long al_size
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
ls_result = This.readstring(al_size)
Return ls_result
end function

public function boolean of_iswhitespace(long al_ch);
//*-----------------------------------------------------------------*/
//*  .NET function : IsWhitespace
//*   Argument:
//*              Long al_ch
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
lbln_result = This.iswhitespace(al_ch)
Return lbln_result
end function

public function boolean of_iswhitespace(long al_ch,boolean abln_iswhitespace);
//*-----------------------------------------------------------------*/
//*  .NET function : IsWhitespace
//*   Argument:
//*              Long al_ch
//*              Boolean abln_iswhitespace
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
lbln_result = This.iswhitespace(al_ch,abln_iswhitespace)
Return lbln_result
end function

public function boolean of_isdelimiter(long al_ch);
//*-----------------------------------------------------------------*/
//*  .NET function : IsDelimiter
//*   Argument:
//*              Long al_ch
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
lbln_result = This.isdelimiter(al_ch)
Return lbln_result
end function

public subroutine  of_backoneposition(long al_ch);
//*-----------------------------------------------------------------*/
//*  .NET function : BackOnePosition
//*   Argument:
//*              Long al_ch
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.backoneposition(al_ch)
end subroutine

public subroutine  of_throwerror(string as_error);
//*-----------------------------------------------------------------*/
//*  .NET function : ThrowError
//*   Argument:
//*              String as_error
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.throwerror(as_error)
end subroutine

public function long of_getheaderoffset();
//*-----------------------------------------------------------------*/
//*  .NET function : GetHeaderOffset
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
ll_result = This.getheaderoffset()
Return ll_result
end function

public function char of_checkpdfheader();
//*-----------------------------------------------------------------*/
//*  .NET function : CheckPdfHeader
//*   Return : Char
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Char lch_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lch_result)
	Return lch_result
End If

/* Trigger the dotnet function */
lch_result = This.checkpdfheader()
Return lch_result
end function

public subroutine  of_checkfdfheader();
//*-----------------------------------------------------------------*/
//*  .NET function : CheckFdfHeader
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.checkfdfheader()
end subroutine

public function longlong of_getstartxref();
//*-----------------------------------------------------------------*/
//*  .NET function : GetStartxref
//*   Return : Longlong
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Longlong lll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lll_result)
	Return lll_result
End If

/* Trigger the dotnet function */
lll_result = This.getstartxref()
Return lll_result
end function

public function long of_gethex(long al_v);
//*-----------------------------------------------------------------*/
//*  .NET function : GetHex
//*   Argument:
//*              Long al_v
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
ll_result = This.gethex(al_v)
Return ll_result
end function

public subroutine  of_nextvalidtoken();
//*-----------------------------------------------------------------*/
//*  .NET function : NextValidToken
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.nextvalidtoken()
end subroutine

public function boolean of_nexttoken();
//*-----------------------------------------------------------------*/
//*  .NET function : NextToken
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
lbln_result = This.nexttoken()
Return lbln_result
end function

public function boolean of_readlinesegment(blob ablo_input);
//*-----------------------------------------------------------------*/
//*  .NET function : ReadLineSegment
//*   Argument:
//*              Blob ablo_input
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
lbln_result = This.readlinesegment(ablo_input)
Return lbln_result
end function

public function boolean of_readlinesegment(blob ablo_input,boolean abln_isnullwhitespace);
//*-----------------------------------------------------------------*/
//*  .NET function : ReadLineSegment
//*   Argument:
//*              Blob ablo_input
//*              Boolean abln_isnullwhitespace
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
lbln_result = This.readlinesegment(ablo_input,abln_isnullwhitespace)
Return lbln_result
end function

public function any of_checkobjectstart(blob ablo_line);
//*-----------------------------------------------------------------*/
//*  .NET function : CheckObjectStart
//*   Argument:
//*              Blob ablo_line
//*   Return : Longlong[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Any lll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lll_result)
	Return lll_result
End If

/* Trigger the dotnet function */
lll_result = This.checkobjectstart(ablo_line)
Return lll_result
end function

public function boolean of_ishexstring();
//*-----------------------------------------------------------------*/
//*  .NET function : IsHexString
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
lbln_result = This.ishexstring()
Return lbln_result
end function

public function longlong get_filepointer();
//*-----------------------------------------------------------------*/
//*  .NET property : FilePointer
//*   Return : Longlong
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Longlong lll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lll_result)
	Return lll_result
End If

/* Trigger the dotnet property */
lll_result = This.filepointer
Return lll_result
end function

public function longlong get_length();
//*-----------------------------------------------------------------*/
//*  .NET property : Length
//*   Return : Longlong
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Longlong lll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lll_result)
	Return lll_result
End If

/* Trigger the dotnet property */
lll_result = This.length
Return lll_result
end function

public function dotnetobject get_safefile();
//*-----------------------------------------------------------------*/
//*  .NET property : SafeFile
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
lnv_result = This.safefile
Return lnv_result
end function

public function dotnetobject get_file();
//*-----------------------------------------------------------------*/
//*  .NET property : File
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
lnv_result = This.file
Return lnv_result
end function

public function long get_tokentype();
//*-----------------------------------------------------------------*/
//*  .NET property : TokenType
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
ll_result = This.tokentype
Return ll_result
end function

public function string get_stringvalue();
//*-----------------------------------------------------------------*/
//*  .NET property : StringValue
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
ls_result = This.stringvalue
Return ls_result
end function

public function long get_reference();
//*-----------------------------------------------------------------*/
//*  .NET property : Reference
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
ll_result = This.reference
Return ll_result
end function

public function long get_generation();
//*-----------------------------------------------------------------*/
//*  .NET property : Generation
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
ll_result = This.generation
Return ll_result
end function

public function longlong get_longvalue();
//*-----------------------------------------------------------------*/
//*  .NET property : LongValue
//*   Return : Longlong
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Longlong lll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lll_result)
	Return lll_result
End If

/* Trigger the dotnet property */
lll_result = This.longvalue
Return lll_result
end function

public function long get_intvalue();
//*-----------------------------------------------------------------*/
//*  .NET property : IntValue
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
ll_result = This.intvalue
Return ll_result
end function

on nvo_prtokeniser.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_prtokeniser.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

