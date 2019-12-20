
Imports System.Data.SqlClient
Public Class Login
    Dim hitung As Integer

    Private Sub Login_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.GroupBox3.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        Me.GroupBox3.BackgroundImageLayout = ImageLayout.Stretch
        user.Text = "lope12"
        pass.Text = "langsungenter"
    End Sub

    Private Sub OK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK.Click
        Call koneksi()
        cmd = New SqlCommand("select * from mUser where idUser='" & user.Text & "' and password='" & pass.Text & "'", conn)
        dr = cmd.ExecuteReader
        dr.Read()
        If dr.HasRows Then
            If pass.Text <> dr("password") Then
                MsgBox("Password Salah")
                Exit Sub
            End If
            MenuUtama.Show()
        Else
            MsgBox("Password Salah")
            hitung = hitung + 1
            If hitung = 3 Then
                End
            End If
        End If
    End Sub

    Private Sub Cancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel.Click
        If MessageBox.Show("yakin ingin membatalkan login?", "konfirmasi", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = Windows.Forms.DialogResult.Yes Then
            Application.Exit()
        End If
    End Sub
End Class