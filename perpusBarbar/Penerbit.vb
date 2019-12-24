
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
    Private Sub btnTambah_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnTambah.Click
        If btnTambah.Text = "Tambah" Then
            btnTambah.Text = "Update"
            btnUpdate.Text = "Simpan"
            btnHapus.Enabled = False
            CmbGroup.Enabled = False
        Else
            btnTambah.Text = "Tambah"
            btnUpdate.Text = "Update"
            btnHapus.Enabled = True
            CmbGroup.Enabled = True
        End If
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        btnTambah.Text = "Tambah"
        btnUpdate.Text = "Update"
        btnHapus.Enabled = True
        CmbGroup.Enabled = True
        TxtPenerbit.Clear()
        TxtPenerbit.Focus()
        LoadDataPenerbit()
        AddCombobox()
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If TxtPenerbit.Text = "" Then
            MsgBox("Penerbit tidak boleh kosong!!", vbExclamation, "WOI")
        Else
            If btnUpdate.Text = "Update" Then
                Dim x As String = "exec spMpenerbit 'cek',0,'" & TxtPenerbit.Text & "'"
                If CekExistsData(x) = 1 Then
                    MsgBox("Nama penerbit tersebut sudah digunakan!", vbExclamation, "WOI")
                Else
                    x = "exec spMpenerbit 'upd','" & CmbGroup.SelectedValue & "','" & TxtPenerbit.Text & "'"
                    SQLInsert(x)
                    MsgBox("Data berhasil di Update :)", vbInformation, "Perhatian")
                    btnCancel_Click(btnCancel, Nothing)
                End If
            Else
                Dim x As String = "exec spMpenerbit 'cek',0,'" & TxtPenerbit.Text & "'"
                If CekExistsData(x) = 1 Then
                    MsgBox("Nama penerbit tersebut sudah digunakan!", vbExclamation, "WOI")
                Else
                    x = "exec spMpenerbit 'add',0,'" & TxtPenerbit.Text & "'"
                    SQLInsert(x)
                    MsgBox("Data berhasil di Simpan :)", vbInformation, "Perhatian")
                    btnCancel_Click(btnCancel, Nothing)
                End If
            End If
        End If
       
    End Sub

    Private Sub btnHapus_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnHapus.Click
        Dim x As String = "exec spMpenerbit 'del','" & CmbGroup.SelectedValue & "','" & TxtPenerbit.Text & "'"
        SQLInsert(x)
        MsgBox("Data berhasil dihapus :)", vbInformation, "Perhatian")
        btnCancel_Click(btnCancel, Nothing)
    End Sub
End Class