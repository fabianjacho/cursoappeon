$PBExportHeader$nvo_clipperoffset.sru
forward
global type nvo_clipperoffset from dotnetobject
end type
end forward

global type nvo_clipperoffset from dotnetobject
end type
global nvo_clipperoffset nvo_clipperoffset

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.parser.clipper.ClipperOffset"

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
public subroutine  of_clear()
public subroutine  of_addpath(dotnetobject anv_path,long al_jointype,long al_endtype)
public subroutine  of_addpaths(dotnetobject anv_paths,long al_jointype,long al_endtype)
public subroutine  of_execute(ref dotnetobject anv_solution,double adb_delta)
public subroutine  of_execute1(ref dotnetobject anv_solution,double adb_delta)
public function double get_arctolerance()
public subroutine  set_arctolerance(double adb_value)
public function double get_miterlimit()
public subroutine  set_miterlimit(double adb_value)
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

public subroutine  of_clear();
//*-----------------------------------------------------------------*/
//*  .NET function : Clear
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.clear()
end subroutine

public subroutine  of_addpath(dotnetobject anv_path,long al_jointype,long al_endtype);
//*-----------------------------------------------------------------*/
//*  .NET function : AddPath
//*   Argument:
//*              Dotnetobject anv_path
//*              Long al_jointype
//*              Long al_endtype
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addpath(anv_path,al_jointype,al_endtype)
end subroutine

public subroutine  of_addpaths(dotnetobject anv_paths,long al_jointype,long al_endtype);
//*-----------------------------------------------------------------*/
//*  .NET function : AddPaths
//*   Argument:
//*              Dotnetobject anv_paths
//*              Long al_jointype
//*              Long al_endtype
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addpaths(anv_paths,al_jointype,al_endtype)
end subroutine

public subroutine  of_execute(ref dotnetobject anv_solution,double adb_delta);
//*-----------------------------------------------------------------*/
//*  .NET function : Execute
//*   Argument:
//*              Dotnetobject anv_solution
//*              Double adb_delta
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.execute(ref anv_solution,adb_delta)
end subroutine

public subroutine  of_execute1(ref dotnetobject anv_solution,double adb_delta);
//*-----------------------------------------------------------------*/
//*  .NET function : Execute
//*   Argument:
//*              Dotnetobject anv_solution
//*              Double adb_delta
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.execute(ref anv_solution,adb_delta)
end subroutine

public function double get_arctolerance();
//*-----------------------------------------------------------------*/
//*  .NET property : ArcTolerance
//*   Return : Double
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Double ldb_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ldb_result)
	Return ldb_result
End If

/* Trigger the dotnet property */
ldb_result = This.arctolerance
Return ldb_result
end function

public subroutine  set_arctolerance(double adb_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ArcTolerance
//*   Argument:
//*              Double adb_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.arctolerance = adb_value
end subroutine

public function double get_miterlimit();
//*-----------------------------------------------------------------*/
//*  .NET property : MiterLimit
//*   Return : Double
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Double ldb_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ldb_result)
	Return ldb_result
End If

/* Trigger the dotnet property */
ldb_result = This.miterlimit
Return ldb_result
end function

public subroutine  set_miterlimit(double adb_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MiterLimit
//*   Argument:
//*              Double adb_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.miterlimit = adb_value
end subroutine

on nvo_clipperoffset.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_clipperoffset.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

