$PBExportHeader$nvo_subpath.sru
forward
global type nvo_subpath from dotnetobject
end type
end forward

global type nvo_subpath from dotnetobject
end type
global nvo_subpath nvo_subpath

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.parser.Subpath"

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
public subroutine  of_setstartpoint(dotnetobject anv_startpoint)
public subroutine  of_setstartpoint(real ar_x,real ar_y)
public function dotnetobject of_getstartpoint()
public function dotnetobject of_getlastpoint()
public subroutine  of_addsegment(dotnetobject anv_segment)
public function dotnetobject of_getsegments()
public function boolean of_isempty()
public function boolean of_issinglepointopen()
public function boolean of_issinglepointclosed()
public function boolean of_isdegenerate()
public function dotnetobject of_getpiecewiselinearapproximation()
public function boolean get_closed()
public subroutine  set_closed(boolean abln_value)
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

public subroutine  of_setstartpoint(dotnetobject anv_startpoint);
//*-----------------------------------------------------------------*/
//*  .NET function : SetStartPoint
//*   Argument:
//*              Dotnetobject anv_startpoint
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setstartpoint(anv_startpoint)
end subroutine

public subroutine  of_setstartpoint(real ar_x,real ar_y);
//*-----------------------------------------------------------------*/
//*  .NET function : SetStartPoint
//*   Argument:
//*              Real ar_x
//*              Real ar_y
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setstartpoint(ar_x,ar_y)
end subroutine

public function dotnetobject of_getstartpoint();
//*-----------------------------------------------------------------*/
//*  .NET function : GetStartPoint
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
lnv_result = This.getstartpoint()
Return lnv_result
end function

public function dotnetobject of_getlastpoint();
//*-----------------------------------------------------------------*/
//*  .NET function : GetLastPoint
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
lnv_result = This.getlastpoint()
Return lnv_result
end function

public subroutine  of_addsegment(dotnetobject anv_segment);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSegment
//*   Argument:
//*              Dotnetobject anv_segment
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addsegment(anv_segment)
end subroutine

public function dotnetobject of_getsegments();
//*-----------------------------------------------------------------*/
//*  .NET function : GetSegments
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
lnv_result = This.getsegments()
Return lnv_result
end function

public function boolean of_isempty();
//*-----------------------------------------------------------------*/
//*  .NET function : IsEmpty
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
lbln_result = This.isempty()
Return lbln_result
end function

public function boolean of_issinglepointopen();
//*-----------------------------------------------------------------*/
//*  .NET function : IsSinglePointOpen
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
lbln_result = This.issinglepointopen()
Return lbln_result
end function

public function boolean of_issinglepointclosed();
//*-----------------------------------------------------------------*/
//*  .NET function : IsSinglePointClosed
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
lbln_result = This.issinglepointclosed()
Return lbln_result
end function

public function boolean of_isdegenerate();
//*-----------------------------------------------------------------*/
//*  .NET function : IsDegenerate
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
lbln_result = This.isdegenerate()
Return lbln_result
end function

public function dotnetobject of_getpiecewiselinearapproximation();
//*-----------------------------------------------------------------*/
//*  .NET function : GetPiecewiseLinearApproximation
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
lnv_result = This.getpiecewiselinearapproximation()
Return lnv_result
end function

public function boolean get_closed();
//*-----------------------------------------------------------------*/
//*  .NET property : Closed
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
lbln_result = This.closed
Return lbln_result
end function

public subroutine  set_closed(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Closed
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.closed = abln_value
end subroutine

on nvo_subpath.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_subpath.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

