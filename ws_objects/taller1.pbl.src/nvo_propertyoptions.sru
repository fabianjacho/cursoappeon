$PBExportHeader$nvo_propertyoptions.sru
forward
global type nvo_propertyoptions from dotnetobject
end type
end forward

global type nvo_propertyoptions from dotnetobject
end type
global nvo_propertyoptions nvo_propertyoptions

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.xmp.options.PropertyOptions"

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
public function boolean of_equalarraytypes(dotnetobject anv_options)
public subroutine  of_mergewith(dotnetobject anv_options)
public subroutine  of_clear()
public function boolean of_isexactly(ulong aul_optionbits)
public function boolean of_containsalloptions(ulong aul_optionbits)
public function boolean of_containsoneof(ulong aul_optionbits)
public subroutine  of_setoption(ulong aul_optionbits,boolean abln_value)
public function boolean of_equals(dotnetobject anv_obj)
public function long of_gethashcode()
public function string of_tostring()
public function boolean get_uri()
public subroutine  set_uri(boolean abln_value)
public function boolean get_hasqualifiers()
public subroutine  set_hasqualifiers(boolean abln_value)
public function boolean get_qualifier()
public subroutine  set_qualifier(boolean abln_value)
public function boolean get_haslanguage()
public subroutine  set_haslanguage(boolean abln_value)
public function boolean get_hastype()
public subroutine  set_hastype(boolean abln_value)
public function boolean get_struct()
public subroutine  set_struct(boolean abln_value)
public function boolean get_array()
public subroutine  set_array(boolean abln_value)
public function boolean get_arrayordered()
public subroutine  set_arrayordered(boolean abln_value)
public function boolean get_arrayalternate()
public subroutine  set_arrayalternate(boolean abln_value)
public function boolean get_arrayalttext()
public subroutine  set_arrayalttext(boolean abln_value)
public function boolean get_schemanode()
public subroutine  set_schemanode(boolean abln_value)
public function boolean get_compositeproperty()
public function boolean get_simple()
public function boolean get_onlyarrayoptions()
public function ulong get_options()
public subroutine  set_options(ulong aul_value)
public function string get_optionsstring()
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

