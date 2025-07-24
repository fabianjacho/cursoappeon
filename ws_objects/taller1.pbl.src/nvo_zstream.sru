$PBExportHeader$nvo_zstream.sru
forward
global type nvo_zstream from dotnetobject
end type
end forward

global type nvo_zstream from dotnetobject
end type
global nvo_zstream nvo_zstream

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "System.util.zlib.ZStream"

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
public function long of_inflateinit()
public function long of_inflateinit(boolean abln_nowrap)
public function long of_inflateinit(long al_w)
public function long of_inflateinit(long al_w,boolean abln_nowrap)
public function long of_inflate(long al_f)
public function long of_inflateend()
public function long of_inflatesync()
public function long of_inflatesetdictionary(blob ablo_dictionary,long al_dictlength)
public function long of_deflateinit(long al_level)
public function long of_deflateinit(long al_level,boolean abln_nowrap)
public function long of_deflateinit(long al_level,long al_bits)
public function long of_deflateinit(long al_level,long al_bits,boolean abln_nowrap)
public function long of_deflate(long al_flush)
public function long of_deflateend()
public function long of_deflateparams(long al_level,long al_strategy)
public function long of_deflatesetdictionary(blob ablo_dictionary,long al_dictlength)
public subroutine  of_free()
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

public function long of_inflateinit();
//*-----------------------------------------------------------------*/
//*  .NET function : inflateInit
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
ll_result = This.inflateinit()
Return ll_result
end function

public function long of_inflateinit(boolean abln_nowrap);
//*-----------------------------------------------------------------*/
//*  .NET function : inflateInit
//*   Argument:
//*              Boolean abln_nowrap
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
ll_result = This.inflateinit(abln_nowrap)
Return ll_result
end function

public function long of_inflateinit(long al_w);
//*-----------------------------------------------------------------*/
//*  .NET function : inflateInit
//*   Argument:
//*              Long al_w
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
ll_result = This.inflateinit(al_w)
Return ll_result
end function

public function long of_inflateinit(long al_w,boolean abln_nowrap);
//*-----------------------------------------------------------------*/
//*  .NET function : inflateInit
//*   Argument:
//*              Long al_w
//*              Boolean abln_nowrap
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
ll_result = This.inflateinit(al_w,abln_nowrap)
Return ll_result
end function

public function long of_inflate(long al_f);
//*-----------------------------------------------------------------*/
//*  .NET function : inflate
//*   Argument:
//*              Long al_f
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
ll_result = This.inflate(al_f)
Return ll_result
end function

public function long of_inflateend();
//*-----------------------------------------------------------------*/
//*  .NET function : inflateEnd
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
ll_result = This.inflateend()
Return ll_result
end function

public function long of_inflatesync();
//*-----------------------------------------------------------------*/
//*  .NET function : inflateSync
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
ll_result = This.inflatesync()
Return ll_result
end function

public function long of_inflatesetdictionary(blob ablo_dictionary,long al_dictlength);
//*-----------------------------------------------------------------*/
//*  .NET function : inflateSetDictionary
//*   Argument:
//*              Blob ablo_dictionary
//*              Long al_dictlength
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
ll_result = This.inflatesetdictionary(ablo_dictionary,al_dictlength)
Return ll_result
end function

public function long of_deflateinit(long al_level);
//*-----------------------------------------------------------------*/
//*  .NET function : deflateInit
//*   Argument:
//*              Long al_level
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
ll_result = This.deflateinit(al_level)
Return ll_result
end function

public function long of_deflateinit(long al_level,boolean abln_nowrap);
//*-----------------------------------------------------------------*/
//*  .NET function : deflateInit
//*   Argument:
//*              Long al_level
//*              Boolean abln_nowrap
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
ll_result = This.deflateinit(al_level,abln_nowrap)
Return ll_result
end function

public function long of_deflateinit(long al_level,long al_bits);
//*-----------------------------------------------------------------*/
//*  .NET function : deflateInit
//*   Argument:
//*              Long al_level
//*              Long al_bits
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
ll_result = This.deflateinit(al_level,al_bits)
Return ll_result
end function

public function long of_deflateinit(long al_level,long al_bits,boolean abln_nowrap);
//*-----------------------------------------------------------------*/
//*  .NET function : deflateInit
//*   Argument:
//*              Long al_level
//*              Long al_bits
//*              Boolean abln_nowrap
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
ll_result = This.deflateinit(al_level,al_bits,abln_nowrap)
Return ll_result
end function

public function long of_deflate(long al_flush);
//*-----------------------------------------------------------------*/
//*  .NET function : deflate
//*   Argument:
//*              Long al_flush
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
ll_result = This.deflate(al_flush)
Return ll_result
end function

public function long of_deflateend();
//*-----------------------------------------------------------------*/
//*  .NET function : deflateEnd
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
ll_result = This.deflateend()
Return ll_result
end function

public function long of_deflateparams(long al_level,long al_strategy);
//*-----------------------------------------------------------------*/
//*  .NET function : deflateParams
//*   Argument:
//*              Long al_level
//*              Long al_strategy
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
ll_result = This.deflateparams(al_level,al_strategy)
Return ll_result
end function

public function long of_deflatesetdictionary(blob ablo_dictionary,long al_dictlength);
//*-----------------------------------------------------------------*/
//*  .NET function : deflateSetDictionary
//*   Argument:
//*              Blob ablo_dictionary
//*              Long al_dictlength
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
ll_result = This.deflatesetdictionary(ablo_dictionary,al_dictlength)
Return ll_result
end function

public subroutine  of_free();
//*-----------------------------------------------------------------*/
//*  .NET function : free
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.free()
end subroutine

on nvo_zstream.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_zstream.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

