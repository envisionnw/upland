Option Compare Database
Option Explicit

' =================================
' MODULE:       mod_App_UI
' Level:        Application module
' Version:      1.06
' Description:  Application User Interface related functions & subroutines
'
' Source/date:  Bonnie Campbell, April 2015
' Revisions:    BLC, 4/30/2015 - 1.00 - initial version
'               ----------- invasives reports -----------------
'               BLC, 5/26/2015 - 1.01 - added PopulateSpeciesPriorities function from mod_Species
'               BLC, 6/1/2015  - 1.02 - changed View to Search tab
'               BLC, 6/12/2015 - 1.03 - added EnableTargetTool button
'               ----------- big rivers ------------------------
'               BLC, 6/30/2015 - 1.04 - added ClearFields()
'               BLC, 7/27/2015 - 1.05 - added SetHints()
'               ----------- uplands ---------------------------
'               BLC, 8/21/2015 - 1.06 - added CaptureEscapeKey
'               BLC, 2/3/2016  - 1.07 - added SetNoDataCheckbox()
' =================================

' =================================
' SUB:          CaptureEscapeKey
' Description:  Handles ESCAPE key actions for certain forms
' Assumptions:
' Note:         Handles ESC for the following modal forms:
'               fsub_Soil_Stability, fsub_Fuels_LD, frm_Locations, frm_Unknown_Species
' Parameters:   KeyCode - keycode detected (key down)
' Returns:      -
' Throws:       none
' References:
'  John Spencer, 3/11/2010
'  http://msgroups.net/microsoft.public.access/how-best-to-disable-esc-key-on-form/21881
' Source/date:  Bonnie Campbell, August 21, 2015 - for NCPN tools
' Revisions:    BLC, 8/21/2015 - initial version
' =================================
Public Sub CaptureEscapeKey(KeyCode As Integer)
On Error GoTo Err_Handler

    If KeyCode = vbKeyEscape Then
        If MsgBox("Undo changes?" & vbCrLf & vbCrLf & _
            "If yes, this may undo all recent changes (not just for a single field)." & vbCrLf & vbCrLf & _
            "Note:" & vbCrLf & _
            "If your cursor was in a..." & vbCrLf & _
            "+ text field, dropdown listbox, or checkbox field >> ALL changes will be undone." & vbCrLf & _
            "+ text field changed immediately before you clicked ESCAPE >> only the text field changes will be undone." & vbCrLf & vbCrLf & _
            "Previously saved data will remain unchanged.", vbYesNo, "ESCAPE Pressed!") = vbNo Then
            KeyCode = 0
        End If
        'KeyCode = 0
    End If
    
Exit_Sub:
    Exit Sub
    
Err_Handler:
    Select Case Err.Number
      Case Else
        MsgBox "Error #" & Err.Number & ": " & Err.Description, vbCritical, _
            "Error encountered (#" & Err.Number & " - CaptureEscapeKey[mod_App_UI])"
    End Select
    Resume Exit_Sub
End Sub

' =================================
' SUB:          RollupReportbyPark
' Description:  Prepares concatenated report data
'               Looks for the number of records (years) for each ParkPlotSpecies (species found on a given park plot)
'               and concatenates the years (e.g. 2008|2009|2013 ) so that a species only takes up a single
'               row for a specific park plot in the report. This reduces report length by 50% or more.
' Assumptions:  Assumes that tlu_NCPN_Plants contains Utah_Species names for all species
'               identified in the plots. Also assumes temp_Sp_Rpt_by_Park_Complete has been run prior to
'               running this so the report is updated with the most recent data.
' Note:         -
' Parameters:   -
' Returns:      -
' Throws:       none
' References:
' Source/date:  Bonnie Campbell, August 27, 2015 - for NCPN tools
' Revisions:    BLC, 8/27/2015 - initial version
' =================================
Public Sub RollupReportbyPark()
On Error GoTo Err_Handler

    Dim strParkPlotSpecies As String, strSpeciesYears As String
    Dim strPark As String, strFamily As String, strUtah_Species As String, strParkPlot As String
    Dim intPlotID As Integer, i As Integer, iCount As Integer
    Dim rs As DAO.Recordset, rsTemp As DAO.Recordset, rsCount As DAO.Recordset
    'Dim blnAdd As Boolean
    'Dim strSpeciesYr As String
    Dim strSQL As String
    
    Dim strPrevParkPlotSpecies As String
    
    
    Set rs = CurrentDb.OpenRecordset("temp_Sp_Rpt_by_Park_Complete")

    'remove existing table
    If DCount("[Name]", "MSysObjects", "[Name] = 'temp_Sp_Rpt_by_Park_Rollup'") = 1 Then _
            CurrentDb.TableDefs.Delete "temp_Sp_Rpt_by_Park_Rollup"
    
    'create empty table
    CreateRollupTable
    Set rsTemp = CurrentDb.OpenRecordset("temp_Sp_Rpt_by_Park_Rollup")
    
    'default
    strParkPlotSpecies = ""
    strSpeciesYears = ""
    'blnAdd = False
    
    If Not (rs.EOF And rs.BOF) Then
        rs.MoveFirst
        
        Do Until rs.EOF
            
            'set the current record's values
            strPark = rs("Unit_Code")
            intPlotID = rs("Plot_ID")
            strFamily = rs("Master_Family")
            strUtah_Species = rs("Utah_Species")
            strParkPlotSpecies = rs("ParkPlotSpecies")
            strParkPlot = rs("ParkPlot")
            'strSpeciesYr = rs("Year")
            
            If Not iCount > 0 Then
              'determine how many have the same ParkPlotSpecies
              strSQL = "SELECT COUNT(Year) AS NumRecords FROM temp_Sp_Rpt_by_Park_Complete WHERE ParkPlotSpecies = '" & strParkPlotSpecies & "';"
              Set rsCount = CurrentDb.OpenRecordset(strSQL, dbOpenSnapshot)
              iCount = rsCount!NumRecords
            End If
          
            For i = 1 To iCount
              'add year if it's a new year
              If Len(strSpeciesYears) = Len(Replace(strSpeciesYears, CStr(rs("Year")), "")) Then
                  strSpeciesYears = IIf(Len(strSpeciesYears) > 0, strSpeciesYears & "|" & rs("Year"), rs("Year"))
              End If
              rs.MoveNext
            Next
            
            ' add new record
            With rsTemp
                .AddNew
                !Unit_Code = strPark
                !Plot_ID = intPlotID
                !Master_Family = strFamily
                !Utah_Species = strUtah_Species
                !SpeciesYears = IIf(Len(strSpeciesYears) > 0, strSpeciesYears, rs!Year)
                !PlotParkSpecies = strParkPlotSpecies
                !ParkPlot = strParkPlot
                'update when rs!ParkPlotSpecies <> strParkPlotSpecies
                .Update
            End With
            'reset values
            strSpeciesYears = ""
            iCount = 0
        Loop
    End If
    
