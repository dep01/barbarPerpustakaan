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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(MenuUtama))
        Me.GroupBox = New System.Windows.Forms.GroupBox()
        Me.btnanggota = New System.Windows.Forms.Button()
        Me.btnbuku = New System.Windows.Forms.Button()
        Me.btnpinjam = New System.Windows.Forms.Button()
        Me.btnkembali = New System.Windows.Forms.Button()
        Me.GroupBox.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupBox
        '
        Me.GroupBox.Controls.Add(Me.btnkembali)
        Me.GroupBox.Controls.Add(Me.btnpinjam)
        Me.GroupBox.Controls.Add(Me.btnbuku)
        Me.GroupBox.Controls.Add(Me.btnanggota)
        Me.GroupBox.Location = New System.Drawing.Point(13, 13)
        Me.GroupBox.Name = "GroupBox"
        Me.GroupBox.Size = New System.Drawing.Size(390, 138)
        Me.GroupBox.TabIndex = 0
        Me.GroupBox.TabStop = False
        Me.GroupBox.Text = "Group Box"
        '
        'btnanggota
        '
        Me.btnanggota.Image = CType(resources.GetObject("btnanggota.Image"), System.Drawing.Image)
        Me.btnanggota.Location = New System.Drawing.Point(0, 46)
        Me.btnanggota.Name = "btnanggota"
        Me.btnanggota.Size = New System.Drawing.Size(83, 86)
        Me.btnanggota.TabIndex = 0
        Me.btnanggota.Text = "Anggota"
        Me.btnanggota.UseVisualStyleBackColor = True
        '
        'btnbuku
        '
        Me.btnbuku.ImageAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnbuku.Location = New System.Drawing.Point(89, 46)
        Me.btnbuku.Name = "btnbuku"
        Me.btnbuku.Size = New System.Drawing.Size(83, 86)
        Me.btnbuku.TabIndex = 1
        Me.btnbuku.Text = "Buku"
        Me.btnbuku.UseVisualStyleBackColor = True
        '
        'btnpinjam
        '
        Me.btnpinjam.Location = New System.Drawing.Point(178, 46)
        Me.btnpinjam.Name = "btnpinjam"
        Me.btnpinjam.Size = New System.Drawing.Size(83, 86)
        Me.btnpinjam.TabIndex = 2
        Me.btnpinjam.Text = "Peminjaman"
        Me.btnpinjam.UseVisualStyleBackColor = True
        '
        'btnkembali
        '
        Me.btnkembali.Location = New System.Drawing.Point(267, 46)
        Me.btnkembali.Name = "btnkembali"
        Me.btnkembali.Size = New System.Drawing.Size(89, 86)
        Me.btnkembali.TabIndex = 3
        Me.btnkembali.Text = "Pengembalian"
        Me.btnkembali.UseVisualStyleBackColor = True
        '
        'MenuUtama
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(613, 261)
        Me.Controls.Add(Me.GroupBox)
        Me.Name = "MenuUtama"
        Me.Text = "MenuUtama Perpus BarBar"
        Me.GroupBox.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GroupBox As System.Windows.Forms.GroupBox
    Friend WithEvents btnkembali As System.Windows.Forms.Button
    Friend WithEvents btnpinjam As System.Windows.Forms.Button
    Friend WithEvents btnbuku As System.Windows.Forms.Button
    Friend WithEvents btnanggota As System.Windows.Forms.Button
End Class
