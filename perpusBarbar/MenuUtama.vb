Public Class MenuUtama

    Private Sub MenuUtama_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        Me.BackgroundImageLayout = ImageLayout.Stretch
    End Sub

    Private Sub LogOutToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Dim frmLogin As New Login
        frmLogin.Show()
        Me.Hide()
    End Sub

    Private Sub HakAksesToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles HakAksesToolStripMenuItem.Click
        HakAksesFrm.ShowDialog()
    End Sub

    Private Sub ToolStripStatusLabel1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub
End Class