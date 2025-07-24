$PBExportHeader$nvo_rectangle.sru
forward
global type nvo_rectangle from dotnetobject
end type
end forward

global type nvo_rectangle from dotnetobject
end type
global nvo_rectangle nvo_rectangle

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.Rectangle"

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
public subroutine  of_clonenonpositionparameters(dotnetobject anv_rect)
public subroutine  of_softclonenonpositionparameters(dotnetobject anv_rect)
public function boolean of_process(dotnetobject anv_listener)
public function boolean of_iscontent()
public function boolean of_isnestable()
public subroutine  of_normalize()
public function dotnetobject of_getrectangle(real ar_top,real ar_bottom)
public function dotnetobject of_rotate()
public subroutine  of_enableborderside(long al_side)
public subroutine  of_disableborderside(long al_side)
public function real of_getleft(real ar_margin)
public function real of_getright(real ar_margin)
public function real of_gettop(real ar_margin)
public function real of_getbottom(real ar_margin)
public function boolean of_hasborders()
public function boolean of_hasborder(long al_type)
public function string of_tostring()
public function boolean of_equals(dotnetobject anv_obj)
public function long get_type()
public function dotnetobject get_chunks()
public function real get_top()
public subroutine  set_top(real ar_value)
public function long get_border()
public subroutine  set_border(long al_value)
public function real get_grayfill()
public subroutine  set_grayfill(real ar_value)
public function real get_left()
public subroutine  set_left(real ar_value)
public function real get_right()
public subroutine  set_right(real ar_value)
public function real get_bottom()
public subroutine  set_bottom(real ar_value)
public function dotnetobject get_bordercolorbottom()
public subroutine  set_bordercolorbottom(dotnetobject anv_value)
public function dotnetobject get_bordercolortop()
public subroutine  set_bordercolortop(dotnetobject anv_value)
public function dotnetobject get_bordercolorleft()
public subroutine  set_bordercolorleft(dotnetobject anv_value)
public function dotnetobject get_bordercolorright()
public subroutine  set_bordercolorright(dotnetobject anv_value)
public function real get_width()
public subroutine  set_width(real ar_value)
public function real get_height()
public function real get_borderwidth()
public subroutine  set_borderwidth(real ar_value)
public function dotnetobject get_bordercolor()
public subroutine  set_bordercolor(dotnetobject anv_value)
public function dotnetobject get_backgroundcolor()
public subroutine  set_backgroundcolor(dotnetobject anv_value)
public function long get_rotation()
public subroutine  set_rotation(long al_value)
public function real get_borderwidthleft()
public subroutine  set_borderwidthleft(real ar_value)
public function real get_borderwidthright()
public subroutine  set_borderwidthright(real ar_value)
public function real get_borderwidthtop()
public subroutine  set_borderwidthtop(real ar_value)
public function real get_borderwidthbottom()
public subroutine  set_borderwidthbottom(real ar_value)
public function boolean get_usevariableborders()
public subroutine  set_usevariableborders(boolean abln_value)
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

public subroutine  of_clonenonpositionparameters(dotnetobject anv_rect);
//*-----------------------------------------------------------------*/
//*  .NET function : CloneNonPositionParameters
//*   Argument:
//*              Dotnetobject anv_rect
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.clonenonpositionparameters(anv_rect)
end subroutine

public subroutine  of_softclonenonpositionparameters(dotnetobject anv_rect);
//*-----------------------------------------------------------------*/
//*  .NET function : SoftCloneNonPositionParameters
//*   Argument:
//*              Dotnetobject anv_rect
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.softclonenonpositionparameters(anv_rect)
end subroutine

public function boolean of_process(dotnetobject anv_listener);
//*-----------------------------------------------------------------*/
//*  .NET function : Process
//*   Argument:
//*              Dotnetobject anv_listener
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
lbln_result = This.process(anv_listener)
Return lbln_result
end function

