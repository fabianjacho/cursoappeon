$PBExportHeader$nvo_comparetool.sru
forward
global type nvo_comparetool from dotnetobject
end type
end forward

global type nvo_comparetool from dotnetobject
end type
global nvo_comparetool nvo_comparetool

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.testutils.CompareTool"

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
public function string of_compare(string as_outpdf,string as_cmppdf,string as_outpath,string as_differenceimageprefix,dotnetobject anv_ignoredareas)
public function string of_compare(string as_outpdf,string as_cmppdf,string as_outpath,string as_differenceimageprefix)
public function dotnetobject of_setcomparebycontenterrorslimit(long al_comparebycontentmaxerrorcount)
public subroutine  of_setgeneratecomparebycontentxmlreport(boolean abln_generatecomparebycontentxmlreport)
public function dotnetobject of_setfloatabsoluteerror(real ar_error)
public function dotnetobject of_setfloatrelativeerror(real ar_error)
public subroutine  of_setxmlreportname(string as_reportname)
public function string of_getxmlreportname()
public function string of_comparebycontent(string as_outpdf,string as_cmppdf,string as_outpath,string as_differenceimageprefix,dotnetobject anv_ignoredareas)
public function string of_comparebycontent(string as_outpdf,string as_cmppdf,string as_outpath,string as_differenceimageprefix)
public function boolean of_comparedictionaries(dotnetobject anv_outdict,dotnetobject anv_cmpdict)
public function boolean of_comparecontentstreamsbyparsing(dotnetobject anv_outobj,dotnetobject anv_cmpobj)
public function boolean of_comparecontentstreamsbyparsing(dotnetobject anv_outobj,dotnetobject anv_cmpobj,dotnetobject anv_outresources,dotnetobject anv_cmpresources)
public function boolean of_comparestreams(dotnetobject anv_outstream,dotnetobject anv_cmpstream)
public function boolean of_comparearrays(dotnetobject anv_outarray,dotnetobject anv_cmparray)
public function boolean of_comparenames(dotnetobject anv_outname,dotnetobject anv_cmpname)
public function boolean of_comparenumbers(dotnetobject anv_outnumber,dotnetobject anv_cmpnumber)
public function boolean of_comparestrings(dotnetobject anv_outstring,dotnetobject anv_cmpstring)
public function boolean of_compareliterals(dotnetobject anv_outliteral,dotnetobject anv_cmpliteral)
public function boolean of_comparebooleans(dotnetobject anv_outboolean,dotnetobject anv_cmpboolean)
public function string of_comparexmp(blob ablo_xmp1,blob ablo_xmp2)
public function string of_comparexmp(blob ablo_xmp1,blob ablo_xmp2,boolean abln_ignoredateandproducerproperties)
public function string of_comparexmp(string as_outpdf,string as_cmppdf)
public function string of_comparexmp(string as_outpdf,string as_cmppdf,boolean abln_ignoredateandproducerproperties)
public function boolean of_comparexmls(blob ablo_xml1,blob ablo_xml2)
public function string of_comparedocumentinfo(string as_outpdf,string as_cmppdf)
public function string of_comparelinks(string as_outpdf,string as_cmppdf)
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

public function string of_compare(string as_outpdf,string as_cmppdf,string as_outpath,string as_differenceimageprefix,dotnetobject anv_ignoredareas);
//*-----------------------------------------------------------------*/
//*  .NET function : Compare
//*   Argument:
//*              String as_outpdf
//*              String as_cmppdf
//*              String as_outpath
//*              String as_differenceimageprefix
//*              Dotnetobject anv_ignoredareas
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
ls_result = This.compare(as_outpdf,as_cmppdf,as_outpath,as_differenceimageprefix,anv_ignoredareas)
Return ls_result
end function

public function string of_compare(string as_outpdf,string as_cmppdf,string as_outpath,string as_differenceimageprefix);
//*-----------------------------------------------------------------*/
//*  .NET function : Compare
//*   Argument:
//*              String as_outpdf
//*              String as_cmppdf
//*              String as_outpath
//*              String as_differenceimageprefix
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
ls_result = This.compare(as_outpdf,as_cmppdf,as_outpath,as_differenceimageprefix)
Return ls_result
end function

