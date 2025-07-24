$PBExportHeader$nvo_columntext.sru
forward
global type nvo_columntext from dotnetobject
end type
end forward

global type nvo_columntext from dotnetobject
end type
global nvo_columntext nvo_columntext

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.ColumnText"

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
public function dotnetobject of_duplicate(dotnetobject anv_org)
public function dotnetobject of_setacopy(dotnetobject anv_org)
public subroutine  of_addtext(dotnetobject anv_phrase)
public subroutine  of_settext(dotnetobject anv_phrase)
public subroutine  of_addtext1(dotnetobject anv_chunk)
public subroutine  of_addelement(dotnetobject anv_element)
public function boolean of_isallowedelement(dotnetobject anv_element)
public subroutine  of_setcolumns(real ar_leftline[],real ar_rightline[])
public subroutine  of_setsimplecolumn(dotnetobject anv_phrase,real ar_llx,real ar_lly,real ar_urx,real ar_ury,real ar_leading,long al_alignment)
public subroutine  of_setsimplecolumn(real ar_llx,real ar_lly,real ar_urx,real ar_ury,real ar_leading,long al_alignment)
public subroutine  of_setsimplecolumn(real ar_llx,real ar_lly,real ar_urx,real ar_ury)
public subroutine  of_setsimplecolumn(dotnetobject anv_rect)
public subroutine  of_setleading(real ar_fixedleading,real ar_multipliedleading)
public subroutine  of_setindent(real ar_indent,boolean abln_repeatfirstlineindent)
public function long of_go()
public function long of_go(boolean abln_simulate)
public function long of_go(boolean abln_simulate,dotnetobject anv_elementtogo)
public function boolean of_iswordsplit()
public subroutine  of_clearchunks()
public function real of_getwidth(dotnetobject anv_phrase,long al_rundirection,long al_arabicoptions)
public function real of_getwidth(dotnetobject anv_phrase)
public subroutine  of_showtextaligned(dotnetobject anv_canvas,long al_alignment,dotnetobject anv_phrase,real ar_x,real ar_y,real ar_rotation,long al_rundirection,long al_arabicoptions)
public subroutine  of_showtextaligned(dotnetobject anv_canvas,long al_alignment,dotnetobject anv_phrase,real ar_x,real ar_y,real ar_rotation)
public function real of_fittext(dotnetobject anv_font,string as_text,dotnetobject anv_rect,real ar_maxfontsize,long al_rundirection)
public function boolean of_zeroheightelement()
public function boolean of_hasmoretext(long al_status)
public subroutine  of_updatefilledwidth(real ar_w)
public function real get_leading()
public subroutine  set_leading(real ar_value)
public function real get_multipliedleading()
public function real get_yline()
public subroutine  set_yline(real ar_value)
public function long get_rowsdrawn()
public function long get_alignment()
public subroutine  set_alignment(long al_value)
public function real get_indent()
public subroutine  set_indent(real ar_value)
public function real get_followingindent()
public subroutine  set_followingindent(real ar_value)
public function real get_rightindent()
public subroutine  set_rightindent(real ar_value)
public function real get_currentleading()
public function boolean get_inheritgraphicstate()
public subroutine  set_inheritgraphicstate(boolean abln_value)
public function boolean get_ignorespacingbefore()
public subroutine  set_ignorespacingbefore(boolean abln_value)
public function real get_extraparagraphspace()
public subroutine  set_extraparagraphspace(real ar_value)
public function real get_spacecharratio()
public subroutine  set_spacecharratio(real ar_value)
public function long get_rundirection()
public subroutine  set_rundirection(long al_value)
public function long get_lineswritten()
public function real get_lastx()
public function long get_arabicoptions()
public subroutine  set_arabicoptions(long al_value)
public function real get_descender()
public function dotnetobject get_canvas()
public subroutine  set_canvas(dotnetobject anv_value)
public function dotnetobject get_compositeelements()
public function boolean get_useascender()
public subroutine  set_useascender(boolean abln_value)
public function real get_filledwidth()
public subroutine  set_filledwidth(real ar_value)
public function boolean get_adjustfirstline()
public subroutine  set_adjustfirstline(boolean abln_value)
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

public function dotnetobject of_duplicate(dotnetobject anv_org);
//*-----------------------------------------------------------------*/
//*  .NET function : Duplicate
//*   Argument:
//*              Dotnetobject anv_org
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
lnv_result = This.duplicate(anv_org)
Return lnv_result
end function

