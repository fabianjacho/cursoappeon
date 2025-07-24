$PBExportHeader$nvo_rectanglej.sru
forward
global type nvo_rectanglej from dotnetobject
end type
end forward

global type nvo_rectanglej from dotnetobject
end type
global nvo_rectanglej nvo_rectanglej

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "System.util.RectangleJ"

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
public subroutine  of_add(dotnetobject anv_rect)
public function long of_outcode(double adb_x,double adb_y)
public function boolean of_intersectsline(double adb_x1,double adb_y1,double adb_x2,double adb_y2)
public function dotnetobject of_intersection(dotnetobject anv_r)
public function boolean of_isempty()
public function boolean of_contains(dotnetobject anv_point)
public function boolean of_contains(double adb_x,double adb_y)
public function real get_x()
public subroutine  set_x(real ar_value)
public function real get_y()
public subroutine  set_y(real ar_value)
public function real get_width()
public subroutine  set_width(real ar_value)
public function real get_height()
public subroutine  set_height(real ar_value)
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

public subroutine  of_add(dotnetobject anv_rect);
//*-----------------------------------------------------------------*/
//*  .NET function : Add
//*   Argument:
//*              Dotnetobject anv_rect
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.add(anv_rect)
end subroutine

public function long of_outcode(double adb_x,double adb_y);
//*-----------------------------------------------------------------*/
//*  .NET function : Outcode
//*   Argument:
//*              Double adb_x
//*              Double adb_y
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
ll_result = This.outcode(adb_x,adb_y)
Return ll_result
end function

public function boolean of_intersectsline(double adb_x1,double adb_y1,double adb_x2,double adb_y2);
//*-----------------------------------------------------------------*/
//*  .NET function : IntersectsLine
//*   Argument:
//*              Double adb_x1
//*              Double adb_y1
//*              Double adb_x2
//*              Double adb_y2
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
lbln_result = This.intersectsline(adb_x1,adb_y1,adb_x2,adb_y2)
Return lbln_result
end function

public function dotnetobject of_intersection(dotnetobject anv_r);
//*-----------------------------------------------------------------*/
//*  .NET function : Intersection
//*   Argument:
//*              Dotnetobject anv_r
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
lnv_result = This.intersection(anv_r)
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

public function boolean of_contains(dotnetobject anv_point);
//*-----------------------------------------------------------------*/
//*  .NET function : Contains
//*   Argument:
//*              Dotnetobject anv_point
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
lbln_result = This.contains(anv_point)
Return lbln_result
end function

public function boolean of_contains(double adb_x,double adb_y);
//*-----------------------------------------------------------------*/
//*  .NET function : Contains
//*   Argument:
//*              Double adb_x
//*              Double adb_y
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
lbln_result = This.contains(adb_x,adb_y)
Return lbln_result
end function

public function real get_x();
//*-----------------------------------------------------------------*/
//*  .NET property : X
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
lr_result = This.x
Return lr_result
end function

public subroutine  set_x(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : X
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.x = ar_value
end subroutine

public function real get_y();
//*-----------------------------------------------------------------*/
//*  .NET property : Y
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
lr_result = This.y
Return lr_result
end function

public subroutine  set_y(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Y
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.y = ar_value
end subroutine

public function real get_width();
//*-----------------------------------------------------------------*/
//*  .NET property : Width
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
lr_result = This.width
Return lr_result
end function

public subroutine  set_width(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Width
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.width = ar_value
end subroutine

public function real get_height();
//*-----------------------------------------------------------------*/
//*  .NET property : Height
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
lr_result = This.height
Return lr_result
end function

public subroutine  set_height(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Height
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.height = ar_value
end subroutine

on nvo_rectanglej.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_rectanglej.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

