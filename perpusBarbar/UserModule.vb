Imports System.Data.SqlClient

Module UserModule
    Public vNIK, vNamaUser, vStatusUser As String
    Public vIdStatus As Integer
    Public Sub CekUserStatus(ByVal strQuery)
        Call koneksi()
        cmd = New SqlCommand(strQuery, conn)
        dr = cmd.ExecuteReader
        dr.Read()
        vNIK = dr.Item(0)
        vStatusUser = dr.Item(1)
        vNamaUser = dr.Item(2)
        vIdStatus = dr.Item(3)
    End Sub

End Module
