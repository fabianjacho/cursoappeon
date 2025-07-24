$PBExportHeader$nvo_bytebuffer1.sru
forward
global type nvo_bytebuffer1 from dotnetobject
end type
end forward

global type nvo_bytebuffer1 from dotnetobject
end type
global nvo_bytebuffer1 nvo_bytebuffer1

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.ByteBuffer"

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
public subroutine  of_setcachesize(long al_size)
public subroutine  of_fillcache(long al_decimals)
public function dotnetobject of_append_i(long al_b)
public function dotnetobject of_append(blob ablo_b,long al_off,long al_len)
public function dotnetobject of_append(blob ablo_b)
public function dotnetobject of_append(string as_str)
public function dotnetobject of_append(char ach_c)
public function dotnetobject of_append(dotnetobject anv_buf)
public function dotnetobject of_append(long al_i)
public function dotnetobject of_append(longlong all_i)
public function dotnetobject of_append(byte abyt_b)
public function dotnetobject of_appendhex(byte abyt_b)
public function dotnetobject of_append(real ar_i)
public function dotnetobject of_append(double adb_d)
public function string of_formatdouble(double adb_d)
public function string of_formatdouble(double adb_d,dotnetobject anv_buf)
public subroutine  of_reset()
public function blob of_tobytearray()
public function string of_tostring()
public subroutine  of_writeto(dotnetobject anv_str)
public subroutine  of_flush()
public function long of_read(blob ablo_buffer,long al_offset,long al_count)
public function longlong of_seek(longlong all_offset,long al_origin)
public subroutine  of_setlength(longlong all_value)
public subroutine  of_write(blob ablo_buffer,long al_offset,long al_count)
public subroutine  of_writebyte(byte abyt_value)
public function long get_size()
public subroutine  set_size(long al_value)
public function blob get_buffer()
public function boolean get_canread()
public function boolean get_canseek()
public function boolean get_canwrite()
public function longlong get_length()
public function longlong get_position()
public subroutine  set_position(longlong all_value)
public function boolean get_cantimeout()
public function long get_readtimeout()
public subroutine  set_readtimeout(long al_value)
public function long get_writetimeout()
public subroutine  set_writetimeout(long al_value)
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

public subroutine  of_setcachesize(long al_size);
//*-----------------------------------------------------------------*/
//*  .NET function : SetCacheSize
//*   Argument:
//*              Long al_size
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcachesize(al_size)
end subroutine

public subroutine  of_fillcache(long al_decimals);
//*-----------------------------------------------------------------*/
//*  .NET function : FillCache
//*   Argument:
//*              Long al_decimals
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.fillcache(al_decimals)
end subroutine

public function dotnetobject of_append_i(long al_b);
//*-----------------------------------------------------------------*/
//*  .NET function : Append_i
//*   Argument:
//*              Long al_b
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
lnv_result = This.append_i(al_b)
Return lnv_result
end function

public function dotnetobject of_append(blob ablo_b,long al_off,long al_len);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              Blob ablo_b
//*              Long al_off
//*              Long al_len
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
lnv_result = This.append(ablo_b,al_off,al_len)
Return lnv_result
end function

public function dotnetobject of_append(blob ablo_b);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              Blob ablo_b
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
lnv_result = This.append(ablo_b)
Return lnv_result
end function

public function dotnetobject of_append(string as_str);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              String as_str
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
lnv_result = This.append(as_str)
Return lnv_result
end function

public function dotnetobject of_append(char ach_c);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              Char ach_c
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
lnv_result = This.append(ref ach_c)
Return lnv_result
end function

public function dotnetobject of_append(dotnetobject anv_buf);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              Dotnetobject anv_buf
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
lnv_result = This.append(anv_buf)
Return lnv_result
end function

public function dotnetobject of_append(long al_i);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              Long al_i
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
lnv_result = This.append(al_i)
Return lnv_result
end function

public function dotnetobject of_append(longlong all_i);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              Longlong all_i
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
lnv_result = This.append(all_i)
Return lnv_result
end function

public function dotnetobject of_append(byte abyt_b);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              Byte abyt_b
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
lnv_result = This.append(abyt_b)
Return lnv_result
end function

public function dotnetobject of_appendhex(byte abyt_b);
//*-----------------------------------------------------------------*/
//*  .NET function : AppendHex
//*   Argument:
//*              Byte abyt_b
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
lnv_result = This.appendhex(abyt_b)
Return lnv_result
end function

public function dotnetobject of_append(real ar_i);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              Real ar_i
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
lnv_result = This.append(ar_i)
Return lnv_result
end function

