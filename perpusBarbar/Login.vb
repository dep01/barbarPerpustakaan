Imports System.Data.SqlClient
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
    Private Sub HakAksesMenu()
        Call koneksi()
        Dim x As String = "exec sptblHakakses 'get',0," & vIdStatus & ",'menu','submenu'"
        cmd = New SqlCommand(x, conn)
        dr = cmd.ExecuteReader

        Do While dr.Read()
            For Each header As ToolStripMenuItem In MenuUtama.MenuStrip1.Items
                If header.Text = dr.Item(2) Then
                    header.Visible = True
                End If
                For Each Menu1 In header.DropDownItems.OfType(Of ToolStripMenuItem)()

                    If Menu1.Text = dr.Item(3) Then
                        header.Visible = True
                        Menu1.Visible = True

                    End If

                    For Each menu2 As ToolStripMenuItem In Menu1.DropDownItems
                        If menu2.Text = dr.Item(3) And Menu1.Text = dr.Item(2) Then
                            header.Visible = True
                            Menu1.Visible = True
                            menu2.Visible = True
                        End If

                        For Each menu3 As ToolStripMenuItem In menu2.DropDownItems
                            If menu3.Text = dr.Item(3) And menu2.Text = dr.Item(2) Then
                                header.Visible = True
                                Menu1.Visible = True
                                menu2.Visible = True
                                menu3.Visible = True
                            End If
                        Next
                    Next
                Next
            Next
        Loop

    End Sub
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
            Dim x As String = "exec spMstatusUser 'status',0,'" & user.Text & "'"
            Call CekUserStatus(x)
            MenuUtama.StatusStrip1.Items.Clear()
            MenuUtama.StatusStrip1.Items.Add("NIK  : " & vNIK & "    ").Font = New Font("Microsoft sans serif", 8.25, FontStyle.Bold)
            MenuUtama.StatusStrip1.Items.Add("Nama Petugas : " & vNamaUser & "    ").Font = New Font("Microsoft sans serif", 8.25, FontStyle.Bold)
            MenuUtama.StatusStrip1.Items.Add("Status  : " & vStatusUser & "    ").Font = New Font("Microsoft sans serif", 8.25, FontStyle.Bold)
            If vIdStatus <> 1 Then
                Call kuncimenuXplore()
                Call HakAksesMenu()
            Else
                Call bukamenu()
            End If
            MenuUtama.Show()
            Me.Close()
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