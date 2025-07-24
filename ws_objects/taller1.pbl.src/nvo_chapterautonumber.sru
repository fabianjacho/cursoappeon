$PBExportHeader$nvo_chapterautonumber.sru
forward
global type nvo_chapterautonumber from dotnetobject
end type
end forward

global type nvo_chapterautonumber from dotnetobject
end type
global nvo_chapterautonumber nvo_chapterautonumber

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.ChapterAutoNumber"

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
public function dotnetobject of_addsection(string as_title)
public function dotnetobject of_addsection(dotnetobject anv_title)
public function long of_setautomaticnumber(long al_number)
public function boolean of_isnestable()
public function boolean of_process(dotnetobject anv_listener)
public function boolean of_iscontent()
public subroutine  of_add(long al_index,dotnetobject anv_element)
public function boolean of_add(dotnetobject anv_element)
public function boolean of_addall(dotnetobject anv_collection)
public function dotnetobject of_addsection(real ar_indentation,dotnetobject anv_title,long al_numberdepth)
public function dotnetobject of_addsection(real ar_indentation,dotnetobject anv_title)
public function dotnetobject of_addsection(dotnetobject anv_title,long al_numberdepth)
public function dotnetobject of_addmarkedsection()
public function dotnetobject of_addsection(real ar_indentation,string as_title,long al_numberdepth)
public function dotnetobject of_addsection(string as_title,long al_numberdepth)
public function dotnetobject of_addsection(real ar_indentation,string as_title)
public function boolean of_ischapter()
public function boolean of_issection()
public function dotnetobject of_getbookmarktitle()
public function string of_tostring()
public subroutine  of_setchapternumber(long al_number)
public subroutine  of_flushcontent()
public subroutine  of_newpage()
public function dotnetobject of_getaccessibleattribute(dotnetobject anv_key)
public subroutine  of_setaccessibleattribute(dotnetobject anv_key,dotnetobject anv_value)
public function dotnetobject of_getaccessibleattributes()
public function long get_type()
public function dotnetobject get_chunks()
public function dotnetobject get_title()
public subroutine  set_title(dotnetobject anv_value)
public function long get_numberstyle()
public subroutine  set_numberstyle(long al_value)
public function long get_numberdepth()
public subroutine  set_numberdepth(long al_value)
public function real get_indentationleft()
public subroutine  set_indentationleft(real ar_value)
public function real get_indentationright()
public subroutine  set_indentationright(real ar_value)
public function real get_indentation()
public subroutine  set_indentation(real ar_value)
public function long get_depth()
public function boolean get_bookmarkopen()
public subroutine  set_bookmarkopen(boolean abln_value)
public subroutine  set_bookmarktitle(string as_value)
public function boolean get_triggernewpage()
public subroutine  set_triggernewpage(boolean abln_value)
public function boolean get_notaddedyet()
public subroutine  set_notaddedyet(boolean abln_value)
public function boolean get_elementcomplete()
public subroutine  set_elementcomplete(boolean abln_value)
public function dotnetobject get_role()
public subroutine  set_role(dotnetobject anv_value)
public function dotnetobject get_id()
public subroutine  set_id(dotnetobject anv_value)
public function boolean get_isinline()
public function long get_capacity()
public subroutine  set_capacity(long al_value)
public function long get_count()
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

public function dotnetobject of_addsection(string as_title);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSection
//*   Argument:
//*              String as_title
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
lnv_result = This.addsection(as_title)
Return lnv_result
end function

public function dotnetobject of_addsection(dotnetobject anv_title);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSection
//*   Argument:
//*              Dotnetobject anv_title
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
lnv_result = This.addsection(anv_title)
Return lnv_result
end function

public function long of_setautomaticnumber(long al_number);
//*-----------------------------------------------------------------*/
//*  .NET function : SetAutomaticNumber
//*   Argument:
//*              Long al_number
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
ll_result = This.setautomaticnumber(al_number)
Return ll_result
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

public subroutine  of_add(long al_index,dotnetobject anv_element);
//*-----------------------------------------------------------------*/
//*  .NET function : Add
//*   Argument:
//*              Long al_index
//*              Dotnetobject anv_element
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.add(al_index,anv_element)
end subroutine

public function boolean of_add(dotnetobject anv_element);
//*-----------------------------------------------------------------*/
//*  .NET function : Add
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
lbln_result = This.add(anv_element)
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

public function dotnetobject of_addsection(real ar_indentation,dotnetobject anv_title,long al_numberdepth);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSection
//*   Argument:
//*              Real ar_indentation
//*              Dotnetobject anv_title
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
lnv_result = This.addsection(ar_indentation,anv_title,al_numberdepth)
Return lnv_result
end function

