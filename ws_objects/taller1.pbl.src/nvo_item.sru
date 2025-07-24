$PBExportHeader$nvo_item.sru
forward
global type nvo_item from dotnetobject
end type
end forward

global type nvo_item from dotnetobject
end type
global nvo_item nvo_item

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.AcroFields+Item"

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
public subroutine  of_writetoall(dotnetobject anv_key,dotnetobject anv_value,long al_writeflags)
public subroutine  of_markused(dotnetobject anv_parentfields,long al_writeflags)
public function dotnetobject of_getvalue(long al_idx)
public function dotnetobject of_getwidget(long al_idx)
public function dotnetobject of_getwidgetref(long al_idx)
public function dotnetobject of_getmerged(long al_idx)
public function long of_getpage(long al_idx)
public function long of_gettaborder(long al_idx)
public function long get_size()
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

public subroutine  of_writetoall(dotnetobject anv_key,dotnetobject anv_value,long al_writeflags);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteToAll
//*   Argument:
//*              Dotnetobject anv_key
//*              Dotnetobject anv_value
//*              Long al_writeflags
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.writetoall(anv_key,anv_value,al_writeflags)
end subroutine

public subroutine  of_markused(dotnetobject anv_parentfields,long al_writeflags);
//*-----------------------------------------------------------------*/
//*  .NET function : MarkUsed
//*   Argument:
//*              Dotnetobject anv_parentfields
//*              Long al_writeflags
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.markused(anv_parentfields,al_writeflags)
end subroutine

public function dotnetobject of_getvalue(long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : GetValue
//*   Argument:
//*              Long al_idx
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
lnv_result = This.getvalue(al_idx)
Return lnv_result
end function

public function dotnetobject of_getwidget(long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : GetWidget
//*   Argument:
//*              Long al_idx
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
lnv_result = This.getwidget(al_idx)
Return lnv_result
end function

public function dotnetobject of_getwidgetref(long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : GetWidgetRef
//*   Argument:
//*              Long al_idx
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
lnv_result = This.getwidgetref(al_idx)
Return lnv_result
end function

public function dotnetobject of_getmerged(long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : GetMerged
//*   Argument:
//*              Long al_idx
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
lnv_result = This.getmerged(al_idx)
Return lnv_result
end function

public function long of_getpage(long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPage
//*   Argument:
//*              Long al_idx
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
ll_result = This.getpage(al_idx)
Return ll_result
end function

public function long of_gettaborder(long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : GetTabOrder
//*   Argument:
//*              Long al_idx
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
ll_result = This.gettaborder(al_idx)
Return ll_result
end function

public function long get_size();
//*-----------------------------------------------------------------*/
//*  .NET property : Size
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
ll_result = This.size
Return ll_result
end function

on nvo_item.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_item.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

