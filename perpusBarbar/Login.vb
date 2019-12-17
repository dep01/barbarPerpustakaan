Imports System.Data.OleDb
Imports System.Data.SqlClient
Public Class Login
    Dim hitung As Integer
    Private Sub Login_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
    End Sub
    Private Sub Cancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel.Click
        If MessageBox.Show("Yakin Ingin Membatalkan Login?", "Konfirmasi", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = Windows.Forms.DialogResult.Yes Then
            Me.Close()
        End If
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
            Me.Visible = False
            MenuUtama.Show()
        Else
            MsgBox("Password Salah")
            hitung = hitung + 1
            If hitung = 1 Then
                End
            End If
        End If
    End Sub
End Class