public function boolean of_iscontent();
//*-----------------------------------------------------------------*/
//*  .NET function : IsContent
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
lbln_result = This.iscontent()
Return lbln_result
end function

public function boolean of_isnestable();
//*-----------------------------------------------------------------*/
//*  .NET function : IsNestable
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
lbln_result = This.isnestable()
Return lbln_result
end function

public subroutine  of_normalize();
//*-----------------------------------------------------------------*/
//*  .NET function : Normalize
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.normalize()
end subroutine

public function dotnetobject of_getrectangle(real ar_top,real ar_bottom);
//*-----------------------------------------------------------------*/
//*  .NET function : GetRectangle
//*   Argument:
//*              Real ar_top
//*              Real ar_bottom
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
lnv_result = This.getrectangle(ar_top,ar_bottom)
Return lnv_result
end function

public function dotnetobject of_rotate();
//*-----------------------------------------------------------------*/
//*  .NET function : Rotate
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
lnv_result = This.rotate()
Return lnv_result
end function

public subroutine  of_enableborderside(long al_side);
//*-----------------------------------------------------------------*/
//*  .NET function : EnableBorderSide
//*   Argument:
//*              Long al_side
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.enableborderside(al_side)
end subroutine

public subroutine  of_disableborderside(long al_side);
//*-----------------------------------------------------------------*/
//*  .NET function : DisableBorderSide
//*   Argument:
//*              Long al_side
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.disableborderside(al_side)
end subroutine

public function real of_getleft(real ar_margin);
//*-----------------------------------------------------------------*/
//*  .NET function : GetLeft
//*   Argument:
//*              Real ar_margin
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
lr_result = This.getleft(ar_margin)
Return lr_result
end function

public function real of_getright(real ar_margin);
//*-----------------------------------------------------------------*/
//*  .NET function : GetRight
//*   Argument:
//*              Real ar_margin
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
lr_result = This.getright(ar_margin)
Return lr_result
end function

public function real of_gettop(real ar_margin);
//*-----------------------------------------------------------------*/
//*  .NET function : GetTop
//*   Argument:
//*              Real ar_margin
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
lr_result = This.gettop(ar_margin)
Return lr_result
end function

public function real of_getbottom(real ar_margin);
//*-----------------------------------------------------------------*/
//*  .NET function : GetBottom
//*   Argument:
//*              Real ar_margin
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
lr_result = This.getbottom(ar_margin)
Return lr_result
end function

public function boolean of_hasborders();
//*-----------------------------------------------------------------*/
//*  .NET function : HasBorders
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
lbln_result = This.hasborders()
Return lbln_result
end function

public function boolean of_hasborder(long al_type);
//*-----------------------------------------------------------------*/
//*  .NET function : HasBorder
//*   Argument:
//*              Long al_type
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
lbln_result = This.hasborder(al_type)
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

public function boolean of_equals(dotnetobject anv_obj);
//*-----------------------------------------------------------------*/
//*  .NET function : Equals
//*   Argument:
//*              Dotnetobject anv_obj
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
lbln_result = This.equals(anv_obj)
Return lbln_result
end function

public function long get_type();
//*-----------------------------------------------------------------*/
//*  .NET property : Type
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
ll_result = This.type
Return ll_result
end function

public function dotnetobject get_chunks();
//*-----------------------------------------------------------------*/
//*  .NET property : Chunks
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
lnv_result = This.chunks
Return lnv_result
end function

public function real get_top();
//*-----------------------------------------------------------------*/
//*  .NET property : Top
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
lr_result = This.top
Return lr_result
end function