public function dotnetobject of_setacopy(dotnetobject anv_org);
//*-----------------------------------------------------------------*/
//*  .NET function : SetACopy
//*   Argument:
//*              Dotnetobject anv_org
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
lnv_result = This.setacopy(anv_org)
Return lnv_result
end function

public subroutine  of_addtext(dotnetobject anv_phrase);
//*-----------------------------------------------------------------*/
//*  .NET function : AddText
//*   Argument:
//*              Dotnetobject anv_phrase
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtext(anv_phrase)
end subroutine

public subroutine  of_settext(dotnetobject anv_phrase);
//*-----------------------------------------------------------------*/
//*  .NET function : SetText
//*   Argument:
//*              Dotnetobject anv_phrase
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settext(anv_phrase)
end subroutine

public subroutine  of_addtext1(dotnetobject anv_chunk);
//*-----------------------------------------------------------------*/
//*  .NET function : AddText
//*   Argument:
//*              Dotnetobject anv_chunk
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addtext(anv_chunk)
end subroutine

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

public function boolean of_isallowedelement(dotnetobject anv_element);
//*-----------------------------------------------------------------*/
//*  .NET function : isAllowedElement
//*   Argument:
//*              Dotnetobject anv_element
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
lbln_result = This.isallowedelement(anv_element)
Return lbln_result
end function

public subroutine  of_setcolumns(real ar_leftline[],real ar_rightline[]);
//*-----------------------------------------------------------------*/
//*  .NET function : SetColumns
//*   Argument:
//*              Real ar_leftline[]
//*              Real ar_rightline[]
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setcolumns(ar_leftline,ar_rightline)
end subroutine

public subroutine  of_setsimplecolumn(dotnetobject anv_phrase,real ar_llx,real ar_lly,real ar_urx,real ar_ury,real ar_leading,long al_alignment);
//*-----------------------------------------------------------------*/
//*  .NET function : SetSimpleColumn
//*   Argument:
//*              Dotnetobject anv_phrase
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*              Real ar_leading
//*              Long al_alignment
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setsimplecolumn(anv_phrase,ar_llx,ar_lly,ar_urx,ar_ury,ar_leading,al_alignment)
end subroutine

public subroutine  of_setsimplecolumn(real ar_llx,real ar_lly,real ar_urx,real ar_ury,real ar_leading,long al_alignment);
//*-----------------------------------------------------------------*/
//*  .NET function : SetSimpleColumn
//*   Argument:
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*              Real ar_leading
//*              Long al_alignment
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setsimplecolumn(ar_llx,ar_lly,ar_urx,ar_ury,ar_leading,al_alignment)
end subroutine

public subroutine  of_setsimplecolumn(real ar_llx,real ar_lly,real ar_urx,real ar_ury);
//*-----------------------------------------------------------------*/
//*  .NET function : SetSimpleColumn
//*   Argument:
//*              Real ar_llx
//*              Real ar_lly
//*              Real ar_urx
//*              Real ar_ury
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setsimplecolumn(ar_llx,ar_lly,ar_urx,ar_ury)
end subroutine

public subroutine  of_setsimplecolumn(dotnetobject anv_rect);
//*-----------------------------------------------------------------*/
//*  .NET function : SetSimpleColumn
//*   Argument:
//*              Dotnetobject anv_rect
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setsimplecolumn(anv_rect)
end subroutine

public subroutine  of_setleading(real ar_fixedleading,real ar_multipliedleading);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLeading
//*   Argument:
//*              Real ar_fixedleading
//*              Real ar_multipliedleading
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setleading(ar_fixedleading,ar_multipliedleading)
end subroutine

public subroutine  of_setindent(real ar_indent,boolean abln_repeatfirstlineindent);
//*-----------------------------------------------------------------*/
//*  .NET function : SetIndent
//*   Argument:
//*              Real ar_indent
//*              Boolean abln_repeatfirstlineindent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setindent(ar_indent,abln_repeatfirstlineindent)
end subroutine

public function long of_go();
//*-----------------------------------------------------------------*/
//*  .NET function : Go
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
ll_result = This.go()
Return ll_result
end function

public function long of_go(boolean abln_simulate);
//*-----------------------------------------------------------------*/
//*  .NET function : Go
//*   Argument:
//*              Boolean abln_simulate
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
ll_result = This.go(abln_simulate)
Return ll_result
end function

public function long of_go(boolean abln_simulate,dotnetobject anv_elementtogo);
//*-----------------------------------------------------------------*/
//*  .NET function : Go
//*   Argument:
//*              Boolean abln_simulate
//*              Dotnetobject anv_elementtogo
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
ll_result = This.go(abln_simulate,anv_elementtogo)
Return ll_result
end function

