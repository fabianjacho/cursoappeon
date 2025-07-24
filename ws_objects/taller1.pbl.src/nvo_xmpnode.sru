$PBExportHeader$nvo_xmpnode.sru
forward
global type nvo_xmpnode from dotnetobject
end type
end forward

global type nvo_xmpnode from dotnetobject
end type
global nvo_xmpnode nvo_xmpnode

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.xmp.impl.XmpNode"

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
public function dotnetobject of_clone()
public function long of_compareto(dotnetobject anv_xmpnode)
public subroutine  of_clear()
public function dotnetobject of_getchild(long al_index)
public subroutine  of_addchild(dotnetobject anv_node)
public subroutine  of_addchild(long al_index,dotnetobject anv_node)
public subroutine  of_replacechild(long al_index,dotnetobject anv_node)
public subroutine  of_removechild(long al_itemindex)
public subroutine  of_removechild(dotnetobject anv_node)
public subroutine  of_removechildren()
public function dotnetobject of_findchildbyname(string as_expr)
public function dotnetobject of_getqualifier(long al_index)
public subroutine  of_addqualifier(dotnetobject anv_qualnode)
public subroutine  of_removequalifier(dotnetobject anv_qualnode)
public subroutine  of_removequalifiers()
public function dotnetobject of_findqualifierbyname(string as_expr)
public function boolean of_haschildren()
public function dotnetobject of_iteratechildren()
public function boolean of_hasqualifier()
public function dotnetobject of_iteratequalifier()
public subroutine  of_clonesubtree(dotnetobject anv_destination)
public function string of_dumpnode(boolean abln_recursive)
public subroutine  of_sort()
public function dotnetobject get_parent()
public subroutine  set_parent(dotnetobject anv_value)
public function long get_childrenlength()
public function long get_qualifierlength()
public function string get_name()
public subroutine  set_name(string as_value)
public function string get_value()
public subroutine  set_value(string as_value)
public function dotnetobject get_options()
public subroutine  set_options(dotnetobject anv_value)
public function boolean get_implicit()
public subroutine  set_implicit(boolean abln_value)
public function boolean get_hasaliases()
public subroutine  set_hasaliases(boolean abln_value)
public function boolean get_alias()
public subroutine  set_alias(boolean abln_value)
public function boolean get_hasvaluechild()
public subroutine  set_hasvaluechild(boolean abln_value)
public function dotnetobject get_unmodifiablechildren()
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

public function dotnetobject of_clone();
//*-----------------------------------------------------------------*/
//*  .NET function : Clone
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
lnv_result = This.clone()
Return lnv_result
end function

public function long of_compareto(dotnetobject anv_xmpnode);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareTo
//*   Argument:
//*              Dotnetobject anv_xmpnode
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
ll_result = This.compareto(anv_xmpnode)
Return ll_result
end function

public subroutine  of_clear();
//*-----------------------------------------------------------------*/
//*  .NET function : Clear
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.clear()
end subroutine

