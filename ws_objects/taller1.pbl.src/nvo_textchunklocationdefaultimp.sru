$PBExportHeader$nvo_textchunklocationdefaultimp.sru
forward
global type nvo_textchunklocationdefaultimp from dotnetobject
end type
end forward

global type nvo_textchunklocationdefaultimp from dotnetobject
end type
global nvo_textchunklocationdefaultimp nvo_textchunklocationdefaultimp

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.parser.LocationTextExtractionStrategy+TextChunkLocationDefaultImp"

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
public function boolean of_sameline(dotnetobject anv_other)
public function real of_distancefromendof(dotnetobject anv_other)
public function boolean of_isatwordboundary(dotnetobject anv_previous)
public function long of_compareto(dotnetobject anv_other)
public function dotnetobject get_startlocation()
public function dotnetobject get_endlocation()
public function long get_orientationmagnitude()
public function long get_distperpendicular()
public function real get_distparallelstart()
public function real get_distparallelend()
public function real get_charspacewidth()
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

public function boolean of_sameline(dotnetobject anv_other);
//*-----------------------------------------------------------------*/
//*  .NET function : SameLine
//*   Argument:
//*              Dotnetobject anv_other
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
lbln_result = This.sameline(anv_other)
Return lbln_result
end function

public function real of_distancefromendof(dotnetobject anv_other);
//*-----------------------------------------------------------------*/
//*  .NET function : DistanceFromEndOf
//*   Argument:
//*              Dotnetobject anv_other
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
lr_result = This.distancefromendof(anv_other)
Return lr_result
end function

public function boolean of_isatwordboundary(dotnetobject anv_previous);
//*-----------------------------------------------------------------*/
//*  .NET function : IsAtWordBoundary
//*   Argument:
//*              Dotnetobject anv_previous
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
lbln_result = This.isatwordboundary(anv_previous)
Return lbln_result
end function

public function long of_compareto(dotnetobject anv_other);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareTo
//*   Argument:
//*              Dotnetobject anv_other
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
ll_result = This.compareto(anv_other)
Return ll_result
end function

public function dotnetobject get_startlocation();
//*-----------------------------------------------------------------*/
//*  .NET property : StartLocation
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
lnv_result = This.startlocation
Return lnv_result
end function

public function dotnetobject get_endlocation();
//*-----------------------------------------------------------------*/
//*  .NET property : EndLocation
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
lnv_result = This.endlocation
Return lnv_result
end function

public function long get_orientationmagnitude();
//*-----------------------------------------------------------------*/
//*  .NET property : OrientationMagnitude
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
ll_result = This.orientationmagnitude
Return ll_result
end function

public function long get_distperpendicular();
//*-----------------------------------------------------------------*/
//*  .NET property : DistPerpendicular
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
ll_result = This.distperpendicular
Return ll_result
end function

public function real get_distparallelstart();
//*-----------------------------------------------------------------*/
//*  .NET property : DistParallelStart
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet property */
lr_result = This.distparallelstart
Return lr_result
end function

public function real get_distparallelend();
//*-----------------------------------------------------------------*/
//*  .NET property : DistParallelEnd
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet property */
lr_result = This.distparallelend
Return lr_result
end function

public function real get_charspacewidth();
//*-----------------------------------------------------------------*/
//*  .NET property : CharSpaceWidth
//*   Return : Real
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Real lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet property */
lr_result = This.charspacewidth
Return lr_result
end function

on nvo_textchunklocationdefaultimp.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_textchunklocationdefaultimp.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

