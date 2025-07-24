$PBExportHeader$nvo_document.sru
forward
global type nvo_document from dotnetobject
end type
end forward

global type nvo_document from dotnetobject
end type
global nvo_document nvo_document

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.Document"

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
public subroutine  of_adddoclistener(dotnetobject anv_listener)
public subroutine  of_removeidoclistener(dotnetobject anv_listener)
public function boolean of_add(dotnetobject anv_element)
public subroutine  of_open()
public subroutine  of_opendocument()
public function boolean of_setpagesize(dotnetobject anv_pagesize)
public function boolean of_setmargins(real ar_marginleft,real ar_marginright,real ar_margintop,real ar_marginbottom)
public function boolean of_newpage()
public subroutine  of_resetpagecount()
public subroutine  of_close()
public subroutine  of_closedocument()
public function boolean of_addheader(string as_name,string as_content)
public function boolean of_addtitle(string as_title)
public function boolean of_addsubject(string as_subject)
public function boolean of_addkeywords(string as_keywords)
public function boolean of_addauthor(string as_author)
public function boolean of_addcreator(string as_creator)
public function boolean of_addproducer()
public function boolean of_addlanguage(string as_language)
public function boolean of_addcreationdate()
public function real of_getleft(real ar_margin)
public function real of_getright(real ar_margin)
public function real of_gettop(real ar_margin)
public function real of_getbottom(real ar_margin)
public function boolean of_isopen()
public function boolean of_setmarginmirroring(boolean abln_marginmirroring)
public function boolean of_setmarginmirroringtopbottom(boolean abln_marginmirroringtopbottom)
public function boolean of_ismarginmirroring()
public subroutine  of_dispose()
public function dotnetobject of_getaccessibleattribute(dotnetobject anv_key)
public subroutine  of_setaccessibleattribute(dotnetobject anv_key,dotnetobject anv_value)
public function dotnetobject of_getaccessibleattributes()
public subroutine  set_pagecount(long al_value)
public function long get_pagenumber()
public function real get_leftmargin()
public function real get_rightmargin()
public function real get_topmargin()
public function real get_bottommargin()
public function real get_left()
public function real get_right()
public function real get_top()
public function real get_bottom()
public function dotnetobject get_pagesize()
public function string get_javascript_onload()
public subroutine  set_javascript_onload(string as_value)
public function string get_javascript_onunload()
public subroutine  set_javascript_onunload(string as_value)
public function string get_htmlstyleclass()
public subroutine  set_htmlstyleclass(string as_value)
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

public subroutine  of_adddoclistener(dotnetobject anv_listener);
//*-----------------------------------------------------------------*/
//*  .NET function : AddDocListener
//*   Argument:
//*              Dotnetobject anv_listener
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.adddoclistener(anv_listener)
end subroutine

public subroutine  of_removeidoclistener(dotnetobject anv_listener);
//*-----------------------------------------------------------------*/
//*  .NET function : RemoveIDocListener
//*   Argument:
//*              Dotnetobject anv_listener
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.removeidoclistener(anv_listener)
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

public subroutine  of_open();
//*-----------------------------------------------------------------*/
//*  .NET function : Open
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.open()
end subroutine

public subroutine  of_opendocument();
//*-----------------------------------------------------------------*/
//*  .NET function : OpenDocument
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.opendocument()
end subroutine

public function boolean of_setpagesize(dotnetobject anv_pagesize);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPageSize
//*   Argument:
//*              Dotnetobject anv_pagesize
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
lbln_result = This.setpagesize(anv_pagesize)
Return lbln_result
end function

public function boolean of_setmargins(real ar_marginleft,real ar_marginright,real ar_margintop,real ar_marginbottom);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMargins
//*   Argument:
//*              Real ar_marginleft
//*              Real ar_marginright
//*              Real ar_margintop
//*              Real ar_marginbottom
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
lbln_result = This.setmargins(ar_marginleft,ar_marginright,ar_margintop,ar_marginbottom)
Return lbln_result
end function

public function boolean of_newpage();
//*-----------------------------------------------------------------*/
//*  .NET function : NewPage
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
lbln_result = This.newpage()
Return lbln_result
end function

public subroutine  of_resetpagecount();
//*-----------------------------------------------------------------*/
//*  .NET function : ResetPageCount
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.resetpagecount()
end subroutine

public subroutine  of_close();
//*-----------------------------------------------------------------*/
//*  .NET function : Close
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.close()
end subroutine

public subroutine  of_closedocument();
//*-----------------------------------------------------------------*/
//*  .NET function : CloseDocument
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.closedocument()
end subroutine

public function boolean of_addheader(string as_name,string as_content);
//*-----------------------------------------------------------------*/
//*  .NET function : AddHeader
//*   Argument:
//*              String as_name
//*              String as_content
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
lbln_result = This.addheader(as_name,as_content)
Return lbln_result
end function

public function boolean of_addtitle(string as_title);
//*-----------------------------------------------------------------*/
//*  .NET function : AddTitle
//*   Argument:
//*              String as_title
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
lbln_result = This.addtitle(as_title)
Return lbln_result
end function

