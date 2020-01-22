
Public Class Buku
    Dim vIdbuku, vjangka, vmaxPinjam As Integer
    Private Sub Buku_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        Me.BackgroundImageLayout = ImageLayout.Stretch
        LoadDataBuku()
        AddComboboxPenerbit()
        AddComboboxJenisBUku()
        AddComboboxFilter()
    End Sub
    Private Sub LoadDataBuku()
        Dim Sql As String = "exec spMbuku 'get','0','0','0','0','0','0','2019-01-01'"
        Call FillDgv(Sql)
        Me.DGVBuku.DataSource = (ds.Tables(0))
        Me.DGVBuku.AllowUserToAddRows = False
        Me.DGVBuku.AllowUserToDeleteRows = False
        Me.DGVBuku.ReadOnly = True

    End Sub
    Private Sub AddComboboxPenerbit()
        Dim Sql As String = "exec spMPenerbit 'get',0,'x'"
        Call FillCombobox(Sql)
        With cmbPenerbit
            .DataSource = dt
            .ValueMember = "idPenerbit"
            .DisplayMember = "namaPenerbit"
        End With
        'Do While dr.Read
        '    cmbPenerbit.Items.Add(dr.Item(1))
        'Loop
    End Sub
    Private Sub AddComboboxFilter()
        cmbFilter.Items.Clear()
        cmbFilter.Items.Add("All")
        cmbFilter.Items.Add("Penerbit")
        cmbFilter.Items.Add("Jenis Buku")
        cmbFilter.Items.Add("Judul Buku")
        cmbFilter.Text = "All"
    End Sub
    Private Sub AddComboboxJenisBUku()
        Dim Sql As String = "exec spMJenisBuku 'get',0,'x'"
        Call FillCombobox(Sql)
        With cmbJenisBuku
            .DataSource = dt
            .ValueMember = "idJenisBuku"
            .DisplayMember = "jenisBuku"
        End With
        'Do While dr.Read
        '    cmbJenisBuku.Items.Add(dr.Item(1))
        'Loop
    End Sub

    Private Sub cmbFilter_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbFilter.SelectedIndexChanged
        txtFilter.Text = ""
    End Sub

    Private Sub txtFilter_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtFilter.TextChanged
        Dim Sql As String = "exec spMbuku '" & cmbFilter.Text & "','0','0','0','" & txtFilter.Text & "','0','0','2019-01-01'"
        FillDgv(Sql)
        Me.DGVBuku.DataSource = (ds.Tables(0))
        Me.DGVBuku.AllowUserToAddRows = False
        Me.DGVBuku.AllowUserToDeleteRows = False
        Me.DGVBuku.ReadOnly = True

    End Sub


    Private Sub btnTambah_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnTambah.Click
        If btnTambah.Text = "Tambah" Then
            btnTambah.Text = "Update"
            Call fillComboboxAdd("select * from settingPerpus")
            dr.Read()
            vjangka = dr.Item(2)
            vmaxPinjam = dr.Item(3)
            txtJangka.Text = vjangka
            btnUpdate.Text = "Simpan"
            btnHapus.Enabled = False
            txtBuku.Text = ""
        Else
            btnTambah.Text = "Tambah"
            btnUpdate.Text = "Update"
            btnHapus.Enabled = True
        End If
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim a As String = DTterbit.Value.Year
        Dim b As String = DTterbit.Value.Month
        Dim c As String = DTterbit.Value.Day
        Dim vTglTerbit As String = a + "-" + b + "-" + c
        If txtBuku.Text = "" Or txtDenda.Text = "" Or txtJangka.Text = "" Then
            MsgBox("Lengkapi semua data!!!", vbExclamation, "WOI")
        Else
            If btnUpdate.Text = "Update" Then
                Dim x As String = "exec spMbuku 'upd','" & vIdbuku & "','" & cmbPenerbit.SelectedValue & "','" & cmbJenisBuku.SelectedValue & "','" & txtBuku.Text & "','" & txtJangka.Text & "','" & txtDenda.Text & "','" & vTglTerbit & "'"
                SQLInsert(x)
                MsgBox("Data berhasil di Update :)", vbInformation, "Perhatian")
                btnCancel_Click(btnCancel, Nothing)

            Else
                Dim x As String = "exec spMbuku 'cek','0','" & cmbPenerbit.SelectedValue & "','" & cmbJenisBuku.SelectedValue & "','" & txtBuku.Text & "','0','0','2019-03-06'"
                If CekExistsData(x) = 1 Then
                    MsgBox("Data tersebut sudah digunakan!", vbExclamation, "WOI")
                Else
                    x = "exec spMbuku 'add','" & vIdbuku & "','" & cmbPenerbit.SelectedValue & "','" & cmbJenisBuku.SelectedValue & "','" & txtBuku.Text & "','" & txtJangka.Text & "','" & txtDenda.Text & "','" & vTglTerbit & "'"
                    SQLInsert(x)
                    MsgBox("Data berhasil di Simpan :)", vbInformation, "Perhatian")
                    btnCancel_Click(btnCancel, Nothing)
                End If
            End If
        End If
    End Sub
    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        btnTambah.Text = "Tambah"
        btnUpdate.Text = "Update"
        btnHapus.Enabled = True
        txtBuku.Clear()
        txtDenda.Clear()
        txtJangka.Clear()
        txtBuku.Focus()
        LoadDataBuku()
        AddComboboxPenerbit()
        AddComboboxJenisBUku()
        AddComboboxFilter()
    End Sub

    Private Sub btnHapus_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnHapus.Click
        If vIdbuku = 0 Then
            MsgBox("Pilih dulu data yang akan dihapus!", vbExclamation, "WOI")
        Else
            Dim x As String = "exec spMbuku 'del','" & vIdbuku & "','0','0','0','0','0','2019-01-01'"
            SQLInsert(x)
            MsgBox("Data berhasil dihapus :)", vbInformation, "Perhatian")
            btnCancel_Click(btnCancel, Nothing)
        End If

    End Sub

    Private Sub DGVBuku_CellMouseClick(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles DGVBuku.CellMouseClick
        Try
            cmbPenerbit.Text = DGVBuku.CurrentRow.Cells(0).Value
            cmbJenisBuku.Text = DGVBuku.CurrentRow.Cells(1).Value
            txtBuku.Text = DGVBuku.CurrentRow.Cells(3).Value
            txtJangka.Text = DGVBuku.CurrentRow.Cells(4).Value
            txtDenda.Text = DGVBuku.CurrentRow.Cells(5).Value
            DTterbit.Value = DGVBuku.CurrentRow.Cells(6).Value
            vIdbuku = DGVBuku.CurrentRow.Cells(2).Value
        Catch ex As Exception
            MsgBox(Err.Number)
        End Try
    End Sub

    Private Sub txtJangka_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtJangka.KeyPress
        If Not ((e.KeyChar >= "0" And e.KeyChar <= "9") Or e.KeyChar = vbBack) Then e.Handled = True
    End Sub

    Private Sub txtDenda_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtDenda.KeyPress
        If Not ((e.KeyChar >= "0" And e.KeyChar <= "9") Or e.KeyChar = vbBack) Then e.Handled = True
    End Sub

    Private Sub txtJangka_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtJangka.TextChanged
        If txtJangka.Text = "" Then
        Else
            If txtJangka.Text > vmaxPinjam Then
                MsgBox("Maksimal jangka pinjam adalah " & vmaxPinjam & " hari", vbExclamation, "WOI")
                txtJangka.Text = vmaxPinjam
            End If
        End If
  
    End Sub
End Class