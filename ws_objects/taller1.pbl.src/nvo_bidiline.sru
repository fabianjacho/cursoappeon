$PBExportHeader$nvo_bidiline.sru
forward
global type nvo_bidiline from dotnetobject
end type
end forward

global type nvo_bidiline from dotnetobject
end type
global nvo_bidiline nvo_bidiline

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.BidiLine"

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
public function boolean of_isempty()
public subroutine  of_clearchunks()
public function boolean of_getparagraph(long al_rundirection)
public subroutine  of_addchunk(dotnetobject anv_chunk)
public subroutine  of_addchunks(dotnetobject anv_chunks)
public subroutine  of_addpiece(char ach_c,dotnetobject anv_chunk)
public subroutine  of_save()
public subroutine  of_restore()
public subroutine  of_mirrorglyphs()
public subroutine  of_doarabicshapping()
public function dotnetobject of_processline(real ar_leftx,real ar_width,long al_alignment,long al_rundirection,long al_arabicoptions,real ar_miny,real ar_yline,real ar_descender)
public function boolean of_iswordsplit()
public function real of_getwidth(long al_startidx,long al_lastidx)
public function real of_getwidth(long al_startidx,long al_lastidx,real ar_originalwidth)
public function dotnetobject of_createarrayofpdfchunks(long al_startidx,long al_endidx)
public function dotnetobject of_createarrayofpdfchunks(long al_startidx,long al_endidx,dotnetobject anv_extrapdfchunk)
public function any of_getword(long al_startidx,long al_idx)
public function long of_trimright(long al_startidx,long al_endidx)
public function long of_trimleft(long al_startidx,long al_endidx)
public function long of_trimrightex(long al_startidx,long al_endidx)
public function long of_trimleftex(long al_startidx,long al_endidx)
public subroutine  of_reorder(long al_start,long al_end)
public subroutine  of_flip(long al_start,long al_end)
public function boolean of_isws(char ach_c)
public function string of_processltr(string as_s,long al_rundirection,long al_arabicoptions)
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

public function boolean of_getparagraph(long al_rundirection);
//*-----------------------------------------------------------------*/
//*  .NET function : GetParagraph
//*   Argument:
//*              Long al_rundirection
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
lbln_result = This.getparagraph(al_rundirection)
Return lbln_result
end function

public subroutine  of_addchunk(dotnetobject anv_chunk);
//*-----------------------------------------------------------------*/
//*  .NET function : AddChunk
//*   Argument:
//*              Dotnetobject anv_chunk
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addchunk(anv_chunk)
end subroutine

public subroutine  of_addchunks(dotnetobject anv_chunks);
//*-----------------------------------------------------------------*/
//*  .NET function : AddChunks
//*   Argument:
//*              Dotnetobject anv_chunks
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addchunks(anv_chunks)
end subroutine

public subroutine  of_addpiece(char ach_c,dotnetobject anv_chunk);
//*-----------------------------------------------------------------*/
//*  .NET function : AddPiece
//*   Argument:
//*              Char ach_c
//*              Dotnetobject anv_chunk
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addpiece(ref ach_c,anv_chunk)
end subroutine

public subroutine  of_save();
//*-----------------------------------------------------------------*/
//*  .NET function : Save
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.save()
end subroutine

public subroutine  of_restore();
//*-----------------------------------------------------------------*/
//*  .NET function : Restore
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.restore()
end subroutine

public subroutine  of_mirrorglyphs();
//*-----------------------------------------------------------------*/
//*  .NET function : MirrorGlyphs
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.mirrorglyphs()
end subroutine

public subroutine  of_doarabicshapping();
//*-----------------------------------------------------------------*/
//*  .NET function : DoArabicShapping
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.doarabicshapping()
end subroutine

public function dotnetobject of_processline(real ar_leftx,real ar_width,long al_alignment,long al_rundirection,long al_arabicoptions,real ar_miny,real ar_yline,real ar_descender);
//*-----------------------------------------------------------------*/
//*  .NET function : ProcessLine
//*   Argument:
//*              Real ar_leftx
//*              Real ar_width
//*              Long al_alignment
//*              Long al_rundirection
//*              Long al_arabicoptions
//*              Real ar_miny
//*              Real ar_yline
//*              Real ar_descender
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
lnv_result = This.processline(ar_leftx,ar_width,al_alignment,al_rundirection,al_arabicoptions,ar_miny,ar_yline,ar_descender)
Return lnv_result
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

