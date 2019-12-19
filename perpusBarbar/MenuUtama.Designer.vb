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
        Me.MasterToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.GantiPasswordToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.LogOutToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MasterToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.BukuToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AnggotaToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PetugasToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AddUserToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PeminjamanToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PengembalianToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'MenuStrip1
        '
        Me.MenuStrip1.BackColor = System.Drawing.Color.Transparent
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.MasterToolStripMenuItem, Me.MasterToolStripMenuItem1, Me.PeminjamanToolStripMenuItem, Me.PengembalianToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(795, 24)
        Me.MenuStrip1.TabIndex = 0
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'MasterToolStripMenuItem
        '
        Me.MasterToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.GantiPasswordToolStripMenuItem, Me.LogOutToolStripMenuItem})
        Me.MasterToolStripMenuItem.Name = "MasterToolStripMenuItem"
        Me.MasterToolStripMenuItem.Size = New System.Drawing.Size(42, 20)
        Me.MasterToolStripMenuItem.Text = "User"
        '
        'GantiPasswordToolStripMenuItem
        '
        Me.GantiPasswordToolStripMenuItem.Name = "GantiPasswordToolStripMenuItem"
        Me.GantiPasswordToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.GantiPasswordToolStripMenuItem.Text = "Akun"
        '
        'LogOutToolStripMenuItem
        '
        Me.LogOutToolStripMenuItem.Name = "LogOutToolStripMenuItem"
        Me.LogOutToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.LogOutToolStripMenuItem.Text = "Log Out"
        '
        'MasterToolStripMenuItem1
        '
        Me.MasterToolStripMenuItem1.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BukuToolStripMenuItem, Me.AnggotaToolStripMenuItem, Me.PetugasToolStripMenuItem, Me.AddUserToolStripMenuItem})
        Me.MasterToolStripMenuItem1.Name = "MasterToolStripMenuItem1"
        Me.MasterToolStripMenuItem1.Size = New System.Drawing.Size(55, 20)
        Me.MasterToolStripMenuItem1.Text = "Master"
        '
        'BukuToolStripMenuItem
        '
        Me.BukuToolStripMenuItem.Name = "BukuToolStripMenuItem"
        Me.BukuToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.BukuToolStripMenuItem.Text = "Buku"
        '
        'AnggotaToolStripMenuItem
        '
        Me.AnggotaToolStripMenuItem.Name = "AnggotaToolStripMenuItem"
        Me.AnggotaToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.AnggotaToolStripMenuItem.Text = "Anggota"
        '
        'PetugasToolStripMenuItem
        '
        Me.PetugasToolStripMenuItem.Name = "PetugasToolStripMenuItem"
        Me.PetugasToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.PetugasToolStripMenuItem.Text = "Petugas"
        '
        'AddUserToolStripMenuItem
        '
        Me.AddUserToolStripMenuItem.Name = "AddUserToolStripMenuItem"
        Me.AddUserToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.AddUserToolStripMenuItem.Text = "Add User"
        '
        'PeminjamanToolStripMenuItem
        '
        Me.PeminjamanToolStripMenuItem.Name = "PeminjamanToolStripMenuItem"
        Me.PeminjamanToolStripMenuItem.Size = New System.Drawing.Size(86, 20)
        Me.PeminjamanToolStripMenuItem.Text = "Peminjaman"
        '
        'PengembalianToolStripMenuItem
        '
        Me.PengembalianToolStripMenuItem.Name = "PengembalianToolStripMenuItem"
        Me.PengembalianToolStripMenuItem.Size = New System.Drawing.Size(95, 20)
        Me.PengembalianToolStripMenuItem.Text = "Pengembalian"
        '
        'MenuUtama
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(795, 505)
        Me.Controls.Add(Me.MenuStrip1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "MenuUtama"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "MenuUtama Perpus BarBar"
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents MasterToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents GantiPasswordToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents LogOutToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MasterToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents BukuToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AnggotaToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PetugasToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AddUserToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PeminjamanToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PengembalianToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
End Class
