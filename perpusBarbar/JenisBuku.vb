Public Class JenisBuku

    Private Sub JenisBuku_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        LoadDatajenisbuku()
        AddCombobox()
    End Sub
    Private Sub AddCombobox()
        Dim Sql As String = "exec spMjenisBuku 'get',0,'x'"
        Call FillCombobox(sql)
        With CmbJenisBuku
            .DataSource = dt
            .ValueMember = "idJenisBuku"
            .DisplayMember = "JenisBuku"
        End With
    End Sub
    Private Sub LoadDatajenisbuku()
        Dim Sql As String = "exec spMjenisBuku 'get',0,'x'"
        Call FillDgv(Sql)
        Me.DGVJenisBuku.DataSource = (ds.Tables(0))

        Me.DGVJenisBuku.Columns(0).HeaderText = "ID Jenis"
        Me.DGVJenisBuku.Columns(1).HeaderText = "Jenis Buku"

        Me.DGVJenisBuku.Columns(0).Width = 60
        Me.DGVJenisBuku.Columns(1).Width = 250

        Me.DGVJenisBuku.Columns(0).ReadOnly = True
        Me.DGVJenisBuku.Columns(1).ReadOnly = True


        Me.DGVJenisBuku.Columns(0).HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter
        Me.DGVJenisBuku.Columns(1).HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleLeft



        Me.DGVJenisBuku.Columns(0).DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter
        Me.DGVJenisBuku.Columns(1).DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleLeft
        Me.DGVJenisBuku.AllowUserToAddRows = False

    End Sub

    Private Sub btnTambah_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnTambah.Click
        If btnTambah.Text = "Tambah" Then
            btnTambah.Text = "Update"
            btnUpdate.Text = "Simpan"
            btnHapus.Enabled = False
            CmbJenisBuku.Enabled = False
        Else
            btnTambah.Text = "Tambah"
            btnUpdate.Text = "Update"
            btnHapus.Enabled = True
            CmbJenisBuku.Enabled = True
        End If
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If TxtJenisBuku.Text = "" Then
            MsgBox("Jenis Buku tidak boleh kosong!!", vbExclamation, "WOI")
        Else
            If btnUpdate.Text = "Update" Then
                Dim x As String = "exec spMjenisBuku 'cek',0,'" & TxtJenisBuku.Text & "'"
                If CekExistsData(x) = 1 Then
                    MsgBox("Jenis Buku tersebut sudah digunakan!", vbExclamation, "WOI")
                Else
                    x = "exec spMjenisBuku 'upd','" & CmbJenisBuku.SelectedValue & "','" & TxtJenisBuku.Text & "'"
                    SQLInsert(x)
                    MsgBox("Data berhasil di Update :)", vbInformation, "Perhatian")
                    btnCancel_Click(btnCancel, Nothing)
                End If
            Else
                Dim x As String = "exec spMjenisBuku 'cek',0,'" & TxtJenisBuku.Text & "'"
                If CekExistsData(x) = 1 Then
                    MsgBox("Jenis Buku tersebut sudah digunakan!", vbExclamation, "WOI")
                Else
                    x = "exec spMjenisBuku 'add',0,'" & TxtJenisBuku.Text & "'"
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
        CmbJenisBuku.Enabled = True
        TxtJenisBuku.Clear()
        TxtJenisBuku.Focus()
        LoadDatajenisbuku()
        AddCombobox()
    End Sub

    Private Sub btnHapus_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnHapus.Click
        Dim x As String = "exec spMjenisBuku 'del','" & CmbJenisBuku.SelectedValue & "','" & TxtJenisBuku.Text & "'"
        SQLInsert(x)
        MsgBox("Data berhasil dihapus :)", vbInformation, "Perhatian")
        btnCancel_Click(btnCancel, Nothing)
    End Sub
End Class