public function dotnetobject of_getchild(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetChild
//*   Argument:
//*              Long al_index
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
lnv_result = This.getchild(al_index)
Return lnv_result
end function

public subroutine  of_addchild(dotnetobject anv_node);
//*-----------------------------------------------------------------*/
//*  .NET function : AddChild
//*   Argument:
//*              Dotnetobject anv_node
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addchild(anv_node)
end subroutine

public subroutine  of_addchild(long al_index,dotnetobject anv_node);
//*-----------------------------------------------------------------*/
//*  .NET function : AddChild
//*   Argument:
//*              Long al_index
//*              Dotnetobject anv_node
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addchild(al_index,anv_node)
end subroutine

public subroutine  of_replacechild(long al_index,dotnetobject anv_node);
//*-----------------------------------------------------------------*/
//*  .NET function : ReplaceChild
//*   Argument:
//*              Long al_index
//*              Dotnetobject anv_node
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.replacechild(al_index,anv_node)
end subroutine

public subroutine  of_removechild(long al_itemindex);
//*-----------------------------------------------------------------*/
//*  .NET function : RemoveChild
//*   Argument:
//*              Long al_itemindex
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.removechild(al_itemindex)
end subroutine

public subroutine  of_removechild(dotnetobject anv_node);
//*-----------------------------------------------------------------*/
//*  .NET function : RemoveChild
//*   Argument:
//*              Dotnetobject anv_node
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.removechild(anv_node)
end subroutine

public subroutine  of_removechildren();
//*-----------------------------------------------------------------*/
//*  .NET function : RemoveChildren
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.removechildren()
end subroutine

public function dotnetobject of_findchildbyname(string as_expr);
//*-----------------------------------------------------------------*/
//*  .NET function : FindChildByName
//*   Argument:
//*              String as_expr
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
lnv_result = This.findchildbyname(as_expr)
Return lnv_result
end function

public function dotnetobject of_getqualifier(long al_index);
//*-----------------------------------------------------------------*/
//*  .NET function : GetQualifier
//*   Argument:
//*              Long al_index
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
lnv_result = This.getqualifier(al_index)
Return lnv_result
end function

public subroutine  of_addqualifier(dotnetobject anv_qualnode);
//*-----------------------------------------------------------------*/
//*  .NET function : AddQualifier
//*   Argument:
//*              Dotnetobject anv_qualnode
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addqualifier(anv_qualnode)
end subroutine

public subroutine  of_removequalifier(dotnetobject anv_qualnode);
//*-----------------------------------------------------------------*/
//*  .NET function : RemoveQualifier
//*   Argument:
//*              Dotnetobject anv_qualnode
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.removequalifier(anv_qualnode)
end subroutine

public subroutine  of_removequalifiers();
//*-----------------------------------------------------------------*/
//*  .NET function : RemoveQualifiers
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.removequalifiers()
end subroutine

public function dotnetobject of_findqualifierbyname(string as_expr);
//*-----------------------------------------------------------------*/
//*  .NET function : FindQualifierByName
//*   Argument:
//*              String as_expr
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
lnv_result = This.findqualifierbyname(as_expr)
Return lnv_result
end function

public function boolean of_haschildren();
//*-----------------------------------------------------------------*/
//*  .NET function : HasChildren
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
lbln_result = This.haschildren()
Return lbln_result
end function

public function dotnetobject of_iteratechildren();
//*-----------------------------------------------------------------*/
//*  .NET function : IterateChildren
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
lnv_result = This.iteratechildren()
Return lnv_result
end function

public function boolean of_hasqualifier();
//*-----------------------------------------------------------------*/
//*  .NET function : HasQualifier
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
lbln_result = This.hasqualifier()
Return lbln_result
end function

public function dotnetobject of_iteratequalifier();
//*-----------------------------------------------------------------*/
//*  .NET function : IterateQualifier
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
lnv_result = This.iteratequalifier()
Return lnv_result
end function

public subroutine  of_clonesubtree(dotnetobject anv_destination);
//*-----------------------------------------------------------------*/
//*  .NET function : CloneSubtree
//*   Argument:
//*              Dotnetobject anv_destination
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.clonesubtree(anv_destination)
end subroutine

public function string of_dumpnode(boolean abln_recursive);
//*-----------------------------------------------------------------*/
//*  .NET function : DumpNode
//*   Argument:
//*              Boolean abln_recursive
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
ls_result = This.dumpnode(abln_recursive)
Return ls_result
end function

public subroutine  of_sort();
//*-----------------------------------------------------------------*/
//*  .NET function : Sort
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.sort()
end subroutine

public function dotnetobject get_parent();
//*-----------------------------------------------------------------*/
//*  .NET property : Parent
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
lnv_result = This.parent
Return lnv_result
end function

public subroutine  set_parent(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Parent
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.parent = anv_value
end subroutine

public function long get_childrenlength();
//*-----------------------------------------------------------------*/
//*  .NET property : ChildrenLength
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
ll_result = This.childrenlength
Return ll_result
end function

public function long get_qualifierlength();
//*-----------------------------------------------------------------*/
//*  .NET property : QualifierLength
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
ll_result = This.qualifierlength
Return ll_result
end function

public function string get_name();
//*-----------------------------------------------------------------*/
//*  .NET property : Name
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
ls_result = This.name
Return ls_result
end function

public subroutine  set_name(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Name
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.name = as_value
end subroutine

public function string get_value();
//*-----------------------------------------------------------------*/
//*  .NET property : Value
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
ls_result = This.value
Return ls_result
end function

public subroutine  set_value(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Value
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.value = as_value
end subroutine

public function dotnetobject get_options();
//*-----------------------------------------------------------------*/
//*  .NET property : Options
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
lnv_result = This.options
Return lnv_result
end function

public subroutine  set_options(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Options
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.options = anv_value
end subroutine

public function boolean get_implicit();
//*-----------------------------------------------------------------*/
//*  .NET property : Implicit
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
lbln_result = This.implicit
Return lbln_result
end function

public subroutine  set_implicit(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Implicit
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.implicit = abln_value
end subroutine

public function boolean get_hasaliases();
//*-----------------------------------------------------------------*/
//*  .NET property : HasAliases
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
lbln_result = This.hasaliases
Return lbln_result
end function

public subroutine  set_hasaliases(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : HasAliases
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.hasaliases = abln_value
end subroutine

public function boolean get_alias();
//*-----------------------------------------------------------------*/
//*  .NET property : Alias
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
lbln_result = This.alias
Return lbln_result
end function

public subroutine  set_alias(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Alias
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.alias = abln_value
end subroutine

public function boolean get_hasvaluechild();
//*-----------------------------------------------------------------*/
//*  .NET property : HasValueChild
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
lbln_result = This.hasvaluechild
Return lbln_result
end function

public subroutine  set_hasvaluechild(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : HasValueChild
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.hasvaluechild = abln_value
end subroutine

public function dotnetobject get_unmodifiablechildren();
//*-----------------------------------------------------------------*/
//*  .NET property : UnmodifiableChildren
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
lnv_result = This.unmodifiablechildren
Return lnv_result
end function

on nvo_xmpnode.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_xmpnode.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

