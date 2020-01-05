Public Class Pengembalian
    Private Sub LoadDataPengembalian()
        Dim sql As String = "exec SpTrPerpus 'getKembali','nik','0','nomorpinjam','0'"
        Call FillDgv(sql)
        DGVPengembalian.DataSource = ds.Tables(0)
        Me.DGVPengembalian.AllowUserToAddRows = False
        Me.DGVPengembalian.AllowUserToDeleteRows = False
        Me.DGVPengembalian.ReadOnly = True
    End Sub
    Private Sub addComboboxNomor()
        cmbNomor.Items.Clear()
        Dim sql As String = "exec SpTrPerpus 'cmb','nik','0','nomorpinjam','0'"
        fillComboboxAdd(sql)
        dr.Read()
        Do While dr.Read
            cmbNomor.Items.Add(dr.Item(0))
        Loop
    End Sub
    Private Sub Pengembalian_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        Me.BackgroundImageLayout = ImageLayout.Stretch
        Call LoadDataPengembalian()
        Call addComboboxNomor()
    End Sub
    Private Sub cmbNomor_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbNomor.TextChanged
        Dim sql As String = "exec SpTrPerpus 'getData','nik','0','" & cmbNomor.Text & "','0'"
        fillComboboxAdd(sql)
        dr.Read()
        If dr.HasRows Then
            txtJudul.Text = dr.Item(0)
            txtTgl.Text = dr.Item(1)
            txtBatas.Text = dr.Item(2)
            txtLama.Text = dr.Item(3)
            txtTelat.Text = dr.Item(4)
            txtDenda.Text = dr.Item(5)
            txtTotal.Text = dr.Item(6)
        Else
            txtJudul.Text = ""
            txtTgl.Text = ""
            txtBatas.Text = ""
            txtLama.Text = ""
            txtTelat.Text = ""
            txtDenda.Text = ""
            txtTotal.Text = ""
        End If
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        txtJudul.Text = ""
        txtTgl.Text = ""
        txtBatas.Text = ""
        txtLama.Text = ""
        txtTelat.Text = ""
        txtDenda.Text = ""
        txtTotal.Text = ""
        cmbNomor.Text = ""
        Call LoadDataPengembalian()
        Call addComboboxNomor()
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If txtJudul.Text = "" Then
            MsgBox("Data tidak ditemukan!", vbInformation, "Perhatian")
        Else
            Dim sql As String = "exec SpTrPerpus 'kembali','" & vNIK & "','0','" & cmbNomor.Text & "','0'"
            SQLInsert(sql)
            MsgBox("Data berhasil disimpan :)", vbInformation, "Perhatian")
            btnCancel_Click(btnCancel, Nothing)
        End If

    End Sub
End Class