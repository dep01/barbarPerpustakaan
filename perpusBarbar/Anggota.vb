Public Class Anggota

    Private Sub Anggota_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        Me.BackgroundImageLayout = ImageLayout.Stretch
        LoadDataAnggota()
        AddComboboxJk()
        AddComboboxFilter()
    End Sub
    Private Sub AddComboboxJk()
        Dim Sql As String = "select * from mJkelamin"
        Call FillCombobox(Sql)
        With cmbJK
            .DataSource = dt
            .ValueMember = "idJkelamin"
            .DisplayMember = "jenisKelamin"
        End With
    End Sub
    Private Sub AddComboboxFilter()
        cmbFilter.Items.Clear()
        cmbFilter.Items.Add("All")
        cmbFilter.Items.Add("Kartu")
        cmbFilter.Items.Add("Nama")
        cmbFilter.Items.Add("Alamat")
        cmbFilter.Text = "All"
    End Sub
    Private Sub LoadDataAnggota()
        Dim Sql As String = "exec spManggota 'get','kartu','nama',0,'alamat','nomor'"
        Call FillDgv(Sql)
        Me.DGVanggota.DataSource = (ds.Tables(0))
        Me.DGVanggota.AllowUserToAddRows = False
        Me.DGVanggota.AllowUserToDeleteRows = False
        Me.DGVanggota.ReadOnly = True

    End Sub

    Private Sub btnTambah_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnTambah.Click
        If btnTambah.Text = "Tambah" Then
            btnCancel_Click(btnCancel, Nothing)
            btnTambah.Text = "Update"
            DGVanggota.Enabled = False
            btnHapus.Enabled = False
            txtKartu.Text = kartuPerpus()
        Else
            btnCancel_Click(btnCancel, Nothing)
            btnTambah.Text = "Tambah"
            DGVanggota.Enabled = True
            btnHapus.Enabled = True
        End If
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        btnTambah.Text = "Tambah"
        DGVanggota.Enabled = True
        txtAlamat.Text = ""
        txtFilter.Text = ""
        txtNama.Text = ""
        txtNo.Text = ""
        txtKartu.Text = ""
        btnHapus.Enabled = True
        LoadDataAnggota()
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If txtAlamat.Text = "" Or txtNama.Text = "" Or txtKartu.Text = "" Or txtNo.Text = "" Then
            MsgBox("Lengkapi semua data!!!", vbExclamation, "WOI")
        Else
            Dim x As String = "exec spManggota 'upd','" & txtKartu.Text & "','" & txtNama.Text & "','" & cmbJK.SelectedValue & "','" & txtAlamat.Text & "','" & txtNo.Text & "'"
            If btnTambah.Text = "Tambah" Then

                SQLInsert(x)
                MsgBox("Data berhasil di Update :)", vbInformation, "Perhatian")
                btnCancel_Click(btnCancel, Nothing)

            Else

                x = "exec spManggota 'add','" & txtKartu.Text & "','" & txtNama.Text & "','" & cmbJK.SelectedValue & "','" & txtAlamat.Text & "','" & txtNo.Text & "'"
                SQLInsert(x)
                MsgBox("Data berhasil di Simpan :)", vbInformation, "Perhatian")
                btnCancel_Click(btnCancel, Nothing)

            End If
        End If
    End Sub

    Private Sub btnHapus_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnHapus.Click
        Dim x As String = "exec spManggota 'del','" & txtKartu.Text & "','" & txtNama.Text & "','" & cmbJK.SelectedValue & "','" & txtAlamat.Text & "','" & txtNo.Text & "'"
        SQLInsert(x)
        MsgBox("Data berhasil dihapus :)", vbInformation, "Perhatian")
        btnCancel_Click(btnCancel, Nothing)
    End Sub

    Private Sub cmbFilter_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbFilter.SelectedIndexChanged
        txtFilter.Text = ""
    End Sub

    Private Sub txtFilter_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtFilter.TextChanged
        Dim sqlQuery As String = "exec spManggota '" & cmbFilter.Text & "','c','" & txtFilter.Text & "','1','x','0'"
        FillDgv(sqlQuery)
        Me.DGVanggota.DataSource = (ds.Tables(0))
    End Sub

    Private Sub txtNo_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtNo.KeyPress
        If Not ((e.KeyChar >= "0" And e.KeyChar <= "9") Or e.KeyChar = vbBack) Then e.Handled = True
    End Sub

    Private Sub DGVanggota_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DGVanggota.CellContentClick

    End Sub

    Private Sub DGVanggota_CellMouseClick(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles DGVanggota.CellMouseClick
        Try
            txtKartu.Text = DGVanggota.CurrentRow.Cells(0).Value
            txtNama.Text = DGVanggota.CurrentRow.Cells(1).Value
            cmbJK.Text = DGVanggota.CurrentRow.Cells(2).Value
            txtAlamat.Text = DGVanggota.CurrentRow.Cells(3).Value
            txtNo.Text = DGVanggota.CurrentRow.Cells(4).Value
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class