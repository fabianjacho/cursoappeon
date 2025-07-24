$PBExportHeader$nvo_metastate.sru
forward
global type nvo_metastate from dotnetobject
end type
end forward

global type nvo_metastate from dotnetobject
end type
global nvo_metastate nvo_metastate

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.codec.wmf.MetaState"

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
public subroutine  of_addmetaobject(dotnetobject anv_obj)
public subroutine  of_selectmetaobject(long al_index,dotnetobject anv_cb)
public subroutine  of_deletemetaobject(long al_index)
public subroutine  of_savestate(dotnetobject anv_cb)
public subroutine  of_restorestate(long al_index,dotnetobject anv_cb)
public subroutine  of_cleanup(dotnetobject anv_cb)
public function real of_transformx(long al_x)
public function real of_transformy(long al_y)
public function real of_transformangle(real ar_angle)
public subroutine  set_metastate(dotnetobject anv_value)
public subroutine  set_scalingx(real ar_value)
public subroutine  set_scalingy(real ar_value)
public subroutine  set_offsetwx(long al_value)
public subroutine  set_offsetwy(long al_value)
public subroutine  set_extentwx(long al_value)
public subroutine  set_extentwy(long al_value)
public function dotnetobject get_currentpoint()
public subroutine  set_currentpoint(dotnetobject anv_value)
public function dotnetobject get_currentbrush()
public function dotnetobject get_currentpen()
public function dotnetobject get_currentfont()
public function dotnetobject get_currentbackgroundcolor()
public subroutine  set_currentbackgroundcolor(dotnetobject anv_value)
public function dotnetobject get_currenttextcolor()
public subroutine  set_currenttextcolor(dotnetobject anv_value)
public function long get_backgroundmode()
public subroutine  set_backgroundmode(long al_value)
public function long get_textalign()
public subroutine  set_textalign(long al_value)
public function long get_polyfillmode()
public subroutine  set_polyfillmode(long al_value)
public subroutine  set_linejoinrectangle(dotnetobject anv_value)
public subroutine  set_linejoinpolygon(dotnetobject anv_value)
public function boolean get_lineneutral()
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

public subroutine  of_addmetaobject(dotnetobject anv_obj);
//*-----------------------------------------------------------------*/
//*  .NET function : AddMetaObject
//*   Argument:
//*              Dotnetobject anv_obj
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addmetaobject(anv_obj)
end subroutine

public subroutine  of_selectmetaobject(long al_index,dotnetobject anv_cb);
//*-----------------------------------------------------------------*/
//*  .NET function : SelectMetaObject
//*   Argument:
//*              Long al_index
//*              Dotnetobject anv_cb
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.selectmetaobject(al_index,anv_cb)
end subroutine

