$PBExportHeader$nvo_pdfptable.sru
forward
global type nvo_pdfptable from dotnetobject
end type
end forward

global type nvo_pdfptable from dotnetobject
end type
global nvo_pdfptable nvo_pdfptable

type variables

PUBLIC:
String is_assemblypath = "C:\Users\CEC\Documents\APPEON_FJ\Firmar\Firmar\bin\Debug\net461\itextsharp.dll"
String is_classname = "iTextSharp.text.pdf.PdfPTable"

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
public subroutine  of_setextendlastrow(boolean abln_extendlastrows,boolean abln_extendfinalrow)
public function boolean of_isextendlastrow(boolean abln_newpagefollows)
public subroutine  of_completerow()
public subroutine  of_flushcontent()
public function dotnetobject of_getaccessibleattribute(dotnetobject anv_key)
public subroutine  of_setaccessibleattribute(dotnetobject anv_key,dotnetobject anv_value)
public function dotnetobject of_getaccessibleattributes()
public function dotnetobject of_getheader()
public function dotnetobject of_getbody()
public function dotnetobject of_getfooter()
public function long of_getcellstartrowindex(long al_rowidx,long al_colidx)
public function dotnetobject of_getfittingrows(real ar_availableheight,long al_startidx)
public subroutine  of_init()
public function dotnetobject of_shallowcopy(dotnetobject anv_table)
public subroutine  of_setwidths(real ar_relativewidths[])
public subroutine  of_setwidths(long al_relativewidths[])
public subroutine  of_settotalwidth(real ar_columnwidth[])
public subroutine  of_setwidthpercentage(real ar_columnwidth[],dotnetobject anv_pagesize)
public function real of_calculateheights()
public subroutine  of_resetcolumncount(long al_newcolcount)
public function dotnetobject of_addcell(dotnetobject anv_cell)
public subroutine  of_addcell(string as_text)
public subroutine  of_addcell1(dotnetobject anv_table)
public subroutine  of_addcell2(dotnetobject anv_image)
public subroutine  of_addcell3(dotnetobject anv_phrase)
public function real of_writeselectedrows(long al_rowstart,long al_rowend,real ar_xpos,real ar_ypos,dotnetobject anv_canvas)
public function real of_writeselectedrows(long al_colstart,long al_colend,long al_rowstart,long al_rowend,real ar_xpos,real ar_ypos,dotnetobject anv_canvas)
public function real of_writeselectedrows(long al_colstart,long al_colend,long al_rowstart,long al_rowend,real ar_xpos,real ar_ypos,dotnetobject anv_canvas,boolean abln_reusable)
public function real of_getrowheight(long al_idx)
public function real of_getrowspanheight(long al_rowindex,long al_cellindex)
public function boolean of_hasrowspan(long al_rowidx)
public subroutine  of_normalizeheadersfooters()
public function boolean of_deleterow(long al_rownumber)
public function boolean of_deletelastrow()
public subroutine  of_deletebodyrows()
public function boolean of_iscontent()
public function boolean of_isnestable()
public function boolean of_process(dotnetobject anv_listener)
public function dotnetobject of_getrow(long al_idx)
public function long of_getlastcompletedrowindex()
public subroutine  of_setbreakpoints(long al_breakpoints[])
public subroutine  of_keeprowstogether(long al_rows[])
public subroutine  of_keeprowstogether(long al_start,long al_end)
public subroutine  of_keeprowstogether(long al_start)
public function dotnetobject of_getrows(long al_start,long al_end)
public function boolean get_complete()
public subroutine  set_complete(boolean abln_value)
public function real get_totalwidth()
public subroutine  set_totalwidth(real ar_value)
public function dotnetobject get_defaultcell()
public function long get_size()
public function real get_totalheight()
public function real get_headerheight()
public function real get_footerheight()
public function long get_numberofcolumns()
public function long get_headerrows()
public subroutine  set_headerrows(long al_value)
public function long get_footerrows()
public subroutine  set_footerrows(long al_value)
public function dotnetobject get_chunks()
public function long get_type()
public function real get_widthpercentage()
public subroutine  set_widthpercentage(real ar_value)
public function long get_horizontalalignment()
public subroutine  set_horizontalalignment(long al_value)
public function dotnetobject get_rows()
public function dotnetobject get_tableevent()
public subroutine  set_tableevent(dotnetobject anv_value)
public function any get_absolutewidths()
public function boolean get_skipfirstheader()
public subroutine  set_skipfirstheader(boolean abln_value)
public function boolean get_skiplastfooter()
public subroutine  set_skiplastfooter(boolean abln_value)
public function long get_rundirection()
public subroutine  set_rundirection(long al_value)
public function boolean get_lockedwidth()
public subroutine  set_lockedwidth(boolean abln_value)
public function boolean get_splitrows()
public subroutine  set_splitrows(boolean abln_value)
public function real get_spacingbefore()
public subroutine  set_spacingbefore(real ar_value)
public function real get_spacingafter()
public subroutine  set_spacingafter(real ar_value)
public function real get_paddingtop()
public subroutine  set_paddingtop(real ar_value)
public function string get_summary()
public subroutine  set_summary(string as_value)
public function boolean get_extendlastrow()
public subroutine  set_extendlastrow(boolean abln_value)
public function boolean get_headersinevent()
public subroutine  set_headersinevent(boolean abln_value)
public function boolean get_splitlate()
public subroutine  set_splitlate(boolean abln_value)
public function boolean get_keeptogether()
public subroutine  set_keeptogether(boolean abln_value)
public function boolean get_elementcomplete()
public subroutine  set_elementcomplete(boolean abln_value)
public function boolean get_loopcheck()
public subroutine  set_loopcheck(boolean abln_value)
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