public function dotnetobject of_append(double adb_d);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              Double adb_d
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
lnv_result = This.append(adb_d)
Return lnv_result
end function

public function string of_formatdouble(double adb_d);
//*-----------------------------------------------------------------*/
//*  .NET function : FormatDouble
//*   Argument:
//*              Double adb_d
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
ls_result = This.formatdouble(adb_d)
Return ls_result
end function

public function string of_formatdouble(double adb_d,dotnetobject anv_buf);
//*-----------------------------------------------------------------*/
//*  .NET function : FormatDouble
//*   Argument:
//*              Double adb_d
//*              Dotnetobject anv_buf
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
ls_result = This.formatdouble(adb_d,anv_buf)
Return ls_result
end function

public subroutine  of_reset();
//*-----------------------------------------------------------------*/
//*  .NET function : Reset
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.reset()
end subroutine

public function blob of_tobytearray();
//*-----------------------------------------------------------------*/
//*  .NET function : ToByteArray
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
lbyt_result = This.tobytearray()
Return lbyt_result
end function

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

public subroutine  of_writeto(dotnetobject anv_str);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteTo
//*   Argument:
//*              Dotnetobject anv_str
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writeto(anv_str)
end subroutine

public subroutine  of_flush();
//*-----------------------------------------------------------------*/
//*  .NET function : Flush
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.flush()
end subroutine

public function long of_read(blob ablo_buffer,long al_offset,long al_count);
//*-----------------------------------------------------------------*/
//*  .NET function : Read
//*   Argument:
//*              Blob ablo_buffer
//*              Long al_offset
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
ll_result = This.read(ablo_buffer,al_offset,al_count)
Return ll_result
end function

public function longlong of_seek(longlong all_offset,long al_origin);
//*-----------------------------------------------------------------*/
//*  .NET function : Seek
//*   Argument:
//*              Longlong all_offset
//*              Long al_origin
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
lll_result = This.seek(all_offset,al_origin)
Return lll_result
end function

public subroutine  of_setlength(longlong all_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLength
//*   Argument:
//*              Longlong all_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlength(all_value)
end subroutine

public subroutine  of_write(blob ablo_buffer,long al_offset,long al_count);
//*-----------------------------------------------------------------*/
//*  .NET function : Write
//*   Argument:
//*              Blob ablo_buffer
//*              Long al_offset
//*              Long al_count
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.write(ablo_buffer,al_offset,al_count)
end subroutine

public subroutine  of_writebyte(byte abyt_value);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteByte
//*   Argument:
//*              Byte abyt_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writebyte(abyt_value)
end subroutine

public function long get_size();
//*-----------------------------------------------------------------*/
//*  .NET property : Size
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
ll_result = This.size
Return ll_result
end function

public subroutine  set_size(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Size
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.size = al_value
end subroutine

public function blob get_buffer();
//*-----------------------------------------------------------------*/
//*  .NET property : Buffer
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
lbyt_result = This.buffer
Return lbyt_result
end function

public function boolean get_canread();
//*-----------------------------------------------------------------*/
//*  .NET property : CanRead
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
lbln_result = This.canread
Return lbln_result
end function

public function boolean get_canseek();
//*-----------------------------------------------------------------*/
//*  .NET property : CanSeek
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
lbln_result = This.canseek
Return lbln_result
end function

public function boolean get_canwrite();
//*-----------------------------------------------------------------*/
//*  .NET property : CanWrite
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
lbln_result = This.canwrite
Return lbln_result
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

public function longlong get_position();
//*-----------------------------------------------------------------*/
//*  .NET property : Position
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
lll_result = This.position
Return lll_result
end function

public subroutine  set_position(longlong all_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Position
//*   Argument:
//*              Longlong all_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.position = all_value
end subroutine

public function boolean get_cantimeout();
//*-----------------------------------------------------------------*/
//*  .NET property : CanTimeout
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
lbln_result = This.cantimeout
Return lbln_result
end function

public function long get_readtimeout();
//*-----------------------------------------------------------------*/
//*  .NET property : ReadTimeout
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
ll_result = This.readtimeout
Return ll_result
end function

public subroutine  set_readtimeout(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ReadTimeout
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.readtimeout = al_value
end subroutine

public function long get_writetimeout();
//*-----------------------------------------------------------------*/
//*  .NET property : WriteTimeout
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
ll_result = This.writetimeout
Return ll_result
end function

public subroutine  set_writetimeout(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : WriteTimeout
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.writetimeout = al_value
end subroutine

on nvo_bytebuffer1.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_bytebuffer1.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

