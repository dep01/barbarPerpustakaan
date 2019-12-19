Public Class MenuUtama

    Private Sub MenuUtama_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        Me.BackgroundImageLayout = ImageLayout.Stretch
    End Sub
End Class