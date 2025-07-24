$PBExportHeader$nvo_pdfsignatureappearance.sru
forward
global type nvo_pdfsignatureappearance from dotnetobject
end type
end forward

global type nvo_pdfsignatureappearance from dotnetobject
end type
global nvo_pdfsignatureappearance nvo_pdfsignatureappearance

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PdfSignatureAppearance"

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
public function dotnetobject of_getrangestream()
public subroutine  of_adddeveloperextension(dotnetobject anv_de)
public function string of_getnewsigname()
public function boolean of_isinvisible()
public subroutine  of_setvisiblesignature(dotnetobject anv_pagerect,long al_page,string as_fieldname)
public subroutine  of_setvisiblesignature(string as_fieldname)
public function dotnetobject of_getlayer(long al_layer)
public function dotnetobject of_gettoplayer()
public function dotnetobject of_getappearance()
public subroutine  of_setstamper(dotnetobject anv_stamper)
public subroutine  of_settempfile(string as_tempfile)
public function boolean of_ispreclosed()
public subroutine  of_preclose(dotnetobject anv_exclusionsizes)
public subroutine  of_close(dotnetobject anv_update)
public function long get_certificationlevel()
public subroutine  set_certificationlevel(long al_value)
public function string get_reason()
public subroutine  set_reason(string as_value)
public subroutine  set_reasoncaption(string as_value)
public function string get_location()
public subroutine  set_location(string as_value)
public subroutine  set_locationcaption(string as_value)
public function string get_signaturecreator()
public subroutine  set_signaturecreator(string as_value)
public function string get_contact()
public subroutine  set_contact(string as_value)
public function datetime get_signdate()
public subroutine  set_signdate(datetime adt_value)
public function dotnetobject get_cryptodictionary()
public subroutine  set_cryptodictionary(dotnetobject anv_value)
public function dotnetobject get_certificate()
public subroutine  set_certificate(dotnetobject anv_value)
public function dotnetobject get_signatureevent()
public subroutine  set_signatureevent(dotnetobject anv_value)
public function string get_fieldname()
public function long get_page()
public function dotnetobject get_rect()
public function dotnetobject get_pagerect()
public function long get_signaturerenderingmode()
public subroutine  set_signaturerenderingmode(long al_value)
public function dotnetobject get_signaturegraphic()
public subroutine  set_signaturegraphic(dotnetobject anv_value)
public function boolean get_acro6layers()
public subroutine  set_acro6layers(boolean abln_value)
public subroutine  set_reuseappearance(boolean abln_value)
public function dotnetobject get_image()
public subroutine  set_image(dotnetobject anv_value)
public function real get_imagescale()
public subroutine  set_imagescale(real ar_value)
public function string get_layer2text()
public subroutine  set_layer2text(string as_value)
public function dotnetobject get_layer2font()
public subroutine  set_layer2font(dotnetobject anv_value)
public function long get_rundirection()
public subroutine  set_rundirection(long al_value)
public function string get_layer4text()
public subroutine  set_layer4text(string as_value)
public function dotnetobject get_stamper()
public function dotnetobject get_sigout()
public subroutine  set_sigout(dotnetobject anv_value)
public function dotnetobject get_originalout()
public subroutine  set_originalout(dotnetobject anv_value)
public function string get_tempfile()
public function dotnetobject get_fieldlockdict()
public subroutine  set_fieldlockdict(dotnetobject anv_value)
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

public function dotnetobject of_getrangestream();
//*-----------------------------------------------------------------*/
//*  .NET function : GetRangeStream
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
lnv_result = This.getrangestream()
Return lnv_result
end function

public subroutine  of_adddeveloperextension(dotnetobject anv_de);
//*-----------------------------------------------------------------*/
//*  .NET function : AddDeveloperExtension
//*   Argument:
//*              Dotnetobject anv_de
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.adddeveloperextension(anv_de)
end subroutine

public function string of_getnewsigname();
//*-----------------------------------------------------------------*/
//*  .NET function : GetNewSigName
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
ls_result = This.getnewsigname()
Return ls_result
end function

public function boolean of_isinvisible();
//*-----------------------------------------------------------------*/
//*  .NET function : IsInvisible
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
lbln_result = This.isinvisible()
Return lbln_result
end function

public subroutine  of_setvisiblesignature(dotnetobject anv_pagerect,long al_page,string as_fieldname);
//*-----------------------------------------------------------------*/
//*  .NET function : SetVisibleSignature
//*   Argument:
//*              Dotnetobject anv_pagerect
//*              Long al_page
//*              String as_fieldname
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setvisiblesignature(anv_pagerect,al_page,as_fieldname)
end subroutine

