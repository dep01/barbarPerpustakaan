Public Class GantiPassword
    Dim nPass As String
    Private Sub GantiPassword_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        lblPass.Text = "Masukan Password Lama"
    End Sub

    Private Sub txtPass_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles txtPass.KeyDown
        If e.KeyCode = Keys.Enter Then
            Dim x As String
            If lblPass.Text = "Masukan Password Lama" Then
                x = "exec spMuser 'CPass'," & vNIK & ",'iduser','" & txtPass.Text & "',1"
                If GantiPass(x) = 1 Then
                    lblPass.Text = "Masukan Password Baru"
                    txtPass.Clear()
                    txtPass.Focus()
                Else
                    MsgBox("Password yang anda masukan salah!!", vbExclamation, "WOI")
                End If
            Else
                x = "exec spMuser 'UPass'," & vNIK & ",'iduser','" & txtPass.Text & "',1"
                Call SQLInsert(x)
                MsgBox("Silahkan ulang dan pakai password baru", vbInformation, "Perhatian")
                Dim frm As New Login
                frm.Show()
                MenuUtama.Close()
                Me.Close()
            End If
        End If
    End Sub

    Private Sub txtPass_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtPass.TextChanged

    End Sub
End Class