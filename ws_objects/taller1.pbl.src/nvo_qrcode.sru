$PBExportHeader$nvo_qrcode.sru
forward
global type nvo_qrcode from dotnetobject
end type
end forward

global type nvo_qrcode from dotnetobject
end type
global nvo_qrcode nvo_qrcode

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.qrcode.QRCode"

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
public function dotnetobject of_getmode()
public function dotnetobject of_geteclevel()
public function long of_getversion()
public function long of_getmatrixwidth()
public function long of_getmaskpattern()
public function long of_getnumtotalbytes()
public function long of_getnumdatabytes()
public function long of_getnumecbytes()
public function long of_getnumrsblocks()
public function dotnetobject of_getmatrix()
public function long of_at(long al_x,long al_y)
public function boolean of_isvalid()
public function string of_tostring()
public subroutine  of_setmode(dotnetobject anv_value)
public subroutine  of_seteclevel(dotnetobject anv_value)
public subroutine  of_setversion(long al_value)
public subroutine  of_setmatrixwidth(long al_value)
public subroutine  of_setmaskpattern(long al_value)
public subroutine  of_setnumtotalbytes(long al_value)
public subroutine  of_setnumdatabytes(long al_value)
public subroutine  of_setnumecbytes(long al_value)
public subroutine  of_setnumrsblocks(long al_value)
public subroutine  of_setmatrix(dotnetobject anv_value)
public function boolean of_isvalidmaskpattern(long al_maskpattern)
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

public function dotnetobject of_getmode();
//*-----------------------------------------------------------------*/
//*  .NET function : GetMode
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
lnv_result = This.getmode()
Return lnv_result
end function

public function dotnetobject of_geteclevel();
//*-----------------------------------------------------------------*/
//*  .NET function : GetECLevel
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
lnv_result = This.geteclevel()
Return lnv_result
end function

public function long of_getversion();
//*-----------------------------------------------------------------*/
//*  .NET function : GetVersion
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
ll_result = This.getversion()
Return ll_result
end function

public function long of_getmatrixwidth();
//*-----------------------------------------------------------------*/
//*  .NET function : GetMatrixWidth
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
ll_result = This.getmatrixwidth()
Return ll_result
end function

public function long of_getmaskpattern();
//*-----------------------------------------------------------------*/
//*  .NET function : GetMaskPattern
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
ll_result = This.getmaskpattern()
Return ll_result
end function

public function long of_getnumtotalbytes();
//*-----------------------------------------------------------------*/
//*  .NET function : GetNumTotalBytes
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
ll_result = This.getnumtotalbytes()
Return ll_result
end function

public function long of_getnumdatabytes();
//*-----------------------------------------------------------------*/
//*  .NET function : GetNumDataBytes
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
ll_result = This.getnumdatabytes()
Return ll_result
end function

public function long of_getnumecbytes();
//*-----------------------------------------------------------------*/
//*  .NET function : GetNumECBytes
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
ll_result = This.getnumecbytes()
Return ll_result
end function

public function long of_getnumrsblocks();
//*-----------------------------------------------------------------*/
//*  .NET function : GetNumRSBlocks
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
ll_result = This.getnumrsblocks()
Return ll_result
end function

public function dotnetobject of_getmatrix();
//*-----------------------------------------------------------------*/
//*  .NET function : GetMatrix
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
lnv_result = This.getmatrix()
Return lnv_result
end function

public function long of_at(long al_x,long al_y);
//*-----------------------------------------------------------------*/
//*  .NET function : At
//*   Argument:
//*              Long al_x
//*              Long al_y
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
ll_result = This.at(al_x,al_y)
Return ll_result
end function

public function boolean of_isvalid();
//*-----------------------------------------------------------------*/
//*  .NET function : IsValid
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
lbln_result = This.isvalid()
Return lbln_result
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

public subroutine  of_setmode(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMode
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setmode(anv_value)
end subroutine

public subroutine  of_seteclevel(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetECLevel
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.seteclevel(anv_value)
end subroutine

public subroutine  of_setversion(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetVersion
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setversion(al_value)
end subroutine

public subroutine  of_setmatrixwidth(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMatrixWidth
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setmatrixwidth(al_value)
end subroutine

public subroutine  of_setmaskpattern(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMaskPattern
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setmaskpattern(al_value)
end subroutine

public subroutine  of_setnumtotalbytes(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetNumTotalBytes
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setnumtotalbytes(al_value)
end subroutine

public subroutine  of_setnumdatabytes(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetNumDataBytes
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setnumdatabytes(al_value)
end subroutine

public subroutine  of_setnumecbytes(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetNumECBytes
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setnumecbytes(al_value)
end subroutine

public subroutine  of_setnumrsblocks(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetNumRSBlocks
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setnumrsblocks(al_value)
end subroutine

public subroutine  of_setmatrix(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMatrix
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setmatrix(anv_value)
end subroutine

public function boolean of_isvalidmaskpattern(long al_maskpattern);
//*-----------------------------------------------------------------*/
//*  .NET function : IsValidMaskPattern
//*   Argument:
//*              Long al_maskpattern
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
lbln_result = This.isvalidmaskpattern(al_maskpattern)
Return lbln_result
end function

on nvo_qrcode.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_qrcode.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

