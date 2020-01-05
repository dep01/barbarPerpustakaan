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

    Private Sub LogOutToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles LogOutToolStripMenuItem1.Click
        Dim frm As New Login
        frm.Show()
        Me.Close()
    End Sub



    Private Sub AkunToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AkunToolStripMenuItem.Click
        Dim frm As New GantiPassword
        frm.ShowDialog()
    End Sub

    Private Sub AddUserToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AddUserToolStripMenuItem1.Click
        Dim frm As New User
        frm.ShowDialog()
    End Sub

    Private Sub MasterPenerbitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MasterPenerbitToolStripMenuItem.Click
        Dim frm As New Penerbit
        frm.ShowDialog()
    End Sub

    Private Sub MasterJenisBukuToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MasterJenisBukuToolStripMenuItem.Click
        Dim frm As New JenisBuku
        frm.ShowDialog()
    End Sub


    Private Sub MasterRakBukuToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MasterRakBukuToolStripMenuItem.Click
        Dim frm As New RakBuku
        frm.ShowDialog()
    End Sub

    Private Sub MasterBukuToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MasterBukuToolStripMenuItem.Click
        Dim frm As New Buku
        frm.ShowDialog()
    End Sub

    Private Sub JumlahBukuToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles JumlahBukuToolStripMenuItem.Click
        Dim frm As New LokasidanJumlah
        frm.ShowDialog()
    End Sub

    Private Sub PetugasToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PetugasToolStripMenuItem1.Click
        Dim frm As New Petugas
        frm.ShowDialog()
    End Sub

    Private Sub AnggotaToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AnggotaToolStripMenuItem1.Click
        Dim frm As New Anggota
        frm.ShowDialog()
    End Sub

    Private Sub PeminjamanToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PeminjamanToolStripMenuItem1.Click
        Dim frm As New Peminjaman
        frm.ShowDialog()
    End Sub

    Private Sub PengembalianToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PengembalianToolStripMenuItem1.Click
        Dim frm As New Pengembalian
        frm.ShowDialog()
    End Sub

    Private Sub HarianToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles HarianToolStripMenuItem.Click
        Dim frm As New Laporan
        frm.DTAkhir.Enabled = False
        frm.DTmulai.Enabled = False
        frm.ShowDialog()

    End Sub

    Private Sub PerToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PerToolStripMenuItem.Click
        Dim frm As New Laporan
        frm.DTAkhir.Enabled = True
        frm.DTmulai.Enabled = True
        frm.ShowDialog()
    End Sub
End Class