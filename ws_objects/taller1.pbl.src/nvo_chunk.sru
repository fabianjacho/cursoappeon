$PBExportHeader$nvo_chunk.sru
forward
global type nvo_chunk from dotnetobject
end type
end forward

global type nvo_chunk from dotnetobject
end type
global nvo_chunk nvo_chunk

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.Chunk"

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
public function boolean of_process(dotnetobject anv_listener)
public function dotnetobject of_append(string as_str)
public function string of_tostring()
public function boolean of_isempty()
public function real of_getwidthpoint()
public function boolean of_hasattributes()
public function boolean of_hasaccessibleattributes()
public function dotnetobject of_sethorizontalscaling(real ar_scale)
public function dotnetobject of_setunderline(real ar_thickness,real ar_yposition)
public function dotnetobject of_setunderline(dotnetobject anv_color,real ar_thickness,real ar_thicknessmul,real ar_yposition,real ar_ypositionmul,long al_cap)
public function dotnetobject of_settextrise(real ar_rise)
public function real of_gettextrise()
public function dotnetobject of_setskew(real ar_alpha,real ar_beta)
public function dotnetobject of_setbackground(dotnetobject anv_color)
public function dotnetobject of_setbackground(dotnetobject anv_color,real ar_extraleft,real ar_extrabottom,real ar_extraright,real ar_extratop)
public function dotnetobject of_settextrendermode(long al_mode,real ar_strokewidth,dotnetobject anv_strokecolor)
public function dotnetobject of_setsplitcharacter(dotnetobject anv_splitcharacter)
public function dotnetobject of_sethyphenation(dotnetobject anv_hyphenation)
public function dotnetobject of_setremotegoto(string as_filename,string as_name)
public function dotnetobject of_setremotegoto(string as_filename,long al_page)
public function dotnetobject of_setlocalgoto(string as_name)
public function dotnetobject of_setlocaldestination(string as_name)
public function dotnetobject of_setgenerictag(string as_text)
public function dotnetobject of_setlineheight(real ar_lineheight)
public function dotnetobject of_getimage()
public function dotnetobject of_setaction(dotnetobject anv_action)
public function dotnetobject of_setanchor(dotnetobject anv_url)
public function dotnetobject of_setanchor(string as_url)
public function dotnetobject of_setnewpage()
public function dotnetobject of_setannotation(dotnetobject anv_annotation)
public function boolean of_iscontent()
public function boolean of_isnestable()
public function dotnetobject of_gethyphenation()
public function dotnetobject of_setcharacterspacing(real ar_charspace)
public function real of_getcharacterspacing()
public function dotnetobject of_setwordspacing(real ar_wordspace)
public function real of_getwordspacing()
public function dotnetobject of_createwhitespace(string as_content)
public function dotnetobject of_createwhitespace(string as_content,boolean abln_preserve)
public function boolean of_iswhitespace()
public function dotnetobject of_createtabspace()
public function dotnetobject of_createtabspace(real ar_spacing)
public function boolean of_istabspace()
public function dotnetobject of_getaccessibleattribute(dotnetobject anv_key)
public subroutine  of_setaccessibleattribute(dotnetobject anv_key,dotnetobject anv_value)
public function dotnetobject of_getaccessibleattributes()
public function string of_gettextexpansion()
public subroutine  of_settextexpansion(string as_value)
public function long get_type()
public function dotnetobject get_chunks()
public function dotnetobject get_font()
public subroutine  set_font(dotnetobject anv_value)
public function string get_content()
public function dotnetobject get_attributes()
public subroutine  set_attributes(dotnetobject anv_value)
public function real get_horizontalscaling()
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

public function dotnetobject of_append(string as_str);
//*-----------------------------------------------------------------*/
//*  .NET function : Append
//*   Argument:
//*              String as_str
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
lnv_result = This.append(as_str)
Return lnv_result
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

public function real of_getwidthpoint();
//*-----------------------------------------------------------------*/
//*  .NET function : GetWidthPoint
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
lr_result = This.getwidthpoint()
Return lr_result
end function

public function boolean of_hasattributes();
//*-----------------------------------------------------------------*/
//*  .NET function : HasAttributes
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
lbln_result = This.hasattributes()
Return lbln_result
end function

public function boolean of_hasaccessibleattributes();
//*-----------------------------------------------------------------*/
//*  .NET function : HasAccessibleAttributes
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
lbln_result = This.hasaccessibleattributes()
Return lbln_result
end function

public function dotnetobject of_sethorizontalscaling(real ar_scale);
//*-----------------------------------------------------------------*/
//*  .NET function : SetHorizontalScaling
//*   Argument:
//*              Real ar_scale
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
lnv_result = This.sethorizontalscaling(ar_scale)
Return lnv_result
end function

public function dotnetobject of_setunderline(real ar_thickness,real ar_yposition);
//*-----------------------------------------------------------------*/
//*  .NET function : SetUnderline
//*   Argument:
//*              Real ar_thickness
//*              Real ar_yposition
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
lnv_result = This.setunderline(ar_thickness,ar_yposition)
Return lnv_result
end function

