$PBExportHeader$nvo_affinetransform.sru
forward
global type nvo_affinetransform from dotnetobject
end type
end forward

global type nvo_affinetransform from dotnetobject
end type
global nvo_affinetransform nvo_affinetransform

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.awt.geom.AffineTransform"

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
public function double of_getscalex()
public function double of_getscaley()
public function double of_getshearx()
public function double of_getsheary()
public function double of_gettranslatex()
public function double of_gettranslatey()
public function boolean of_isidentity()
public subroutine  of_getmatrix(double adb_matrix[])
public function double of_getdeterminant()
public subroutine  of_settransform(double adb_m00,double adb_m10,double adb_m01,double adb_m11,double adb_m02,double adb_m12)
public subroutine  of_settransform(dotnetobject anv_t)
public subroutine  of_settoidentity()
public subroutine  of_settotranslation(double adb_mx,double adb_my)
public subroutine  of_settoscale(double adb_scx,double adb_scy)
public subroutine  of_settoshear(double adb_shx,double adb_shy)
public subroutine  of_settorotation(double adb_angle)
public subroutine  of_settorotation(double adb_angle,double adb_px,double adb_py)
public function dotnetobject of_gettranslateinstance(double adb_mx,double adb_my)
public function dotnetobject of_getscaleinstance(double adb_scx,double adb_scy)
public function dotnetobject of_getshearinstance(double adb_shx,double adb_shy)
public function dotnetobject of_getrotateinstance(double adb_angle)
public function dotnetobject of_getrotateinstance(double adb_angle,double adb_x,double adb_y)
public subroutine  of_translate(double adb_mx,double adb_my)
public subroutine  of_scale(double adb_scx,double adb_scy)
public subroutine  of_shear(double adb_shx,double adb_shy)
public subroutine  of_rotate(double adb_angle)
public subroutine  of_rotate(double adb_angle,double adb_px,double adb_py)
public subroutine  of_concatenate(dotnetobject anv_t)
public subroutine  of_preconcatenate(dotnetobject anv_t)
public function dotnetobject of_createinverse()
public function dotnetobject of_transform(dotnetobject anv_src,dotnetobject anv_dst)
public subroutine  of_transform(double adb_src[],long al_srcoff,double adb_dst[],long al_dstoff,long al_length)
public subroutine  of_transform(real ar_src[],long al_srcoff,real ar_dst[],long al_dstoff,long al_length)
public subroutine  of_transform(real ar_src[],long al_srcoff,double adb_dst[],long al_dstoff,long al_length)
public subroutine  of_transform(double adb_src[],long al_srcoff,real ar_dst[],long al_dstoff,long al_length)
public function dotnetobject of_deltatransform(dotnetobject anv_src,dotnetobject anv_dst)
public subroutine  of_deltatransform(double adb_src[],long al_srcoff,double adb_dst[],long al_dstoff,long al_length)
public function dotnetobject of_inversetransform(dotnetobject anv_src,dotnetobject anv_dst)
public subroutine  of_inversetransform(double adb_src[],long al_srcoff,double adb_dst[],long al_dstoff,long al_length)
public subroutine  of_inversetransform(real ar_src[],long al_srcoff,real ar_dst[],long al_dstoff,long al_length)
public function dotnetobject of_clone()
public function string of_tostring()
public function long get_type()
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

public function double of_getscalex();
//*-----------------------------------------------------------------*/
//*  .NET function : GetScaleX
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
ldb_result = This.getscalex()
Return ldb_result
end function

public function double of_getscaley();
//*-----------------------------------------------------------------*/
//*  .NET function : GetScaleY
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
ldb_result = This.getscaley()
Return ldb_result
end function

public function double of_getshearx();
//*-----------------------------------------------------------------*/
//*  .NET function : GetShearX
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
ldb_result = This.getshearx()
Return ldb_result
end function

