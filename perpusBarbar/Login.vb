Imports System.Linq
Public Class Login
    Dim hitung As Integer
    Public Sub kuncimenuXplore()

        For Each header As ToolStripMenuItem In MenuUtama.MenuStrip1.Items
            header.Visible = False

            For Each Menu1 In header.DropDownItems.OfType(Of ToolStripMenuItem)()

                Menu1.Visible = False

                For Each menu2 In Menu1.DropDownItems.OfType(Of ToolStripMenuItem)()

                    menu2.Visible = False

                    For Each menu3 In menu2.DropDownItems.OfType(Of ToolStripMenuItem)()

                        menu3.Visible = False
                        'For Each menu4 In menu3.DropDownItems.OfType(Of ToolStripMenuItem)()

                        '    menu4.Visible = False
                        'Next
                    Next
                Next
            Next

        Next
    End Sub
    Private Sub bukamenu()
        For Each header As ToolStripMenuItem In MenuUtama.MenuStrip1.Items
            header.Visible = True

            For Each Menu1 In header.DropDownItems.OfType(Of ToolStripMenuItem)()

                Menu1.Visible = True

                For Each menu2 In Menu1.DropDownItems.OfType(Of ToolStripMenuItem)()

                    menu2.Visible = True

                    For Each menu3 In menu2.DropDownItems.OfType(Of ToolStripMenuItem)()

                        menu3.Visible = True
                    Next
                Next
            Next

        Next
    End Sub
   
    Private Sub Login_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.GroupBox3.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        Me.GroupBox3.BackgroundImageLayout = ImageLayout.Stretch
        user.Text = "lope12"
        pass.Text = "langsungenter"
    End Sub

    Private Sub OK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK.Click
        Dim sql As String = "exec spMuser 'login','nik','" & user.Text & "','" & pass.Text & "','0'"
        cekLogin(sql)
        dr.Read()
        If dr.HasRows Then
            If dr("status") = 9 Then
                MsgBox("Petugas tersebut sudah tidak aktif!", vbInformation, "Informasi")
            Else
                Dim x As String = "exec spMstatusUser 'status',0,'" & user.Text & "'"
                Call CekUserStatus(x)
                MenuUtama.StatusStrip1.Items.Clear()
                MenuUtama.StatusStrip1.Items.Add("NIK  : " & vNIK & "    ").Font = New Font("Microsoft sans serif", 8.25, FontStyle.Bold)
                MenuUtama.StatusStrip1.Items.Add("Nama Petugas : " & vNamaUser & "    ").Font = New Font("Microsoft sans serif", 8.25, FontStyle.Bold)
                MenuUtama.StatusStrip1.Items.Add("Status  : " & vStatusUser & "    ").Font = New Font("Microsoft sans serif", 8.25, FontStyle.Bold)
                If vIdStatus <> 1 Then
                    Call kuncimenuXplore()
                    Call HakAksesMenu("exec sptblHakakses 'get',0," & vIdStatus & ",'menu','submenu'")
                Else
                    Call bukamenu()
                End If
                MenuUtama.Show()
                Me.Close()
            End If

        Else
            MsgBox("Username dan Password Salah")
            hitung = hitung + 1
            If hitung = 3 Then
                Application.Exit()
            End If
        End If
    End Sub

    Private Sub Cancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel.Click
        If MessageBox.Show("yakin ingin membatalkan login?", "konfirmasi", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = Windows.Forms.DialogResult.Yes Then
            Application.Exit()
        End If
    End Sub
End Class