public function dotnetobject of_setunderline(dotnetobject anv_color,real ar_thickness,real ar_thicknessmul,real ar_yposition,real ar_ypositionmul,long al_cap);
//*-----------------------------------------------------------------*/
//*  .NET function : SetUnderline
//*   Argument:
//*              Dotnetobject anv_color
//*              Real ar_thickness
//*              Real ar_thicknessmul
//*              Real ar_yposition
//*              Real ar_ypositionmul
//*              Long al_cap
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
lnv_result = This.setunderline(anv_color,ar_thickness,ar_thicknessmul,ar_yposition,ar_ypositionmul,al_cap)
Return lnv_result
end function

public function dotnetobject of_settextrise(real ar_rise);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTextRise
//*   Argument:
//*              Real ar_rise
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
lnv_result = This.settextrise(ar_rise)
Return lnv_result
end function

public function real of_gettextrise();
//*-----------------------------------------------------------------*/
//*  .NET function : GetTextRise
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
lr_result = This.gettextrise()
Return lr_result
end function

public function dotnetobject of_setskew(real ar_alpha,real ar_beta);
//*-----------------------------------------------------------------*/
//*  .NET function : SetSkew
//*   Argument:
//*              Real ar_alpha
//*              Real ar_beta
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
lnv_result = This.setskew(ar_alpha,ar_beta)
Return lnv_result
end function

public function dotnetobject of_setbackground(dotnetobject anv_color);
//*-----------------------------------------------------------------*/
//*  .NET function : SetBackground
//*   Argument:
//*              Dotnetobject anv_color
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
lnv_result = This.setbackground(anv_color)
Return lnv_result
end function

public function dotnetobject of_setbackground(dotnetobject anv_color,real ar_extraleft,real ar_extrabottom,real ar_extraright,real ar_extratop);
//*-----------------------------------------------------------------*/
//*  .NET function : SetBackground
//*   Argument:
//*              Dotnetobject anv_color
//*              Real ar_extraleft
//*              Real ar_extrabottom
//*              Real ar_extraright
//*              Real ar_extratop
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
lnv_result = This.setbackground(anv_color,ar_extraleft,ar_extrabottom,ar_extraright,ar_extratop)
Return lnv_result
end function

public function dotnetobject of_settextrendermode(long al_mode,real ar_strokewidth,dotnetobject anv_strokecolor);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTextRenderMode
//*   Argument:
//*              Long al_mode
//*              Real ar_strokewidth
//*              Dotnetobject anv_strokecolor
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
lnv_result = This.settextrendermode(al_mode,ar_strokewidth,anv_strokecolor)
Return lnv_result
end function

public function dotnetobject of_setsplitcharacter(dotnetobject anv_splitcharacter);
//*-----------------------------------------------------------------*/
//*  .NET function : SetSplitCharacter
//*   Argument:
//*              Dotnetobject anv_splitcharacter
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
lnv_result = This.setsplitcharacter(anv_splitcharacter)
Return lnv_result
end function

public function dotnetobject of_sethyphenation(dotnetobject anv_hyphenation);
//*-----------------------------------------------------------------*/
//*  .NET function : SetHyphenation
//*   Argument:
//*              Dotnetobject anv_hyphenation
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
lnv_result = This.sethyphenation(anv_hyphenation)
Return lnv_result
end function

public function dotnetobject of_setremotegoto(string as_filename,string as_name);
//*-----------------------------------------------------------------*/
//*  .NET function : SetRemoteGoto
//*   Argument:
//*              String as_filename
//*              String as_name
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
lnv_result = This.setremotegoto(as_filename,as_name)
Return lnv_result
end function

public function dotnetobject of_setremotegoto(string as_filename,long al_page);
//*-----------------------------------------------------------------*/
//*  .NET function : SetRemoteGoto
//*   Argument:
//*              String as_filename
//*              Long al_page
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
lnv_result = This.setremotegoto(as_filename,al_page)
Return lnv_result
end function

public function dotnetobject of_setlocalgoto(string as_name);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLocalGoto
//*   Argument:
//*              String as_name
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
lnv_result = This.setlocalgoto(as_name)
Return lnv_result
end function

public function dotnetobject of_setlocaldestination(string as_name);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLocalDestination
//*   Argument:
//*              String as_name
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
lnv_result = This.setlocaldestination(as_name)
Return lnv_result
end function

