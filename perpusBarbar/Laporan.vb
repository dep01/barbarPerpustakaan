Public Class Laporan
    Dim reportString As String
    Private Sub addComboboxjenis()
        cmbJenis.Items.Clear()
        cmbJenis.Items.Add("PerBuku")
        cmbJenis.Text = "PerBuku"
    End Sub
    Private Sub Laporan_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.BackgroundImage = System.Drawing.Image.FromFile("images.jpg")
        Me.BackgroundImageLayout = ImageLayout.Stretch
        addComboboxjenis()

    End Sub
    Private Sub btnOk_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnOk.Click
        Dim a As String = DTAkhir.Value.Year
        Dim b As String = DTAkhir.Value.Month
        Dim c As String = DTAkhir.Value.Day
        Dim d As String = DTmulai.Value.Year
        Dim g As String = DTmulai.Value.Month
        Dim f As String = DTmulai.Value.Day
        Dim TglAkhir As String = a + "-" + b + "-" + c
        Dim tglAwal As String = d + "-" + g + "-" + f
        reportString = "exec spReport 'PerBuku','" & tglAwal & "','" & TglAkhir & "'"
        dataReport(reportString)
        Dim rpt As New RptPerbuku
        Dim txtTglAwal As CrystalDecisions.CrystalReports.Engine.TextObject
        txtTglAwal = rpt.ReportDefinition.ReportObjects("txtTglAwal")
        txtTglAwal.Text = tglAwal
        Dim txtAkhir As CrystalDecisions.CrystalReports.Engine.TextObject
        txtAkhir = rpt.ReportDefinition.ReportObjects("txtAkhir")
        txtAkhir.Text = TglAkhir
        rpt.SetDataSource(dtReport)
        FrmReporting.CRV.ReportSource = rpt
        FrmReporting.ShowDialog()
    End Sub
End Class