Exit_Sub:
    Set rs = Nothing
    Set rsTemp = Nothing
    Exit Sub
    
Err_Handler:
    Select Case Err.Number
      Case Else
        MsgBox "Error #" & Err.Number & ": " & Err.Description, vbCritical, _
            "Error encountered (#" & Err.Number & " - RollupReportbyPark[mod_App_UI])"
    End Select
    Resume Exit_Sub
End Sub

' =================================
' SUB:          CreateRollupTable
' Description:  Prepares rollup temporary table
' Assumptions:
' Note:         -
' Parameters:   -
' Returns:      -
' Throws:       none
' References:
' Source/date:  Bonnie Campbell, August 27, 2015 - for NCPN tools
' Revisions:    BLC, 8/27/2015 - initial version
' =================================
Public Sub CreateRollupTable()
On Error GoTo Err_Handler

    Dim tdf As DAO.TableDef
    
    Set tdf = CurrentDb.CreateTableDef("temp_Sp_Rpt_by_Park_Rollup")
    
    'add the new record
    With tdf
        .Fields.Append .CreateField("Unit_Code", dbText)
        .Fields.Append .CreateField("Plot_ID", dbInteger)
        .Fields.Append .CreateField("Master_Family", dbText)
        .Fields.Append .CreateField("Utah_Species", dbText)
        .Fields.Append .CreateField("SpeciesYears", dbText)
        .Fields.Append .CreateField("PlotParkSpecies", dbText)
        .Fields.Append .CreateField("ParkPlot", dbText)
    End With

    CurrentDb.TableDefs.Append tdf
    
Exit_Sub:
    Exit Sub
    
Err_Handler:
    Select Case Err.Number
      Case Else
        MsgBox "Error #" & Err.Number & ": " & Err.Description, vbCritical, _
            "Error encountered (#" & Err.Number & " - CreateRollupTable[mod_App_UI])"
    End Select
    Resume Exit_Sub
End Sub

' ---------------------------------
' SUB:          SetNoDataCheckbox
' Description:  Evaluates form records and sets no data checkbox
' Assumptions:  -
' Parameters:   -
' Returns:      N/A
' Throws:       none
' References:   none
' Source/date:
' Adapted:      Bonnie Campbell, February 3, 2016 - for NCPN tools
' Revisions:
'   BLC, 2/3/2016  - initial version
' ---------------------------------
Public Sub SetNoDataCheckbox(frm As Form)
On Error GoTo Err_Handler

    ' set rectangle color
    ' enable checkbox if there are no species
    ' disable checkbox if there are species
'    MsgBox Me.RecordsetClone.RecordCount
    
    With frm
    
        .Controls("cbxNoData").Value = True
        .Controls("cbxNoData").Enabled = True
        .Controls("rctNoData").Visible = True
        
        If .RecordsetClone.RecordCount > 0 Then
            .Controls("cbxNoData").Value = False
            .Controls("cbxNoData").Enabled = False
            '.Controls("rctNoData").BackColor = RGB(255, 255, 255)
            .Controls("rctNoData").Visible = False
        End If
    
    End With
    
Exit_Handler:
    Exit Sub
    
Err_Handler:
    Select Case Err.Number
      Case Else
        MsgBox "Error #" & Err.Number & ": " & Err.Description, vbCritical, _
            "Error encountered (#" & Err.Number & " - SetCheckbox[mod_App_UI])"
    End Select
    Resume Exit_Handler
End Sub