public function double of_getsheary();
//*-----------------------------------------------------------------*/
//*  .NET function : GetShearY
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
ldb_result = This.getsheary()
Return ldb_result
end function

public function double of_gettranslatex();
//*-----------------------------------------------------------------*/
//*  .NET function : GetTranslateX
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
ldb_result = This.gettranslatex()
Return ldb_result
end function

public function double of_gettranslatey();
//*-----------------------------------------------------------------*/
//*  .NET function : GetTranslateY
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
ldb_result = This.gettranslatey()
Return ldb_result
end function

public function boolean of_isidentity();
//*-----------------------------------------------------------------*/
//*  .NET function : IsIdentity
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
lbln_result = This.isidentity()
Return lbln_result
end function

public subroutine  of_getmatrix(double adb_matrix[]);
//*-----------------------------------------------------------------*/
//*  .NET function : GetMatrix
//*   Argument:
//*              Double adb_matrix[]
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.getmatrix(adb_matrix)
end subroutine

public function double of_getdeterminant();
//*-----------------------------------------------------------------*/
//*  .NET function : GetDeterminant
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
ldb_result = This.getdeterminant()
Return ldb_result
end function

public subroutine  of_settransform(double adb_m00,double adb_m10,double adb_m01,double adb_m11,double adb_m02,double adb_m12);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTransform
//*   Argument:
//*              Double adb_m00
//*              Double adb_m10
//*              Double adb_m01
//*              Double adb_m11
//*              Double adb_m02
//*              Double adb_m12
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settransform(adb_m00,adb_m10,adb_m01,adb_m11,adb_m02,adb_m12)
end subroutine

public subroutine  of_settransform(dotnetobject anv_t);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTransform
//*   Argument:
//*              Dotnetobject anv_t
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settransform(anv_t)
end subroutine

public subroutine  of_settoidentity();
//*-----------------------------------------------------------------*/
//*  .NET function : SetToIdentity
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settoidentity()
end subroutine

public subroutine  of_settotranslation(double adb_mx,double adb_my);
//*-----------------------------------------------------------------*/
//*  .NET function : SetToTranslation
//*   Argument:
//*              Double adb_mx
//*              Double adb_my
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settotranslation(adb_mx,adb_my)
end subroutine

public subroutine  of_settoscale(double adb_scx,double adb_scy);
//*-----------------------------------------------------------------*/
//*  .NET function : SetToScale
//*   Argument:
//*              Double adb_scx
//*              Double adb_scy
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settoscale(adb_scx,adb_scy)
end subroutine

public subroutine  of_settoshear(double adb_shx,double adb_shy);
//*-----------------------------------------------------------------*/
//*  .NET function : SetToShear
//*   Argument:
//*              Double adb_shx
//*              Double adb_shy
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settoshear(adb_shx,adb_shy)
end subroutine

public subroutine  of_settorotation(double adb_angle);
//*-----------------------------------------------------------------*/
//*  .NET function : SetToRotation
//*   Argument:
//*              Double adb_angle
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settorotation(adb_angle)
end subroutine

public subroutine  of_settorotation(double adb_angle,double adb_px,double adb_py);
//*-----------------------------------------------------------------*/
//*  .NET function : SetToRotation
//*   Argument:
//*              Double adb_angle
//*              Double adb_px
//*              Double adb_py
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settorotation(adb_angle,adb_px,adb_py)
end subroutine

public function dotnetobject of_gettranslateinstance(double adb_mx,double adb_my);
//*-----------------------------------------------------------------*/
//*  .NET function : GetTranslateInstance
//*   Argument:
//*              Double adb_mx
//*              Double adb_my
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
lnv_result = This.gettranslateinstance(adb_mx,adb_my)
Return lnv_result
end function

