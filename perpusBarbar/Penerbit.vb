Imports System.Data.SqlClient
Public Class Penerbit

    Private Sub Penerbit_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        LoadDataPenerbit()
        AddCombobox()
    End Sub
    Private Sub LoadDataPenerbit()
        Dim Sql As String = "exec spMpenerbit 'get',0,'x'"
        Call FillDgv(Sql)
        Me.DGVgroup.DataSource = (ds.Tables(0))

        Me.DGVgroup.Columns(0).HeaderText = "ID Penerbit"
        Me.DGVgroup.Columns(1).HeaderText = "Penerbit"

        Me.DGVgroup.Columns(0).Width = 60
        Me.DGVgroup.Columns(1).Width = 250

        Me.DGVgroup.Columns(0).ReadOnly = True
        Me.DGVgroup.Columns(1).ReadOnly = True


        Me.DGVgroup.Columns(0).HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter
        Me.DGVgroup.Columns(1).HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleLeft



        Me.DGVgroup.Columns(0).DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter
        Me.DGVgroup.Columns(1).DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleLeft
        Me.DGVgroup.AllowUserToAddRows = False

    End Sub
    Private Sub AddCombobox()
        Dim Sql As String = "exec spMpenerbit 'get',0,'x'"
        Call FillCombobox(sql)
        With CmbGroup
            .DataSource = dt
            .ValueMember = "idPenerbit"
            .DisplayMember = "namaPenerbit"
        End With
    End Sub
    Private Sub btnsave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnsave.Click
        If btnsave.Text = "Tambah" Then
            btnsave.Text = "Update"
            Button1.Text = "Simpan"
            Button2.Enabled = False
            CmbGroup.Enabled = False
        Else
            btnsave.Text = "Tambah"
            Button1.Text = "Update"
            Button2.Enabled = True
            CmbGroup.Enabled = True
        End If
    End Sub
End Class