public function dotnetobject of_setcomparebycontenterrorslimit(long al_comparebycontentmaxerrorcount);
//*-----------------------------------------------------------------*/
//*  .NET function : SetCompareByContentErrorsLimit
//*   Argument:
//*              Long al_comparebycontentmaxerrorcount
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
lnv_result = This.setcomparebycontenterrorslimit(al_comparebycontentmaxerrorcount)
Return lnv_result
end function

public subroutine  of_setgeneratecomparebycontentxmlreport(boolean abln_generatecomparebycontentxmlreport);
//*-----------------------------------------------------------------*/
//*  .NET function : SetGenerateCompareByContentXmlReport
//*   Argument:
//*              Boolean abln_generatecomparebycontentxmlreport
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setgeneratecomparebycontentxmlreport(abln_generatecomparebycontentxmlreport)
end subroutine

public function dotnetobject of_setfloatabsoluteerror(real ar_error);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFloatAbsoluteError
//*   Argument:
//*              Real ar_error
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
lnv_result = This.setfloatabsoluteerror(ar_error)
Return lnv_result
end function

public function dotnetobject of_setfloatrelativeerror(real ar_error);
//*-----------------------------------------------------------------*/
//*  .NET function : SetFloatRelativeError
//*   Argument:
//*              Real ar_error
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
lnv_result = This.setfloatrelativeerror(ar_error)
Return lnv_result
end function

public subroutine  of_setxmlreportname(string as_reportname);
//*-----------------------------------------------------------------*/
//*  .NET function : SetXmlReportName
//*   Argument:
//*              String as_reportname
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setxmlreportname(as_reportname)
end subroutine

public function string of_getxmlreportname();
//*-----------------------------------------------------------------*/
//*  .NET function : GetXmlReportName
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
ls_result = This.getxmlreportname()
Return ls_result
end function

public function string of_comparebycontent(string as_outpdf,string as_cmppdf,string as_outpath,string as_differenceimageprefix,dotnetobject anv_ignoredareas);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareByContent
//*   Argument:
//*              String as_outpdf
//*              String as_cmppdf
//*              String as_outpath
//*              String as_differenceimageprefix
//*              Dotnetobject anv_ignoredareas
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
ls_result = This.comparebycontent(as_outpdf,as_cmppdf,as_outpath,as_differenceimageprefix,anv_ignoredareas)
Return ls_result
end function

public function string of_comparebycontent(string as_outpdf,string as_cmppdf,string as_outpath,string as_differenceimageprefix);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareByContent
//*   Argument:
//*              String as_outpdf
//*              String as_cmppdf
//*              String as_outpath
//*              String as_differenceimageprefix
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
ls_result = This.comparebycontent(as_outpdf,as_cmppdf,as_outpath,as_differenceimageprefix)
Return ls_result
end function

public function boolean of_comparedictionaries(dotnetobject anv_outdict,dotnetobject anv_cmpdict);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareDictionaries
//*   Argument:
//*              Dotnetobject anv_outdict
//*              Dotnetobject anv_cmpdict
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
lbln_result = This.comparedictionaries(anv_outdict,anv_cmpdict)
Return lbln_result
end function

public function boolean of_comparecontentstreamsbyparsing(dotnetobject anv_outobj,dotnetobject anv_cmpobj);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareContentStreamsByParsing
//*   Argument:
//*              Dotnetobject anv_outobj
//*              Dotnetobject anv_cmpobj
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
lbln_result = This.comparecontentstreamsbyparsing(anv_outobj,anv_cmpobj)
Return lbln_result
end function

public function boolean of_comparecontentstreamsbyparsing(dotnetobject anv_outobj,dotnetobject anv_cmpobj,dotnetobject anv_outresources,dotnetobject anv_cmpresources);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareContentStreamsByParsing
//*   Argument:
//*              Dotnetobject anv_outobj
//*              Dotnetobject anv_cmpobj
//*              Dotnetobject anv_outresources
//*              Dotnetobject anv_cmpresources
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
lbln_result = This.comparecontentstreamsbyparsing(anv_outobj,anv_cmpobj,anv_outresources,anv_cmpresources)
Return lbln_result
end function

public function boolean of_comparestreams(dotnetobject anv_outstream,dotnetobject anv_cmpstream);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareStreams
//*   Argument:
//*              Dotnetobject anv_outstream
//*              Dotnetobject anv_cmpstream
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
lbln_result = This.comparestreams(anv_outstream,anv_cmpstream)
Return lbln_result
end function