public subroutine  of_setextendlastrow(boolean abln_extendlastrows,boolean abln_extendfinalrow);
//*-----------------------------------------------------------------*/
//*  .NET function : SetExtendLastRow
//*   Argument:
//*              Boolean abln_extendlastrows
//*              Boolean abln_extendfinalrow
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setextendlastrow(abln_extendlastrows,abln_extendfinalrow)
end subroutine

public function boolean of_isextendlastrow(boolean abln_newpagefollows);
//*-----------------------------------------------------------------*/
//*  .NET function : IsExtendLastRow
//*   Argument:
//*              Boolean abln_newpagefollows
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
lbln_result = This.isextendlastrow(abln_newpagefollows)
Return lbln_result
end function

public subroutine  of_completerow();
//*-----------------------------------------------------------------*/
//*  .NET function : CompleteRow
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.completerow()
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

public function dotnetobject of_getheader();
//*-----------------------------------------------------------------*/
//*  .NET function : GetHeader
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
lnv_result = This.getheader()
Return lnv_result
end function

public function dotnetobject of_getbody();
//*-----------------------------------------------------------------*/
//*  .NET function : GetBody
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
lnv_result = This.getbody()
Return lnv_result
end function

public function dotnetobject of_getfooter();
//*-----------------------------------------------------------------*/
//*  .NET function : GetFooter
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
lnv_result = This.getfooter()
Return lnv_result
end function

public function long of_getcellstartrowindex(long al_rowidx,long al_colidx);
//*-----------------------------------------------------------------*/
//*  .NET function : GetCellStartRowIndex
//*   Argument:
//*              Long al_rowidx
//*              Long al_colidx
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
ll_result = This.getcellstartrowindex(al_rowidx,al_colidx)
Return ll_result
end function

public function dotnetobject of_getfittingrows(real ar_availableheight,long al_startidx);
//*-----------------------------------------------------------------*/
//*  .NET function : GetFittingRows
//*   Argument:
//*              Real ar_availableheight
//*              Long al_startidx
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
lnv_result = This.getfittingrows(ar_availableheight,al_startidx)
Return lnv_result
end function

public subroutine  of_init();
//*-----------------------------------------------------------------*/
//*  .NET function : Init
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.init()
end subroutine

public function dotnetobject of_shallowcopy(dotnetobject anv_table);
//*-----------------------------------------------------------------*/
//*  .NET function : ShallowCopy
//*   Argument:
//*              Dotnetobject anv_table
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
lnv_result = This.shallowcopy(anv_table)
Return lnv_result
end function

