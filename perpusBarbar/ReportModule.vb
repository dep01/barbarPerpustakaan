Imports System.Data.SqlClient

Module ReportModule
    Public dtReport As DataTable
    Public Sub dataReport(ByVal strQuery)
        dtReport = New DataTable
        Try
            Call koneksi()
            da = New SqlDataAdapter(strQuery, conn)
            da.Fill(dtReport)
        Catch ex As Exception
            MsgBox(ex.Message & Err.Number)
        End Try
    End Sub
End Module