public subroutine  of_setvisiblesignature(string as_fieldname);
//*-----------------------------------------------------------------*/
//*  .NET function : SetVisibleSignature
//*   Argument:
//*              String as_fieldname
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setvisiblesignature(as_fieldname)
end subroutine

public function dotnetobject of_getlayer(long al_layer);
//*-----------------------------------------------------------------*/
//*  .NET function : GetLayer
//*   Argument:
//*              Long al_layer
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
lnv_result = This.getlayer(al_layer)
Return lnv_result
end function

public function dotnetobject of_gettoplayer();
//*-----------------------------------------------------------------*/
//*  .NET function : GetTopLayer
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
lnv_result = This.gettoplayer()
Return lnv_result
end function

public function dotnetobject of_getappearance();
//*-----------------------------------------------------------------*/
//*  .NET function : GetAppearance
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
lnv_result = This.getappearance()
Return lnv_result
end function

public subroutine  of_setstamper(dotnetobject anv_stamper);
//*-----------------------------------------------------------------*/
//*  .NET function : SetStamper
//*   Argument:
//*              Dotnetobject anv_stamper
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setstamper(anv_stamper)
end subroutine

public subroutine  of_settempfile(string as_tempfile);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTempFile
//*   Argument:
//*              String as_tempfile
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settempfile(as_tempfile)
end subroutine

public function boolean of_ispreclosed();
//*-----------------------------------------------------------------*/
//*  .NET function : IsPreClosed
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
lbln_result = This.ispreclosed()
Return lbln_result
end function

public subroutine  of_preclose(dotnetobject anv_exclusionsizes);
//*-----------------------------------------------------------------*/
//*  .NET function : PreClose
//*   Argument:
//*              Dotnetobject anv_exclusionsizes
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.preclose(anv_exclusionsizes)
end subroutine

public subroutine  of_close(dotnetobject anv_update);
//*-----------------------------------------------------------------*/
//*  .NET function : Close
//*   Argument:
//*              Dotnetobject anv_update
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.close(anv_update)
end subroutine

public function long get_certificationlevel();
//*-----------------------------------------------------------------*/
//*  .NET property : CertificationLevel
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
ll_result = This.certificationlevel
Return ll_result
end function

