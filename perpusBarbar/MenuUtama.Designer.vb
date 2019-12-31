<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class MenuUtama
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.UserToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AkunToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.LogOutToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.MasterToolStripMenuItem2 = New System.Windows.Forms.ToolStripMenuItem()
        Me.BukuToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.MasterBukuToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MasterPenerbitToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MasterJenisBukuToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MasterRakBukuToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.JumlahBukuToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PetugasToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.AnggotaToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.AddUserToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.HakAksesToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PeminjamanToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.PengembalianToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.LaporanToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.HarianToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PerToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip()
        Me.MenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'MenuStrip1
        '
        Me.MenuStrip1.BackColor = System.Drawing.Color.Transparent
        Me.MenuStrip1.Font = New System.Drawing.Font("Calibri", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.UserToolStripMenuItem, Me.MasterToolStripMenuItem2, Me.PeminjamanToolStripMenuItem1, Me.PengembalianToolStripMenuItem1, Me.LaporanToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Padding = New System.Windows.Forms.Padding(8, 3, 0, 3)
        Me.MenuStrip1.Size = New System.Drawing.Size(795, 29)
        Me.MenuStrip1.TabIndex = 1
        Me.MenuStrip1.Text = "MenuStrip2"
        '
        'UserToolStripMenuItem
        '
        Me.UserToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AkunToolStripMenuItem, Me.LogOutToolStripMenuItem1})
        Me.UserToolStripMenuItem.Name = "UserToolStripMenuItem"
        Me.UserToolStripMenuItem.Size = New System.Drawing.Size(57, 23)
        Me.UserToolStripMenuItem.Text = "Akun"
        '
        'AkunToolStripMenuItem
        '
        Me.AkunToolStripMenuItem.Name = "AkunToolStripMenuItem"
        Me.AkunToolStripMenuItem.Size = New System.Drawing.Size(183, 24)
        Me.AkunToolStripMenuItem.Text = "Ganti Password"
        '
        'LogOutToolStripMenuItem1
        '
        Me.LogOutToolStripMenuItem1.Name = "LogOutToolStripMenuItem1"
        Me.LogOutToolStripMenuItem1.Size = New System.Drawing.Size(183, 24)
        Me.LogOutToolStripMenuItem1.Text = "Log Out"
        '
        'MasterToolStripMenuItem2
        '
        Me.MasterToolStripMenuItem2.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BukuToolStripMenuItem1, Me.PetugasToolStripMenuItem1, Me.AnggotaToolStripMenuItem1, Me.AddUserToolStripMenuItem1, Me.HakAksesToolStripMenuItem})
        Me.MasterToolStripMenuItem2.Name = "MasterToolStripMenuItem2"
        Me.MasterToolStripMenuItem2.Size = New System.Drawing.Size(69, 23)
        Me.MasterToolStripMenuItem2.Text = "Master"
        '
        'BukuToolStripMenuItem1
        '
        Me.BukuToolStripMenuItem1.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.MasterBukuToolStripMenuItem, Me.MasterPenerbitToolStripMenuItem, Me.MasterJenisBukuToolStripMenuItem, Me.MasterRakBukuToolStripMenuItem, Me.JumlahBukuToolStripMenuItem})
        Me.BukuToolStripMenuItem1.Name = "BukuToolStripMenuItem1"
        Me.BukuToolStripMenuItem1.Size = New System.Drawing.Size(152, 24)
        Me.BukuToolStripMenuItem1.Text = "Buku"
        '
        'MasterBukuToolStripMenuItem
        '
        Me.MasterBukuToolStripMenuItem.Name = "MasterBukuToolStripMenuItem"
        Me.MasterBukuToolStripMenuItem.Size = New System.Drawing.Size(203, 24)
        Me.MasterBukuToolStripMenuItem.Text = "Master Buku"
        '
        'MasterPenerbitToolStripMenuItem
        '
        Me.MasterPenerbitToolStripMenuItem.Name = "MasterPenerbitToolStripMenuItem"
        Me.MasterPenerbitToolStripMenuItem.Size = New System.Drawing.Size(203, 24)
        Me.MasterPenerbitToolStripMenuItem.Text = "Master Penerbit"
        '
        'MasterJenisBukuToolStripMenuItem
        '
        Me.MasterJenisBukuToolStripMenuItem.Name = "MasterJenisBukuToolStripMenuItem"
        Me.MasterJenisBukuToolStripMenuItem.Size = New System.Drawing.Size(203, 24)
        Me.MasterJenisBukuToolStripMenuItem.Text = "Master Jenis Buku"
        '
        'MasterRakBukuToolStripMenuItem
        '
        Me.MasterRakBukuToolStripMenuItem.Name = "MasterRakBukuToolStripMenuItem"
        Me.MasterRakBukuToolStripMenuItem.Size = New System.Drawing.Size(203, 24)
        Me.MasterRakBukuToolStripMenuItem.Text = "Master Rak Buku"
        '
        'JumlahBukuToolStripMenuItem
        '
        Me.JumlahBukuToolStripMenuItem.Name = "JumlahBukuToolStripMenuItem"
        Me.JumlahBukuToolStripMenuItem.Size = New System.Drawing.Size(203, 24)
        Me.JumlahBukuToolStripMenuItem.Text = "Input Buku Masuk"
        '
        'PetugasToolStripMenuItem1
        '
        Me.PetugasToolStripMenuItem1.Name = "PetugasToolStripMenuItem1"
        Me.PetugasToolStripMenuItem1.Size = New System.Drawing.Size(152, 24)
        Me.PetugasToolStripMenuItem1.Text = "Petugas"
        '
        'AnggotaToolStripMenuItem1
        '
        Me.AnggotaToolStripMenuItem1.Name = "AnggotaToolStripMenuItem1"
        Me.AnggotaToolStripMenuItem1.Size = New System.Drawing.Size(152, 24)
        Me.AnggotaToolStripMenuItem1.Text = "Anggota"
        '
        'AddUserToolStripMenuItem1
        '
        Me.AddUserToolStripMenuItem1.Name = "AddUserToolStripMenuItem1"
        Me.AddUserToolStripMenuItem1.Size = New System.Drawing.Size(152, 24)
        Me.AddUserToolStripMenuItem1.Text = "User"
        '
        'HakAksesToolStripMenuItem
        '
        Me.HakAksesToolStripMenuItem.Name = "HakAksesToolStripMenuItem"
        Me.HakAksesToolStripMenuItem.Size = New System.Drawing.Size(152, 24)
        Me.HakAksesToolStripMenuItem.Text = "Hak Akses"
        '
        'PeminjamanToolStripMenuItem1
        '
        Me.PeminjamanToolStripMenuItem1.Name = "PeminjamanToolStripMenuItem1"
        Me.PeminjamanToolStripMenuItem1.Size = New System.Drawing.Size(106, 23)
        Me.PeminjamanToolStripMenuItem1.Text = "Peminjaman"
        '
        'PengembalianToolStripMenuItem1
        '
        Me.PengembalianToolStripMenuItem1.Name = "PengembalianToolStripMenuItem1"
        Me.PengembalianToolStripMenuItem1.Size = New System.Drawing.Size(118, 23)
        Me.PengembalianToolStripMenuItem1.Text = "Pengembalian"
        '
        'LaporanToolStripMenuItem
        '
        Me.LaporanToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.HarianToolStripMenuItem, Me.PerToolStripMenuItem})
        Me.LaporanToolStripMenuItem.Name = "LaporanToolStripMenuItem"
        Me.LaporanToolStripMenuItem.Size = New System.Drawing.Size(77, 23)
        Me.LaporanToolStripMenuItem.Text = "Laporan"
        '
        'HarianToolStripMenuItem
        '
        Me.HarianToolStripMenuItem.Name = "HarianToolStripMenuItem"
        Me.HarianToolStripMenuItem.Size = New System.Drawing.Size(152, 24)
        Me.HarianToolStripMenuItem.Text = "Harian"
        '
        'PerToolStripMenuItem
        '
        Me.PerToolStripMenuItem.Name = "PerToolStripMenuItem"
        Me.PerToolStripMenuItem.Size = New System.Drawing.Size(152, 24)
        Me.PerToolStripMenuItem.Text = "Pertanggal"
        '
        'StatusStrip1
        '
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 483)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.Size = New System.Drawing.Size(795, 22)
        Me.StatusStrip1.TabIndex = 2
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'MenuUtama
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(795, 505)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Controls.Add(Me.MenuStrip1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.Name = "MenuUtama"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "MenuUtama Perpus BarBar"
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents UserToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AkunToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents LogOutToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MasterToolStripMenuItem2 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents BukuToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PetugasToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AnggotaToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AddUserToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents HakAksesToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PeminjamanToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PengembalianToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents MasterBukuToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MasterPenerbitToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MasterJenisBukuToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MasterRakBukuToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents LaporanToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents HarianToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PerToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents JumlahBukuToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
End Class
