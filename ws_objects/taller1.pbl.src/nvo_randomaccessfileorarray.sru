$PBExportHeader$nvo_randomaccessfileorarray.sru
forward
global type nvo_randomaccessfileorarray from dotnetobject
end type
end forward

global type nvo_randomaccessfileorarray from dotnetobject
end type
global nvo_randomaccessfileorarray nvo_randomaccessfileorarray

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.RandomAccessFileOrArray"

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
public function dotnetobject of_createview()
public function dotnetobject of_createsourceview()
public subroutine  of_pushback(byte abyt_b)
public function long of_read()
public function long of_read(blob ablo_b,long al_off,long al_len)
public function long of_read(blob ablo_b)
public subroutine  of_readfully(blob ablo_b)
public subroutine  of_readfully(blob ablo_b,long al_off,long al_len)
public function longlong of_skip(longlong all_n)
public function longlong of_skipbytes(longlong all_n)
public subroutine  of_reopen()
public subroutine  of_close()
public subroutine  of_seek(longlong all_pos)
public subroutine  of_seek(long al_pos)
public function boolean of_readboolean()
public function byte of_readbyte()
public function long of_readunsignedbyte()
public function int of_readshort()
public function int of_readshortle()
public function long of_readunsignedshort()
public function long of_readunsignedshortle()
public function char of_readchar()
public function char of_readcharle()
public function long of_readint()
public function long of_readintle()
public function longlong of_readunsignedint()
public function longlong of_readunsignedintle()
public function longlong of_readlong()
public function longlong of_readlongle()
public function real of_readfloat()
public function real of_readfloatle()
public function double of_readdouble()
public function double of_readdoublele()
public function string of_readline()
public function string of_readstring(long al_length,string as_encoding)
public function longlong get_length()
public function longlong get_filepointer()
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

public function dotnetobject of_createview();
//*-----------------------------------------------------------------*/
//*  .NET function : CreateView
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
lnv_result = This.createview()
Return lnv_result
end function

public function dotnetobject of_createsourceview();
//*-----------------------------------------------------------------*/
//*  .NET function : CreateSourceView
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
lnv_result = This.createsourceview()
Return lnv_result
end function

public subroutine  of_pushback(byte abyt_b);
//*-----------------------------------------------------------------*/
//*  .NET function : PushBack
//*   Argument:
//*              Byte abyt_b
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.pushback(abyt_b)
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

public function long of_read(blob ablo_b,long al_off,long al_len);
//*-----------------------------------------------------------------*/
//*  .NET function : Read
//*   Argument:
//*              Blob ablo_b
//*              Long al_off
//*              Long al_len
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
ll_result = This.read(ablo_b,al_off,al_len)
Return ll_result
end function

public function long of_read(blob ablo_b);
//*-----------------------------------------------------------------*/
//*  .NET function : Read
//*   Argument:
//*              Blob ablo_b
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
ll_result = This.read(ablo_b)
Return ll_result
end function

public subroutine  of_readfully(blob ablo_b);
//*-----------------------------------------------------------------*/
//*  .NET function : ReadFully
//*   Argument:
//*              Blob ablo_b
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.readfully(ablo_b)
end subroutine

public subroutine  of_readfully(blob ablo_b,long al_off,long al_len);
//*-----------------------------------------------------------------*/
//*  .NET function : ReadFully
//*   Argument:
//*              Blob ablo_b
//*              Long al_off
//*              Long al_len
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.readfully(ablo_b,al_off,al_len)
end subroutine

public function longlong of_skip(longlong all_n);
//*-----------------------------------------------------------------*/
//*  .NET function : Skip
//*   Argument:
//*              Longlong all_n
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
lll_result = This.skip(all_n)
Return lll_result
end function

public function longlong of_skipbytes(longlong all_n);
//*-----------------------------------------------------------------*/
//*  .NET function : SkipBytes
//*   Argument:
//*              Longlong all_n
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
lll_result = This.skipbytes(all_n)
Return lll_result
end function

public subroutine  of_reopen();
//*-----------------------------------------------------------------*/
//*  .NET function : ReOpen
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.reopen()
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

public subroutine  of_seek(long al_pos);
//*-----------------------------------------------------------------*/
//*  .NET function : Seek
//*   Argument:
//*              Long al_pos
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.seek(al_pos)
end subroutine

public function boolean of_readboolean();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadBoolean
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
lbln_result = This.readboolean()
Return lbln_result
end function

public function byte of_readbyte();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadByte
//*   Return : Byte
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Byte lbyt_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lbyt_result)
	Return lbyt_result
End If

/* Trigger the dotnet function */
lbyt_result = This.readbyte()
Return lbyt_result
end function

public function long of_readunsignedbyte();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadUnsignedByte
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
ll_result = This.readunsignedbyte()
Return ll_result
end function

public function int of_readshort();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadShort
//*   Return : Int
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Int li_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(li_result)
	Return li_result
End If

/* Trigger the dotnet function */
li_result = This.readshort()
Return li_result
end function

public function int of_readshortle();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadShortLE
//*   Return : Int
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Int li_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(li_result)
	Return li_result
End If

/* Trigger the dotnet function */
li_result = This.readshortle()
Return li_result
end function

public function long of_readunsignedshort();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadUnsignedShort
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
ll_result = This.readunsignedshort()
Return ll_result
end function

public function long of_readunsignedshortle();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadUnsignedShortLE
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
ll_result = This.readunsignedshortle()
Return ll_result
end function

public function char of_readchar();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadChar
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
lch_result = This.readchar()
Return lch_result
end function

public function char of_readcharle();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadCharLE
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
lch_result = This.readcharle()
Return lch_result
end function

public function long of_readint();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadInt
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
ll_result = This.readint()
Return ll_result
end function

public function long of_readintle();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadIntLE
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
ll_result = This.readintle()
Return ll_result
end function

public function longlong of_readunsignedint();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadUnsignedInt
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
lll_result = This.readunsignedint()
Return lll_result
end function

public function longlong of_readunsignedintle();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadUnsignedIntLE
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
lll_result = This.readunsignedintle()
Return lll_result
end function

public function longlong of_readlong();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadLong
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
lll_result = This.readlong()
Return lll_result
end function

public function longlong of_readlongle();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadLongLE
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
lll_result = This.readlongle()
Return lll_result
end function

public function real of_readfloat();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadFloat
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
lr_result = This.readfloat()
Return lr_result
end function

public function real of_readfloatle();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadFloatLE
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
lr_result = This.readfloatle()
Return lr_result
end function

public function double of_readdouble();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadDouble
//*   Return : Double
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Double ldb_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ldb_result)
	Return ldb_result
End If

/* Trigger the dotnet function */
ldb_result = This.readdouble()
Return ldb_result
end function

public function double of_readdoublele();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadDoubleLE
//*   Return : Double
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Double ldb_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ldb_result)
	Return ldb_result
End If

/* Trigger the dotnet function */
ldb_result = This.readdoublele()
Return ldb_result
end function

public function string of_readline();
//*-----------------------------------------------------------------*/
//*  .NET function : ReadLine
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
ls_result = This.readline()
Return ls_result
end function

public function string of_readstring(long al_length,string as_encoding);
//*-----------------------------------------------------------------*/
//*  .NET function : ReadString
//*   Argument:
//*              Long al_length
//*              String as_encoding
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
ls_result = This.readstring(al_length,as_encoding)
Return ls_result
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

on nvo_randomaccessfileorarray.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_randomaccessfileorarray.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

