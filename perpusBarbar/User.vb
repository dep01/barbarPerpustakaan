Public Class User
    Dim x As String = "exec spMuser 'get','nik','iduser','pass','0'"
    Dim y As String = "exec spMuser 'getCB','nik','iduser','pass','0'"
    Private Sub AddComboboxStatus()
        Dim Sql As String = "exec spMstatusUser 'getAll','0','jenisuser'"
        Call FillCombobox(Sql)
        With cmbStatUser
            .DataSource = dt
            .ValueMember = "idStatusUser"
            .DisplayMember = "JenisUser"
        End With
    End Sub

    Private Sub AddComboboxNik(ByVal strQuery)
        Call FillCombobox(strQuery)
        With cmbNik
            .DataSource = dt
            .ValueMember = "NIK"
            .DisplayMember = "NIK"
        End With
    End Sub
    Private Sub AddComboboxFilter()
        cmbFilter.Items.Clear()
        cmbFilter.Items.Add("All")
        cmbFilter.Items.Add("NIK")
        cmbFilter.Items.Add("Username")
        cmbFilter.Text = "All"
    End Sub

    Private Sub LoadDataUser(ByVal strQuery)
        Call FillDgv(strQuery)
        Me.DGVuser.DataSource = (ds.Tables(0))
        Me.DGVuser.AllowUserToAddRows = False
        Me.DGVuser.AllowUserToDeleteRows = False
        Me.DGVuser.Columns(4).Visible = False
        Me.DGVuser.ReadOnly = True

    End Sub
    Private Sub btnTambah_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnTambah.Click
        If btnTambah.Text = "Tambah" Then
            btnCancel_Click(btnCancel, Nothing)
            txtPass.UseSystemPasswordChar = False
            btnTambah.Text = "Update"
            AddComboboxNik(y)
            cmbNik.Enabled = True
            DGVuser.Enabled = False
            txtUser.Enabled = True
            txtPass.Enabled = True
        Else
            btnCancel_Click(btnCancel, Nothing)
            btnTambah.Text = "Tambah"
            cmbNik.Enabled = False
            txtUser.Enabled = False
            txtPass.Enabled = False
            DGVuser.Enabled = True
            AddComboboxNik(x)
        End If
    End Sub

    Private Sub User_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        Me.BackgroundImageLayout = ImageLayout.Stretch
        cmbNik.Enabled = False
        LoadDataUser(x)
        AddComboboxStatus()
        AddComboboxFilter()
        AddComboboxNIK(x)
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        btnTambah.Text = "Tambah"
        cmbNik.Enabled = False
        DGVuser.Enabled = True
        txtPass.Enabled = False
        txtUser.Enabled = False
        txtFilter.Text = ""
        txtPass.Text = ""
        txtUser.Text = ""
        LoadDataUser(x)
        AddComboboxStatus()
        AddComboboxNik(x)
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If txtUser.Text = "" Or txtPass.Text = "" Or cmbNik.Text = "" Or cmbStatUser.Text = "" Then
            MsgBox("Lengkapi semua data!!!", vbExclamation, "WOI")
        Else
            Dim sql As String = "exec spMuser 'upd','" & cmbNik.SelectedValue & "','iduser','pass','" & cmbStatUser.SelectedValue & "'"
            If btnTambah.Text = "Tambah" Then
                SQLInsert(sql)
                MsgBox("Data berhasil di Update :)", vbInformation, "Perhatian")
                btnCancel_Click(btnCancel, Nothing)

            Else
                sql = "exec spMuser 'cek','x','" & txtUser.Text & "','pass','0'"
                If CekExistsData(sql) = 1 Then
                    MsgBox("Username sudah digunakan!", vbExclamation, "Perhatian")
                Else
                    sql = "exec spMuser 'add','" & cmbNik.SelectedValue & "','" & txtUser.Text & "','" & txtPass.Text & "','" & cmbStatUser.SelectedValue & "'"
                    SQLInsert(sql)
                    MsgBox("Data berhasil di Simpan :)", vbInformation, "Perhatian")
                    btnCancel_Click(btnCancel, Nothing)
                End If
  

            End If
        End If
    End Sub
    Private Sub DGVuser_CellMouseClick(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles DGVuser.CellMouseClick
        Try
            txtPass.UseSystemPasswordChar = True
            cmbNik.Text = DGVuser.CurrentRow.Cells(0).Value
            txtUser.Text = DGVuser.CurrentRow.Cells(2).Value
            cmbStatUser.Text = DGVuser.CurrentRow.Cells(3).Value
            txtPass.Text = DGVuser.CurrentRow.Cells(4).Value
        Catch ex As Exception

        End Try
    End Sub
End Class