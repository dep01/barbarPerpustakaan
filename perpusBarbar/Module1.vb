Imports System.Data.SqlClient
Module Module1
    Public conn As SqlConnection
    Public da As SqlDataAdapter
    Public ds As DataSet
    Public cmd As SqlCommand
    Public dr As SqlDataReader

    Public Sub koneksi()
        conn = New SqlConnection("data source =FARHANF\SQLEXPRESS; initial catalog = dbPerpustakaan; integrated security = true")

        conn.Open()

    End Sub
End Module