public subroutine  of_setwidths(real ar_relativewidths[]);
//*-----------------------------------------------------------------*/
//*  .NET function : SetWidths
//*   Argument:
//*              Real ar_relativewidths[]
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setwidths(ar_relativewidths)
end subroutine

public subroutine  of_setwidths(long al_relativewidths[]);
//*-----------------------------------------------------------------*/
//*  .NET function : SetWidths
//*   Argument:
//*              Long al_relativewidths[]
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setwidths(al_relativewidths)
end subroutine

public subroutine  of_settotalwidth(real ar_columnwidth[]);
//*-----------------------------------------------------------------*/
//*  .NET function : SetTotalWidth
//*   Argument:
//*              Real ar_columnwidth[]
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.settotalwidth(ar_columnwidth)
end subroutine

public subroutine  of_setwidthpercentage(real ar_columnwidth[],dotnetobject anv_pagesize);
//*-----------------------------------------------------------------*/
//*  .NET function : SetWidthPercentage
//*   Argument:
//*              Real ar_columnwidth[]
//*              Dotnetobject anv_pagesize
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setwidthpercentage(ar_columnwidth,anv_pagesize)
end subroutine

public function real of_calculateheights();
//*-----------------------------------------------------------------*/
//*  .NET function : CalculateHeights
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
lr_result = This.calculateheights()
Return lr_result
end function

public subroutine  of_resetcolumncount(long al_newcolcount);
//*-----------------------------------------------------------------*/
//*  .NET function : ResetColumnCount
//*   Argument:
//*              Long al_newcolcount
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.resetcolumncount(al_newcolcount)
end subroutine

public function dotnetobject of_addcell(dotnetobject anv_cell);
//*-----------------------------------------------------------------*/
//*  .NET function : AddCell
//*   Argument:
//*              Dotnetobject anv_cell
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
lnv_result = This.addcell(anv_cell)
Return lnv_result
end function

public subroutine  of_addcell(string as_text);
//*-----------------------------------------------------------------*/
//*  .NET function : AddCell
//*   Argument:
//*              String as_text
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addcell(as_text)
end subroutine

public subroutine  of_addcell1(dotnetobject anv_table);
//*-----------------------------------------------------------------*/
//*  .NET function : AddCell
//*   Argument:
//*              Dotnetobject anv_table
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addcell(anv_table)
end subroutine

public subroutine  of_addcell2(dotnetobject anv_image);
//*-----------------------------------------------------------------*/
//*  .NET function : AddCell
//*   Argument:
//*              Dotnetobject anv_image
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addcell(anv_image)
end subroutine

public subroutine  of_addcell3(dotnetobject anv_phrase);
//*-----------------------------------------------------------------*/
//*  .NET function : AddCell
//*   Argument:
//*              Dotnetobject anv_phrase
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.addcell(anv_phrase)
end subroutine

public function real of_writeselectedrows(long al_rowstart,long al_rowend,real ar_xpos,real ar_ypos,dotnetobject anv_canvas);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteSelectedRows
//*   Argument:
//*              Long al_rowstart
//*              Long al_rowend
//*              Real ar_xpos
//*              Real ar_ypos
//*              Dotnetobject anv_canvas
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
lr_result = This.writeselectedrows(al_rowstart,al_rowend,ar_xpos,ar_ypos,anv_canvas)
Return lr_result
end function

public function real of_writeselectedrows(long al_colstart,long al_colend,long al_rowstart,long al_rowend,real ar_xpos,real ar_ypos,dotnetobject anv_canvas);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteSelectedRows
//*   Argument:
//*              Long al_colstart
//*              Long al_colend
//*              Long al_rowstart
//*              Long al_rowend
//*              Real ar_xpos
//*              Real ar_ypos
//*              Dotnetobject anv_canvas
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
lr_result = This.writeselectedrows(al_colstart,al_colend,al_rowstart,al_rowend,ar_xpos,ar_ypos,anv_canvas)
Return lr_result
end function

