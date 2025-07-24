$PBExportHeader$nvo_clipper.sru
forward
global type nvo_clipper from dotnetobject
end type
end forward

global type nvo_clipper from dotnetobject
end type
global nvo_clipper nvo_clipper

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.parser.clipper.Clipper"

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
public subroutine  of_reversepaths(dotnetobject anv_polys)
public function boolean of_orientation(dotnetobject anv_poly)
public function double of_area(dotnetobject anv_poly)
public function dotnetobject of_simplifypolygon(dotnetobject anv_poly)
public function dotnetobject of_simplifypolygon(dotnetobject anv_poly,long al_filltype)
public function dotnetobject of_simplifypolygons(dotnetobject anv_polys)
public function dotnetobject of_simplifypolygons(dotnetobject anv_polys,long al_filltype)
public function dotnetobject of_cleanpolygon(dotnetobject anv_path)
public function dotnetobject of_cleanpolygon(dotnetobject anv_path,double adb_distance)
public function dotnetobject of_cleanpolygons(dotnetobject anv_polys)
public function dotnetobject of_cleanpolygons(dotnetobject anv_polys,double adb_distance)
public function dotnetobject of_minkowskisum(dotnetobject anv_pattern,dotnetobject anv_path,boolean abln_pathisclosed)
public function dotnetobject of_minkowskisum1(dotnetobject anv_pattern,dotnetobject anv_paths,boolean abln_pathisclosed)
public function dotnetobject of_minkowskidiff(dotnetobject anv_poly1,dotnetobject anv_poly2)
public function dotnetobject of_polytreetopaths(dotnetobject anv_polytree)
public function dotnetobject of_openpathsfrompolytree(dotnetobject anv_polytree)
public function dotnetobject of_closedpathsfrompolytree(dotnetobject anv_polytree)
public function boolean of_execute(long al_cliptype,dotnetobject anv_solution)
public function boolean of_execute(long al_cliptype,dotnetobject anv_solution,long al_filltype)
public function boolean of_execute1(long al_cliptype,dotnetobject anv_polytree)
public function boolean of_execute1(long al_cliptype,dotnetobject anv_polytree,long al_filltype)
public function boolean of_execute(long al_cliptype,dotnetobject anv_solution,long al_subjfilltype,long al_clipfilltype)
public function boolean of_execute1(long al_cliptype,dotnetobject anv_polytree,long al_subjfilltype,long al_clipfilltype)
public subroutine  of_swap(ref longlong all_val1,ref longlong all_val2)
public subroutine  of_clear()
public function boolean of_addpath(dotnetobject anv_pg,long al_polytype,boolean abln_closed)
public function boolean of_addpaths(dotnetobject anv_ppg,long al_polytype,boolean abln_closed)
public function boolean get_reversesolution()
public subroutine  set_reversesolution(boolean abln_value)
public function boolean get_strictlysimple()
public subroutine  set_strictlysimple(boolean abln_value)
public function boolean get_preservecollinear()
public subroutine  set_preservecollinear(boolean abln_value)
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

public subroutine  of_reversepaths(dotnetobject anv_polys);
//*-----------------------------------------------------------------*/
//*  .NET function : ReversePaths
//*   Argument:
//*              Dotnetobject anv_polys
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.reversepaths(anv_polys)
end subroutine

public function boolean of_orientation(dotnetobject anv_poly);
//*-----------------------------------------------------------------*/
//*  .NET function : Orientation
//*   Argument:
//*              Dotnetobject anv_poly
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
lbln_result = This.orientation(anv_poly)
Return lbln_result
end function

public function double of_area(dotnetobject anv_poly);
//*-----------------------------------------------------------------*/
//*  .NET function : Area
//*   Argument:
//*              Dotnetobject anv_poly
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
ldb_result = This.area(anv_poly)
Return ldb_result
end function

public function dotnetobject of_simplifypolygon(dotnetobject anv_poly);
//*-----------------------------------------------------------------*/
//*  .NET function : SimplifyPolygon
//*   Argument:
//*              Dotnetobject anv_poly
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
lnv_result = This.simplifypolygon(anv_poly)
Return lnv_result
end function

public function dotnetobject of_simplifypolygon(dotnetobject anv_poly,long al_filltype);
//*-----------------------------------------------------------------*/
//*  .NET function : SimplifyPolygon
//*   Argument:
//*              Dotnetobject anv_poly
//*              Long al_filltype
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
lnv_result = This.simplifypolygon(anv_poly,al_filltype)
Return lnv_result
end function

