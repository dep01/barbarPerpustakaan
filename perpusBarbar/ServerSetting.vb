Imports System.IO

Public Class ServerSetting
    Dim strFile As String = String.Format(My.Application.Info.DirectoryPath & "\SettingServer.dep")
    Private Sub ServerSetting_Activated(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Activated
        Call cekServer()
    End Sub

    Public Sub SaveSetting()
        If File.Exists(strFile) Then File.Delete(strFile)
        IO.File.AppendAllText(strFile, "" & TextBox1.Text & "" & vbCrLf &
                              "" & TextBox2.Text & "" & vbCrLf &
                              "" & TextBox3.Text & "" & vbCrLf &
                              "" & TextBox4.Text & "")
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Call SaveSetting()
        MsgBox("Aplikasi akan ditutup setelah setting server,Silahkan buka Aplikasi kembali", vbInformation, "Perhatian")
        Application.Exit()
    End Sub

    Private Sub ServerSetting_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub
End Class