$PBExportHeader$nvo_tifffield.sru
forward
global type nvo_tifffield from dotnetobject
end type
end forward

global type nvo_tifffield from dotnetobject
end type
global nvo_tifffield nvo_tifffield

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.codec.TIFFField"

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
public function long of_gettag()
public function long of_gettype()
public function long of_getcount()
public function blob of_getasbytes()
public function any of_getaschars()
public function any of_getasshorts()
public function any of_getasints()
public function any of_getaslongs()
public function any of_getasfloats()
public function any of_getasdoubles()
public function long of_getasint(long al_index)
public function longlong of_getaslong(long al_index)
public function real of_getasfloat(long al_index)
public function double of_getasdouble(long al_index)
public function string of_getasstring(long al_index)
public function any of_getassrational(long al_index)
public function any of_getasrational(long al_index)
public function long of_compareto(dotnetobject anv_o)
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

public function long of_gettag();
//*-----------------------------------------------------------------*/
//*  .NET function : GetTag
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
ll_result = This.gettag()
Return ll_result
end function

public function long of_gettype();
//*-----------------------------------------------------------------*/
//*  .NET function : GetType
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
ll_result = This.gettype()
Return ll_result
end function

public function long of_getcount();
//*-----------------------------------------------------------------*/
//*  .NET function : GetCount
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
ll_result = This.getcount()
Return ll_result
end function

public function blob of_getasbytes();
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsBytes
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
lbyt_result = This.getasbytes()
Return lbyt_result
end function

public function any of_getaschars();
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsChars
//*   Return : Char[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Any lch_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lch_result)
	Return lch_result
End If

/* Trigger the dotnet function */
lch_result = This.getaschars()
Return lch_result
end function

public function any of_getasshorts();
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsShorts
//*   Return : Int[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Any li_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(li_result)
	Return li_result
End If

/* Trigger the dotnet function */
li_result = This.getasshorts()
Return li_result
end function

public function any of_getasints();
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsInts
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
ll_result = This.getasints()
Return ll_result
end function

public function any of_getaslongs();
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsLongs
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
lll_result = This.getaslongs()
Return lll_result
end function

public function any of_getasfloats();
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsFloats
//*   Return : Real[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Any lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet function */
lr_result = This.getasfloats()
Return lr_result
end function

public function any of_getasdoubles();
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsDoubles
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
ldb_result = This.getasdoubles()
Return ldb_result
end function

public function long of_getasint(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsInt
//*   Argument:
//*              Long al_index
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
ll_result = This.getasint(al_index)
Return ll_result
end function

public function longlong of_getaslong(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsLong
//*   Argument:
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
lll_result = This.getaslong(al_index)
Return lll_result
end function

public function real of_getasfloat(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsFloat
//*   Argument:
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
lr_result = This.getasfloat(al_index)
Return lr_result
end function

public function double of_getasdouble(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsDouble
//*   Argument:
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
ldb_result = This.getasdouble(al_index)
Return ldb_result
end function

public function string of_getasstring(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsString
//*   Argument:
//*              Long al_index
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
ls_result = This.getasstring(al_index)
Return ls_result
end function

public function any of_getassrational(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsSRational
//*   Argument:
//*              Long al_index
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
ll_result = This.getassrational(al_index)
Return ll_result
end function

public function any of_getasrational(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAsRational
//*   Argument:
//*              Long al_index
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
lll_result = This.getasrational(al_index)
Return lll_result
end function

public function long of_compareto(dotnetobject anv_o);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareTo
//*   Argument:
//*              Dotnetobject anv_o
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
ll_result = This.compareto(anv_o)
Return ll_result
end function

on nvo_tifffield.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_tifffield.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