public function dotnetobject of_getscaleinstance(double adb_scx,double adb_scy);
//*-----------------------------------------------------------------*/
//*  .NET function : GetScaleInstance
//*   Argument:
//*              Double adb_scx
//*              Double adb_scy
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
lnv_result = This.getscaleinstance(adb_scx,adb_scy)
Return lnv_result
end function

public function dotnetobject of_getshearinstance(double adb_shx,double adb_shy);
//*-----------------------------------------------------------------*/
//*  .NET function : GetShearInstance
//*   Argument:
//*              Double adb_shx
//*              Double adb_shy
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
lnv_result = This.getshearinstance(adb_shx,adb_shy)
Return lnv_result
end function

public function dotnetobject of_getrotateinstance(double adb_angle);
//*-----------------------------------------------------------------*/
//*  .NET function : GetRotateInstance
//*   Argument:
//*              Double adb_angle
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
lnv_result = This.getrotateinstance(adb_angle)
Return lnv_result
end function

public function dotnetobject of_getrotateinstance(double adb_angle,double adb_x,double adb_y);
//*-----------------------------------------------------------------*/
//*  .NET function : GetRotateInstance
//*   Argument:
//*              Double adb_angle
//*              Double adb_x
//*              Double adb_y
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
lnv_result = This.getrotateinstance(adb_angle,adb_x,adb_y)
Return lnv_result
end function

public subroutine  of_translate(double adb_mx,double adb_my);
//*-----------------------------------------------------------------*/
//*  .NET function : Translate
//*   Argument:
//*              Double adb_mx
//*              Double adb_my
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.translate(adb_mx,adb_my)
end subroutine

public subroutine  of_scale(double adb_scx,double adb_scy);
//*-----------------------------------------------------------------*/
//*  .NET function : Scale
//*   Argument:
//*              Double adb_scx
//*              Double adb_scy
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.scale(adb_scx,adb_scy)
end subroutine

public subroutine  of_shear(double adb_shx,double adb_shy);
//*-----------------------------------------------------------------*/
//*  .NET function : Shear
//*   Argument:
//*              Double adb_shx
//*              Double adb_shy
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.shear(adb_shx,adb_shy)
end subroutine

public subroutine  of_rotate(double adb_angle);
//*-----------------------------------------------------------------*/
//*  .NET function : Rotate
//*   Argument:
//*              Double adb_angle
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.rotate(adb_angle)
end subroutine

public subroutine  of_rotate(double adb_angle,double adb_px,double adb_py);
//*-----------------------------------------------------------------*/
//*  .NET function : Rotate
//*   Argument:
//*              Double adb_angle
//*              Double adb_px
//*              Double adb_py
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.rotate(adb_angle,adb_px,adb_py)
end subroutine

public subroutine  of_concatenate(dotnetobject anv_t);
//*-----------------------------------------------------------------*/
//*  .NET function : Concatenate
//*   Argument:
//*              Dotnetobject anv_t
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.concatenate(anv_t)
end subroutine

public subroutine  of_preconcatenate(dotnetobject anv_t);
//*-----------------------------------------------------------------*/
//*  .NET function : preConcatenate
//*   Argument:
//*              Dotnetobject anv_t
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.preconcatenate(anv_t)
end subroutine

public function dotnetobject of_createinverse();
//*-----------------------------------------------------------------*/
//*  .NET function : CreateInverse
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
lnv_result = This.createinverse()
Return lnv_result
end function

public function dotnetobject of_transform(dotnetobject anv_src,dotnetobject anv_dst);
//*-----------------------------------------------------------------*/
//*  .NET function : Transform
//*   Argument:
//*              Dotnetobject anv_src
//*              Dotnetobject anv_dst
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
lnv_result = This.transform(anv_src,anv_dst)
Return lnv_result
end function

public subroutine  of_transform(double adb_src[],long al_srcoff,double adb_dst[],long al_dstoff,long al_length);
//*-----------------------------------------------------------------*/
//*  .NET function : Transform
//*   Argument:
//*              Double adb_src[]
//*              Long al_srcoff
//*              Double adb_dst[]
//*              Long al_dstoff
//*              Long al_length
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.transform(adb_src,al_srcoff,adb_dst,al_dstoff,al_length)
end subroutine