public function dotnetobject of_simplifypolygons(dotnetobject anv_polys);
//*-----------------------------------------------------------------*/
//*  .NET function : SimplifyPolygons
//*   Argument:
//*              Dotnetobject anv_polys
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
lnv_result = This.simplifypolygons(anv_polys)
Return lnv_result
end function

public function dotnetobject of_simplifypolygons(dotnetobject anv_polys,long al_filltype);
//*-----------------------------------------------------------------*/
//*  .NET function : SimplifyPolygons
//*   Argument:
//*              Dotnetobject anv_polys
//*              Long al_filltype
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
lnv_result = This.simplifypolygons(anv_polys,al_filltype)
Return lnv_result
end function

public function dotnetobject of_cleanpolygon(dotnetobject anv_path);
//*-----------------------------------------------------------------*/
//*  .NET function : CleanPolygon
//*   Argument:
//*              Dotnetobject anv_path
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
lnv_result = This.cleanpolygon(anv_path)
Return lnv_result
end function

public function dotnetobject of_cleanpolygon(dotnetobject anv_path,double adb_distance);
//*-----------------------------------------------------------------*/
//*  .NET function : CleanPolygon
//*   Argument:
//*              Dotnetobject anv_path
//*              Double adb_distance
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
lnv_result = This.cleanpolygon(anv_path,adb_distance)
Return lnv_result
end function

public function dotnetobject of_cleanpolygons(dotnetobject anv_polys);
//*-----------------------------------------------------------------*/
//*  .NET function : CleanPolygons
//*   Argument:
//*              Dotnetobject anv_polys
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
lnv_result = This.cleanpolygons(anv_polys)
Return lnv_result
end function

public function dotnetobject of_cleanpolygons(dotnetobject anv_polys,double adb_distance);
//*-----------------------------------------------------------------*/
//*  .NET function : CleanPolygons
//*   Argument:
//*              Dotnetobject anv_polys
//*              Double adb_distance
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
lnv_result = This.cleanpolygons(anv_polys,adb_distance)
Return lnv_result
end function

public function dotnetobject of_minkowskisum(dotnetobject anv_pattern,dotnetobject anv_path,boolean abln_pathisclosed);
//*-----------------------------------------------------------------*/
//*  .NET function : MinkowskiSum
//*   Argument:
//*              Dotnetobject anv_pattern
//*              Dotnetobject anv_path
//*              Boolean abln_pathisclosed
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
lnv_result = This.minkowskisum(anv_pattern,anv_path,abln_pathisclosed)
Return lnv_result
end function

public function dotnetobject of_minkowskisum1(dotnetobject anv_pattern,dotnetobject anv_paths,boolean abln_pathisclosed);
//*-----------------------------------------------------------------*/
//*  .NET function : MinkowskiSum
//*   Argument:
//*              Dotnetobject anv_pattern
//*              Dotnetobject anv_paths
//*              Boolean abln_pathisclosed
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
lnv_result = This.minkowskisum(anv_pattern,anv_paths,abln_pathisclosed)
Return lnv_result
end function

public function dotnetobject of_minkowskidiff(dotnetobject anv_poly1,dotnetobject anv_poly2);
//*-----------------------------------------------------------------*/
//*  .NET function : MinkowskiDiff
//*   Argument:
//*              Dotnetobject anv_poly1
//*              Dotnetobject anv_poly2
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
lnv_result = This.minkowskidiff(anv_poly1,anv_poly2)
Return lnv_result
end function

public function dotnetobject of_polytreetopaths(dotnetobject anv_polytree);
//*-----------------------------------------------------------------*/
//*  .NET function : PolyTreeToPaths
//*   Argument:
//*              Dotnetobject anv_polytree
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
lnv_result = This.polytreetopaths(anv_polytree)
Return lnv_result
end function

public function dotnetobject of_openpathsfrompolytree(dotnetobject anv_polytree);
//*-----------------------------------------------------------------*/
//*  .NET function : OpenPathsFromPolyTree
//*   Argument:
//*              Dotnetobject anv_polytree
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
lnv_result = This.openpathsfrompolytree(anv_polytree)
Return lnv_result
end function

public function dotnetobject of_closedpathsfrompolytree(dotnetobject anv_polytree);
//*-----------------------------------------------------------------*/
//*  .NET function : ClosedPathsFromPolyTree
//*   Argument:
//*              Dotnetobject anv_polytree
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
lnv_result = This.closedpathsfrompolytree(anv_polytree)
Return lnv_result
end function