public subroutine  set_top(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Top
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.top = ar_value
end subroutine

public function long get_border();
//*-----------------------------------------------------------------*/
//*  .NET property : Border
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
ll_result = This.border
Return ll_result
end function

public subroutine  set_border(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Border
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.border = al_value
end subroutine

public function real get_grayfill();
//*-----------------------------------------------------------------*/
//*  .NET property : GrayFill
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
lr_result = This.grayfill
Return lr_result
end function

public subroutine  set_grayfill(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : GrayFill
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.grayfill = ar_value
end subroutine

public function real get_left();
//*-----------------------------------------------------------------*/
//*  .NET property : Left
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
lr_result = This.left
Return lr_result
end function

public subroutine  set_left(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Left
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.left = ar_value
end subroutine

public function real get_right();
//*-----------------------------------------------------------------*/
//*  .NET property : Right
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
lr_result = This.right
Return lr_result
end function

public subroutine  set_right(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Right
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.right = ar_value
end subroutine

public function real get_bottom();
//*-----------------------------------------------------------------*/
//*  .NET property : Bottom
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
lr_result = This.bottom
Return lr_result
end function

public subroutine  set_bottom(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Bottom
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.bottom = ar_value
end subroutine

public function dotnetobject get_bordercolorbottom();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorBottom
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
lnv_result = This.bordercolorbottom
Return lnv_result
end function

public subroutine  set_bordercolorbottom(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorBottom
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.bordercolorbottom = anv_value
end subroutine

public function dotnetobject get_bordercolortop();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorTop
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
lnv_result = This.bordercolortop
Return lnv_result
end function

public subroutine  set_bordercolortop(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorTop
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.bordercolortop = anv_value
end subroutine

public function dotnetobject get_bordercolorleft();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorLeft
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
lnv_result = This.bordercolorleft
Return lnv_result
end function

public subroutine  set_bordercolorleft(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorLeft
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.bordercolorleft = anv_value
end subroutine

public function dotnetobject get_bordercolorright();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorRight
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
lnv_result = This.bordercolorright
Return lnv_result
end function

public subroutine  set_bordercolorright(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColorRight
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.bordercolorright = anv_value
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

public function real get_borderwidth();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidth
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
lr_result = This.borderwidth
Return lr_result
end function

public subroutine  set_borderwidth(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidth
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.borderwidth = ar_value
end subroutine

public function dotnetobject get_bordercolor();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColor
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
lnv_result = This.bordercolor
Return lnv_result
end function

public subroutine  set_bordercolor(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderColor
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.bordercolor = anv_value
end subroutine

public function dotnetobject get_backgroundcolor();
//*-----------------------------------------------------------------*/
//*  .NET property : BackgroundColor
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
lnv_result = This.backgroundcolor
Return lnv_result
end function

public subroutine  set_backgroundcolor(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BackgroundColor
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.backgroundcolor = anv_value
end subroutine

public function long get_rotation();
//*-----------------------------------------------------------------*/
//*  .NET property : Rotation
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
ll_result = This.rotation
Return ll_result
end function

public subroutine  set_rotation(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Rotation
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.rotation = al_value
end subroutine

public function real get_borderwidthleft();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthLeft
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
lr_result = This.borderwidthleft
Return lr_result
end function

public subroutine  set_borderwidthleft(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthLeft
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.borderwidthleft = ar_value
end subroutine

public function real get_borderwidthright();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthRight
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
lr_result = This.borderwidthright
Return lr_result
end function

public subroutine  set_borderwidthright(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthRight
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.borderwidthright = ar_value
end subroutine

public function real get_borderwidthtop();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthTop
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
lr_result = This.borderwidthtop
Return lr_result
end function

public subroutine  set_borderwidthtop(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthTop
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.borderwidthtop = ar_value
end subroutine

public function real get_borderwidthbottom();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthBottom
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
lr_result = This.borderwidthbottom
Return lr_result
end function

public subroutine  set_borderwidthbottom(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderWidthBottom
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.borderwidthbottom = ar_value
end subroutine

public function boolean get_usevariableborders();
//*-----------------------------------------------------------------*/
//*  .NET property : UseVariableBorders
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
lbln_result = This.usevariableborders
Return lbln_result
end function

public subroutine  set_usevariableborders(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : UseVariableBorders
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.usevariableborders = abln_value
end subroutine

on nvo_rectangle.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_rectangle.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

