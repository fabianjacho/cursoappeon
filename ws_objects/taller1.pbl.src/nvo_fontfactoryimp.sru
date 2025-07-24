$PBExportHeader$nvo_fontfactoryimp.sru
forward
global type nvo_fontfactoryimp from dotnetobject
end type
end forward

global type nvo_fontfactoryimp from dotnetobject
end type
global nvo_fontfactoryimp nvo_fontfactoryimp

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.FontFactoryImp"

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
public function dotnetobject of_getfont(string as_fontname,string as_encoding,boolean abln_embedded,real ar_size,long al_style,dotnetobject anv_color)
public function dotnetobject of_getfont(string as_fontname,string as_encoding,boolean abln_embedded,real ar_size,long al_style,dotnetobject anv_color,boolean abln_cached)
public function dotnetobject of_getfont(string as_fontname,string as_encoding,boolean abln_embedded,real ar_size,long al_style)
public function dotnetobject of_getfont(string as_fontname,string as_encoding,boolean abln_embedded,real ar_size)
public function dotnetobject of_getfont(string as_fontname,string as_encoding,boolean abln_embedded)
public function dotnetobject of_getfont(string as_fontname,string as_encoding,real ar_size,long al_style,dotnetobject anv_color)
public function dotnetobject of_getfont(string as_fontname,string as_encoding,real ar_size,long al_style)
public function dotnetobject of_getfont(string as_fontname,string as_encoding,real ar_size)
public function dotnetobject of_getfont(string as_fontname,string as_encoding)
public function dotnetobject of_getfont(string as_fontname,real ar_size,long al_style,dotnetobject anv_color)
public function dotnetobject of_getfont(string as_fontname,real ar_size,dotnetobject anv_color)
public function dotnetobject of_getfont(string as_fontname,real ar_size,long al_style)
public function dotnetobject of_getfont(string as_fontname,real ar_size)
public function dotnetobject of_getfont(string as_fontname)
public subroutine  of_registerfamily(string as_familyname,string as_fullname,string as_path)
public subroutine  of_register(string as_path)
public subroutine  of_register(string as_path,string as_alias)
public function long of_registerdirectory(string as_dir)
public function long of_registerdirectory(string as_dir,boolean abln_scansubdirectories)
public function long of_registerdirectories()
public function boolean of_isregistered(string as_fontname)
public function dotnetobject get_registeredfonts()
public function dotnetobject get_registeredfamilies()
public function string get_defaultencoding()
public subroutine  set_defaultencoding(string as_value)
public function boolean get_defaultembedding()
public subroutine  set_defaultembedding(boolean abln_value)
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

public function dotnetobject of_getfont(string as_fontname,string as_encoding,boolean abln_embedded,real ar_size,long al_style,dotnetobject anv_color);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              String as_fontname
//*              String as_encoding
//*              Boolean abln_embedded
//*              Real ar_size
//*              Long al_style
//*              Dotnetobject anv_color
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
lnv_result = This.getfont(as_fontname,as_encoding,abln_embedded,ar_size,al_style,anv_color)
Return lnv_result
end function

public function dotnetobject of_getfont(string as_fontname,string as_encoding,boolean abln_embedded,real ar_size,long al_style,dotnetobject anv_color,boolean abln_cached);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              String as_fontname
//*              String as_encoding
//*              Boolean abln_embedded
//*              Real ar_size
//*              Long al_style
//*              Dotnetobject anv_color
//*              Boolean abln_cached
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
lnv_result = This.getfont(as_fontname,as_encoding,abln_embedded,ar_size,al_style,anv_color,abln_cached)
Return lnv_result
end function

public function dotnetobject of_getfont(string as_fontname,string as_encoding,boolean abln_embedded,real ar_size,long al_style);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              String as_fontname
//*              String as_encoding
//*              Boolean abln_embedded
//*              Real ar_size
//*              Long al_style
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
lnv_result = This.getfont(as_fontname,as_encoding,abln_embedded,ar_size,al_style)
Return lnv_result
end function

public function dotnetobject of_getfont(string as_fontname,string as_encoding,boolean abln_embedded,real ar_size);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              String as_fontname
//*              String as_encoding
//*              Boolean abln_embedded
//*              Real ar_size
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
lnv_result = This.getfont(as_fontname,as_encoding,abln_embedded,ar_size)
Return lnv_result
end function

public function dotnetobject of_getfont(string as_fontname,string as_encoding,boolean abln_embedded);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              String as_fontname
//*              String as_encoding
//*              Boolean abln_embedded
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
lnv_result = This.getfont(as_fontname,as_encoding,abln_embedded)
Return lnv_result
end function

public function dotnetobject of_getfont(string as_fontname,string as_encoding,real ar_size,long al_style,dotnetobject anv_color);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              String as_fontname
//*              String as_encoding
//*              Real ar_size
//*              Long al_style
//*              Dotnetobject anv_color
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
lnv_result = This.getfont(as_fontname,as_encoding,ar_size,al_style,anv_color)
Return lnv_result
end function

