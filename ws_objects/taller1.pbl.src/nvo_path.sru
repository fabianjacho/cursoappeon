$PBExportHeader$nvo_path.sru
forward
global type nvo_path from dotnetobject
end type
end forward

global type nvo_path from dotnetobject
end type
global nvo_path nvo_path

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.parser.Path"

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
public subroutine  of_addsubpath(dotnetobject anv_subpath)
public subroutine  of_addsubpaths(dotnetobject anv_subpaths)
public subroutine  of_moveto(real ar_x,real ar_y)
public subroutine  of_lineto(real ar_x,real ar_y)
public subroutine  of_curveto(real ar_x1,real ar_y1,real ar_x2,real ar_y2,real ar_x3,real ar_y3)
public subroutine  of_curveto(real ar_x2,real ar_y2,real ar_x3,real ar_y3)
public subroutine  of_curvefromto(real ar_x1,real ar_y1,real ar_x3,real ar_y3)
public subroutine  of_rectangle(real ar_x,real ar_y,real ar_w,real ar_h)
public subroutine  of_closesubpath()
public subroutine  of_closeallsubpaths()
public function dotnetobject of_replaceclosewithline()
public function boolean of_isempty()
public function dotnetobject get_subpaths()
public function dotnetobject get_currentpoint()
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

public subroutine  of_addsubpath(dotnetobject anv_subpath);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSubpath
//*   Argument:
//*              Dotnetobject anv_subpath
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addsubpath(anv_subpath)
end subroutine

public subroutine  of_addsubpaths(dotnetobject anv_subpaths);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSubpaths
//*   Argument:
//*              Dotnetobject anv_subpaths
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addsubpaths(anv_subpaths)
end subroutine

public subroutine  of_moveto(real ar_x,real ar_y);
//*-----------------------------------------------------------------*/
//*  .NET function : MoveTo
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
This.moveto(ar_x,ar_y)
end subroutine

public subroutine  of_lineto(real ar_x,real ar_y);
//*-----------------------------------------------------------------*/
//*  .NET function : LineTo
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
This.lineto(ar_x,ar_y)
end subroutine

public subroutine  of_curveto(real ar_x1,real ar_y1,real ar_x2,real ar_y2,real ar_x3,real ar_y3);
//*-----------------------------------------------------------------*/
//*  .NET function : CurveTo
//*   Argument:
//*              Real ar_x1
//*              Real ar_y1
//*              Real ar_x2
//*              Real ar_y2
//*              Real ar_x3
//*              Real ar_y3
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.curveto(ar_x1,ar_y1,ar_x2,ar_y2,ar_x3,ar_y3)
end subroutine

public subroutine  of_curveto(real ar_x2,real ar_y2,real ar_x3,real ar_y3);
//*-----------------------------------------------------------------*/
//*  .NET function : CurveTo
//*   Argument:
//*              Real ar_x2
//*              Real ar_y2
//*              Real ar_x3
//*              Real ar_y3
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.curveto(ar_x2,ar_y2,ar_x3,ar_y3)
end subroutine

public subroutine  of_curvefromto(real ar_x1,real ar_y1,real ar_x3,real ar_y3);
//*-----------------------------------------------------------------*/
//*  .NET function : CurveFromTo
//*   Argument:
//*              Real ar_x1
//*              Real ar_y1
//*              Real ar_x3
//*              Real ar_y3
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.curvefromto(ar_x1,ar_y1,ar_x3,ar_y3)
end subroutine

public subroutine  of_rectangle(real ar_x,real ar_y,real ar_w,real ar_h);
//*-----------------------------------------------------------------*/
//*  .NET function : Rectangle
//*   Argument:
//*              Real ar_x
//*              Real ar_y
//*              Real ar_w
//*              Real ar_h
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.rectangle(ar_x,ar_y,ar_w,ar_h)
end subroutine

public subroutine  of_closesubpath();
//*-----------------------------------------------------------------*/
//*  .NET function : CloseSubpath
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.closesubpath()
end subroutine

public subroutine  of_closeallsubpaths();
//*-----------------------------------------------------------------*/
//*  .NET function : CloseAllSubpaths
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.closeallsubpaths()
end subroutine

public function dotnetobject of_replaceclosewithline();
//*-----------------------------------------------------------------*/
//*  .NET function : ReplaceCloseWithLine
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
lnv_result = This.replaceclosewithline()
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

public function dotnetobject get_subpaths();
//*-----------------------------------------------------------------*/
//*  .NET property : Subpaths
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
lnv_result = This.subpaths
Return lnv_result
end function

public function dotnetobject get_currentpoint();
//*-----------------------------------------------------------------*/
//*  .NET property : CurrentPoint
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
lnv_result = This.currentpoint
Return lnv_result
end function

on nvo_path.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_path.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

