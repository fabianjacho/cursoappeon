$PBExportHeader$nvo_tiffdirectory.sru
forward
global type nvo_tiffdirectory from dotnetobject
end type
end forward

global type nvo_tiffdirectory from dotnetobject
end type
global nvo_tiffdirectory nvo_tiffdirectory

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.codec.TIFFDirectory"

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
public function long of_getnumentries()
public function dotnetobject of_getfield(long al_tag)
public function boolean of_istagpresent(long al_tag)
public function any of_gettags()
public function byte of_getfieldasbyte(long al_tag,long al_index)
public function byte of_getfieldasbyte(long al_tag)
public function longlong of_getfieldaslong(long al_tag,long al_index)
public function longlong of_getfieldaslong(long al_tag)
public function real of_getfieldasfloat(long al_tag,long al_index)
public function real of_getfieldasfloat(long al_tag)
public function double of_getfieldasdouble(long al_tag,long al_index)
public function double of_getfieldasdouble(long al_tag)
public function long of_getnumdirectories(dotnetobject anv_stream)
public function boolean of_isbigendian()
public function longlong of_getifdoffset()
public function longlong of_getnextifdoffset()
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

public function long of_getnumentries();
//*-----------------------------------------------------------------*/
//*  .NET function : GetNumEntries
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
ll_result = This.getnumentries()
Return ll_result
end function

public function dotnetobject of_getfield(long al_tag);
//*-----------------------------------------------------------------*/
//*  .NET function : GetField
//*   Argument:
//*              Long al_tag
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
lnv_result = This.getfield(al_tag)
Return lnv_result
end function

public function boolean of_istagpresent(long al_tag);
//*-----------------------------------------------------------------*/
//*  .NET function : IsTagPresent
//*   Argument:
//*              Long al_tag
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
lbln_result = This.istagpresent(al_tag)
Return lbln_result
end function

public function any of_gettags();
//*-----------------------------------------------------------------*/
//*  .NET function : GetTags
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
ll_result = This.gettags()
Return ll_result
end function

public function byte of_getfieldasbyte(long al_tag,long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFieldAsByte
//*   Argument:
//*              Long al_tag
//*              Long al_index
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
lbyt_result = This.getfieldasbyte(al_tag,al_index)
Return lbyt_result
end function

public function byte of_getfieldasbyte(long al_tag);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFieldAsByte
//*   Argument:
//*              Long al_tag
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
lbyt_result = This.getfieldasbyte(al_tag)
Return lbyt_result
end function

public function longlong of_getfieldaslong(long al_tag,long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFieldAsLong
//*   Argument:
//*              Long al_tag
//*              Long al_index
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
lll_result = This.getfieldaslong(al_tag,al_index)
Return lll_result
end function

public function longlong of_getfieldaslong(long al_tag);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFieldAsLong
//*   Argument:
//*              Long al_tag
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
lll_result = This.getfieldaslong(al_tag)
Return lll_result
end function

public function real of_getfieldasfloat(long al_tag,long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFieldAsFloat
//*   Argument:
//*              Long al_tag
//*              Long al_index
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
lr_result = This.getfieldasfloat(al_tag,al_index)
Return lr_result
end function

public function real of_getfieldasfloat(long al_tag);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFieldAsFloat
//*   Argument:
//*              Long al_tag
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
lr_result = This.getfieldasfloat(al_tag)
Return lr_result
end function

public function double of_getfieldasdouble(long al_tag,long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFieldAsDouble
//*   Argument:
//*              Long al_tag
//*              Long al_index
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
ldb_result = This.getfieldasdouble(al_tag,al_index)
Return ldb_result
end function

public function double of_getfieldasdouble(long al_tag);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFieldAsDouble
//*   Argument:
//*              Long al_tag
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
ldb_result = This.getfieldasdouble(al_tag)
Return ldb_result
end function

public function long of_getnumdirectories(dotnetobject anv_stream);
//*-----------------------------------------------------------------*/
//*  .NET function : GetNumDirectories
//*   Argument:
//*              Dotnetobject anv_stream
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
ll_result = This.getnumdirectories(anv_stream)
Return ll_result
end function

public function boolean of_isbigendian();
//*-----------------------------------------------------------------*/
//*  .NET function : IsBigEndian
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
lbln_result = This.isbigendian()
Return lbln_result
end function

public function longlong of_getifdoffset();
//*-----------------------------------------------------------------*/
//*  .NET function : GetIFDOffset
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
lll_result = This.getifdoffset()
Return lll_result
end function

public function longlong of_getnextifdoffset();
//*-----------------------------------------------------------------*/
//*  .NET function : GetNextIFDOffset
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
lll_result = This.getnextifdoffset()
Return lll_result
end function

on nvo_tiffdirectory.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_tiffdirectory.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