public function boolean of_iswordsplit();
//*-----------------------------------------------------------------*/
//*  .NET function : IsWordSplit
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
lbln_result = This.iswordsplit()
Return lbln_result
end function

public subroutine  of_clearchunks();
//*-----------------------------------------------------------------*/
//*  .NET function : ClearChunks
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.clearchunks()
end subroutine

public function real of_getwidth(dotnetobject anv_phrase,long al_rundirection,long al_arabicoptions);
//*-----------------------------------------------------------------*/
//*  .NET function : GetWidth
//*   Argument:
//*              Dotnetobject anv_phrase
//*              Long al_rundirection
//*              Long al_arabicoptions
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
lr_result = This.getwidth(anv_phrase,al_rundirection,al_arabicoptions)
Return lr_result
end function

public function real of_getwidth(dotnetobject anv_phrase);
//*-----------------------------------------------------------------*/
//*  .NET function : GetWidth
//*   Argument:
//*              Dotnetobject anv_phrase
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
lr_result = This.getwidth(anv_phrase)
Return lr_result
end function

public subroutine  of_showtextaligned(dotnetobject anv_canvas,long al_alignment,dotnetobject anv_phrase,real ar_x,real ar_y,real ar_rotation,long al_rundirection,long al_arabicoptions);
//*-----------------------------------------------------------------*/
//*  .NET function : ShowTextAligned
//*   Argument:
//*              Dotnetobject anv_canvas
//*              Long al_alignment
//*              Dotnetobject anv_phrase
//*              Real ar_x
//*              Real ar_y
//*              Real ar_rotation
//*              Long al_rundirection
//*              Long al_arabicoptions
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.showtextaligned(anv_canvas,al_alignment,anv_phrase,ar_x,ar_y,ar_rotation,al_rundirection,al_arabicoptions)
end subroutine

public subroutine  of_showtextaligned(dotnetobject anv_canvas,long al_alignment,dotnetobject anv_phrase,real ar_x,real ar_y,real ar_rotation);
//*-----------------------------------------------------------------*/
//*  .NET function : ShowTextAligned
//*   Argument:
//*              Dotnetobject anv_canvas
//*              Long al_alignment
//*              Dotnetobject anv_phrase
//*              Real ar_x
//*              Real ar_y
//*              Real ar_rotation
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.showtextaligned(anv_canvas,al_alignment,anv_phrase,ar_x,ar_y,ar_rotation)
end subroutine

public function real of_fittext(dotnetobject anv_font,string as_text,dotnetobject anv_rect,real ar_maxfontsize,long al_rundirection);
//*-----------------------------------------------------------------*/
//*  .NET function : FitText
//*   Argument:
//*              Dotnetobject anv_font
//*              String as_text
//*              Dotnetobject anv_rect
//*              Real ar_maxfontsize
//*              Long al_rundirection
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
lr_result = This.fittext(anv_font,as_text,anv_rect,ar_maxfontsize,al_rundirection)
Return lr_result
end function

public function boolean of_zeroheightelement();
//*-----------------------------------------------------------------*/
//*  .NET function : ZeroHeightElement
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
lbln_result = This.zeroheightelement()
Return lbln_result
end function

public function boolean of_hasmoretext(long al_status);
//*-----------------------------------------------------------------*/
//*  .NET function : HasMoreText
//*   Argument:
//*              Long al_status
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
lbln_result = This.hasmoretext(al_status)
Return lbln_result
end function

public subroutine  of_updatefilledwidth(real ar_w);
//*-----------------------------------------------------------------*/
//*  .NET function : UpdateFilledWidth
//*   Argument:
//*              Real ar_w
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.updatefilledwidth(ar_w)
end subroutine

public function real get_leading();
//*-----------------------------------------------------------------*/
//*  .NET property : Leading
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
lr_result = This.leading
Return lr_result
end function

