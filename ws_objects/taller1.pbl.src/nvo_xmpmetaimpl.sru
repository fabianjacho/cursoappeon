$PBExportHeader$nvo_xmpmetaimpl.sru
forward
global type nvo_xmpmetaimpl from dotnetobject
end type
end forward

global type nvo_xmpmetaimpl from dotnetobject
end type
global nvo_xmpmetaimpl nvo_xmpmetaimpl

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.xmp.impl.XmpMetaImpl"

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
public subroutine  of_appendarrayitem(string as_schemans,string as_arrayname,dotnetobject anv_arrayoptions,string as_itemvalue,dotnetobject anv_itemoptions)
public subroutine  of_appendarrayitem(string as_schemans,string as_arrayname,string as_itemvalue)
public function long of_countarrayitems(string as_schemans,string as_arrayname)
public subroutine  of_deletearrayitem(string as_schemans,string as_arrayname,long al_itemindex)
public subroutine  of_deleteproperty(string as_schemans,string as_propname)
public subroutine  of_deletequalifier(string as_schemans,string as_propname,string as_qualns,string as_qualname)
public subroutine  of_deletestructfield(string as_schemans,string as_structname,string as_fieldns,string as_fieldname)
public function boolean of_doespropertyexist(string as_schemans,string as_propname)
public function boolean of_doesarrayitemexist(string as_schemans,string as_arrayname,long al_itemindex)
public function boolean of_doesstructfieldexist(string as_schemans,string as_structname,string as_fieldns,string as_fieldname)
public function boolean of_doesqualifierexist(string as_schemans,string as_propname,string as_qualns,string as_qualname)
public function dotnetobject of_getarrayitem(string as_schemans,string as_arrayname,long al_itemindex)
public function dotnetobject of_getlocalizedtext(string as_schemans,string as_alttextname,string as_genericlang,string as_specificlang)
public subroutine  of_setlocalizedtext(string as_schemans,string as_alttextname,string as_genericlang,string as_specificlang,string as_itemvalue,dotnetobject anv_options)
public subroutine  of_setlocalizedtext(string as_schemans,string as_alttextname,string as_genericlang,string as_specificlang,string as_itemvalue)
public function dotnetobject of_getproperty(string as_schemans,string as_propname)
public function boolean of_getpropertyboolean(string as_schemans,string as_propname)
public subroutine  of_setpropertyboolean(string as_schemans,string as_propname,boolean abln_propvalue,dotnetobject anv_options)
public subroutine  of_setpropertyboolean(string as_schemans,string as_propname,boolean abln_propvalue)
public function long of_getpropertyinteger(string as_schemans,string as_propname)
public subroutine  of_setpropertyinteger(string as_schemans,string as_propname,long al_propvalue,dotnetobject anv_options)
public subroutine  of_setpropertyinteger(string as_schemans,string as_propname,long al_propvalue)
public function longlong of_getpropertylong(string as_schemans,string as_propname)
public subroutine  of_setpropertylong(string as_schemans,string as_propname,longlong all_propvalue,dotnetobject anv_options)
public subroutine  of_setpropertylong(string as_schemans,string as_propname,longlong all_propvalue)
public function double of_getpropertydouble(string as_schemans,string as_propname)
public subroutine  of_setpropertydouble(string as_schemans,string as_propname,double adb_propvalue,dotnetobject anv_options)
public subroutine  of_setpropertydouble(string as_schemans,string as_propname,double adb_propvalue)
public function dotnetobject of_getpropertydate(string as_schemans,string as_propname)
public subroutine  of_setpropertydate(string as_schemans,string as_propname,dotnetobject anv_propvalue,dotnetobject anv_options)
public subroutine  of_setpropertydate(string as_schemans,string as_propname,dotnetobject anv_propvalue)
public function datetime of_getpropertycalendar(string as_schemans,string as_propname)
public subroutine  of_setpropertycalendar(string as_schemans,string as_propname,datetime adt_propvalue,dotnetobject anv_options)
public subroutine  of_setpropertycalendar(string as_schemans,string as_propname,datetime adt_propvalue)
public function string of_getpropertystring(string as_schemans,string as_propname)
public function dotnetobject of_getqualifier(string as_schemans,string as_propname,string as_qualns,string as_qualname)
public function dotnetobject of_getstructfield(string as_schemans,string as_structname,string as_fieldns,string as_fieldname)
public function dotnetobject of_iterator()
public function dotnetobject of_iterator(dotnetobject anv_options)
public function dotnetobject of_iterator(string as_schemans,string as_propname,dotnetobject anv_options)
public subroutine  of_setarrayitem(string as_schemans,string as_arrayname,long al_itemindex,string as_itemvalue,dotnetobject anv_options)
public subroutine  of_setarrayitem(string as_schemans,string as_arrayname,long al_itemindex,string as_itemvalue)
public subroutine  of_insertarrayitem(string as_schemans,string as_arrayname,long al_itemindex,string as_itemvalue,dotnetobject anv_options)
public subroutine  of_insertarrayitem(string as_schemans,string as_arrayname,long al_itemindex,string as_itemvalue)
public subroutine  of_setproperty(string as_schemans,string as_propname,dotnetobject anv_propvalue,dotnetobject anv_options)
public subroutine  of_setproperty(string as_schemans,string as_propname,dotnetobject anv_propvalue)
public subroutine  of_setqualifier(string as_schemans,string as_propname,string as_qualns,string as_qualname,string as_qualvalue,dotnetobject anv_options)
public subroutine  of_setqualifier(string as_schemans,string as_propname,string as_qualns,string as_qualname,string as_qualvalue)
public subroutine  of_setstructfield(string as_schemans,string as_structname,string as_fieldns,string as_fieldname,string as_fieldvalue,dotnetobject anv_options)
public subroutine  of_setstructfield(string as_schemans,string as_structname,string as_fieldns,string as_fieldname,string as_fieldvalue)
public function dotnetobject of_clone()
public function string of_dumpobject()
public subroutine  of_sort()
public subroutine  of_normalize(dotnetobject anv_options)
public function dotnetobject get_root()
public function string get_objectname()
public subroutine  set_objectname(string as_value)
public function string get_packetheader()
public subroutine  set_packetheader(string as_value)
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

