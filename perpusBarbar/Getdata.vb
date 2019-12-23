Imports System.Data.SqlClient
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



End Module
