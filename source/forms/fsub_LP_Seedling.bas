﻿Version =20
VersionRequired =20
Begin Form
    AutoCenter = NotDefault
    AllowDesignChanges = NotDefault
    ScrollBars =2
    TabularFamily =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridX =24
    GridY =24
    Width =5760
    DatasheetFontHeight =9
    ItemSuffix =28
    Left =540
    Top =1230
    Right =5880
    Bottom =3645
    DatasheetGridlinesColor =12632256
    RecSrcDt = Begin
        0x73776174d27ce340
    End
    RecordSource ="tbl_LP_Seedling"
    Caption ="fsub_LP_Belt_Shrub"
    BeforeInsert ="[Event Procedure]"
    DatasheetFontName ="Arial"
    PrtMip = Begin
        0xa0050000a0050000a0050000a005000000000000201c0000e010000001000000 ,
        0x010000006801000000000000a10700000100000001000000
    End
    OnLoad ="[Event Procedure]"
    FilterOnLoad =255
    DatasheetGridlinesColor12 =12632256
    Begin
        Begin Label
            BackStyle =0
            BackColor =-2147483633
            ForeColor =-2147483630
        End
        Begin Rectangle
            SpecialEffect =3
            BackStyle =0
            BorderLineStyle =0
        End
        Begin Image
            BackStyle =0
            OldBorderStyle =0
            BorderLineStyle =0
            PictureAlignment =2
        End
        Begin CommandButton
            FontSize =8
            FontWeight =400
            FontName ="MS Sans Serif"
            BorderLineStyle =0
        End
        Begin OptionButton
            SpecialEffect =2
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin CheckBox
            SpecialEffect =2
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin OptionGroup
            SpecialEffect =3
            BorderLineStyle =0
        End
        Begin BoundObjectFrame
            SpecialEffect =2
            OldBorderStyle =0
            BorderLineStyle =0
            BackStyle =0
        End
        Begin TextBox
            FELineBreak = NotDefault
            SpecialEffect =2
            BorderLineStyle =0
            BackColor =-2147483643
            ForeColor =-2147483640
            AsianLineBreak =255
        End
        Begin ListBox
            SpecialEffect =2
            BorderLineStyle =0
            BackColor =-2147483643
            ForeColor =-2147483640
        End
        Begin ComboBox
            SpecialEffect =2
            BorderLineStyle =0
            BackColor =-2147483643
            ForeColor =-2147483640
        End
        Begin Subform
            SpecialEffect =2
            BorderLineStyle =0
        End
        Begin UnboundObjectFrame
            SpecialEffect =2
            OldBorderStyle =1
        End
        Begin ToggleButton
            FontSize =8
            FontWeight =400
            FontName ="MS Sans Serif"
            BorderLineStyle =0
        End
        Begin Tab
            BackStyle =0
            BorderLineStyle =0
        End
        Begin FormHeader
            Height =720
            BackColor =-2147483633
            Name ="FormHeader"
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =240
                    Top =420
                    Width =1335
                    Height =240
                    FontWeight =700
                    Name ="Species_Label"
                    Caption ="Species Name"
                    Tag ="DetachedLabel"
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    Left =2775
                    Top =420
                    Width =540
                    Height =240
                    FontWeight =700
                    Name ="Total_Label"
                    Caption ="Total"
                    Tag ="DetachedLabel"
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =480
                    Top =60
                    Width =3045
                    Height =300
                    FontSize =10
                    FontWeight =700
                    Name ="Label23"
                    Caption ="Tree Seedlings"
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    OldBorderStyle =0
                    OverlapFlags =93
                    Left =3600
                    Top =180
                    Width =2100
                    Height =480
                    BackColor =6750207
                    Name ="rctNoData"
                    OnClick ="[Event Procedure]"
                    LayoutCachedLeft =3600
                    LayoutCachedTop =180
                    LayoutCachedWidth =5700
                    LayoutCachedHeight =660
                End
                Begin CheckBox
                    OverlapFlags =215
                    Left =3720
                    Top =330
                    Width =300
                    ColumnOrder =0
                    Name ="cbxNoData"
                    OnClick ="[Event Procedure]"
                    ControlTipText ="No tree seedlings found"

                    LayoutCachedLeft =3720
                    LayoutCachedTop =330
                    LayoutCachedWidth =4020
                    LayoutCachedHeight =570
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3950
                            Top =300
                            Width =1650
                            Height =240
                            FontWeight =600
                            Name ="lblNoData"
                            Caption ="No Species Found"
                            ControlTipText ="No tree seedlings found"
                            LayoutCachedLeft =3950
                            LayoutCachedTop =300
                            LayoutCachedWidth =5600
                            LayoutCachedHeight =540
                        End
                    End
                End
            End
        End
        Begin Section
            Height =420
            BackColor =-2147483633
            Name ="Detail"
            Begin
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =60
                    Top =60
                    Width =360
                    Height =255
                    ColumnWidth =2310
                    Name ="Shrub_ID"
                    ControlSource ="Seedling_ID"
                    StatusBarText ="Unique record identifier - primary key"

                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =300
                    Top =60
                    Width =300
                    Height =255
                    ColumnWidth =2310
                    TabIndex =1
                    Name ="Transect_ID"
                    ControlSource ="Transect_ID"
                    StatusBarText ="Foreign key to tbl_Canopy_Transect"

                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2760
                    Top =60
                    Width =540
                    Height =255
                    ColumnWidth =600
                    TabIndex =3
                    Name ="SeedTotal"
                    ControlSource ="Total"
                    StatusBarText ="0-10cm height class total"

                End
                Begin ComboBox
                    OverlapFlags =247
                    IMESentenceMode =3
                    ColumnCount =3
                    ListWidth =6480
                    Left =180
                    Top =60
                    Width =2304
                    TabIndex =2
                    ColumnInfo ="\"\";\"\";\"\";\"\";\"\";\"\";\"10\";\"510\""
                    Name ="Species"
                    ControlSource ="Species"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT qryU_Top_Canopy.Master_PLANT_Code, qryU_Top_Canopy.LU_Code, qryU_Top_Cano"
                        "py.Utah_Species, Lifeform FROM qryU_Top_Canopy WHERE (((qryU_Top_Canopy.Utah_Spe"
                        "cies) Is Not Null)) AND Lifeform = 'Tree' ORDER BY qryU_Top_Canopy.LU_Code;"
                    ColumnWidths ="0;2160;4320"
                    BeforeUpdate ="[Event Procedure]"
                    OnGotFocus ="[Event Procedure]"

                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =3600
                    Top =60
                    Width =705
                    Height =300
                    TabIndex =4
                    ForeColor =255
                    Name ="ButtonDelete"
                    Caption ="Delete"
                    OnClick ="[Event Procedure]"

                    WebImagePaddingLeft =2
                    WebImagePaddingTop =2
                    WebImagePaddingRight =1
                    WebImagePaddingBottom =1
                End
            End
        End
        Begin FormFooter
            Height =480
            BackColor =-2147483633
            Name ="FormFooter"
            Begin
                Begin CommandButton
                    OverlapFlags =85
                    Left =720
                    Top =60
                    Width =606
                    Height =288
                    Name ="ButtonA1"
                    Caption ="+ 1"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    WebImagePaddingLeft =2
                    WebImagePaddingTop =2
                    WebImagePaddingRight =1
                    WebImagePaddingBottom =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =1440
                    Top =60
                    Width =606
                    Height =288
                    TabIndex =1
                    Name ="ButtonA5"
                    Caption ="+ 5"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    WebImagePaddingLeft =2
                    WebImagePaddingTop =2
                    WebImagePaddingRight =1
                    WebImagePaddingBottom =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =2160
                    Top =60
                    Width =606
                    Height =288
                    TabIndex =2
                    Name ="ButtonS1"
                    Caption ="- 1"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    WebImagePaddingLeft =2
                    WebImagePaddingTop =2
                    WebImagePaddingRight =1
                    WebImagePaddingBottom =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =2880
                    Top =60
                    Width =606
                    Height =288
                    TabIndex =3
                    Name ="ButtonS5"
                    Caption ="- 5"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    WebImagePaddingLeft =2
                    WebImagePaddingTop =2
                    WebImagePaddingRight =1
                    WebImagePaddingBottom =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =3600
                    Top =60
                    Width =606
                    Height =288
                    TabIndex =4
                    Name ="ButtonZero"
                    Caption ="0"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    WebImagePaddingLeft =2
                    WebImagePaddingTop =2
                    WebImagePaddingRight =1
                    WebImagePaddingBottom =1
                End
            End
        End
    End
