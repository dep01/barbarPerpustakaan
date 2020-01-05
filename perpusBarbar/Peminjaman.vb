Public Class Peminjaman
    Dim vIdanggota, vTersedia As Integer
    Private Sub LoadDataPeminjaman()
        Dim sql As String = "exec SpTrPerpus 'get','nik','0','nomorpinjam','0'"
        Call FillDgv(sql)
        DGVpeminjaman.DataSource = ds.Tables(0)
        Me.DGVpeminjaman.AllowUserToAddRows = False
        Me.DGVpeminjaman.AllowUserToDeleteRows = False
        Me.DGVpeminjaman.ReadOnly = True
    End Sub
    Private Sub nomorPinjaman()
        Dim sql As String = "select dbo.fcNomorPinjam()"
        Call fillComboboxAdd(sql)
        dr.Read()
        txtNomot.Text = dr.Item(0)
    End Sub
    Private Sub LoadDataAnggota()
        Dim sql As String = "exec SpTrPerpus 'anggota','nik','0','nomorpinjam','0'"
        Call FillDgv(sql)
        DGVanggota.DataSource = ds.Tables(0)
        Me.DGVanggota.AllowUserToAddRows = False
        Me.DGVanggota.AllowUserToDeleteRows = False
        Me.DGVanggota.ReadOnly = True
    End Sub
    Private Sub LoadDataBuku()
        Dim sql As String = "exec SpTrPerpus 'Buku','nik','0','nomorpinjam','0'"
        Call FillDgv(sql)
        DGVbuku.DataSource = ds.Tables(0)
        DGVbuku.Columns(3).Visible = False
        Me.DGVbuku.AllowUserToAddRows = False
        Me.DGVbuku.AllowUserToDeleteRows = False
        Me.DGVbuku.ReadOnly = True
    End Sub
    Private Sub addComboboxBuku()
        Dim sql As String = "exec SpTrPerpus 'Buku','nik','0','nomorpinjam','0'"
        FillCombobox(sql)
        With cmbBuku
            .DataSource = dt
            .ValueMember = "idBuku"
            .DisplayMember = "judulBuku"
        End With
    End Sub

    Private Sub Peminjaman_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        Me.BackgroundImageLayout = ImageLayout.Stretch
        Call LoadDataAnggota()
        Call LoadDataBuku()
        Call LoadDataPeminjaman()
        Call addComboboxBuku()
        Call nomorPinjaman()
    End Sub
    Private Sub DGVbuku_CellMouseClick(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles DGVbuku.CellMouseClick
        Try
            cmbBuku.Text = DGVbuku.CurrentRow.Cells(1).Value
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub txtKartu_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtKartu.KeyPress
        If Not ((e.KeyChar >= "0" And e.KeyChar <= "9") Or e.KeyChar = vbBack) Then e.Handled = True
    End Sub

    Private Sub txtKartu_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtKartu.TextChanged
        Dim sql As String = "exec SpTrPerpus 'cekanggota','nik','0','" & txtKartu.Text & "','0'"
        Call fillComboboxAdd(sql)
        dr.Read()
        If dr.HasRows Then
            vIdanggota = dr.Item(0)
            txtNama.Text = dr.Item(1)
        Else
            vIdanggota = 0
            txtNama.Text = ""
        End If
    End Sub

    Private Sub cmbBuku_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbBuku.SelectedIndexChanged
        Try
            Dim sql As String = "exec SpTrPerpus 'cekbuku','nik','" & cmbBuku.SelectedValue & "','nomorpinjam','0'"
            fillComboboxAdd(sql)
            dr.Read()
            vTersedia = dr.Item(0)
        Catch ex As Exception
            If Err.Number = 13 Then

            Else
                MsgBox(ex.Message)
            End If
        End Try

    End Sub

    Private Sub DGVanggota_CellMouseClick(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles DGVanggota.CellMouseClick
        Try
            txtKartu.Text = DGVanggota.CurrentRow.Cells(0).Value
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnPinjam_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPinjam.Click
        Try

            If txtNama.Text = "" Then
                MsgBox("Anggota tidak ditemukan!", vbInformation, "Perhatian")
            ElseIf vTersedia <= 0 Then
                MsgBox("Jumlah buku tersedia 0 !", vbInformation, "WOI")
            Else
                Dim sql As String = "exec SpTrPerpus 'pinjam','" & vNIK & "','" & cmbBuku.SelectedValue & "','" & txtNomot.Text & "','" & vIdanggota & "'"
                SQLInsert(sql)
                MsgBox("Data tersimpan,Jangan lupa mengembalikan buku sesuai dengan waktunya :)", vbInformation, "Perhatian")
                btnCancel_Click(btnCancel, Nothing)
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        txtKartu.Text = ""
        txtFAnggota.Text = ""
        txtFbuku.Text = ""
        Call LoadDataAnggota()
        Call LoadDataBuku()
        Call LoadDataPeminjaman()
        Call addComboboxBuku()
        Call nomorPinjaman()
    End Sub

    Private Sub txtFAnggota_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtFAnggota.TextChanged
        Dim sql As String = "exec SpTrPerpus 'Fanggota','" & txtFAnggota.Text & "','0','nomorpinjam','0'"
        Call FillDgv(sql)
        DGVanggota.DataSource = ds.Tables(0)
        Me.DGVanggota.AllowUserToAddRows = False
        Me.DGVanggota.AllowUserToDeleteRows = False
        Me.DGVanggota.ReadOnly = True
    End Sub

    Private Sub txtFbuku_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtFbuku.TextChanged
        Dim sql As String = "exec SpTrPerpus 'FBuku','" & txtFAnggota.Text & "','0','nomorpinjam','0'"
        Call FillDgv(sql)
        DGVbuku.DataSource = ds.Tables(0)
        DGVbuku.Columns(3).Visible = False
        Me.DGVbuku.AllowUserToAddRows = False
        Me.DGVbuku.AllowUserToDeleteRows = False
        Me.DGVbuku.ReadOnly = True
    End Sub
End Class