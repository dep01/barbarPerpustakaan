Imports System.Data.SqlClient
Imports System.Linq
Module Getdata
    Public dt As DataTable
    Public Sub FillDgv(ByVal strQuery)
        Try
            Call koneksi()
            da = New SqlDataAdapter(strQuery, conn)
            ds = New DataSet
            da.Fill(ds)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub
    Public Sub FillCombobox(ByVal strQuery)
        Try
            Call koneksi()
            da = New SqlDataAdapter(strQuery, conn)
            dt = New DataTable
            da.Fill(dt)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub
    Public Sub fillComboboxAdd(ByVal strQuery)
        Try
            Call koneksi()
            cmd = New SqlCommand(strQuery, conn)
            dr = cmd.ExecuteReader
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Public Sub HakAksesMenu(ByVal strQuery)
        Call koneksi()
        cmd = New SqlCommand(strQuery, conn)
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



End Module
