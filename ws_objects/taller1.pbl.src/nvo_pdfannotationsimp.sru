$PBExportHeader$nvo_pdfannotationsimp.sru
forward
global type nvo_pdfannotationsimp from dotnetobject
end type
end forward

global type nvo_pdfannotationsimp from dotnetobject
end type
global nvo_pdfannotationsimp nvo_pdfannotationsimp

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.intern.PdfAnnotationsImp"

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
public function boolean of_hasvalidacroform()
public subroutine  of_addcalculationorder(dotnetobject anv_formfield)
public subroutine  of_addannotation(dotnetobject anv_annot)
public subroutine  of_addplainannotation(dotnetobject anv_annot)
public function boolean of_hasunusedannotations()
public subroutine  of_resetannotations()
public function dotnetobject of_rotateannotations(dotnetobject anv_writer,dotnetobject anv_pagesize)
public function dotnetobject of_convertannotation(dotnetobject anv_writer,dotnetobject anv_annot,dotnetobject anv_defaultrect)
public function dotnetobject get_acroform()
public subroutine  set_sigflags(long al_value)
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

public function boolean of_hasvalidacroform();
//*-----------------------------------------------------------------*/
//*  .NET function : HasValidAcroForm
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
lbln_result = This.hasvalidacroform()
Return lbln_result
end function

public subroutine  of_addcalculationorder(dotnetobject anv_formfield);
//*-----------------------------------------------------------------*/
//*  .NET function : AddCalculationOrder
//*   Argument:
//*              Dotnetobject anv_formfield
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addcalculationorder(anv_formfield)
end subroutine

public subroutine  of_addannotation(dotnetobject anv_annot);
//*-----------------------------------------------------------------*/
//*  .NET function : AddAnnotation
//*   Argument:
//*              Dotnetobject anv_annot
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addannotation(anv_annot)
end subroutine

public subroutine  of_addplainannotation(dotnetobject anv_annot);
//*-----------------------------------------------------------------*/
//*  .NET function : AddPlainAnnotation
//*   Argument:
//*              Dotnetobject anv_annot
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addplainannotation(anv_annot)
end subroutine

public function boolean of_hasunusedannotations();
//*-----------------------------------------------------------------*/
//*  .NET function : HasUnusedAnnotations
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
lbln_result = This.hasunusedannotations()
Return lbln_result
end function

public subroutine  of_resetannotations();
//*-----------------------------------------------------------------*/
//*  .NET function : ResetAnnotations
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.resetannotations()
end subroutine

public function dotnetobject of_rotateannotations(dotnetobject anv_writer,dotnetobject anv_pagesize);
//*-----------------------------------------------------------------*/
//*  .NET function : RotateAnnotations
//*   Argument:
//*              Dotnetobject anv_writer
//*              Dotnetobject anv_pagesize
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
lnv_result = This.rotateannotations(anv_writer,anv_pagesize)
Return lnv_result
end function

public function dotnetobject of_convertannotation(dotnetobject anv_writer,dotnetobject anv_annot,dotnetobject anv_defaultrect);
//*-----------------------------------------------------------------*/
//*  .NET function : ConvertAnnotation
//*   Argument:
//*              Dotnetobject anv_writer
//*              Dotnetobject anv_annot
//*              Dotnetobject anv_defaultrect
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
lnv_result = This.convertannotation(anv_writer,anv_annot,anv_defaultrect)
Return lnv_result
end function

public function dotnetobject get_acroform();
//*-----------------------------------------------------------------*/
//*  .NET property : AcroForm
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
lnv_result = This.acroform
Return lnv_result
end function

public subroutine  set_sigflags(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SigFlags
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.sigflags = al_value
end subroutine

on nvo_pdfannotationsimp.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfannotationsimp.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