public subroutine  set_leading(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Leading
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.leading = ar_value
end subroutine

public function real get_multipliedleading();
//*-----------------------------------------------------------------*/
//*  .NET property : MultipliedLeading
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
lr_result = This.multipliedleading
Return lr_result
end function

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

public subroutine  set_yline(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : YLine
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.yline = ar_value
end subroutine

public function long get_rowsdrawn();
//*-----------------------------------------------------------------*/
//*  .NET property : RowsDrawn
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
ll_result = This.rowsdrawn
Return ll_result
end function

public function long get_alignment();
//*-----------------------------------------------------------------*/
//*  .NET property : Alignment
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
ll_result = This.alignment
Return ll_result
end function

public subroutine  set_alignment(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Alignment
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.alignment = al_value
end subroutine

public function real get_indent();
//*-----------------------------------------------------------------*/
//*  .NET property : Indent
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
lr_result = This.indent
Return lr_result
end function

public subroutine  set_indent(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Indent
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.indent = ar_value
end subroutine

public function real get_followingindent();
//*-----------------------------------------------------------------*/
//*  .NET property : FollowingIndent
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
lr_result = This.followingindent
Return lr_result
end function

public subroutine  set_followingindent(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : FollowingIndent
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.followingindent = ar_value
end subroutine

public function real get_rightindent();
//*-----------------------------------------------------------------*/
//*  .NET property : RightIndent
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
lr_result = This.rightindent
Return lr_result
end function

public subroutine  set_rightindent(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : RightIndent
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.rightindent = ar_value
end subroutine

public function real get_currentleading();
//*-----------------------------------------------------------------*/
//*  .NET property : CurrentLeading
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
lr_result = This.currentleading
Return lr_result
end function

public function boolean get_inheritgraphicstate();
//*-----------------------------------------------------------------*/
//*  .NET property : InheritGraphicState
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
lbln_result = This.inheritgraphicstate
Return lbln_result
end function

public subroutine  set_inheritgraphicstate(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : InheritGraphicState
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.inheritgraphicstate = abln_value
end subroutine

public function boolean get_ignorespacingbefore();
//*-----------------------------------------------------------------*/
//*  .NET property : IgnoreSpacingBefore
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
lbln_result = This.ignorespacingbefore
Return lbln_result
end function

public subroutine  set_ignorespacingbefore(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : IgnoreSpacingBefore
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.ignorespacingbefore = abln_value
end subroutine

public function real get_extraparagraphspace();
//*-----------------------------------------------------------------*/
//*  .NET property : ExtraParagraphSpace
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
lr_result = This.extraparagraphspace
Return lr_result
end function

public subroutine  set_extraparagraphspace(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ExtraParagraphSpace
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.extraparagraphspace = ar_value
end subroutine

public function real get_spacecharratio();
//*-----------------------------------------------------------------*/
//*  .NET property : SpaceCharRatio
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
lr_result = This.spacecharratio
Return lr_result
end function

public subroutine  set_spacecharratio(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SpaceCharRatio
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.spacecharratio = ar_value
end subroutine

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

public function long get_lineswritten();
//*-----------------------------------------------------------------*/
//*  .NET property : LinesWritten
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
ll_result = This.lineswritten
Return ll_result
end function

public function real get_lastx();
//*-----------------------------------------------------------------*/
//*  .NET property : LastX
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
lr_result = This.lastx
Return lr_result
end function

public function long get_arabicoptions();
//*-----------------------------------------------------------------*/
//*  .NET property : ArabicOptions
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
ll_result = This.arabicoptions
Return ll_result
end function

public subroutine  set_arabicoptions(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ArabicOptions
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.arabicoptions = al_value
end subroutine

public function real get_descender();
//*-----------------------------------------------------------------*/
//*  .NET property : Descender
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
lr_result = This.descender
Return lr_result
end function

public function dotnetobject get_canvas();
//*-----------------------------------------------------------------*/
//*  .NET property : Canvas
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
lnv_result = This.canvas
Return lnv_result
end function

public subroutine  set_canvas(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Canvas
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.canvas = anv_value
end subroutine

public function dotnetobject get_compositeelements();
//*-----------------------------------------------------------------*/
//*  .NET property : CompositeElements
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
lnv_result = This.compositeelements
Return lnv_result
end function

public function boolean get_useascender();
//*-----------------------------------------------------------------*/
//*  .NET property : UseAscender
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
lbln_result = This.useascender
Return lbln_result
end function

public subroutine  set_useascender(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : UseAscender
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.useascender = abln_value
end subroutine

public function real get_filledwidth();
//*-----------------------------------------------------------------*/
//*  .NET property : FilledWidth
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
lr_result = This.filledwidth
Return lr_result
end function

public subroutine  set_filledwidth(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : FilledWidth
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.filledwidth = ar_value
end subroutine

public function boolean get_adjustfirstline();
//*-----------------------------------------------------------------*/
//*  .NET property : AdjustFirstLine
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
lbln_result = This.adjustfirstline
Return lbln_result
end function

public subroutine  set_adjustfirstline(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : AdjustFirstLine
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.adjustfirstline = abln_value
end subroutine

on nvo_columntext.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_columntext.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