public function boolean of_addsubject(string as_subject);
//*-----------------------------------------------------------------*/
//*  .NET function : AddSubject
//*   Argument:
//*              String as_subject
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
lbln_result = This.addsubject(as_subject)
Return lbln_result
end function

public function boolean of_addkeywords(string as_keywords);
//*-----------------------------------------------------------------*/
//*  .NET function : AddKeywords
//*   Argument:
//*              String as_keywords
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
lbln_result = This.addkeywords(as_keywords)
Return lbln_result
end function

public function boolean of_addauthor(string as_author);
//*-----------------------------------------------------------------*/
//*  .NET function : AddAuthor
//*   Argument:
//*              String as_author
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
lbln_result = This.addauthor(as_author)
Return lbln_result
end function

public function boolean of_addcreator(string as_creator);
//*-----------------------------------------------------------------*/
//*  .NET function : AddCreator
//*   Argument:
//*              String as_creator
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
lbln_result = This.addcreator(as_creator)
Return lbln_result
end function

public function boolean of_addproducer();
//*-----------------------------------------------------------------*/
//*  .NET function : AddProducer
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
lbln_result = This.addproducer()
Return lbln_result
end function

public function boolean of_addlanguage(string as_language);
//*-----------------------------------------------------------------*/
//*  .NET function : AddLanguage
//*   Argument:
//*              String as_language
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
lbln_result = This.addlanguage(as_language)
Return lbln_result
end function

public function boolean of_addcreationdate();
//*-----------------------------------------------------------------*/
//*  .NET function : AddCreationDate
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
lbln_result = This.addcreationdate()
Return lbln_result
end function

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

public function boolean of_isopen();
//*-----------------------------------------------------------------*/
//*  .NET function : IsOpen
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
lbln_result = This.isopen()
Return lbln_result
end function

public function boolean of_setmarginmirroring(boolean abln_marginmirroring);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMarginMirroring
//*   Argument:
//*              Boolean abln_marginmirroring
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
lbln_result = This.setmarginmirroring(abln_marginmirroring)
Return lbln_result
end function

public function boolean of_setmarginmirroringtopbottom(boolean abln_marginmirroringtopbottom);
//*-----------------------------------------------------------------*/
//*  .NET function : SetMarginMirroringTopBottom
//*   Argument:
//*              Boolean abln_marginmirroringtopbottom
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
lbln_result = This.setmarginmirroringtopbottom(abln_marginmirroringtopbottom)
Return lbln_result
end function

public function boolean of_ismarginmirroring();
//*-----------------------------------------------------------------*/
//*  .NET function : IsMarginMirroring
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
lbln_result = This.ismarginmirroring()
Return lbln_result
end function

public subroutine  of_dispose();
//*-----------------------------------------------------------------*/
//*  .NET function : Dispose
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.dispose()
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

public subroutine  set_pagecount(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PageCount
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.pagecount = al_value
end subroutine

public function long get_pagenumber();
//*-----------------------------------------------------------------*/
//*  .NET property : PageNumber
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
ll_result = This.pagenumber
Return ll_result
end function

public function real get_leftmargin();
//*-----------------------------------------------------------------*/
//*  .NET property : LeftMargin
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
lr_result = This.leftmargin
Return lr_result
end function

public function real get_rightmargin();
//*-----------------------------------------------------------------*/
//*  .NET property : RightMargin
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
lr_result = This.rightmargin
Return lr_result
end function

public function real get_topmargin();
//*-----------------------------------------------------------------*/
//*  .NET property : TopMargin
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
lr_result = This.topmargin
Return lr_result
end function

public function real get_bottommargin();
//*-----------------------------------------------------------------*/
//*  .NET property : BottomMargin
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
lr_result = This.bottommargin
Return lr_result
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

public function dotnetobject get_pagesize();
//*-----------------------------------------------------------------*/
//*  .NET property : PageSize
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
lnv_result = This.pagesize
Return lnv_result
end function

public function string get_javascript_onload();
//*-----------------------------------------------------------------*/
//*  .NET property : JavaScript_onLoad
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
ls_result = This.javascript_onload
Return ls_result
end function

public subroutine  set_javascript_onload(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : JavaScript_onLoad
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.javascript_onload = as_value
end subroutine

public function string get_javascript_onunload();
//*-----------------------------------------------------------------*/
//*  .NET property : JavaScript_onUnLoad
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
ls_result = This.javascript_onunload
Return ls_result
end function

public subroutine  set_javascript_onunload(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : JavaScript_onUnLoad
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.javascript_onunload = as_value
end subroutine

public function string get_htmlstyleclass();
//*-----------------------------------------------------------------*/
//*  .NET property : HtmlStyleClass
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
ls_result = This.htmlstyleclass
Return ls_result
end function

public subroutine  set_htmlstyleclass(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : HtmlStyleClass
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.htmlstyleclass = as_value
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

on nvo_document.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_document.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

