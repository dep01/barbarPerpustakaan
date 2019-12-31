Public Class RakBuku
    Private Sub RakBuku_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        LoadDataPenerbit()
        AddCombobox()
    End Sub
    Private Sub LoadDataPenerbit()
        Dim Sql As String = "exec spMRakBuku 'get',0,'x'"
        Call FillDgv(Sql)
        Me.DGVRak.DataSource = (ds.Tables(0))

        Me.DGVRak.Columns(0).HeaderText = "ID Rak"
        Me.DGVRak.Columns(1).HeaderText = "Rak Buku"

        Me.DGVRak.Columns(0).Width = 60
        Me.DGVRak.Columns(1).Width = 250

        Me.DGVRak.Columns(0).ReadOnly = True
        Me.DGVRak.Columns(1).ReadOnly = True


        Me.DGVRak.Columns(0).HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter
        Me.DGVRak.Columns(1).HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleLeft



        Me.DGVRak.Columns(0).DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter
        Me.DGVRak.Columns(1).DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleLeft
        Me.DGVRak.AllowUserToAddRows = False

    End Sub
    Private Sub AddCombobox()
        Dim Sql As String = "exec spMRakBuku 'get',0,'x'"
        Call FillCombobox(sql)
        With cmbRak
            .DataSource = dt
            .ValueMember = "idRakBuku"
            .DisplayMember = "namaRak"
        End With
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        btnTambah.Text = "Tambah"
        btnUpdate.Text = "Update"
        btnHapus.Enabled = True
        cmbRak.Enabled = True
        txtRak.Clear()
        txtRak.Focus()
        LoadDataPenerbit()
        AddCombobox()
    End Sub

    Private Sub btnTambah_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnTambah.Click

        If btnTambah.Text = "Tambah" Then
            btnTambah.Text = "Update"
            btnUpdate.Text = "Simpan"
            btnHapus.Enabled = False
            cmbRak.Enabled = False
        Else
            btnTambah.Text = "Tambah"
            btnUpdate.Text = "Update"
            btnHapus.Enabled = True
            cmbRak.Enabled = True
        End If
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If txtRak.Text = "" Then
            MsgBox("Rak Buku tidak boleh kosong!!", vbExclamation, "WOI")
        Else
            If btnUpdate.Text = "Update" Then
                Dim x As String = "exec spMRakBuku 'cek',0,'" & txtRak.Text & "'"
                If CekExistsData(x) = 1 Then
                    MsgBox("Nama Rak tersebut sudah digunakan!", vbExclamation, "WOI")
                Else
                    x = "exec spMRakBuku 'upd','" & cmbRak.SelectedValue & "','" & txtRak.Text & "'"
                    SQLInsert(x)
                    MsgBox("Data berhasil di Update :)", vbInformation, "Perhatian")
                    btnCancel_Click(btnCancel, Nothing)
                End If
            Else
                Dim x As String = "exec spMRakBuku 'cek',0,'" & txtRak.Text & "'"
                If CekExistsData(x) = 1 Then
                    MsgBox("Nama rak tersebut sudah digunakan!", vbExclamation, "WOI")
                Else
                    x = "exec spMRakBuku 'add',0,'" & txtRak.Text & "'"
                    SQLInsert(x)
                    MsgBox("Data berhasil di Simpan :)", vbInformation, "Perhatian")
                    btnCancel_Click(btnCancel, Nothing)
                End If
            End If
        End If
    End Sub

    Private Sub btnHapus_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnHapus.Click
        Dim x As String = "exec spMRakBuku 'del','" & cmbRak.SelectedValue & "','" & txtRak.Text & "'"
        SQLInsert(x)
        MsgBox("Data berhasil dihapus :)", vbInformation, "Perhatian")
        btnCancel_Click(btnCancel, Nothing)
    End Sub

End Class