public function boolean of_comparearrays(dotnetobject anv_outarray,dotnetobject anv_cmparray);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareArrays
//*   Argument:
//*              Dotnetobject anv_outarray
//*              Dotnetobject anv_cmparray
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
lbln_result = This.comparearrays(anv_outarray,anv_cmparray)
Return lbln_result
end function

public function boolean of_comparenames(dotnetobject anv_outname,dotnetobject anv_cmpname);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareNames
//*   Argument:
//*              Dotnetobject anv_outname
//*              Dotnetobject anv_cmpname
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
lbln_result = This.comparenames(anv_outname,anv_cmpname)
Return lbln_result
end function

public function boolean of_comparenumbers(dotnetobject anv_outnumber,dotnetobject anv_cmpnumber);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareNumbers
//*   Argument:
//*              Dotnetobject anv_outnumber
//*              Dotnetobject anv_cmpnumber
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
lbln_result = This.comparenumbers(anv_outnumber,anv_cmpnumber)
Return lbln_result
end function

public function boolean of_comparestrings(dotnetobject anv_outstring,dotnetobject anv_cmpstring);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareStrings
//*   Argument:
//*              Dotnetobject anv_outstring
//*              Dotnetobject anv_cmpstring
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
lbln_result = This.comparestrings(anv_outstring,anv_cmpstring)
Return lbln_result
end function

public function boolean of_compareliterals(dotnetobject anv_outliteral,dotnetobject anv_cmpliteral);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareLiterals
//*   Argument:
//*              Dotnetobject anv_outliteral
//*              Dotnetobject anv_cmpliteral
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
lbln_result = This.compareliterals(anv_outliteral,anv_cmpliteral)
Return lbln_result
end function

public function boolean of_comparebooleans(dotnetobject anv_outboolean,dotnetobject anv_cmpboolean);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareBooleans
//*   Argument:
//*              Dotnetobject anv_outboolean
//*              Dotnetobject anv_cmpboolean
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
lbln_result = This.comparebooleans(anv_outboolean,anv_cmpboolean)
Return lbln_result
end function

public function string of_comparexmp(blob ablo_xmp1,blob ablo_xmp2);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareXmp
//*   Argument:
//*              Blob ablo_xmp1
//*              Blob ablo_xmp2
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
ls_result = This.comparexmp(ablo_xmp1,ablo_xmp2)
Return ls_result
end function

public function string of_comparexmp(blob ablo_xmp1,blob ablo_xmp2,boolean abln_ignoredateandproducerproperties);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareXmp
//*   Argument:
//*              Blob ablo_xmp1
//*              Blob ablo_xmp2
//*              Boolean abln_ignoredateandproducerproperties
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
ls_result = This.comparexmp(ablo_xmp1,ablo_xmp2,abln_ignoredateandproducerproperties)
Return ls_result
end function

public function string of_comparexmp(string as_outpdf,string as_cmppdf);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareXmp
//*   Argument:
//*              String as_outpdf
//*              String as_cmppdf
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
ls_result = This.comparexmp(as_outpdf,as_cmppdf)
Return ls_result
end function

public function string of_comparexmp(string as_outpdf,string as_cmppdf,boolean abln_ignoredateandproducerproperties);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareXmp
//*   Argument:
//*              String as_outpdf
//*              String as_cmppdf
//*              Boolean abln_ignoredateandproducerproperties
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
ls_result = This.comparexmp(as_outpdf,as_cmppdf,abln_ignoredateandproducerproperties)
Return ls_result
end function

public function boolean of_comparexmls(blob ablo_xml1,blob ablo_xml2);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareXmls
//*   Argument:
//*              Blob ablo_xml1
//*              Blob ablo_xml2
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
lbln_result = This.comparexmls(ablo_xml1,ablo_xml2)
Return lbln_result
end function

public function string of_comparedocumentinfo(string as_outpdf,string as_cmppdf);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareDocumentInfo
//*   Argument:
//*              String as_outpdf
//*              String as_cmppdf
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
ls_result = This.comparedocumentinfo(as_outpdf,as_cmppdf)
Return ls_result
end function

public function string of_comparelinks(string as_outpdf,string as_cmppdf);
//*-----------------------------------------------------------------*/
//*  .NET function : CompareLinks
//*   Argument:
//*              String as_outpdf
//*              String as_cmppdf
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
ls_result = This.comparelinks(as_outpdf,as_cmppdf)
Return ls_result
end function

on nvo_comparetool.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_comparetool.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