public function boolean of_execute(long al_cliptype,dotnetobject anv_solution);
//*-----------------------------------------------------------------*/
//*  .NET function : Execute
//*   Argument:
//*              Long al_cliptype
//*              Dotnetobject anv_solution
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
lbln_result = This.execute(al_cliptype,anv_solution)
Return lbln_result
end function

public function boolean of_execute(long al_cliptype,dotnetobject anv_solution,long al_filltype);
//*-----------------------------------------------------------------*/
//*  .NET function : Execute
//*   Argument:
//*              Long al_cliptype
//*              Dotnetobject anv_solution
//*              Long al_filltype
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
lbln_result = This.execute(al_cliptype,anv_solution,al_filltype)
Return lbln_result
end function

public function boolean of_execute1(long al_cliptype,dotnetobject anv_polytree);
//*-----------------------------------------------------------------*/
//*  .NET function : Execute
//*   Argument:
//*              Long al_cliptype
//*              Dotnetobject anv_polytree
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
lbln_result = This.execute(al_cliptype,anv_polytree)
Return lbln_result
end function

public function boolean of_execute1(long al_cliptype,dotnetobject anv_polytree,long al_filltype);
//*-----------------------------------------------------------------*/
//*  .NET function : Execute
//*   Argument:
//*              Long al_cliptype
//*              Dotnetobject anv_polytree
//*              Long al_filltype
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
lbln_result = This.execute(al_cliptype,anv_polytree,al_filltype)
Return lbln_result
end function

public function boolean of_execute(long al_cliptype,dotnetobject anv_solution,long al_subjfilltype,long al_clipfilltype);
//*-----------------------------------------------------------------*/
//*  .NET function : Execute
//*   Argument:
//*              Long al_cliptype
//*              Dotnetobject anv_solution
//*              Long al_subjfilltype
//*              Long al_clipfilltype
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
lbln_result = This.execute(al_cliptype,anv_solution,al_subjfilltype,al_clipfilltype)
Return lbln_result
end function

public function boolean of_execute1(long al_cliptype,dotnetobject anv_polytree,long al_subjfilltype,long al_clipfilltype);
//*-----------------------------------------------------------------*/
//*  .NET function : Execute
//*   Argument:
//*              Long al_cliptype
//*              Dotnetobject anv_polytree
//*              Long al_subjfilltype
//*              Long al_clipfilltype
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
lbln_result = This.execute(al_cliptype,anv_polytree,al_subjfilltype,al_clipfilltype)
Return lbln_result
end function

public subroutine  of_swap(ref longlong all_val1,ref longlong all_val2);
//*-----------------------------------------------------------------*/
//*  .NET function : Swap
//*   Argument:
//*              Longlong all_val1
//*              Longlong all_val2
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.swap(ref all_val1,ref all_val2)
end subroutine

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

public function boolean of_addpath(dotnetobject anv_pg,long al_polytype,boolean abln_closed);
//*-----------------------------------------------------------------*/
//*  .NET function : AddPath
//*   Argument:
//*              Dotnetobject anv_pg
//*              Long al_polytype
//*              Boolean abln_closed
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
lbln_result = This.addpath(anv_pg,al_polytype,abln_closed)
Return lbln_result
end function

public function boolean of_addpaths(dotnetobject anv_ppg,long al_polytype,boolean abln_closed);
//*-----------------------------------------------------------------*/
//*  .NET function : AddPaths
//*   Argument:
//*              Dotnetobject anv_ppg
//*              Long al_polytype
//*              Boolean abln_closed
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
lbln_result = This.addpaths(anv_ppg,al_polytype,abln_closed)
Return lbln_result
end function

public function boolean get_reversesolution();
//*-----------------------------------------------------------------*/
//*  .NET property : ReverseSolution
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
lbln_result = This.reversesolution
Return lbln_result
end function

public subroutine  set_reversesolution(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ReverseSolution
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.reversesolution = abln_value
end subroutine

public function boolean get_strictlysimple();
//*-----------------------------------------------------------------*/
//*  .NET property : StrictlySimple
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
lbln_result = This.strictlysimple
Return lbln_result
end function

public subroutine  set_strictlysimple(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : StrictlySimple
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.strictlysimple = abln_value
end subroutine

public function boolean get_preservecollinear();
//*-----------------------------------------------------------------*/
//*  .NET property : PreserveCollinear
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
lbln_result = This.preservecollinear
Return lbln_result
end function

public subroutine  set_preservecollinear(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PreserveCollinear
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.preservecollinear = abln_value
end subroutine

on nvo_clipper.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_clipper.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

