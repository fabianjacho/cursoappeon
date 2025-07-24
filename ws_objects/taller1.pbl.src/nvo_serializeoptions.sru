$PBExportHeader$nvo_serializeoptions.sru
forward
global type nvo_serializeoptions from dotnetobject
end type
end forward

global type nvo_serializeoptions from dotnetobject
end type
global nvo_serializeoptions nvo_serializeoptions

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.xmp.options.SerializeOptions"

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
public subroutine  of_clear()
public function boolean of_isexactly(ulong aul_optionbits)
public function boolean of_containsalloptions(ulong aul_optionbits)
public function boolean of_containsoneof(ulong aul_optionbits)
public subroutine  of_setoption(ulong aul_optionbits,boolean abln_value)
public function boolean of_equals(dotnetobject anv_obj)
public function long of_gethashcode()
public function string of_tostring()
public function boolean get_omitpacketwrapper()
public subroutine  set_omitpacketwrapper(boolean abln_value)
public function boolean get_omitxmpmetaelement()
public subroutine  set_omitxmpmetaelement(boolean abln_value)
public function boolean get_readonlypacket()
public subroutine  set_readonlypacket(boolean abln_value)
public function boolean get_usecompactformat()
public subroutine  set_usecompactformat(boolean abln_value)
public function boolean get_usecanonicalformat()
public subroutine  set_usecanonicalformat(boolean abln_value)
public function boolean get_includethumbnailpad()
public subroutine  set_includethumbnailpad(boolean abln_value)
public function boolean get_exactpacketlength()
public subroutine  set_exactpacketlength(boolean abln_value)
public function boolean get_sort()
public subroutine  set_sort(boolean abln_value)
public function boolean get_encodeutf16be()
public subroutine  set_encodeutf16be(boolean abln_value)
public function boolean get_encodeutf16le()
public subroutine  set_encodeutf16le(boolean abln_value)
public function long get_baseindent()
public subroutine  set_baseindent(long al_value)
public function string get_indent()
public subroutine  set_indent(string as_value)
public function string get_newline()
public subroutine  set_newline(string as_value)
public function long get_padding()
public subroutine  set_padding(long al_value)
public function boolean get_omitversionattribute()
public function string get_encoding()
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

public function boolean get_omitpacketwrapper();
//*-----------------------------------------------------------------*/
//*  .NET property : OmitPacketWrapper
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
lbln_result = This.omitpacketwrapper
Return lbln_result
end function

public subroutine  set_omitpacketwrapper(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : OmitPacketWrapper
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.omitpacketwrapper = abln_value
end subroutine

public function boolean get_omitxmpmetaelement();
//*-----------------------------------------------------------------*/
//*  .NET property : OmitXmpMetaElement
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
lbln_result = This.omitxmpmetaelement
Return lbln_result
end function

public subroutine  set_omitxmpmetaelement(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : OmitXmpMetaElement
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.omitxmpmetaelement = abln_value
end subroutine

public function boolean get_readonlypacket();
//*-----------------------------------------------------------------*/
//*  .NET property : ReadOnlyPacket
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
lbln_result = This.readonlypacket
Return lbln_result
end function

public subroutine  set_readonlypacket(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ReadOnlyPacket
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.readonlypacket = abln_value
end subroutine

public function boolean get_usecompactformat();
//*-----------------------------------------------------------------*/
//*  .NET property : UseCompactFormat
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
lbln_result = This.usecompactformat
Return lbln_result
end function

public subroutine  set_usecompactformat(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : UseCompactFormat
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.usecompactformat = abln_value
end subroutine

public function boolean get_usecanonicalformat();
//*-----------------------------------------------------------------*/
//*  .NET property : UseCanonicalFormat
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
lbln_result = This.usecanonicalformat
Return lbln_result
end function

public subroutine  set_usecanonicalformat(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : UseCanonicalFormat
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.usecanonicalformat = abln_value
end subroutine

public function boolean get_includethumbnailpad();
//*-----------------------------------------------------------------*/
//*  .NET property : IncludeThumbnailPad
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
lbln_result = This.includethumbnailpad
Return lbln_result
end function

public subroutine  set_includethumbnailpad(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : IncludeThumbnailPad
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.includethumbnailpad = abln_value
end subroutine

public function boolean get_exactpacketlength();
//*-----------------------------------------------------------------*/
//*  .NET property : ExactPacketLength
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
lbln_result = This.exactpacketlength
Return lbln_result
end function

public subroutine  set_exactpacketlength(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ExactPacketLength
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.exactpacketlength = abln_value
end subroutine

public function boolean get_sort();
//*-----------------------------------------------------------------*/
//*  .NET property : Sort
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
lbln_result = This.sort
Return lbln_result
end function

public subroutine  set_sort(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Sort
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.sort = abln_value
end subroutine

public function boolean get_encodeutf16be();
//*-----------------------------------------------------------------*/
//*  .NET property : EncodeUtf16Be
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
lbln_result = This.encodeutf16be
Return lbln_result
end function

public subroutine  set_encodeutf16be(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : EncodeUtf16Be
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.encodeutf16be = abln_value
end subroutine

public function boolean get_encodeutf16le();
//*-----------------------------------------------------------------*/
//*  .NET property : EncodeUtf16Le
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
lbln_result = This.encodeutf16le
Return lbln_result
end function

public subroutine  set_encodeutf16le(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : EncodeUtf16Le
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.encodeutf16le = abln_value
end subroutine

public function long get_baseindent();
//*-----------------------------------------------------------------*/
//*  .NET property : BaseIndent
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
ll_result = This.baseindent
Return ll_result
end function

public subroutine  set_baseindent(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : BaseIndent
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.baseindent = al_value
end subroutine

public function string get_indent();
//*-----------------------------------------------------------------*/
//*  .NET property : Indent
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
ls_result = This.indent
Return ls_result
end function

public subroutine  set_indent(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Indent
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.indent = as_value
end subroutine

public function string get_newline();
//*-----------------------------------------------------------------*/
//*  .NET property : Newline
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
ls_result = This.newline
Return ls_result
end function

public subroutine  set_newline(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Newline
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.newline = as_value
end subroutine

public function long get_padding();
//*-----------------------------------------------------------------*/
//*  .NET property : Padding
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
ll_result = This.padding
Return ll_result
end function

public subroutine  set_padding(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Padding
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.padding = al_value
end subroutine

public function boolean get_omitversionattribute();
//*-----------------------------------------------------------------*/
//*  .NET property : OmitVersionAttribute
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
lbln_result = This.omitversionattribute
Return lbln_result
end function

public function string get_encoding();
//*-----------------------------------------------------------------*/
//*  .NET property : Encoding
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
ls_result = This.encoding
Return ls_result
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

on nvo_serializeoptions.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_serializeoptions.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