public function boolean of_equalarraytypes(dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : EqualArrayTypes
//*   Argument:
//*              Dotnetobject anv_options
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
lbln_result = This.equalarraytypes(anv_options)
Return lbln_result
end function

public subroutine  of_mergewith(dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : MergeWith
//*   Argument:
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.mergewith(anv_options)
end subroutine

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

public function boolean of_isexactly(ulong aul_optionbits);
//*-----------------------------------------------------------------*/
//*  .NET function : IsExactly
//*   Argument:
//*              Ulong aul_optionbits
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
lbln_result = This.isexactly(aul_optionbits)
Return lbln_result
end function

public function boolean of_containsalloptions(ulong aul_optionbits);
//*-----------------------------------------------------------------*/
//*  .NET function : ContainsAllOptions
//*   Argument:
//*              Ulong aul_optionbits
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
lbln_result = This.containsalloptions(aul_optionbits)
Return lbln_result
end function

public function boolean of_containsoneof(ulong aul_optionbits);
//*-----------------------------------------------------------------*/
//*  .NET function : ContainsOneOf
//*   Argument:
//*              Ulong aul_optionbits
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
lbln_result = This.containsoneof(aul_optionbits)
Return lbln_result
end function

public subroutine  of_setoption(ulong aul_optionbits,boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET function : SetOption
//*   Argument:
//*              Ulong aul_optionbits
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setoption(aul_optionbits,abln_value)
end subroutine

public function boolean of_equals(dotnetobject anv_obj);
//*-----------------------------------------------------------------*/
//*  .NET function : Equals
//*   Argument:
//*              Dotnetobject anv_obj
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
lbln_result = This.equals(anv_obj)
Return lbln_result
end function

public function long of_gethashcode();
//*-----------------------------------------------------------------*/
//*  .NET function : GetHashCode
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
ll_result = This.gethashcode()
Return ll_result
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

public function boolean get_uri();
//*-----------------------------------------------------------------*/
//*  .NET property : Uri
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
lbln_result = This.uri
Return lbln_result
end function

public subroutine  set_uri(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Uri
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.uri = abln_value
end subroutine

public function boolean get_hasqualifiers();
//*-----------------------------------------------------------------*/
//*  .NET property : HasQualifiers
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
lbln_result = This.hasqualifiers
Return lbln_result
end function

public subroutine  set_hasqualifiers(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : HasQualifiers
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.hasqualifiers = abln_value
end subroutine

public function boolean get_qualifier();
//*-----------------------------------------------------------------*/
//*  .NET property : Qualifier
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
lbln_result = This.qualifier
Return lbln_result
end function

public subroutine  set_qualifier(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Qualifier
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.qualifier = abln_value
end subroutine

public function boolean get_haslanguage();
//*-----------------------------------------------------------------*/
//*  .NET property : HasLanguage
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
lbln_result = This.haslanguage
Return lbln_result
end function

public subroutine  set_haslanguage(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : HasLanguage
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.haslanguage = abln_value
end subroutine

public function boolean get_hastype();
//*-----------------------------------------------------------------*/
//*  .NET property : HasType
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
lbln_result = This.hastype
Return lbln_result
end function

public subroutine  set_hastype(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : HasType
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.hastype = abln_value
end subroutine

public function boolean get_struct();
//*-----------------------------------------------------------------*/
//*  .NET property : Struct
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
lbln_result = This.struct
Return lbln_result
end function

public subroutine  set_struct(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Struct
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.struct = abln_value
end subroutine

public function boolean get_array();
//*-----------------------------------------------------------------*/
//*  .NET property : Array
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
lbln_result = This.array
Return lbln_result
end function

public subroutine  set_array(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Array
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.array = abln_value
end subroutine

public function boolean get_arrayordered();
//*-----------------------------------------------------------------*/
//*  .NET property : ArrayOrdered
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
lbln_result = This.arrayordered
Return lbln_result
end function

public subroutine  set_arrayordered(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ArrayOrdered
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.arrayordered = abln_value
end subroutine

public function boolean get_arrayalternate();
//*-----------------------------------------------------------------*/
//*  .NET property : ArrayAlternate
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
lbln_result = This.arrayalternate
Return lbln_result
end function

public subroutine  set_arrayalternate(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ArrayAlternate
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.arrayalternate = abln_value
end subroutine

public function boolean get_arrayalttext();
//*-----------------------------------------------------------------*/
//*  .NET property : ArrayAltText
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
lbln_result = This.arrayalttext
Return lbln_result
end function

public subroutine  set_arrayalttext(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ArrayAltText
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.arrayalttext = abln_value
end subroutine

public function boolean get_schemanode();
//*-----------------------------------------------------------------*/
//*  .NET property : SchemaNode
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
lbln_result = This.schemanode
Return lbln_result
end function

public subroutine  set_schemanode(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SchemaNode
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.schemanode = abln_value
end subroutine

public function boolean get_compositeproperty();
//*-----------------------------------------------------------------*/
//*  .NET property : CompositeProperty
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
lbln_result = This.compositeproperty
Return lbln_result
end function

public function boolean get_simple();
//*-----------------------------------------------------------------*/
//*  .NET property : Simple
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
lbln_result = This.simple
Return lbln_result
end function

public function boolean get_onlyarrayoptions();
//*-----------------------------------------------------------------*/
//*  .NET property : OnlyArrayOptions
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
lbln_result = This.onlyarrayoptions
Return lbln_result
end function

public function ulong get_options();
//*-----------------------------------------------------------------*/
//*  .NET property : Options
//*   Return : Ulong
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Ulong lul_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lul_result)
	Return lul_result
End If

/* Trigger the dotnet property */
lul_result = This.options
Return lul_result
end function

public subroutine  set_options(ulong aul_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Options
//*   Argument:
//*              Ulong aul_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.options = aul_value
end subroutine

public function string get_optionsstring();
//*-----------------------------------------------------------------*/
//*  .NET property : OptionsString
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
ls_result = This.optionsstring
Return ls_result
end function

on nvo_propertyoptions.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_propertyoptions.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