End
CodeBehindForm
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

' =================================
' MODULE:       Form_fsub_LP_Seedling
' Level:        Form module
' Version:      1.01
' Description:  data functions & procedures specific to LP seedling monitoring
'
' Source/date:  Bonnie Campbell, 2/2/2016
' Revisions:    RDB - unknown  - 1.00 - initial version
'               BLC - 2/2/2016 - 1.01 - added documentation, checkbox for no species found
' =================================

' ---------------------------------
' SUB:          Form_Load
' Description:  Handles form loading actions
' Assumptions:  -
' Parameters:   -
' Returns:      N/A
' Throws:       none
' References:   none
' Source/date:
' Adapted:      Bonnie Campbell, February 2, 2016 - for NCPN tools
' Revisions:
'   BLC, 2/2/2016  - initial version
' ---------------------------------
Private Sub Form_Load()
On Error GoTo Err_Handler

' set rectangle color
' enable checkbox if there are no species
' disable checkbox if there are species
    SetNoDataCheckbox Me

Exit_Handler:
    Exit Sub
    
Err_Handler:
    Select Case Err.Number
      Case Else
        MsgBox "Error #" & Err.Number & ": " & Err.Description, vbCritical, _
            "Error encountered (#" & Err.Number & " - Form_Load[Form_fsub_LP_Seedling])"
    End Select
    Resume Exit_Handler
