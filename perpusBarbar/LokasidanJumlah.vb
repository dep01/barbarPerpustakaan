Public Class LokasidanJumlah
    Dim x As String = "exec spTblJumlahBuku 'get','0','0','0','c'"
    Dim y As String = "exec spTblJumlahBuku 'getAdd','0','0','0','c'"
    Private Sub AddComboboxRak()
        Dim Sql As String = "exec spMRakBuku 'get',0,'x'"
        Call FillCombobox(Sql)
        With cmbRak
            .DataSource = dt
            .ValueMember = "idRakBuku"
            .DisplayMember = "namaRak"
        End With
    End Sub

    Private Sub AddComboboxBuku(ByVal strQuery)
        Call FillCombobox(strQuery)
        With cmbBuku
            .DataSource = dt
            .ValueMember = "idBUku"
            .DisplayMember = "judulBuku"
        End With
    End Sub
    Private Sub AddComboboxFilter()
        cmbFilter.Items.Clear()
        cmbFilter.Items.Add("All")
        cmbFilter.Items.Add("Penerbit")
        cmbFilter.Items.Add("Jenis Buku")
        cmbFilter.Items.Add("Judul Buku")
        cmbFilter.Text = "All"
    End Sub

    Private Sub LoadDataBuku()
        Dim Sql As String = "exec spTblJumlahBuku 'get','0','0','0','c'"
        Call FillDgv(Sql)
        Me.DGVBuku.DataSource = (ds.Tables(0))
        Me.DGVBuku.AllowUserToAddRows = False
        Me.DGVBuku.AllowUserToDeleteRows = False
        Me.DGVBuku.ReadOnly = True

    End Sub
    Private Sub LokasidanJumlah_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        Me.BackgroundImageLayout = ImageLayout.Stretch
        cmbBuku.Enabled = False
        LoadDataBuku()
        AddComboboxRak()
        AddComboboxFilter()
        AddComboboxBuku(x)
    End Sub

    Private Sub btnTambah_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnTambah.Click
        If btnTambah.Text = "Tambah" Then
            btnTambah.Text = "Update"
            AddComboboxBuku(y)
            cmbBuku.Enabled = True
            DGVBuku.Enabled = False
        Else
            btnTambah.Text = "Tambah"
            cmbBuku.Enabled = False
            DGVBuku.Enabled = True
            AddComboboxBuku(x)
        End If
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If txtInput.Text = "" Or cmbBuku.Text = "" Then
            MsgBox("Lengkapi semua data!!!", vbExclamation, "WOI")
        Else
            Dim sql As String = "exec spTblJumlahBuku 'upd','" & cmbBuku.SelectedValue & "','" & txtInput.Text & "','" & cmbRak.SelectedValue & "','c'"
            If btnTambah.Text = "Tambah" Then
                SQLInsert(sql)
                MsgBox("Data berhasil di Update :)", vbInformation, "Perhatian")
                btnCancel_Click(btnCancel, Nothing)

            Else
                sql = "exec spTblJumlahBuku 'add','" & cmbBuku.SelectedValue & "','" & txtInput.Text & "','" & cmbRak.SelectedValue & "','c'"
                SQLInsert(sql)
                MsgBox("Data berhasil di Simpan :)", vbInformation, "Perhatian")
                btnCancel_Click(btnCancel, Nothing)

            End If
        End If
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        btnTambah.Text = "Tambah"
        cmbBuku.Enabled = False
        DGVBuku.Enabled = True
        txtInput.Text = ""
        LoadDataBuku()
        AddComboboxRak()
        AddComboboxBuku(x)
    End Sub

    Private Sub txtFilter_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtFilter.TextChanged
        Dim Sql As String = "exec spTblJumlahBuku '" & cmbFilter.Text & "','0','0','0','" & txtFilter.Text & "'"
        FillDgv(Sql)
        Me.DGVBuku.DataSource = (ds.Tables(0))
    End Sub


    Private Sub cmbFilter_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbFilter.SelectedIndexChanged
        txtFilter.Text = ""
    End Sub

    Private Sub DGVBuku_CellMouseClick(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles DGVBuku.CellMouseClick
        Try
            cmbRak.Text = DGVBuku.CurrentRow.Cells(0).Value
            cmbBuku.Text = DGVBuku.CurrentRow.Cells(4).Value
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub txtInput_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtInput.KeyPress
        If Not ((e.KeyChar >= "0" And e.KeyChar <= "9") Or e.KeyChar = vbBack) Then e.Handled = True
    End Sub
End Class