public function dotnetobject of_setgenerictag(string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : SetGenericTag
//*   Argument:
//*              String as_text
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
lnv_result = This.setgenerictag(as_text)
Return lnv_result
end function

public function dotnetobject of_setlineheight(real ar_lineheight);
//*-----------------------------------------------------------------*/
//*  .NET function : setLineHeight
//*   Argument:
//*              Real ar_lineheight
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
lnv_result = This.setlineheight(ar_lineheight)
Return lnv_result
end function

public function dotnetobject of_getimage();
//*-----------------------------------------------------------------*/
//*  .NET function : GetImage
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
lnv_result = This.getimage()
Return lnv_result
end function

public function dotnetobject of_setaction(dotnetobject anv_action);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAction
//*   Argument:
//*              Dotnetobject anv_action
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
lnv_result = This.setaction(anv_action)
Return lnv_result
end function

public function dotnetobject of_setanchor(dotnetobject anv_url);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAnchor
//*   Argument:
//*              Dotnetobject anv_url
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
lnv_result = This.setanchor(anv_url)
Return lnv_result
end function

public function dotnetobject of_setanchor(string as_url);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAnchor
//*   Argument:
//*              String as_url
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
lnv_result = This.setanchor(as_url)
Return lnv_result
end function

public function dotnetobject of_setnewpage();
//*-----------------------------------------------------------------*/
//*  .NET function : SetNewPage
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
lnv_result = This.setnewpage()
Return lnv_result
end function

public function dotnetobject of_setannotation(dotnetobject anv_annotation);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAnnotation
//*   Argument:
//*              Dotnetobject anv_annotation
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
lnv_result = This.setannotation(anv_annotation)
Return lnv_result
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

public function dotnetobject of_gethyphenation();
//*-----------------------------------------------------------------*/
//*  .NET function : GetHyphenation
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
lnv_result = This.gethyphenation()
Return lnv_result
end function

public function dotnetobject of_setcharacterspacing(real ar_charspace);
//*-----------------------------------------------------------------*/
//*  .NET function : SetCharacterSpacing
//*   Argument:
//*              Real ar_charspace
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
lnv_result = This.setcharacterspacing(ar_charspace)
Return lnv_result
end function

public function real of_getcharacterspacing();
//*-----------------------------------------------------------------*/
//*  .NET function : GetCharacterSpacing
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
lr_result = This.getcharacterspacing()
Return lr_result
end function

public function dotnetobject of_setwordspacing(real ar_wordspace);
//*-----------------------------------------------------------------*/
//*  .NET function : SetWordSpacing
//*   Argument:
//*              Real ar_wordspace
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
lnv_result = This.setwordspacing(ar_wordspace)
Return lnv_result
end function

public function real of_getwordspacing();
//*-----------------------------------------------------------------*/
//*  .NET function : GetWordSpacing
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
lr_result = This.getwordspacing()
Return lr_result
end function

public function dotnetobject of_createwhitespace(string as_content);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateWhitespace
//*   Argument:
//*              String as_content
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
lnv_result = This.createwhitespace(as_content)
Return lnv_result
end function

public function dotnetobject of_createwhitespace(string as_content,boolean abln_preserve);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateWhitespace
//*   Argument:
//*              String as_content
//*              Boolean abln_preserve
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
lnv_result = This.createwhitespace(as_content,abln_preserve)
Return lnv_result
end function

public function boolean of_iswhitespace();
//*-----------------------------------------------------------------*/
//*  .NET function : IsWhitespace
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
lbln_result = This.iswhitespace()
Return lbln_result
end function

public function dotnetobject of_createtabspace();
//*-----------------------------------------------------------------*/
//*  .NET function : CreateTabspace
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
lnv_result = This.createtabspace()
Return lnv_result
end function

public function dotnetobject of_createtabspace(real ar_spacing);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateTabspace
//*   Argument:
//*              Real ar_spacing
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
lnv_result = This.createtabspace(ar_spacing)
Return lnv_result
end function

public function boolean of_istabspace();
//*-----------------------------------------------------------------*/
//*  .NET function : IsTabspace
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
lbln_result = This.istabspace()
Return lbln_result
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

public function string of_gettextexpansion();
//*-----------------------------------------------------------------*/
//*  .NET function : GetTextExpansion
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
ls_result = This.gettextexpansion()
Return ls_result
end function

public subroutine  of_settextexpansion(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTextExpansion
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settextexpansion(as_value)
end subroutine

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

public function dotnetobject get_font();
//*-----------------------------------------------------------------*/
//*  .NET property : Font
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
lnv_result = This.font
Return lnv_result
end function

public subroutine  set_font(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Font
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.font = anv_value
end subroutine

public function string get_content();
//*-----------------------------------------------------------------*/
//*  .NET property : Content
//*   Return : String
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
String ls_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ls_result)
	Return ls_result
End If

/* Trigger the dotnet property */
ls_result = This.content
Return ls_result
end function

public function dotnetobject get_attributes();
//*-----------------------------------------------------------------*/
//*  .NET property : Attributes
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
lnv_result = This.attributes
Return lnv_result
end function

public subroutine  set_attributes(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Attributes
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.attributes = anv_value
end subroutine

public function real get_horizontalscaling();
//*-----------------------------------------------------------------*/
//*  .NET property : HorizontalScaling
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
lr_result = This.horizontalscaling
Return lr_result
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

on nvo_chunk.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_chunk.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

