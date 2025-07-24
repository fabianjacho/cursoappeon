$PBExportHeader$nvo_pdfdiv.sru
forward
global type nvo_pdfdiv from dotnetobject
end type
end forward

global type nvo_pdfdiv from dotnetobject
end type
global nvo_pdfdiv nvo_pdfdiv

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PdfDiv"

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
public function real of_getactualheight()
public function real of_getactualwidth()
public subroutine  of_setbackgroundimage(dotnetobject anv_image,real ar_width,real ar_height)
public function boolean of_iscontent()
public function boolean of_isnestable()
public function boolean of_process(dotnetobject anv_listener)
public subroutine  of_addelement(dotnetobject anv_element)
public function long of_layout(dotnetobject anv_canvas,boolean abln_useascender,boolean abln_simulate,real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public function dotnetobject of_getaccessibleattribute(dotnetobject anv_key)
public subroutine  of_setaccessibleattribute(dotnetobject anv_key,dotnetobject anv_value)
public function dotnetobject of_getaccessibleattributes()
public function real get_left()
public subroutine  set_left(real ar_value)
public function real get_top()
public subroutine  set_top(real ar_value)
public function real get_right()
public subroutine  set_right(real ar_value)
public function real get_bottom()
public subroutine  set_bottom(real ar_value)
public function real get_width()
public subroutine  set_width(real ar_value)
public function real get_height()
public subroutine  set_height(real ar_value)
public function real get_percentageheight()
public subroutine  set_percentageheight(real ar_value)
public function real get_percentagewidth()
public subroutine  set_percentagewidth(real ar_value)
public function real get_contentwidth()
public subroutine  set_contentwidth(real ar_value)
public function real get_contentheight()
public subroutine  set_contentheight(real ar_value)
public function long get_textalignment()
public subroutine  set_textalignment(long al_value)
public function real get_paddingleft()
public subroutine  set_paddingleft(real ar_value)
public function real get_paddingright()
public subroutine  set_paddingright(real ar_value)
public function real get_paddingtop()
public subroutine  set_paddingtop(real ar_value)
public function real get_paddingbottom()
public subroutine  set_paddingbottom(real ar_value)
public function long get_float()
public subroutine  set_float(long al_value)
public function long get_position()
public subroutine  set_position(long al_value)
public function dotnetobject get_floatlayout()
public subroutine  set_floatlayout(dotnetobject anv_value)
public function long get_display()
public subroutine  set_display(long al_value)
public function dotnetobject get_backgroundcolor()
public subroutine  set_backgroundcolor(dotnetobject anv_value)
public subroutine  set_backgroundimage(dotnetobject anv_value)
public function real get_yline()
public function long get_rundirection()
public subroutine  set_rundirection(long al_value)
public function real get_spacingbefore()
public subroutine  set_spacingbefore(real ar_value)
public function real get_spacingafter()
public subroutine  set_spacingafter(real ar_value)
public function dotnetobject get_content()
public function long get_borderstyle()
public subroutine  set_borderstyle(long al_value)
public function boolean get_keeptogether()
public subroutine  set_keeptogether(boolean abln_value)
public function dotnetobject get_chunks()
public function long get_type()
public function dotnetobject get_role()
public subroutine  set_role(dotnetobject anv_value)
public function dotnetobject get_id()
public subroutine  set_id(dotnetobject anv_value)
public function boolean get_isinline()
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

public function real of_getactualheight();
//*-----------------------------------------------------------------*/
//*  .NET function : getActualHeight
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
lr_result = This.getactualheight()
Return lr_result
end function

public function real of_getactualwidth();
//*-----------------------------------------------------------------*/
//*  .NET function : getActualWidth
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
lr_result = This.getactualwidth()
Return lr_result
end function

public subroutine  of_setbackgroundimage(dotnetobject anv_image,real ar_width,real ar_height);
//*-----------------------------------------------------------------*/
//*  .NET function : SetBackgroundImage
//*   Argument:
//*              Dotnetobject anv_image
//*              Real ar_width
//*              Real ar_height
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setbackgroundimage(anv_image,ar_width,ar_height)
end subroutine

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

public subroutine  of_addelement(dotnetobject anv_element);
//*-----------------------------------------------------------------*/
//*  .NET function : AddElement
//*   Argument:
//*              Dotnetobject anv_element
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addelement(anv_element)
end subroutine

public function long of_layout(dotnetobject anv_canvas,boolean abln_useascender,boolean abln_simulate,real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : Layout
//*   Argument:
//*              Dotnetobject anv_canvas
//*              Boolean abln_useascender
//*              Boolean abln_simulate
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
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
ll_result = This.layout(anv_canvas,abln_useascender,abln_simulate,ar_llx,ar_lly,ar_urx,ar_ury)
Return ll_result
end function

public function dotnetobject of_getaccessibleattribute(dotnetobject anv_key);
//*-----------------------------------------------------------------*/
//*  .NET function : GetAccessibleAttribute
//*   Argument:
//*              Dotnetobject anv_key
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
lnv_result = This.getaccessibleattribute(anv_key)
Return lnv_result
end function

public subroutine  of_setaccessibleattribute(dotnetobject anv_key,dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAccessibleAttribute
//*   Argument:
//*              Dotnetobject anv_key
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setaccessibleattribute(anv_key,anv_value)
end subroutine

public function dotnetobject of_getaccessibleattributes();
//*-----------------------------------------------------------------*/
//*  .NET function : GetAccessibleAttributes
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
lnv_result = This.getaccessibleattributes()
Return lnv_result
end function

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

public function real get_percentageheight();
//*-----------------------------------------------------------------*/
//*  .NET property : PercentageHeight
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
lr_result = This.percentageheight
Return lr_result
end function

public subroutine  set_percentageheight(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PercentageHeight
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.percentageheight = ar_value
end subroutine

public function real get_percentagewidth();
//*-----------------------------------------------------------------*/
//*  .NET property : PercentageWidth
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
lr_result = This.percentagewidth
Return lr_result
end function

public subroutine  set_percentagewidth(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PercentageWidth
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.percentagewidth = ar_value
end subroutine

public function real get_contentwidth();
//*-----------------------------------------------------------------*/
//*  .NET property : ContentWidth
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
lr_result = This.contentwidth
Return lr_result
end function

public subroutine  set_contentwidth(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ContentWidth
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.contentwidth = ar_value
end subroutine

public function real get_contentheight();
//*-----------------------------------------------------------------*/
//*  .NET property : ContentHeight
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
lr_result = This.contentheight
Return lr_result
end function

public subroutine  set_contentheight(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ContentHeight
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.contentheight = ar_value
end subroutine

public function long get_textalignment();
//*-----------------------------------------------------------------*/
//*  .NET property : TextAlignment
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
ll_result = This.textalignment
Return ll_result
end function

public subroutine  set_textalignment(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : TextAlignment
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.textalignment = al_value
end subroutine

public function real get_paddingleft();
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingLeft
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
lr_result = This.paddingleft
Return lr_result
end function

public subroutine  set_paddingleft(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingLeft
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.paddingleft = ar_value
end subroutine

public function real get_paddingright();
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingRight
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
lr_result = This.paddingright
Return lr_result
end function

public subroutine  set_paddingright(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingRight
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.paddingright = ar_value
end subroutine

public function real get_paddingtop();
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingTop
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
lr_result = This.paddingtop
Return lr_result
end function

public subroutine  set_paddingtop(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingTop
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.paddingtop = ar_value
end subroutine

public function real get_paddingbottom();
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingBottom
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
lr_result = This.paddingbottom
Return lr_result
end function

public subroutine  set_paddingbottom(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingBottom
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.paddingbottom = ar_value
end subroutine

public function long get_float();
//*-----------------------------------------------------------------*/
//*  .NET property : Float
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
ll_result = This.float
Return ll_result
end function

public subroutine  set_float(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Float
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.float = al_value
end subroutine

public function long get_position();
//*-----------------------------------------------------------------*/
//*  .NET property : Position
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
ll_result = This.position
Return ll_result
end function

public subroutine  set_position(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Position
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.position = al_value
end subroutine

public function dotnetobject get_floatlayout();
//*-----------------------------------------------------------------*/
//*  .NET property : FloatLayout
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
lnv_result = This.floatlayout
Return lnv_result
end function

public subroutine  set_floatlayout(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : FloatLayout
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.floatlayout = anv_value
end subroutine

public function long get_display();
//*-----------------------------------------------------------------*/
//*  .NET property : Display
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
ll_result = This.display
Return ll_result
end function

public subroutine  set_display(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Display
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.display = al_value
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

public subroutine  set_backgroundimage(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BackgroundImage
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.backgroundimage = anv_value
end subroutine

public function real get_yline();
//*-----------------------------------------------------------------*/
//*  .NET property : YLine
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
lr_result = This.yline
Return lr_result
end function

public function long get_rundirection();
//*-----------------------------------------------------------------*/
//*  .NET property : RunDirection
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
ll_result = This.rundirection
Return ll_result
end function

public subroutine  set_rundirection(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : RunDirection
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.rundirection = al_value
end subroutine

public function real get_spacingbefore();
//*-----------------------------------------------------------------*/
//*  .NET property : SpacingBefore
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
lr_result = This.spacingbefore
Return lr_result
end function

public subroutine  set_spacingbefore(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SpacingBefore
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.spacingbefore = ar_value
end subroutine

public function real get_spacingafter();
//*-----------------------------------------------------------------*/
//*  .NET property : SpacingAfter
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
lr_result = This.spacingafter
Return lr_result
end function

public subroutine  set_spacingafter(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SpacingAfter
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.spacingafter = ar_value
end subroutine

public function dotnetobject get_content();
//*-----------------------------------------------------------------*/
//*  .NET property : Content
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
lnv_result = This.content
Return lnv_result
end function

public function long get_borderstyle();
//*-----------------------------------------------------------------*/
//*  .NET property : BorderStyle
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
ll_result = This.borderstyle
Return ll_result
end function

public subroutine  set_borderstyle(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BorderStyle
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.borderstyle = al_value
end subroutine

public function boolean get_keeptogether();
//*-----------------------------------------------------------------*/
//*  .NET property : KeepTogether
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
lbln_result = This.keeptogether
Return lbln_result
end function

public subroutine  set_keeptogether(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : KeepTogether
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.keeptogether = abln_value
end subroutine

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

public function dotnetobject get_role();
//*-----------------------------------------------------------------*/
//*  .NET property : Role
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
lnv_result = This.role
Return lnv_result
end function

public subroutine  set_role(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Role
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.role = anv_value
end subroutine

public function dotnetobject get_id();
//*-----------------------------------------------------------------*/
//*  .NET property : ID
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
lnv_result = This.id
Return lnv_result
end function

public subroutine  set_id(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ID
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.id = anv_value
end subroutine

public function boolean get_isinline();
//*-----------------------------------------------------------------*/
//*  .NET property : IsInline
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
lbln_result = This.isinline
Return lbln_result
end function

on nvo_pdfdiv.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfdiv.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