public function real of_writeselectedrows(long al_colstart,long al_colend,long al_rowstart,long al_rowend,real ar_xpos,real ar_ypos,dotnetobject anv_canvas,boolean abln_reusable);
//*-----------------------------------------------------------------*/
//*  .NET function : WriteSelectedRows
//*   Argument:
//*              Long al_colstart
//*              Long al_colend
//*              Long al_rowstart
//*              Long al_rowend
//*              Real ar_xpos
//*              Real ar_ypos
//*              Dotnetobject anv_canvas
//*              Boolean abln_reusable
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
lr_result = This.writeselectedrows(al_colstart,al_colend,al_rowstart,al_rowend,ar_xpos,ar_ypos,anv_canvas,abln_reusable)
Return lr_result
end function

public function real of_getrowheight(long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : GetRowHeight
//*   Argument:
//*              Long al_idx
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
lr_result = This.getrowheight(al_idx)
Return lr_result
end function

public function real of_getrowspanheight(long al_rowindex,long al_cellindex);
//*-----------------------------------------------------------------*/
//*  .NET function : GetRowspanHeight
//*   Argument:
//*              Long al_rowindex
//*              Long al_cellindex
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
lr_result = This.getrowspanheight(al_rowindex,al_cellindex)
Return lr_result
end function

public function boolean of_hasrowspan(long al_rowidx);
//*-----------------------------------------------------------------*/
//*  .NET function : HasRowspan
//*   Argument:
//*              Long al_rowidx
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
lbln_result = This.hasrowspan(al_rowidx)
Return lbln_result
end function

public subroutine  of_normalizeheadersfooters();
//*-----------------------------------------------------------------*/
//*  .NET function : NormalizeHeadersFooters
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.normalizeheadersfooters()
end subroutine

public function boolean of_deleterow(long al_rownumber);
//*-----------------------------------------------------------------*/
//*  .NET function : DeleteRow
//*   Argument:
//*              Long al_rownumber
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
lbln_result = This.deleterow(al_rownumber)
Return lbln_result
end function

public function boolean of_deletelastrow();
//*-----------------------------------------------------------------*/
//*  .NET function : DeleteLastRow
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
lbln_result = This.deletelastrow()
Return lbln_result
end function

public subroutine  of_deletebodyrows();
//*-----------------------------------------------------------------*/
//*  .NET function : DeleteBodyRows
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.deletebodyrows()
end subroutine

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

public function dotnetobject of_getrow(long al_idx);
//*-----------------------------------------------------------------*/
//*  .NET function : GetRow
//*   Argument:
//*              Long al_idx
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
lnv_result = This.getrow(al_idx)
Return lnv_result
end function

public function long of_getlastcompletedrowindex();
//*-----------------------------------------------------------------*/
//*  .NET function : getLastCompletedRowIndex
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
ll_result = This.getlastcompletedrowindex()
Return ll_result
end function

public subroutine  of_setbreakpoints(long al_breakpoints[]);
//*-----------------------------------------------------------------*/
//*  .NET function : SetBreakPoints
//*   Argument:
//*              Long al_breakpoints[]
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.setbreakpoints(al_breakpoints)
end subroutine

public subroutine  of_keeprowstogether(long al_rows[]);
//*-----------------------------------------------------------------*/
//*  .NET function : KeepRowsTogether
//*   Argument:
//*              Long al_rows[]
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.keeprowstogether(al_rows)
end subroutine

public subroutine  of_keeprowstogether(long al_start,long al_end);
//*-----------------------------------------------------------------*/
//*  .NET function : KeepRowsTogether
//*   Argument:
//*              Long al_start
//*              Long al_end
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.keeprowstogether(al_start,al_end)
end subroutine

public subroutine  of_keeprowstogether(long al_start);
//*-----------------------------------------------------------------*/
//*  .NET function : KeepRowsTogether
//*   Argument:
//*              Long al_start
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet function */
This.keeprowstogether(al_start)
end subroutine

public function dotnetobject of_getrows(long al_start,long al_end);
//*-----------------------------------------------------------------*/
//*  .NET function : GetRows
//*   Argument:
//*              Long al_start
//*              Long al_end
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
lnv_result = This.getrows(al_start,al_end)
Return lnv_result
end function

public function boolean get_complete();
//*-----------------------------------------------------------------*/
//*  .NET property : Complete
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
lbln_result = This.complete
Return lbln_result
end function

public subroutine  set_complete(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Complete
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.complete = abln_value
end subroutine

public function real get_totalwidth();
//*-----------------------------------------------------------------*/
//*  .NET property : TotalWidth
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
lr_result = This.totalwidth
Return lr_result
end function

public subroutine  set_totalwidth(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : TotalWidth
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.totalwidth = ar_value
end subroutine

public function dotnetobject get_defaultcell();
//*-----------------------------------------------------------------*/
//*  .NET property : DefaultCell
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
lnv_result = This.defaultcell
Return lnv_result
end function

public function long get_size();
//*-----------------------------------------------------------------*/
//*  .NET property : Size
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
ll_result = This.size
Return ll_result
end function

public function real get_totalheight();
//*-----------------------------------------------------------------*/
//*  .NET property : TotalHeight
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
lr_result = This.totalheight
Return lr_result
end function

public function real get_headerheight();
//*-----------------------------------------------------------------*/
//*  .NET property : HeaderHeight
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
lr_result = This.headerheight
Return lr_result
end function

public function real get_footerheight();
//*-----------------------------------------------------------------*/
//*  .NET property : FooterHeight
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
lr_result = This.footerheight
Return lr_result
end function

public function long get_numberofcolumns();
//*-----------------------------------------------------------------*/
//*  .NET property : NumberOfColumns
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
ll_result = This.numberofcolumns
Return ll_result
end function

public function long get_headerrows();
//*-----------------------------------------------------------------*/
//*  .NET property : HeaderRows
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
ll_result = This.headerrows
Return ll_result
end function

public subroutine  set_headerrows(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : HeaderRows
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.headerrows = al_value
end subroutine

public function long get_footerrows();
//*-----------------------------------------------------------------*/
//*  .NET property : FooterRows
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
ll_result = This.footerrows
Return ll_result
end function

public subroutine  set_footerrows(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : FooterRows
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.footerrows = al_value
end subroutine

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

public function real get_widthpercentage();
//*-----------------------------------------------------------------*/
//*  .NET property : WidthPercentage
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
lr_result = This.widthpercentage
Return lr_result
end function

public subroutine  set_widthpercentage(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : WidthPercentage
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.widthpercentage = ar_value
end subroutine

public function long get_horizontalalignment();
//*-----------------------------------------------------------------*/
//*  .NET property : HorizontalAlignment
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
ll_result = This.horizontalalignment
Return ll_result
end function

public subroutine  set_horizontalalignment(long al_value);
//*-----------------------------------------------------------------*/
//*  .NET property : HorizontalAlignment
//*   Argument:
//*              Long al_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.horizontalalignment = al_value
end subroutine

public function dotnetobject get_rows();
//*-----------------------------------------------------------------*/
//*  .NET property : Rows
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
lnv_result = This.rows
Return lnv_result
end function

public function dotnetobject get_tableevent();
//*-----------------------------------------------------------------*/
//*  .NET property : TableEvent
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
lnv_result = This.tableevent
Return lnv_result
end function

public subroutine  set_tableevent(dotnetobject anv_value);
//*-----------------------------------------------------------------*/
//*  .NET property : TableEvent
//*   Argument:
//*              Dotnetobject anv_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.tableevent = anv_value
end subroutine

public function any get_absolutewidths();
//*-----------------------------------------------------------------*/
//*  .NET property : AbsoluteWidths
//*   Return : Real[]
//*-----------------------------------------------------------------*/
/* Store the Return value from dotnet property */
Any lr_result

/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	SetNull(lr_result)
	Return lr_result
End If

/* Trigger the dotnet property */
lr_result = This.absolutewidths
Return lr_result
end function

public function boolean get_skipfirstheader();
//*-----------------------------------------------------------------*/
//*  .NET property : SkipFirstHeader
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
lbln_result = This.skipfirstheader
Return lbln_result
end function

public subroutine  set_skipfirstheader(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SkipFirstHeader
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.skipfirstheader = abln_value
end subroutine

public function boolean get_skiplastfooter();
//*-----------------------------------------------------------------*/
//*  .NET property : SkipLastFooter
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
lbln_result = This.skiplastfooter
Return lbln_result
end function

public subroutine  set_skiplastfooter(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SkipLastFooter
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.skiplastfooter = abln_value
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

public function boolean get_lockedwidth();
//*-----------------------------------------------------------------*/
//*  .NET property : LockedWidth
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
lbln_result = This.lockedwidth
Return lbln_result
end function

public subroutine  set_lockedwidth(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : LockedWidth
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.lockedwidth = abln_value
end subroutine

public function boolean get_splitrows();
//*-----------------------------------------------------------------*/
//*  .NET property : SplitRows
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
lbln_result = This.splitrows
Return lbln_result
end function

public subroutine  set_splitrows(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SplitRows
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.splitrows = abln_value
end subroutine

public function real get_spacingbefore();
//*-----------------------------------------------------------------*/
//*  .NET property : SpacingBefore
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
lr_result = This.spacingbefore
Return lr_result
end function

public subroutine  set_spacingbefore(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SpacingBefore
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.spacingbefore = ar_value
end subroutine

public function real get_spacingafter();
//*-----------------------------------------------------------------*/
//*  .NET property : SpacingAfter
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
lr_result = This.spacingafter
Return lr_result
end function

public subroutine  set_spacingafter(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SpacingAfter
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.spacingafter = ar_value
end subroutine

public function real get_paddingtop();
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingTop
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
lr_result = This.paddingtop
Return lr_result
end function

public subroutine  set_paddingtop(real ar_value);
//*-----------------------------------------------------------------*/
//*  .NET property : PaddingTop
//*   Argument:
//*              Real ar_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.paddingtop = ar_value
end subroutine

public function string get_summary();
//*-----------------------------------------------------------------*/
//*  .NET property : Summary
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
ls_result = This.summary
Return ls_result
end function

public subroutine  set_summary(string as_value);
//*-----------------------------------------------------------------*/
//*  .NET property : Summary
//*   Argument:
//*              String as_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.summary = as_value
end subroutine

public function boolean get_extendlastrow();
//*-----------------------------------------------------------------*/
//*  .NET property : ExtendLastRow
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
lbln_result = This.extendlastrow
Return lbln_result
end function

public subroutine  set_extendlastrow(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : ExtendLastRow
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.extendlastrow = abln_value
end subroutine

public function boolean get_headersinevent();
//*-----------------------------------------------------------------*/
//*  .NET property : HeadersInEvent
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
lbln_result = This.headersinevent
Return lbln_result
end function

public subroutine  set_headersinevent(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : HeadersInEvent
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.headersinevent = abln_value
end subroutine

public function boolean get_splitlate();
//*-----------------------------------------------------------------*/
//*  .NET property : SplitLate
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
lbln_result = This.splitlate
Return lbln_result
end function

public subroutine  set_splitlate(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : SplitLate
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.splitlate = abln_value
end subroutine

public function boolean get_keeptogether();
//*-----------------------------------------------------------------*/
//*  .NET property : KeepTogether
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
lbln_result = This.keeptogether
Return lbln_result
end function

public subroutine  set_keeptogether(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : KeepTogether
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.keeptogether = abln_value
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

public function boolean get_loopcheck();
//*-----------------------------------------------------------------*/
//*  .NET property : LoopCheck
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
lbln_result = This.loopcheck
Return lbln_result
end function

public subroutine  set_loopcheck(boolean abln_value);
//*-----------------------------------------------------------------*/
//*  .NET property : LoopCheck
//*   Argument:
//*              Boolean abln_value
//*   Return : (None)
//*-----------------------------------------------------------------*/
/* Create .NET object */
If Not This.of_createOnDemand( ) Then
	Return 
End If

/* Trigger the dotnet property */
This.loopcheck = abln_value
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

on nvo_pdfptable.create
call super::create
triggerevent( this, "constructor" )
end on

on nvo_pdfptable.destroy
triggerevent( this, "destructor" )
call super::destroy
end on