public subroutine  of_transform(real ar_src[],long al_srcoff,real ar_dst[],long al_dstoff,long al_length);
//*-----------------------------------------------------------------*/
//*  .NET function : Transform
//*   Argument:
//*              Real ar_src[]
//*              Long al_srcoff
//*              Real ar_dst[]
//*              Long al_dstoff
//*              Long al_length
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.transform(ar_src,al_srcoff,ar_dst,al_dstoff,al_length)
end subroutine

public subroutine  of_transform(real ar_src[],long al_srcoff,double adb_dst[],long al_dstoff,long al_length);
//*-----------------------------------------------------------------*/
//*  .NET function : Transform
//*   Argument:
//*              Real ar_src[]
//*              Long al_srcoff
//*              Double adb_dst[]
//*              Long al_dstoff
//*              Long al_length
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.transform(ar_src,al_srcoff,adb_dst,al_dstoff,al_length)
end subroutine

public subroutine  of_transform(double adb_src[],long al_srcoff,real ar_dst[],long al_dstoff,long al_length);
//*-----------------------------------------------------------------*/
//*  .NET function : Transform
//*   Argument:
//*              Double adb_src[]
//*              Long al_srcoff
//*              Real ar_dst[]
//*              Long al_dstoff
//*              Long al_length
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.transform(adb_src,al_srcoff,ar_dst,al_dstoff,al_length)
end subroutine

public function dotnetobject of_deltatransform(dotnetobject anv_src,dotnetobject anv_dst);
//*-----------------------------------------------------------------*/
//*  .NET function : DeltaTransform
//*   Argument:
//*              Dotnetobject anv_src
//*              Dotnetobject anv_dst
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
lnv_result = This.deltatransform(anv_src,anv_dst)
Return lnv_result
end function

public subroutine  of_deltatransform(double adb_src[],long al_srcoff,double adb_dst[],long al_dstoff,long al_length);
//*-----------------------------------------------------------------*/
//*  .NET function : DeltaTransform
//*   Argument:
//*              Double adb_src[]
//*              Long al_srcoff
//*              Double adb_dst[]
//*              Long al_dstoff
//*              Long al_length
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.deltatransform(adb_src,al_srcoff,adb_dst,al_dstoff,al_length)
end subroutine

public function dotnetobject of_inversetransform(dotnetobject anv_src,dotnetobject anv_dst);
//*-----------------------------------------------------------------*/
//*  .NET function : InverseTransform
//*   Argument:
//*              Dotnetobject anv_src
//*              Dotnetobject anv_dst
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
lnv_result = This.inversetransform(anv_src,anv_dst)
Return lnv_result
end function

public subroutine  of_inversetransform(double adb_src[],long al_srcoff,double adb_dst[],long al_dstoff,long al_length);
//*-----------------------------------------------------------------*/
//*  .NET function : InverseTransform
//*   Argument:
//*              Double adb_src[]
//*              Long al_srcoff
//*              Double adb_dst[]
//*              Long al_dstoff
//*              Long al_length
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.inversetransform(adb_src,al_srcoff,adb_dst,al_dstoff,al_length)
end subroutine

public subroutine  of_inversetransform(real ar_src[],long al_srcoff,real ar_dst[],long al_dstoff,long al_length);
//*-----------------------------------------------------------------*/
//*  .NET function : InverseTransform
//*   Argument:
//*              Real ar_src[]
//*              Long al_srcoff
//*              Real ar_dst[]
//*              Long al_dstoff
//*              Long al_length
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.inversetransform(ar_src,al_srcoff,ar_dst,al_dstoff,al_length)
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

on nvo_affinetransform.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_affinetransform.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