public subroutine  of_appendarrayitem(string as_schemans,string as_arrayname,dotnetobject anv_arrayoptions,string as_itemvalue,dotnetobject anv_itemoptions);
//*-----------------------------------------------------------------*/
//*  .NET function : AppendArrayItem
//*   Argument:
//*              String as_schemans
//*              String as_arrayname
//*              Dotnetobject anv_arrayoptions
//*              String as_itemvalue
//*              Dotnetobject anv_itemoptions
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.appendarrayitem(as_schemans,as_arrayname,anv_arrayoptions,as_itemvalue,anv_itemoptions)
end subroutine

public subroutine  of_appendarrayitem(string as_schemans,string as_arrayname,string as_itemvalue);
//*-----------------------------------------------------------------*/
//*  .NET function : AppendArrayItem
//*   Argument:
//*              String as_schemans
//*              String as_arrayname
//*              String as_itemvalue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.appendarrayitem(as_schemans,as_arrayname,as_itemvalue)
end subroutine

public function long of_countarrayitems(string as_schemans,string as_arrayname);
//*-----------------------------------------------------------------*/
//*  .NET function : CountArrayItems
//*   Argument:
//*              String as_schemans
//*              String as_arrayname
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
ll_result = This.countarrayitems(as_schemans,as_arrayname)
Return ll_result
end function

public subroutine  of_deletearrayitem(string as_schemans,string as_arrayname,long al_itemindex);
//*-----------------------------------------------------------------*/
//*  .NET function : DeleteArrayItem
//*   Argument:
//*              String as_schemans
//*              String as_arrayname
//*              Long al_itemindex
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.deletearrayitem(as_schemans,as_arrayname,al_itemindex)
end subroutine

