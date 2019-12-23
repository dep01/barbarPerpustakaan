Imports System.Linq
Imports System.Data.SqlClient

Public Class HakAksesFrm

    Private Sub HakAksesFrm_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        Me.BackgroundImageLayout = ImageLayout.Stretch
        Call hakases()
        Call LoadDataGroup()
        Call LoadComboGroup()
    End Sub

    Private Sub simpanGroup()
        Dim sql As String = "exec spMstatusUser 'cek',0,'" & TxtNamaGroup.Text & "'"
        If CekExistsData(sql) = 1 Then
            MsgBox("Jenis User tersebut sudah ada!", vbExclamation, "WOY")
        Else
            Dim strQuery As String = "exec spMstatusUser 'add',0,'" & TxtNamaGroup.Text & "'"
            SQLInsert(strQuery)
            MsgBox("Data berhasil di simpan", vbInformation, "Sukses")
            Call LoadDataGroup()
            Call LoadComboGroup()
            TxtNamaGroup.Clear()
        End If
    End Sub
    Private Sub LoadComboGroup()
        Dim sql As String = "exec spMstatusUser 'get'," & vIdStatus & ",'x'"
        Call FillCombobox(sql)
        With CmbGroup
            .DataSource = dt
            .ValueMember = "idStatusUser"
            .DisplayMember = "JenisUser"
        End With


    End Sub
    Private Sub LoadDataGroup()
        Dim Sql As String = "exec spMstatusUser 'get'," & vIdStatus & ",'x'"
        Call FillDgv(Sql)
        Me.DGVgroup.DataSource = (ds.Tables(0))

        Me.DGVgroup.Columns(0).HeaderText = "ID Status"
        Me.DGVgroup.Columns(1).HeaderText = "Jenis User"

        Me.DGVgroup.Columns(0).Width = 60
        Me.DGVgroup.Columns(1).Width = 250

        Me.DGVgroup.Columns(0).ReadOnly = True
        Me.DGVgroup.Columns(1).ReadOnly = True


        Me.DGVgroup.Columns(0).HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter
        Me.DGVgroup.Columns(1).HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter



        Me.DGVgroup.Columns(0).DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter
        Me.DGVgroup.Columns(1).DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter

        Me.DGVgroup.AllowUserToAddRows = False

    End Sub


    Private Sub hakases()

        TViewMenu.Nodes.Clear()
        For Each Cntrl As ToolStripMenuItem In MenuUtama.MenuStrip1.Items
            Dim atas As TreeNode = TViewMenu.Nodes.Add(Cntrl.Text)

            For Each Menu1 In Cntrl.DropDownItems.OfType(Of ToolStripMenuItem)()
                Dim tengah As TreeNode = atas.Nodes.Add(Menu1.Text)

                For Each Menu2 In Menu1.DropDownItems.OfType(Of ToolStripMenuItem)()
                    Dim bawah As TreeNode = tengah.Nodes.Add(Menu2.Text)

                    For Each Menu3 In Menu2.DropDownItems.OfType(Of ToolStripMenuItem)()
                        Dim bawahsekali As TreeNode = bawah.Nodes.Add(Menu3.Text)
                    Next
                Next
            Next


        Next

        TViewMenu.ExpandAll()
        TViewMenu.CheckBoxes = True
    End Sub
    Private Sub simpanhakakses()
        Dim strQuery As String = "exec sptblHakakses 'Delete',0," & CmbGroup.SelectedValue & ",'menu','submenu'"
        SQLInsert(strQuery)
        For Each lvl1 As TreeNode In TViewMenu.Nodes
            If lvl1.Checked Then
                strQuery = "exec sptblHakakses 'add',0," & CmbGroup.SelectedValue & ",'" & lvl1.Text & "','" & lvl1.Text & "'"
                SQLInsert(strQuery)
            End If

            For Each lvl2 As TreeNode In lvl1.Nodes
                If lvl2.Checked Then
                    strQuery = "exec sptblHakakses 'add',0," & CmbGroup.SelectedValue & ",'" & lvl1.Text & "','" & lvl2.Text & "'"
                    SQLInsert(strQuery)
                End If

                For Each lvl3 As TreeNode In lvl2.Nodes
                    If lvl3.Checked Then
                        strQuery = "exec sptblHakakses 'add',0," & CmbGroup.SelectedValue & ",'" & lvl2.Text & "','" & lvl3.Text & "'"
                        SQLInsert(strQuery)
                    End If

                    For Each lvl4 As TreeNode In lvl3.Nodes
                        If lvl4.Checked Then
                            strQuery = "exec sptblHakakses 'add',0," & CmbGroup.SelectedValue & ",'" & lvl3.Text & "','" & lvl4.Text & "'"
                            SQLInsert(strQuery)
                        End If
                    Next

                Next

            Next
        Next
        MsgBox("Data berhasil di simpan", vbInformation, "Sukses")
        Call CeklistMenuSubMenu()
    End Sub

    Private Sub TViewMenu_AfterCheck(ByVal sender As Object, ByVal e As TreeViewEventArgs)
        RemoveHandler TViewMenu.AfterCheck, AddressOf TViewMenu_AfterCheck

        Call CheckAllChildNodes(e.Node)

        If e.Node.Checked Then
            If e.Node.Parent Is Nothing = False Then
                Dim allChecked As Boolean = True
                Call IsEveryChildChecked(e.Node.Parent, allChecked)
                If allChecked Then
                    e.Node.Parent.Checked = True
                    Call ShouldParentsBeChecked(e.Node.Parent)
                End If
            End If
        Else
            Dim parentNode As TreeNode = e.Node.Parent
            While parentNode Is Nothing = False
                parentNode.Checked = False
                parentNode = parentNode.Parent
            End While
        End If

        AddHandler TViewMenu.AfterCheck, AddressOf TViewMenu_AfterCheck
    End Sub

    Private Sub CheckAllChildNodes(ByVal parentNode As TreeNode)
        For Each childNode As TreeNode In parentNode.Nodes
            childNode.Checked = parentNode.Checked
            CheckAllChildNodes(childNode)
        Next
    End Sub

    Private Sub IsEveryChildChecked(ByVal parentNode As TreeNode, ByRef checkValue As Boolean)
        For Each node As TreeNode In parentNode.Nodes
            Call IsEveryChildChecked(node, checkValue)
            If Not node.Checked Then
                checkValue = False
            End If
        Next
    End Sub

    Private Sub ShouldParentsBeChecked(ByVal startNode As TreeNode)
        If startNode.Parent Is Nothing = False Then
            Dim allChecked As Boolean = True
            Call IsEveryChildChecked(startNode.Parent, allChecked)
            If allChecked Then
                startNode.Parent.Checked = True
                Call ShouldParentsBeChecked(startNode.Parent)
            End If
        End If
    End Sub

    Private Sub CeklistMenuSubMenu()
        Try
            Call koneksi()
            Dim x As String = "exec sptblHakakses 'Get',0," & CmbGroup.SelectedValue & ",'menu','submenu'"
            cmd = New SqlCommand(x, conn)
            dr = cmd.ExecuteReader
            If dr.HasRows Then

                Do While dr.Read

                    For Each lvl1 As TreeNode In TViewMenu.Nodes
                        If dr.Item(3) = dr.Item(2) Then
                            If lvl1.Text = dr.Item(3) Then
                                lvl1.Checked = True
                            End If
                        End If

                        For Each lvl2 As TreeNode In lvl1.Nodes
                            If lvl1.Text = dr.Item(2) Then
                                If lvl2.Text = dr.Item(3) Then
                                    lvl2.Checked = True
                                End If
                            End If


                            For Each lvl3 As TreeNode In lvl2.Nodes
                                If lvl2.Text = dr.Item(2) Then
                                    If lvl3.Text = dr.Item(3) Then
                                        lvl3.Checked = True
                                    End If
                                End If

                                For Each lvl4 As TreeNode In lvl3.Nodes
                                    If lvl3.Text = dr.Item(2) Then
                                        If lvl4.Text = dr.Item(3) Then
                                            lvl4.Checked = True
                                        End If
                                    End If
                                Next
                            Next

                        Next

                    Next

                Loop


            End If
        Catch ex As Exception
            If Err.Number = 13 Then

            End If
        End Try



    End Sub

    Private Sub BtnSetting_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnSetting.Click
        If Me.CmbGroup.Text = "" Then
            MsgBox("Pilih nama group dahulu.", vbExclamation, "Perhatian")
            Exit Sub

        Else
            Call simpanhakakses()
        End If
    End Sub

    Private Sub CmbGroup_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CmbGroup.SelectedIndexChanged
        If Me.CmbGroup.Text = "" Then
            Exit Sub
        Else
            Call hakases()
            Call CeklistMenuSubMenu()
        End If
    End Sub

    Private Sub TxtNamaGroup_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles TxtNamaGroup.KeyPress
        e.Handled = Not (Char.IsLetter(e.KeyChar) Or Char.IsWhiteSpace(e.KeyChar) Or e.KeyChar = Chr(Keys.Back))
    End Sub

    Private Sub btnsave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnsave.Click
        If Me.TxtNamaGroup.Text = "" Then
            MsgBox("Masukan nama group dahulu", vbExclamation, "Perhatian")
            Exit Sub

        Else
            simpanGroup()
        End If
    End Sub

End Class