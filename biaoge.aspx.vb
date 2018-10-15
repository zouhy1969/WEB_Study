
Partial Class biaoge
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim I, J As Byte
        '显示标题行
        message.Text = "<table width='90%' border='1'><tr bgcolor='#CDCDCD'>"
        For J = 1 To cellNumber.SelectedItem.Value
            message.Text &= "<td>" & "标题行  第 " & J & " 列" & "</td>"
        Next
        message.Text &= "</tr>"
        '利用循环显示每一条记录
        For I = 1 To rowNumber.SelectedItem.Value
            message.Text &= "<tr>"
            For J = 1 To cellNumber.SelectedItem.Value
                message.Text &= "<td>" & "第 " & I & " 行  第 " & J & " 列" & "</td>"
            Next
            message.Text &= "</tr>"
        Next
        message.Text &= "</table>"

    End Sub
End Class
