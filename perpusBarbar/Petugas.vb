Public Class Petugas

    Private Sub Petugas_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        Me.BackgroundImageLayout = ImageLayout.Stretch
        txtNik.Enabled = False
        LoadDataPetugas()
        AddComboboxJk()
        AddComboboxFilter()
    End Sub
    Private Sub LoadDataPetugas()
        Dim Sql As String = "exec spMpetugas 'get','nik','nama',0,'alamat','nomor','email'"
        Call FillDgv(Sql)
        Me.DGVpetugas.DataSource = (ds.Tables(0))
        Me.DGVpetugas.AllowUserToAddRows = False
        Me.DGVpetugas.AllowUserToDeleteRows = False
        Me.DGVpetugas.ReadOnly = True

    End Sub
    Private Sub AddComboboxJk()
        Dim Sql As String = "select * from mJkelamin"
        Call FillCombobox(Sql)
        With cmbJK
            .DataSource = dt
            .ValueMember = "idJkelamin"
            .DisplayMember = "jenisKelamin"
        End With
        'Do While dr.Read
        '    cmbPenerbit.Items.Add(dr.Item(1))
        'Loop
    End Sub
    Private Sub AddComboboxFilter()
        cmbFilter.Items.Clear()
        cmbFilter.Items.Add("All")
        cmbFilter.Items.Add("NIK")
        cmbFilter.Items.Add("Nama")
        cmbFilter.Items.Add("Alamat")
        cmbFilter.Text = "All"
    End Sub

    Private Sub btnTambah_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnTambah.Click
        If btnTambah.Text = "Tambah" Then
            btnCancel_Click(btnCancel, Nothing)
            btnTambah.Text = "Update"
            DGVpetugas.Enabled = False
            btnHapus.Enabled = False
            txtNik.Enabled = True
        Else
            btnCancel_Click(btnCancel, Nothing)
            btnTambah.Text = "Tambah"
            DGVpetugas.Enabled = True
            btnHapus.Enabled = True
            txtNik.Enabled = False
        End If
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        btnTambah.Text = "Tambah"
        DGVpetugas.Enabled = True
        txtNik.Enabled = False
        txtAlamat.Text = ""
        txtEmail.Text = ""
        txtFilter.Text = ""
        txtNama.Text = ""
        txtNik.Text = ""
        txtNo.Text = ""
        btnHapus.Enabled = True
        LoadDataPetugas()
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If txtAlamat.Text = "" Or txtEmail.Text = "" Or txtNama.Text = "" Or txtNik.Text = "" Or txtNo.Text = "" Then
            MsgBox("Lengkapi semua data!!!", vbExclamation, "WOI")
        Else
            If btnTambah.Text = "Tambah" Then
                Dim x As String = "exec spMpetugas 'upd','" & txtNik.Text & "','" & txtNama.Text & "','" & cmbJK.SelectedValue & "','" & txtAlamat.Text & "','" & txtNo.Text & "','" & txtEmail.Text & "'"
                SQLInsert(x)
                MsgBox("Data berhasil di Update :)", vbInformation, "Perhatian")
                btnCancel_Click(btnCancel, Nothing)

            Else
                Dim x As String = "exec spMpetugas 'cek','" & txtNik.Text & "','" & txtNama.Text & "','" & cmbJK.SelectedValue & "','" & txtAlamat.Text & "','" & txtNo.Text & "','" & txtEmail.Text & "'"
                If CekExistsData(x) = 1 Then
                    MsgBox("Nik tersebut sudah digunakan!", vbExclamation, "WOI")
                Else
                    x = "exec spMpetugas 'add','" & txtNik.Text & "','" & txtNama.Text & "','" & cmbJK.SelectedValue & "','" & txtAlamat.Text & "','" & txtNo.Text & "','" & txtEmail.Text & "'"
                    SQLInsert(x)
                    MsgBox("Data berhasil di Simpan :)", vbInformation, "Perhatian")
                    btnCancel_Click(btnCancel, Nothing)
                End If
            End If
        End If
    End Sub


    Private Sub DGVpetugas_CellMouseClick(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles DGVpetugas.CellMouseClick
        Try
            txtNik.Text = DGVpetugas.CurrentRow.Cells(0).Value
            txtNama.Text = DGVpetugas.CurrentRow.Cells(1).Value
            cmbJK.Text = DGVpetugas.CurrentRow.Cells(2).Value
            txtAlamat.Text = DGVpetugas.CurrentRow.Cells(3).Value
            txtNo.Text = DGVpetugas.CurrentRow.Cells(4).Value
            txtEmail.Text = DGVpetugas.CurrentRow.Cells(5).Value
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub cmbFilter_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbFilter.SelectedIndexChanged
        txtFilter.Text = ""
    End Sub

    Private Sub txtFilter_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtFilter.TextChanged
        Dim sqlQuery As String = "exec spMpetugas '" & cmbFilter.Text & "','nik','" & txtFilter.Text & "',0,'alamat','nomor','email'"
        FillDgv(sqlQuery)
        Me.DGVpetugas.DataSource = (ds.Tables(0))
    End Sub

    Private Sub btnHapus_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnHapus.Click
        Dim x As String = "exec spMpetugas 'del','" & txtNik.Text & "','t',0,'alamat','nomor','email'"
        SQLInsert(x)
        MsgBox("Data berhasil dihapus :)", vbInformation, "Perhatian")
        btnCancel_Click(btnCancel, Nothing)
    End Sub

    Private Sub txtNo_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtNo.KeyPress
        If Not ((e.KeyChar >= "0" And e.KeyChar <= "9") Or e.KeyChar = vbBack) Then e.Handled = True
    End Sub


End Class