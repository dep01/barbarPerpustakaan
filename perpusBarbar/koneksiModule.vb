Imports System.Data.SqlClient

Module koneksiModule
    Dim strFile As String = String.Format(My.Application.Info.DirectoryPath & "\SettingServer.dep")
    Dim sLine As String = ""
    Dim arrText As New ArrayList()
    Dim vServer As String
    Dim vDb As String
    Dim vUserDB As String
    Dim vPassDB As String
    Public conn As SqlConnection
    Public da As SqlDataAdapter
    Public ds As DataSet
    Public cmd As SqlCommand
    Public dr As SqlDataReader
    Public strConn As String
    Public Sub koneksi()
        conn = New SqlConnection(strConn)
        conn.Open()
    End Sub
    Public Function cekKoneksi(ByVal S, ByVal D, ByVal U, ByVal P)
        Dim x As Integer
        Try
            If U = "" Then
                strConn = "data source =" & S & "; initial catalog = " & D & "; integrated security = true"
            Else
                strConn = "data source =" & S & "; initial catalog = " & D & "; user = " & U & "; password =" & P & ""
            End If
            Call koneksi()
            x = 1
        Catch ex As Exception
            x = 0
        End Try
        Return x
    End Function
    Public Function cekServer()
        Dim x As Integer
        Dim ds As New DataSet
        Dim dt As New DataTable
        Try
            Dim objReader As New IO.StreamReader(strFile)
            Do
                sLine = objReader.ReadLine()
                If Not sLine Is Nothing Then
                    arrText.Add(sLine)
                End If
            Loop Until sLine Is Nothing
            If arrText.Count > 3 Then
                vServer = arrText.Item(0)
                vDb = arrText.Item(1)
                vUserDB = arrText.Item(2)
                vPassDB = arrText.Item(3)
            Else
                vServer = arrText.Item(0)
                vDb = arrText.Item(1)
                vUserDB = ""
                vPassDB = ""
            End If

            If cekKoneksi(vServer, vDb, vUserDB, vPassDB) = 1 Then
                x = 1
                Login.Show()
                ServerSetting.Hide()
            Else
                x = 0
            End If
            objReader.Close()
        Catch ex As Exception
            If Err.Number = 53 Then
            Else
                MessageBox.Show(ex.Message)
            End If
            x = 0
        End Try
        Return x
    End Function
    
End Module