public function dotnetobject of_addsection(real ar_indentation,dotnetobject anv_title);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSection
//*   Argument:
//*              Real ar_indentation
//*              Dotnetobject anv_title
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
lnv_result = This.addsection(ar_indentation,anv_title)
Return lnv_result
end function

public function dotnetobject of_addsection(dotnetobject anv_title,long al_numberdepth);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSection
//*   Argument:
//*              Dotnetobject anv_title
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
lnv_result = This.addsection(anv_title,al_numberdepth)
Return lnv_result
end function

public function dotnetobject of_addmarkedsection();
//*-----------------------------------------------------------------*/
//*  .NET function : AddMarkedSection
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
lnv_result = This.addmarkedsection()
Return lnv_result
end function

public function dotnetobject of_addsection(real ar_indentation,string as_title,long al_numberdepth);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSection
//*   Argument:
//*              Real ar_indentation
//*              String as_title
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
lnv_result = This.addsection(ar_indentation,as_title,al_numberdepth)
Return lnv_result
end function

public function dotnetobject of_addsection(string as_title,long al_numberdepth);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSection
//*   Argument:
//*              String as_title
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
lnv_result = This.addsection(as_title,al_numberdepth)
Return lnv_result
end function

public function dotnetobject of_addsection(real ar_indentation,string as_title);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSection
//*   Argument:
//*              Real ar_indentation
//*              String as_title
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
lnv_result = This.addsection(ar_indentation,as_title)
Return lnv_result
end function

public function boolean of_ischapter();
//*-----------------------------------------------------------------*/
//*  .NET function : IsChapter
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
lbln_result = This.ischapter()
Return lbln_result
end function

public function boolean of_issection();
//*-----------------------------------------------------------------*/
//*  .NET function : IsSection
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
lbln_result = This.issection()
Return lbln_result
end function

public function dotnetobject of_getbookmarktitle();
//*-----------------------------------------------------------------*/
//*  .NET function : GetBookmarkTitle
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
lnv_result = This.getbookmarktitle()
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

public subroutine  of_setchapternumber(long al_number);
//*-----------------------------------------------------------------*/
//*  .NET function : SetChapterNumber
//*   Argument:
//*              Long al_number
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setchapternumber(al_number)
end subroutine

public subroutine  of_flushcontent();
//*-----------------------------------------------------------------*/
//*  .NET function : FlushContent
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.flushcontent()
end subroutine

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

public function long get_numberstyle();
//*-----------------------------------------------------------------*/
//*  .NET property : NumberStyle
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
ll_result = This.numberstyle
Return ll_result
end function

public subroutine  set_numberstyle(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : NumberStyle
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.numberstyle = al_value
end subroutine

public function long get_numberdepth();
//*-----------------------------------------------------------------*/
//*  .NET property : NumberDepth
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
ll_result = This.numberdepth
Return ll_result
end function

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

public function real get_indentation();
//*-----------------------------------------------------------------*/
//*  .NET property : Indentation
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
lr_result = This.indentation
Return lr_result
end function

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

public function long get_depth();
//*-----------------------------------------------------------------*/
//*  .NET property : Depth
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
ll_result = This.depth
Return ll_result
end function

public function boolean get_bookmarkopen();
//*-----------------------------------------------------------------*/
//*  .NET property : BookmarkOpen
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
lbln_result = This.bookmarkopen
Return lbln_result
end function

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

public function boolean get_triggernewpage();
//*-----------------------------------------------------------------*/
//*  .NET property : TriggerNewPage
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
lbln_result = This.triggernewpage
Return lbln_result
end function

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

public function boolean get_notaddedyet();
//*-----------------------------------------------------------------*/
//*  .NET property : NotAddedYet
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
lbln_result = This.notaddedyet
Return lbln_result
end function

public subroutine  set_notaddedyet(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : NotAddedYet
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.notaddedyet = abln_value
end subroutine

public function boolean get_elementcomplete();
//*-----------------------------------------------------------------*/
//*  .NET property : ElementComplete
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
lbln_result = This.elementcomplete
Return lbln_result
end function

public subroutine  set_elementcomplete(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ElementComplete
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.elementcomplete = abln_value
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

public function long get_capacity();
//*-----------------------------------------------------------------*/
//*  .NET property : Capacity
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
ll_result = This.capacity
Return ll_result
end function

public subroutine  set_capacity(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Capacity
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.capacity = al_value
end subroutine

public function long get_count();
//*-----------------------------------------------------------------*/
//*  .NET property : Count
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
ll_result = This.count
Return ll_result
end function

on nvo_chapterautonumber.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_chapterautonumber.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