public function real of_getwidth(long al_startidx,long al_lastidx);
//*-----------------------------------------------------------------*/
//*  .NET function : GetWidth
//*   Argument:
//*              Long al_startidx
//*              Long al_lastidx
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
lr_result = This.getwidth(al_startidx,al_lastidx)
Return lr_result
end function

public function real of_getwidth(long al_startidx,long al_lastidx,real ar_originalwidth);
//*-----------------------------------------------------------------*/
//*  .NET function : GetWidth
//*   Argument:
//*              Long al_startidx
//*              Long al_lastidx
//*              Real ar_originalwidth
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
lr_result = This.getwidth(al_startidx,al_lastidx,ar_originalwidth)
Return lr_result
end function

public function dotnetobject of_createarrayofpdfchunks(long al_startidx,long al_endidx);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateArrayOfPdfChunks
//*   Argument:
//*              Long al_startidx
//*              Long al_endidx
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
lnv_result = This.createarrayofpdfchunks(al_startidx,al_endidx)
Return lnv_result
end function

public function dotnetobject of_createarrayofpdfchunks(long al_startidx,long al_endidx,dotnetobject anv_extrapdfchunk);
//*-----------------------------------------------------------------*/
//*  .NET function : CreateArrayOfPdfChunks
//*   Argument:
//*              Long al_startidx
//*              Long al_endidx
//*              Dotnetobject anv_extrapdfchunk
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
lnv_result = This.createarrayofpdfchunks(al_startidx,al_endidx,anv_extrapdfchunk)
Return lnv_result
end function

public function any of_getword(long al_startidx,long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : GetWord
//*   Argument:
//*              Long al_startidx
//*              Long al_idx
//*   Return : Long[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Any ll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ll_result)
	Return ll_result
End If

/* Trigger the dotnet function */
ll_result = This.getword(al_startidx,al_idx)
Return ll_result
end function

public function long of_trimright(long al_startidx,long al_endidx);
//*-----------------------------------------------------------------*/
//*  .NET function : TrimRight
//*   Argument:
//*              Long al_startidx
//*              Long al_endidx
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
ll_result = This.trimright(al_startidx,al_endidx)
Return ll_result
end function

public function long of_trimleft(long al_startidx,long al_endidx);
//*-----------------------------------------------------------------*/
//*  .NET function : TrimLeft
//*   Argument:
//*              Long al_startidx
//*              Long al_endidx
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
ll_result = This.trimleft(al_startidx,al_endidx)
Return ll_result
end function

public function long of_trimrightex(long al_startidx,long al_endidx);
//*-----------------------------------------------------------------*/
//*  .NET function : TrimRightEx
//*   Argument:
//*              Long al_startidx
//*              Long al_endidx
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
ll_result = This.trimrightex(al_startidx,al_endidx)
Return ll_result
end function

public function long of_trimleftex(long al_startidx,long al_endidx);
//*-----------------------------------------------------------------*/
//*  .NET function : TrimLeftEx
//*   Argument:
//*              Long al_startidx
//*              Long al_endidx
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
ll_result = This.trimleftex(al_startidx,al_endidx)
Return ll_result
end function

public subroutine  of_reorder(long al_start,long al_end);
//*-----------------------------------------------------------------*/
//*  .NET function : Reorder
//*   Argument:
//*              Long al_start
//*              Long al_end
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.reorder(al_start,al_end)
end subroutine

public subroutine  of_flip(long al_start,long al_end);
//*-----------------------------------------------------------------*/
//*  .NET function : Flip
//*   Argument:
//*              Long al_start
//*              Long al_end
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.flip(al_start,al_end)
end subroutine

public function boolean of_isws(char ach_c);
//*-----------------------------------------------------------------*/
//*  .NET function : IsWS
//*   Argument:
//*              Char ach_c
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
lbln_result = This.isws(ref ach_c)
Return lbln_result
end function

public function string of_processltr(string as_s,long al_rundirection,long al_arabicoptions);
//*-----------------------------------------------------------------*/
//*  .NET function : ProcessLTR
//*   Argument:
//*              String as_s
//*              Long al_rundirection
//*              Long al_arabicoptions
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
ls_result = This.processltr(as_s,al_rundirection,al_arabicoptions)
Return ls_result
end function

on nvo_bidiline.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_bidiline.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