public subroutine  of_deletemetaobject(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : DeleteMetaObject
//*   Argument:
//*              Long al_index
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.deletemetaobject(al_index)
end subroutine

public subroutine  of_savestate(dotnetobject anv_cb);
//*-----------------------------------------------------------------*/
//*  .NET function : SaveState
//*   Argument:
//*              Dotnetobject anv_cb
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.savestate(anv_cb)
end subroutine

public subroutine  of_restorestate(long al_index,dotnetobject anv_cb);
//*-----------------------------------------------------------------*/
//*  .NET function : RestoreState
//*   Argument:
//*              Long al_index
//*              Dotnetobject anv_cb
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.restorestate(al_index,anv_cb)
end subroutine

public subroutine  of_cleanup(dotnetobject anv_cb);
//*-----------------------------------------------------------------*/
//*  .NET function : Cleanup
//*   Argument:
//*              Dotnetobject anv_cb
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.cleanup(anv_cb)
end subroutine

public function real of_transformx(long al_x);
//*-----------------------------------------------------------------*/
//*  .NET function : TransformX
//*   Argument:
//*              Long al_x
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
lr_result = This.transformx(al_x)
Return lr_result
end function

public function real of_transformy(long al_y);
//*-----------------------------------------------------------------*/
//*  .NET function : TransformY
//*   Argument:
//*              Long al_y
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
lr_result = This.transformy(al_y)
Return lr_result
end function

public function real of_transformangle(real ar_angle);
//*-----------------------------------------------------------------*/
//*  .NET function : TransformAngle
//*   Argument:
//*              Real ar_angle
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
lr_result = This.transformangle(ar_angle)
Return lr_result
end function

public subroutine  set_metastate(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : metaState
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.metastate = anv_value
end subroutine

public subroutine  set_scalingx(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ScalingX
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.scalingx = ar_value
end subroutine

public subroutine  set_scalingy(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ScalingY
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.scalingy = ar_value
end subroutine

public subroutine  set_offsetwx(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : OffsetWx
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.offsetwx = al_value
end subroutine

public subroutine  set_offsetwy(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : OffsetWy
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.offsetwy = al_value
end subroutine

public subroutine  set_extentwx(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ExtentWx
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.extentwx = al_value
end subroutine

public subroutine  set_extentwy(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ExtentWy
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.extentwy = al_value
end subroutine

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

public subroutine  set_currentpoint(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CurrentPoint
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.currentpoint = anv_value
end subroutine

public function dotnetobject get_currentbrush();
//*-----------------------------------------------------------------*/
//*  .NET property : CurrentBrush
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
lnv_result = This.currentbrush
Return lnv_result
end function

public function dotnetobject get_currentpen();
//*-----------------------------------------------------------------*/
//*  .NET property : CurrentPen
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
lnv_result = This.currentpen
Return lnv_result
end function

public function dotnetobject get_currentfont();
//*-----------------------------------------------------------------*/
//*  .NET property : CurrentFont
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
lnv_result = This.currentfont
Return lnv_result
end function

public function dotnetobject get_currentbackgroundcolor();
//*-----------------------------------------------------------------*/
//*  .NET property : CurrentBackgroundColor
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
lnv_result = This.currentbackgroundcolor
Return lnv_result
end function

public subroutine  set_currentbackgroundcolor(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CurrentBackgroundColor
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.currentbackgroundcolor = anv_value
end subroutine

public function dotnetobject get_currenttextcolor();
//*-----------------------------------------------------------------*/
//*  .NET property : CurrentTextColor
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
lnv_result = This.currenttextcolor
Return lnv_result
end function

public subroutine  set_currenttextcolor(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CurrentTextColor
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.currenttextcolor = anv_value
end subroutine

public function long get_backgroundmode();
//*-----------------------------------------------------------------*/
//*  .NET property : BackgroundMode
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
ll_result = This.backgroundmode
Return ll_result
end function

public subroutine  set_backgroundmode(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BackgroundMode
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.backgroundmode = al_value
end subroutine

public function long get_textalign();
//*-----------------------------------------------------------------*/
//*  .NET property : TextAlign
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
ll_result = This.textalign
Return ll_result
end function

public subroutine  set_textalign(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : TextAlign
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.textalign = al_value
end subroutine

public function long get_polyfillmode();
//*-----------------------------------------------------------------*/
//*  .NET property : PolyFillMode
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
ll_result = This.polyfillmode
Return ll_result
end function

public subroutine  set_polyfillmode(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PolyFillMode
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.polyfillmode = al_value
end subroutine

public subroutine  set_linejoinrectangle(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : LineJoinRectangle
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.linejoinrectangle = anv_value
end subroutine

public subroutine  set_linejoinpolygon(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : LineJoinPolygon
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.linejoinpolygon = anv_value
end subroutine

public function boolean get_lineneutral();
//*-----------------------------------------------------------------*/
//*  .NET property : LineNeutral
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
lbln_result = This.lineneutral
Return lbln_result
end function

on nvo_metastate.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_metastate.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

