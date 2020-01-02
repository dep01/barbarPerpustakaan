Imports System.Data.SqlClient


Module Insertdata
    Public Function SQLInsert(ByVal strQuery)
        Dim x As Integer
        Try
            Call koneksi()
            cmd = New SqlCommand(strQuery, conn)
            cmd.ExecuteNonQuery()
            x = 1
        Catch ex As Exception
            MsgBox(ex.Message)
            x = 0
        End Try
        Return x
    End Function
End Module
