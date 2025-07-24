$PBExportHeader$nvo_pdfprow.sru
forward
global type nvo_pdfprow from dotnetobject
end type
end forward

global type nvo_pdfprow from dotnetobject
end type
global nvo_pdfprow nvo_pdfprow

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PdfPRow"

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
public function boolean of_setwidths(real ar_widths[])
public subroutine  of_setextraheight(long al_cell,real ar_height)
public function real of_setcolumn(dotnetobject anv_ct,real ar_left,real ar_bottom,real ar_right,real ar_top)
public function boolean of_iscalculated()
public subroutine  of_copyrowcontent(dotnetobject anv_table,long al_idx)
public function dotnetobject of_splitrow(dotnetobject anv_table,long al_rowindex,real ar_new_height)
public function real of_getmaxrowheightswithoutcalculating()
public subroutine  of_setfinalmaxheights(real ar_maxheight)
public subroutine  of_splitrowspans(dotnetobject anv_original,long al_originalidx,dotnetobject anv_part,long al_partidx)
public function boolean of_hasrowspan()
public function dotnetobject of_getaccessibleattribute(dotnetobject anv_key)
public subroutine  of_setaccessibleattribute(dotnetobject anv_key,dotnetobject anv_value)
public function dotnetobject of_getaccessibleattributes()
public function boolean get_maynotbreak()
public subroutine  set_maynotbreak(boolean abln_value)
public function real get_maxheights()
public subroutine  set_maxheights(real ar_value)
public function boolean get_adjusted()
public subroutine  set_adjusted(boolean abln_value)
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

public function boolean of_setwidths(real ar_widths[]);
//*-----------------------------------------------------------------*/
//*  .NET function : SetWidths
//*   Argument:
//*              Real ar_widths[]
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
lbln_result = This.setwidths(ar_widths)
Return lbln_result
end function

public subroutine  of_setextraheight(long al_cell,real ar_height);
//*-----------------------------------------------------------------*/
//*  .NET function : SetExtraHeight
//*   Argument:
//*              Long al_cell
//*              Real ar_height
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setextraheight(al_cell,ar_height)
end subroutine

public function real of_setcolumn(dotnetobject anv_ct,real ar_left,real ar_bottom,real ar_right,real ar_top);
//*-----------------------------------------------------------------*/
//*  .NET function : SetColumn
//*   Argument:
//*              Dotnetobject anv_ct
//*              Real ar_left
//*              Real ar_bottom
//*              Real ar_right
//*              Real ar_top
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
lr_result = This.setcolumn(anv_ct,ar_left,ar_bottom,ar_right,ar_top)
Return lr_result
end function

public function boolean of_iscalculated();
//*-----------------------------------------------------------------*/
//*  .NET function : IsCalculated
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
lbln_result = This.iscalculated()
Return lbln_result
end function

public subroutine  of_copyrowcontent(dotnetobject anv_table,long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : CopyRowContent
//*   Argument:
//*              Dotnetobject anv_table
//*              Long al_idx
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.copyrowcontent(anv_table,al_idx)
end subroutine

public function dotnetobject of_splitrow(dotnetobject anv_table,long al_rowindex,real ar_new_height);
//*-----------------------------------------------------------------*/
//*  .NET function : SplitRow
//*   Argument:
//*              Dotnetobject anv_table
//*              Long al_rowindex
//*              Real ar_new_height
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
lnv_result = This.splitrow(anv_table,al_rowindex,ar_new_height)
Return lnv_result
end function

public function real of_getmaxrowheightswithoutcalculating();
//*-----------------------------------------------------------------*/
//*  .NET function : GetMaxRowHeightsWithoutCalculating
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
lr_result = This.getmaxrowheightswithoutcalculating()
Return lr_result
end function

public subroutine  of_setfinalmaxheights(real ar_maxheight);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFinalMaxHeights
//*   Argument:
//*              Real ar_maxheight
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setfinalmaxheights(ar_maxheight)
end subroutine

public subroutine  of_splitrowspans(dotnetobject anv_original,long al_originalidx,dotnetobject anv_part,long al_partidx);
//*-----------------------------------------------------------------*/
//*  .NET function : SplitRowspans
//*   Argument:
//*              Dotnetobject anv_original
//*              Long al_originalidx
//*              Dotnetobject anv_part
//*              Long al_partidx
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.splitrowspans(anv_original,al_originalidx,anv_part,al_partidx)
end subroutine

public function boolean of_hasrowspan();
//*-----------------------------------------------------------------*/
//*  .NET function : HasRowspan
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
lbln_result = This.hasrowspan()
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

public function boolean get_maynotbreak();
//*-----------------------------------------------------------------*/
//*  .NET property : MayNotBreak
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
lbln_result = This.maynotbreak
Return lbln_result
end function

public subroutine  set_maynotbreak(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MayNotBreak
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.maynotbreak = abln_value
end subroutine

public function real get_maxheights();
//*-----------------------------------------------------------------*/
//*  .NET property : MaxHeights
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
lr_result = This.maxheights
Return lr_result
end function

public subroutine  set_maxheights(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : MaxHeights
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.maxheights = ar_value
end subroutine

public function boolean get_adjusted();
//*-----------------------------------------------------------------*/
//*  .NET property : Adjusted
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
lbln_result = This.adjusted
Return lbln_result
end function

public subroutine  set_adjusted(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Adjusted
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.adjusted = abln_value
end subroutine

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

on nvo_pdfprow.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfprow.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