End Sub

Private Sub Form_BeforeInsert(Cancel As Integer)
  
   ' If IsNull(Me.Parent!Observer) And IsNull(Me.Parent!Recorder) Then
   '   MsgBox "You must enter an observer or recorder first."
   '   DoCmd.CancelEvent
   '   SendKeys "{ESC}"
   '   GoTo Exit_Procedure
   ' End If
    ' Create the GUID primary key value
    If IsNull(Me!Seedling_ID) Then
        If GetDataType("tbl_LP_Seedling", "Seedling_ID") = dbText Then
            Me.Seedling_ID = fxnGUIDGen
        End If
    End If
Exit_Procedure:
End Sub

' ---------------------------------
' SUB:          cbxNoSpecies_Click
' Description:  Handles checkbox click actions
' Assumptions:  -
' Parameters:   -
' Returns:      N/A
' Throws:       none
' References:   none
' Source/date:
' Adapted:      Bonnie Campbell, February 2, 2016 - for NCPN tools
' Revisions:
'   BLC, 2/2/2016  - initial version
' ---------------------------------
Private Sub cbxNoSpecies_Click()
On Error GoTo Err_Handler


Exit_Handler:
    Exit Sub
    
Err_Handler:
    Select Case Err.Number
      Case Else
        MsgBox "Error #" & Err.Number & ": " & Err.Description, vbCritical, _
            "Error encountered (#" & Err.Number & " - cbxNoSpecies_Click[Form_fsub_LP_Seedling])"
    End Select
    Resume Exit_Handler
End Sub

Private Sub ButtonA1_Click()
  If Screen.PreviousControl.name = "SeedTotal" And Not IsNull(Me!Species) Then
    Screen.PreviousControl.Value = Screen.PreviousControl.Value + 1
  End If
  Screen.PreviousControl.SetFocus
End Sub

Private Sub ButtonA5_Click()
  If Screen.PreviousControl.name = "SeedTotal" And Not IsNull(Me!Species) Then
    Screen.PreviousControl.Value = Screen.PreviousControl.Value + 5
  End If
  Screen.PreviousControl.SetFocus
End Sub

Private Sub ButtonS1_Click()
  If Screen.PreviousControl.name = "SeedTotal" And Not IsNull(Me!Species) Then
    If Screen.PreviousControl.Value - 1 < 0 Then
      MsgBox "Total cannot be negative.", , "Tree Seedlings"
      Exit Sub
    Else
      Screen.PreviousControl.Value = Screen.PreviousControl.Value - 1
    End If
  End If
  Screen.PreviousControl.SetFocus
End Sub

Private Sub ButtonS5_Click()
  If Screen.PreviousControl.name = "SeedTotal" And Not IsNull(Me!Species) Then
    If Screen.PreviousControl.Value - 5 < 0 Then
      MsgBox "Total cannot be negative.", , "Tree Seedlings"
      Exit Sub
    Else
      Screen.PreviousControl.Value = Screen.PreviousControl.Value - 5
    End If
  End If
  Screen.PreviousControl.SetFocus
End Sub

Private Sub ButtonZero_Click()
  If Screen.PreviousControl.name = "SeedTotal" And Not IsNull(Me!Species) Then
    Screen.PreviousControl.Value = 0
  End If
  Screen.PreviousControl.SetFocus
End Sub

Private Sub Species_BeforeUpdate(Cancel As Integer)
    If Not IsNull(DLookup("[Seedling_ID]", "tbl_LP_Seedling", "[Transect_ID] = '" & Me!Transect_ID & "' AND [Species] = '" & Me!Species & "'")) Then
      MsgBox "This species is already recorded for this transect."
      DoCmd.CancelEvent
      SendKeys "{ESC}"
      Me.Undo
    End If
End Sub


Private Sub Species_GotFocus()

    If IsNull(Me.Parent!Visit_Date) Then    ' If they didn't bother to enter a date, default to event date.
      Me.Parent!Visit_Date = Me.Parent.Parent!Start_Date
      Me.Parent.Refresh   ' Force save of transect record
    End If
   
End Sub

Private Sub ButtonDelete_Click()
On Error GoTo Err_ButtonDelete_Click

  Dim intReply As Integer
  
  intReply = MsgBox("Are you sure you want to delete this record?", vbYesNo, "Delete Record")
    If intReply = vbYes Then
      DoCmd.SetWarnings False
      DoCmd.DoMenuItem acFormBar, acEditMenu, 8, , acMenuVer70
      DoCmd.DoMenuItem acFormBar, acEditMenu, 6, , acMenuVer70
      DoCmd.SetWarnings True
      Me.Requery
    End If

Exit_ButtonDelete_Click:
    Exit Sub

Err_ButtonDelete_Click:
    MsgBox Err.Description
    Resume Exit_ButtonDelete_Click
    
End Sub
