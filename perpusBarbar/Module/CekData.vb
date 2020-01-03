Imports System.Data.SqlClient
Module CekData
    Public Function CekExistsData(ByVal strQuery)
        Dim x As Integer = 0
        Call koneksi()
        cmd = New SqlCommand(strQuery, conn)
        dr = cmd.ExecuteReader
        dr.Read()
        If dr.HasRows Then
            x = 1
        End If
        Return x
    End Function
    Public Sub cekLogin(ByVal strQuery)
        Call koneksi()
        cmd = New SqlCommand(strQuery, conn)
        dr = cmd.ExecuteReader
    End Sub

End Module
