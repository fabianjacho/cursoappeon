$PBExportHeader$nvo_markedsection.sru
forward
global type nvo_markedsection from dotnetobject
end type
end forward

global type nvo_markedsection from dotnetobject
end type
global nvo_markedsection nvo_markedsection

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.MarkedSection"

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
public subroutine  of_add(long al_index,dotnetobject anv_o)
public function boolean of_add(dotnetobject anv_o)
public function boolean of_process(dotnetobject anv_listener)
public function boolean of_addall(dotnetobject anv_collection)
public function dotnetobject of_addsection(real ar_indentation,long al_numberdepth)
public function dotnetobject of_addsection(real ar_indentation)
public function dotnetobject of_addsection(long al_numberdepth)
public function dotnetobject of_addsection()
public subroutine  of_newpage()
public function boolean of_iscontent()
public function boolean of_isnestable()
public subroutine  of_setmarkupattribute(string as_key,string as_value)
public function dotnetobject get_title()
public subroutine  set_title(dotnetobject anv_value)
public subroutine  set_numberdepth(long al_value)
public function real get_indentationleft()
public subroutine  set_indentationleft(real ar_value)
public function real get_indentationright()
public subroutine  set_indentationright(real ar_value)
public subroutine  set_indentation(real ar_value)
public subroutine  set_bookmarkopen(boolean abln_value)
public subroutine  set_triggernewpage(boolean abln_value)
public subroutine  set_bookmarktitle(string as_value)
public function dotnetobject get_chunks()
public function long get_type()
public function dotnetobject get_markupattributes()
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

public subroutine  of_add(long al_index,dotnetobject anv_o);
//*-----------------------------------------------------------------*/
//*  .NET function : Add
//*   Argument:
//*              Long al_index
//*              Dotnetobject anv_o
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.add(al_index,anv_o)
end subroutine

public function boolean of_add(dotnetobject anv_o);
//*-----------------------------------------------------------------*/
//*  .NET function : Add
//*   Argument:
//*              Dotnetobject anv_o
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
lbln_result = This.add(anv_o)
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

public function boolean of_addall(dotnetobject anv_collection);
//*-----------------------------------------------------------------*/
//*  .NET function : AddAll
//*   Argument:
//*              Dotnetobject anv_collection
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
lbln_result = This.addall(anv_collection)
Return lbln_result
end function

public function dotnetobject of_addsection(real ar_indentation,long al_numberdepth);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSection
//*   Argument:
//*              Real ar_indentation
//*              Long al_numberdepth
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
lnv_result = This.addsection(ar_indentation,al_numberdepth)
Return lnv_result
end function

public function dotnetobject of_addsection(real ar_indentation);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSection
//*   Argument:
//*              Real ar_indentation
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
lnv_result = This.addsection(ar_indentation)
Return lnv_result
end function

public function dotnetobject of_addsection(long al_numberdepth);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSection
//*   Argument:
//*              Long al_numberdepth
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
lnv_result = This.addsection(al_numberdepth)
Return lnv_result
end function

public function dotnetobject of_addsection();
//*-----------------------------------------------------------------*/
//*  .NET function : AddSection
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
lnv_result = This.addsection()
Return lnv_result
end function

public subroutine  of_newpage();
//*-----------------------------------------------------------------*/
//*  .NET function : NewPage
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.newpage()
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

public subroutine  of_setmarkupattribute(string as_key,string as_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMarkupAttribute
//*   Argument:
//*              String as_key
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setmarkupattribute(as_key,as_value)
end subroutine

public function dotnetobject get_title();
//*-----------------------------------------------------------------*/
//*  .NET property : Title
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
lnv_result = This.title
Return lnv_result
end function

public subroutine  set_title(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Title
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.title = anv_value
end subroutine

public subroutine  set_numberdepth(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : NumberDepth
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.numberdepth = al_value
end subroutine

public function real get_indentationleft();
//*-----------------------------------------------------------------*/
//*  .NET property : IndentationLeft
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
lr_result = This.indentationleft
Return lr_result
end function

public subroutine  set_indentationleft(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : IndentationLeft
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.indentationleft = ar_value
end subroutine

public function real get_indentationright();
//*-----------------------------------------------------------------*/
//*  .NET property : IndentationRight
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
lr_result = This.indentationright
Return lr_result
end function

public subroutine  set_indentationright(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : IndentationRight
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.indentationright = ar_value
end subroutine

public subroutine  set_indentation(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Indentation
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.indentation = ar_value
end subroutine

public subroutine  set_bookmarkopen(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BookmarkOpen
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.bookmarkopen = abln_value
end subroutine

public subroutine  set_triggernewpage(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : TriggerNewPage
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.triggernewpage = abln_value
end subroutine

public subroutine  set_bookmarktitle(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BookmarkTitle
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.bookmarktitle = as_value
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

public function dotnetobject get_markupattributes();
//*-----------------------------------------------------------------*/
//*  .NET property : MarkupAttributes
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
lnv_result = This.markupattributes
Return lnv_result
end function

on nvo_markedsection.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_markedsection.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