public function dotnetobject of_getfont(string as_fontname,string as_encoding,real ar_size,long al_style);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              String as_fontname
//*              String as_encoding
//*              Real ar_size
//*              Long al_style
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
lnv_result = This.getfont(as_fontname,as_encoding,ar_size,al_style)
Return lnv_result
end function

public function dotnetobject of_getfont(string as_fontname,string as_encoding,real ar_size);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              String as_fontname
//*              String as_encoding
//*              Real ar_size
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
lnv_result = This.getfont(as_fontname,as_encoding,ar_size)
Return lnv_result
end function

public function dotnetobject of_getfont(string as_fontname,string as_encoding);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              String as_fontname
//*              String as_encoding
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
lnv_result = This.getfont(as_fontname,as_encoding)
Return lnv_result
end function

public function dotnetobject of_getfont(string as_fontname,real ar_size,long al_style,dotnetobject anv_color);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              String as_fontname
//*              Real ar_size
//*              Long al_style
//*              Dotnetobject anv_color
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
lnv_result = This.getfont(as_fontname,ar_size,al_style,anv_color)
Return lnv_result
end function

public function dotnetobject of_getfont(string as_fontname,real ar_size,dotnetobject anv_color);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              String as_fontname
//*              Real ar_size
//*              Dotnetobject anv_color
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
lnv_result = This.getfont(as_fontname,ar_size,anv_color)
Return lnv_result
end function

public function dotnetobject of_getfont(string as_fontname,real ar_size,long al_style);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              String as_fontname
//*              Real ar_size
//*              Long al_style
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
lnv_result = This.getfont(as_fontname,ar_size,al_style)
Return lnv_result
end function

public function dotnetobject of_getfont(string as_fontname,real ar_size);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              String as_fontname
//*              Real ar_size
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
lnv_result = This.getfont(as_fontname,ar_size)
Return lnv_result
end function

public function dotnetobject of_getfont(string as_fontname);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFont
//*   Argument:
//*              String as_fontname
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
lnv_result = This.getfont(as_fontname)
Return lnv_result
end function

public subroutine  of_registerfamily(string as_familyname,string as_fullname,string as_path);
//*-----------------------------------------------------------------*/
//*  .NET function : RegisterFamily
//*   Argument:
//*              String as_familyname
//*              String as_fullname
//*              String as_path
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.registerfamily(as_familyname,as_fullname,as_path)
end subroutine

public subroutine  of_register(string as_path);
//*-----------------------------------------------------------------*/
//*  .NET function : Register
//*   Argument:
//*              String as_path
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.register(as_path)
end subroutine

public subroutine  of_register(string as_path,string as_alias);
//*-----------------------------------------------------------------*/
//*  .NET function : Register
//*   Argument:
//*              String as_path
//*              String as_alias
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.register(as_path,as_alias)
end subroutine

public function long of_registerdirectory(string as_dir);
//*-----------------------------------------------------------------*/
//*  .NET function : RegisterDirectory
//*   Argument:
//*              String as_dir
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
ll_result = This.registerdirectory(as_dir)
Return ll_result
end function

public function long of_registerdirectory(string as_dir,boolean abln_scansubdirectories);
//*-----------------------------------------------------------------*/
//*  .NET function : RegisterDirectory
//*   Argument:
//*              String as_dir
//*              Boolean abln_scansubdirectories
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
ll_result = This.registerdirectory(as_dir,abln_scansubdirectories)
Return ll_result
end function

public function long of_registerdirectories();
//*-----------------------------------------------------------------*/
//*  .NET function : RegisterDirectories
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
ll_result = This.registerdirectories()
Return ll_result
end function

public function boolean of_isregistered(string as_fontname);
//*-----------------------------------------------------------------*/
//*  .NET function : IsRegistered
//*   Argument:
//*              String as_fontname
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
lbln_result = This.isregistered(as_fontname)
Return lbln_result
end function

public function dotnetobject get_registeredfonts();
//*-----------------------------------------------------------------*/
//*  .NET property : RegisteredFonts
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
lnv_result = This.registeredfonts
Return lnv_result
end function

public function dotnetobject get_registeredfamilies();
//*-----------------------------------------------------------------*/
//*  .NET property : RegisteredFamilies
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
lnv_result = This.registeredfamilies
Return lnv_result
end function

public function string get_defaultencoding();
//*-----------------------------------------------------------------*/
//*  .NET property : DefaultEncoding
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
ls_result = This.defaultencoding
Return ls_result
end function

public subroutine  set_defaultencoding(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : DefaultEncoding
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.defaultencoding = as_value
end subroutine

public function boolean get_defaultembedding();
//*-----------------------------------------------------------------*/
//*  .NET property : DefaultEmbedding
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
lbln_result = This.defaultembedding
Return lbln_result
end function

public subroutine  set_defaultembedding(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : DefaultEmbedding
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.defaultembedding = abln_value
end subroutine

on nvo_fontfactoryimp.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_fontfactoryimp.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