public subroutine  of_deleteproperty(string as_schemans,string as_propname);
//*-----------------------------------------------------------------*/
//*  .NET function : DeleteProperty
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.deleteproperty(as_schemans,as_propname)
end subroutine

public subroutine  of_deletequalifier(string as_schemans,string as_propname,string as_qualns,string as_qualname);
//*-----------------------------------------------------------------*/
//*  .NET function : DeleteQualifier
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              String as_qualns
//*              String as_qualname
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.deletequalifier(as_schemans,as_propname,as_qualns,as_qualname)
end subroutine

public subroutine  of_deletestructfield(string as_schemans,string as_structname,string as_fieldns,string as_fieldname);
//*-----------------------------------------------------------------*/
//*  .NET function : DeleteStructField
//*   Argument:
//*              String as_schemans
//*              String as_structname
//*              String as_fieldns
//*              String as_fieldname
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.deletestructfield(as_schemans,as_structname,as_fieldns,as_fieldname)
end subroutine

public function boolean of_doespropertyexist(string as_schemans,string as_propname);
//*-----------------------------------------------------------------*/
//*  .NET function : DoesPropertyExist
//*   Argument:
//*              String as_schemans
//*              String as_propname
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
lbln_result = This.doespropertyexist(as_schemans,as_propname)
Return lbln_result
end function

public function boolean of_doesarrayitemexist(string as_schemans,string as_arrayname,long al_itemindex);
//*-----------------------------------------------------------------*/
//*  .NET function : DoesArrayItemExist
//*   Argument:
//*              String as_schemans
//*              String as_arrayname
//*              Long al_itemindex
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
lbln_result = This.doesarrayitemexist(as_schemans,as_arrayname,al_itemindex)
Return lbln_result
end function

public function boolean of_doesstructfieldexist(string as_schemans,string as_structname,string as_fieldns,string as_fieldname);
//*-----------------------------------------------------------------*/
//*  .NET function : DoesStructFieldExist
//*   Argument:
//*              String as_schemans
//*              String as_structname
//*              String as_fieldns
//*              String as_fieldname
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
lbln_result = This.doesstructfieldexist(as_schemans,as_structname,as_fieldns,as_fieldname)
Return lbln_result
end function

public function boolean of_doesqualifierexist(string as_schemans,string as_propname,string as_qualns,string as_qualname);
//*-----------------------------------------------------------------*/
//*  .NET function : DoesQualifierExist
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              String as_qualns
//*              String as_qualname
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
lbln_result = This.doesqualifierexist(as_schemans,as_propname,as_qualns,as_qualname)
Return lbln_result
end function

public function dotnetobject of_getarrayitem(string as_schemans,string as_arrayname,long al_itemindex);
//*-----------------------------------------------------------------*/
//*  .NET function : GetArrayItem
//*   Argument:
//*              String as_schemans
//*              String as_arrayname
//*              Long al_itemindex
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
lnv_result = This.getarrayitem(as_schemans,as_arrayname,al_itemindex)
Return lnv_result
end function

public function dotnetobject of_getlocalizedtext(string as_schemans,string as_alttextname,string as_genericlang,string as_specificlang);
//*-----------------------------------------------------------------*/
//*  .NET function : GetLocalizedText
//*   Argument:
//*              String as_schemans
//*              String as_alttextname
//*              String as_genericlang
//*              String as_specificlang
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
lnv_result = This.getlocalizedtext(as_schemans,as_alttextname,as_genericlang,as_specificlang)
Return lnv_result
end function