public subroutine  set_certificationlevel(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CertificationLevel
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.certificationlevel = al_value
end subroutine

public function string get_reason();
//*-----------------------------------------------------------------*/
//*  .NET property : Reason
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
ls_result = This.reason
Return ls_result
end function

public subroutine  set_reason(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Reason
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.reason = as_value
end subroutine

public subroutine  set_reasoncaption(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ReasonCaption
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.reasoncaption = as_value
end subroutine

public function string get_location();
//*-----------------------------------------------------------------*/
//*  .NET property : Location
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
ls_result = This.location
Return ls_result
end function

public subroutine  set_location(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Location
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.location = as_value
end subroutine

public subroutine  set_locationcaption(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : LocationCaption
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.locationcaption = as_value
end subroutine

public function string get_signaturecreator();
//*-----------------------------------------------------------------*/
//*  .NET property : SignatureCreator
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
ls_result = This.signaturecreator
Return ls_result
end function

public subroutine  set_signaturecreator(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SignatureCreator
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.signaturecreator = as_value
end subroutine

public function string get_contact();
//*-----------------------------------------------------------------*/
//*  .NET property : Contact
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
ls_result = This.contact
Return ls_result
end function

public subroutine  set_contact(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Contact
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.contact = as_value
end subroutine

public function datetime get_signdate();
//*-----------------------------------------------------------------*/
//*  .NET property : SignDate
//*   Return : Datetime
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Datetime ldt_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(ldt_result)
	Return ldt_result
End If

/* Trigger the dotnet property */
ldt_result = This.signdate
Return ldt_result
end function

public subroutine  set_signdate(datetime adt_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SignDate
//*   Argument:
//*              Datetime adt_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.signdate = adt_value
end subroutine

public function dotnetobject get_cryptodictionary();
//*-----------------------------------------------------------------*/
//*  .NET property : CryptoDictionary
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
lnv_result = This.cryptodictionary
Return lnv_result
end function

public subroutine  set_cryptodictionary(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : CryptoDictionary
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.cryptodictionary = anv_value
end subroutine

public function dotnetobject get_certificate();
//*-----------------------------------------------------------------*/
//*  .NET property : Certificate
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
lnv_result = This.certificate
Return lnv_result
end function

public subroutine  set_certificate(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Certificate
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.certificate = anv_value
end subroutine

public function dotnetobject get_signatureevent();
//*-----------------------------------------------------------------*/
//*  .NET property : SignatureEvent
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
lnv_result = This.signatureevent
Return lnv_result
end function

public subroutine  set_signatureevent(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SignatureEvent
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.signatureevent = anv_value
end subroutine

public function string get_fieldname();
//*-----------------------------------------------------------------*/
//*  .NET property : FieldName
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
ls_result = This.fieldname
Return ls_result
end function

public function long get_page();
//*-----------------------------------------------------------------*/
//*  .NET property : Page
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
ll_result = This.page
Return ll_result
end function

public function dotnetobject get_rect();
//*-----------------------------------------------------------------*/
//*  .NET property : Rect
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
lnv_result = This.rect
Return lnv_result
end function

public function dotnetobject get_pagerect();
//*-----------------------------------------------------------------*/
//*  .NET property : PageRect
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
lnv_result = This.pagerect
Return lnv_result
end function

public function long get_signaturerenderingmode();
//*-----------------------------------------------------------------*/
//*  .NET property : SignatureRenderingMode
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
ll_result = This.signaturerenderingmode
Return ll_result
end function

public subroutine  set_signaturerenderingmode(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SignatureRenderingMode
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.signaturerenderingmode = al_value
end subroutine

public function dotnetobject get_signaturegraphic();
//*-----------------------------------------------------------------*/
//*  .NET property : SignatureGraphic
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
lnv_result = This.signaturegraphic
Return lnv_result
end function

public subroutine  set_signaturegraphic(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SignatureGraphic
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.signaturegraphic = anv_value
end subroutine

public function boolean get_acro6layers();
//*-----------------------------------------------------------------*/
//*  .NET property : Acro6Layers
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
lbln_result = This.acro6layers
Return lbln_result
end function

public subroutine  set_acro6layers(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Acro6Layers
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.acro6layers = abln_value
end subroutine

public subroutine  set_reuseappearance(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ReuseAppearance
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.reuseappearance = abln_value
end subroutine

public function dotnetobject get_image();
//*-----------------------------------------------------------------*/
//*  .NET property : Image
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
lnv_result = This.image
Return lnv_result
end function

public subroutine  set_image(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Image
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.image = anv_value
end subroutine

public function real get_imagescale();
//*-----------------------------------------------------------------*/
//*  .NET property : ImageScale
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
lr_result = This.imagescale
Return lr_result
end function

public subroutine  set_imagescale(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ImageScale
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.imagescale = ar_value
end subroutine

public function string get_layer2text();
//*-----------------------------------------------------------------*/
//*  .NET property : Layer2Text
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
ls_result = This.layer2text
Return ls_result
end function

public subroutine  set_layer2text(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Layer2Text
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.layer2text = as_value
end subroutine

public function dotnetobject get_layer2font();
//*-----------------------------------------------------------------*/
//*  .NET property : Layer2Font
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
lnv_result = This.layer2font
Return lnv_result
end function

public subroutine  set_layer2font(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Layer2Font
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.layer2font = anv_value
end subroutine

public function long get_rundirection();
//*-----------------------------------------------------------------*/
//*  .NET property : RunDirection
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
ll_result = This.rundirection
Return ll_result
end function

public subroutine  set_rundirection(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : RunDirection
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.rundirection = al_value
end subroutine

public function string get_layer4text();
//*-----------------------------------------------------------------*/
//*  .NET property : Layer4Text
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
ls_result = This.layer4text
Return ls_result
end function

public subroutine  set_layer4text(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Layer4Text
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.layer4text = as_value
end subroutine

public function dotnetobject get_stamper();
//*-----------------------------------------------------------------*/
//*  .NET property : Stamper
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
lnv_result = This.stamper
Return lnv_result
end function

public function dotnetobject get_sigout();
//*-----------------------------------------------------------------*/
//*  .NET property : Sigout
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
lnv_result = This.sigout
Return lnv_result
end function

public subroutine  set_sigout(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Sigout
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.sigout = anv_value
end subroutine

public function dotnetobject get_originalout();
//*-----------------------------------------------------------------*/
//*  .NET property : Originalout
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
lnv_result = This.originalout
Return lnv_result
end function

public subroutine  set_originalout(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Originalout
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.originalout = anv_value
end subroutine

public function string get_tempfile();
//*-----------------------------------------------------------------*/
//*  .NET property : TempFile
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
ls_result = This.tempfile
Return ls_result
end function

public function dotnetobject get_fieldlockdict();
//*-----------------------------------------------------------------*/
//*  .NET property : FieldLockDict
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
lnv_result = This.fieldlockdict
Return lnv_result
end function

public subroutine  set_fieldlockdict(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : FieldLockDict
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.fieldlockdict = anv_value
end subroutine

on nvo_pdfsignatureappearance.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfsignatureappearance.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