public subroutine  of_setlocalizedtext(string as_schemans,string as_alttextname,string as_genericlang,string as_specificlang,string as_itemvalue,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLocalizedText
//*   Argument:
//*              String as_schemans
//*              String as_alttextname
//*              String as_genericlang
//*              String as_specificlang
//*              String as_itemvalue
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlocalizedtext(as_schemans,as_alttextname,as_genericlang,as_specificlang,as_itemvalue,anv_options)
end subroutine

public subroutine  of_setlocalizedtext(string as_schemans,string as_alttextname,string as_genericlang,string as_specificlang,string as_itemvalue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetLocalizedText
//*   Argument:
//*              String as_schemans
//*              String as_alttextname
//*              String as_genericlang
//*              String as_specificlang
//*              String as_itemvalue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setlocalizedtext(as_schemans,as_alttextname,as_genericlang,as_specificlang,as_itemvalue)
end subroutine

public function dotnetobject of_getproperty(string as_schemans,string as_propname);
//*-----------------------------------------------------------------*/
//*  .NET function : GetProperty
//*   Argument:
//*              String as_schemans
//*              String as_propname
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
lnv_result = This.getproperty(as_schemans,as_propname)
Return lnv_result
end function

public function boolean of_getpropertyboolean(string as_schemans,string as_propname);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPropertyBoolean
//*   Argument:
//*              String as_schemans
//*              String as_propname
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
lbln_result = This.getpropertyboolean(as_schemans,as_propname)
Return lbln_result
end function

public subroutine  of_setpropertyboolean(string as_schemans,string as_propname,boolean abln_propvalue,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPropertyBoolean
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Boolean abln_propvalue
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpropertyboolean(as_schemans,as_propname,abln_propvalue,anv_options)
end subroutine

public subroutine  of_setpropertyboolean(string as_schemans,string as_propname,boolean abln_propvalue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPropertyBoolean
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Boolean abln_propvalue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpropertyboolean(as_schemans,as_propname,abln_propvalue)
end subroutine

public function long of_getpropertyinteger(string as_schemans,string as_propname);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPropertyInteger
//*   Argument:
//*              String as_schemans
//*              String as_propname
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
ll_result = This.getpropertyinteger(as_schemans,as_propname)
Return ll_result
end function

public subroutine  of_setpropertyinteger(string as_schemans,string as_propname,long al_propvalue,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPropertyInteger
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Long al_propvalue
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpropertyinteger(as_schemans,as_propname,al_propvalue,anv_options)
end subroutine

public subroutine  of_setpropertyinteger(string as_schemans,string as_propname,long al_propvalue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPropertyInteger
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Long al_propvalue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpropertyinteger(as_schemans,as_propname,al_propvalue)
end subroutine

public function longlong of_getpropertylong(string as_schemans,string as_propname);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPropertyLong
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*   Return : Longlong
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Longlong lll_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lll_result)
	Return lll_result
End If

/* Trigger the dotnet function */
lll_result = This.getpropertylong(as_schemans,as_propname)
Return lll_result
end function

public subroutine  of_setpropertylong(string as_schemans,string as_propname,longlong all_propvalue,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPropertyLong
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Longlong all_propvalue
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpropertylong(as_schemans,as_propname,all_propvalue,anv_options)
end subroutine

public subroutine  of_setpropertylong(string as_schemans,string as_propname,longlong all_propvalue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPropertyLong
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Longlong all_propvalue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpropertylong(as_schemans,as_propname,all_propvalue)
end subroutine

public function double of_getpropertydouble(string as_schemans,string as_propname);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPropertyDouble
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*   Return : Double
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Double ldb_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ldb_result)
	Return ldb_result
End If

/* Trigger the dotnet function */
ldb_result = This.getpropertydouble(as_schemans,as_propname)
Return ldb_result
end function

public subroutine  of_setpropertydouble(string as_schemans,string as_propname,double adb_propvalue,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPropertyDouble
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Double adb_propvalue
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpropertydouble(as_schemans,as_propname,adb_propvalue,anv_options)
end subroutine

public subroutine  of_setpropertydouble(string as_schemans,string as_propname,double adb_propvalue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPropertyDouble
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Double adb_propvalue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpropertydouble(as_schemans,as_propname,adb_propvalue)
end subroutine

public function dotnetobject of_getpropertydate(string as_schemans,string as_propname);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPropertyDate
//*   Argument:
//*              String as_schemans
//*              String as_propname
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
lnv_result = This.getpropertydate(as_schemans,as_propname)
Return lnv_result
end function

public subroutine  of_setpropertydate(string as_schemans,string as_propname,dotnetobject anv_propvalue,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPropertyDate
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Dotnetobject anv_propvalue
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpropertydate(as_schemans,as_propname,anv_propvalue,anv_options)
end subroutine

public subroutine  of_setpropertydate(string as_schemans,string as_propname,dotnetobject anv_propvalue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPropertyDate
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Dotnetobject anv_propvalue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpropertydate(as_schemans,as_propname,anv_propvalue)
end subroutine

public function datetime of_getpropertycalendar(string as_schemans,string as_propname);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPropertyCalendar
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*   Return : Datetime
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet function */
Datetime ldt_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ldt_result)
	Return ldt_result
End If

/* Trigger the dotnet function */
ldt_result = This.getpropertycalendar(as_schemans,as_propname)
Return ldt_result
end function

public subroutine  of_setpropertycalendar(string as_schemans,string as_propname,datetime adt_propvalue,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPropertyCalendar
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Datetime adt_propvalue
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpropertycalendar(as_schemans,as_propname,adt_propvalue,anv_options)
end subroutine

public subroutine  of_setpropertycalendar(string as_schemans,string as_propname,datetime adt_propvalue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetPropertyCalendar
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Datetime adt_propvalue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setpropertycalendar(as_schemans,as_propname,adt_propvalue)
end subroutine

public function string of_getpropertystring(string as_schemans,string as_propname);
//*-----------------------------------------------------------------*/
//*  .NET function : GetPropertyString
//*   Argument:
//*              String as_schemans
//*              String as_propname
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
ls_result = This.getpropertystring(as_schemans,as_propname)
Return ls_result
end function

public function dotnetobject of_getqualifier(string as_schemans,string as_propname,string as_qualns,string as_qualname);
//*-----------------------------------------------------------------*/
//*  .NET function : GetQualifier
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              String as_qualns
//*              String as_qualname
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
lnv_result = This.getqualifier(as_schemans,as_propname,as_qualns,as_qualname)
Return lnv_result
end function

public function dotnetobject of_getstructfield(string as_schemans,string as_structname,string as_fieldns,string as_fieldname);
//*-----------------------------------------------------------------*/
//*  .NET function : GetStructField
//*   Argument:
//*              String as_schemans
//*              String as_structname
//*              String as_fieldns
//*              String as_fieldname
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
lnv_result = This.getstructfield(as_schemans,as_structname,as_fieldns,as_fieldname)
Return lnv_result
end function

public function dotnetobject of_iterator();
//*-----------------------------------------------------------------*/
//*  .NET function : Iterator
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
lnv_result = This.iterator()
Return lnv_result
end function

public function dotnetobject of_iterator(dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : Iterator
//*   Argument:
//*              Dotnetobject anv_options
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
lnv_result = This.iterator(anv_options)
Return lnv_result
end function

public function dotnetobject of_iterator(string as_schemans,string as_propname,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : Iterator
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Dotnetobject anv_options
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
lnv_result = This.iterator(as_schemans,as_propname,anv_options)
Return lnv_result
end function

public subroutine  of_setarrayitem(string as_schemans,string as_arrayname,long al_itemindex,string as_itemvalue,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : SetArrayItem
//*   Argument:
//*              String as_schemans
//*              String as_arrayname
//*              Long al_itemindex
//*              String as_itemvalue
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setarrayitem(as_schemans,as_arrayname,al_itemindex,as_itemvalue,anv_options)
end subroutine

public subroutine  of_setarrayitem(string as_schemans,string as_arrayname,long al_itemindex,string as_itemvalue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetArrayItem
//*   Argument:
//*              String as_schemans
//*              String as_arrayname
//*              Long al_itemindex
//*              String as_itemvalue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setarrayitem(as_schemans,as_arrayname,al_itemindex,as_itemvalue)
end subroutine

public subroutine  of_insertarrayitem(string as_schemans,string as_arrayname,long al_itemindex,string as_itemvalue,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : InsertArrayItem
//*   Argument:
//*              String as_schemans
//*              String as_arrayname
//*              Long al_itemindex
//*              String as_itemvalue
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.insertarrayitem(as_schemans,as_arrayname,al_itemindex,as_itemvalue,anv_options)
end subroutine

public subroutine  of_insertarrayitem(string as_schemans,string as_arrayname,long al_itemindex,string as_itemvalue);
//*-----------------------------------------------------------------*/
//*  .NET function : InsertArrayItem
//*   Argument:
//*              String as_schemans
//*              String as_arrayname
//*              Long al_itemindex
//*              String as_itemvalue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.insertarrayitem(as_schemans,as_arrayname,al_itemindex,as_itemvalue)
end subroutine

public subroutine  of_setproperty(string as_schemans,string as_propname,dotnetobject anv_propvalue,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : SetProperty
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Dotnetobject anv_propvalue
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setproperty(as_schemans,as_propname,anv_propvalue,anv_options)
end subroutine

public subroutine  of_setproperty(string as_schemans,string as_propname,dotnetobject anv_propvalue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetProperty
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              Dotnetobject anv_propvalue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setproperty(as_schemans,as_propname,anv_propvalue)
end subroutine

public subroutine  of_setqualifier(string as_schemans,string as_propname,string as_qualns,string as_qualname,string as_qualvalue,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : SetQualifier
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              String as_qualns
//*              String as_qualname
//*              String as_qualvalue
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setqualifier(as_schemans,as_propname,as_qualns,as_qualname,as_qualvalue,anv_options)
end subroutine

public subroutine  of_setqualifier(string as_schemans,string as_propname,string as_qualns,string as_qualname,string as_qualvalue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetQualifier
//*   Argument:
//*              String as_schemans
//*              String as_propname
//*              String as_qualns
//*              String as_qualname
//*              String as_qualvalue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setqualifier(as_schemans,as_propname,as_qualns,as_qualname,as_qualvalue)
end subroutine

public subroutine  of_setstructfield(string as_schemans,string as_structname,string as_fieldns,string as_fieldname,string as_fieldvalue,dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : SetStructField
//*   Argument:
//*              String as_schemans
//*              String as_structname
//*              String as_fieldns
//*              String as_fieldname
//*              String as_fieldvalue
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setstructfield(as_schemans,as_structname,as_fieldns,as_fieldname,as_fieldvalue,anv_options)
end subroutine

public subroutine  of_setstructfield(string as_schemans,string as_structname,string as_fieldns,string as_fieldname,string as_fieldvalue);
//*-----------------------------------------------------------------*/
//*  .NET function : SetStructField
//*   Argument:
//*              String as_schemans
//*              String as_structname
//*              String as_fieldns
//*              String as_fieldname
//*              String as_fieldvalue
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setstructfield(as_schemans,as_structname,as_fieldns,as_fieldname,as_fieldvalue)
end subroutine

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

public function string of_dumpobject();
//*-----------------------------------------------------------------*/
//*  .NET function : DumpObject
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
ls_result = This.dumpobject()
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

public subroutine  of_normalize(dotnetobject anv_options);
//*-----------------------------------------------------------------*/
//*  .NET function : Normalize
//*   Argument:
//*              Dotnetobject anv_options
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.normalize(anv_options)
end subroutine

public function dotnetobject get_root();
//*-----------------------------------------------------------------*/
//*  .NET property : Root
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
lnv_result = This.root
Return lnv_result
end function

public function string get_objectname();
//*-----------------------------------------------------------------*/
//*  .NET property : ObjectName
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
ls_result = This.objectname
Return ls_result
end function

public subroutine  set_objectname(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ObjectName
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.objectname = as_value
end subroutine

public function string get_packetheader();
//*-----------------------------------------------------------------*/
//*  .NET property : PacketHeader
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
ls_result = This.packetheader
Return ls_result
end function

public subroutine  set_packetheader(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PacketHeader
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.packetheader = as_value
end subroutine

on nvo_xmpmetaimpl.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_xmpmetaimpl.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

