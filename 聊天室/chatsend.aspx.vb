
Partial Class chatdisplay
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Dim i As Integer
        For i = 0 To 20
            RBbq.Items.Add("<img src='images/" + i.ToString + ".gif' />")
            '  RBbq.Items(i).Value = "[img" + i.ToString + ".gif]"
            RBbq.Items(i).Value = i.ToString
        Next
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblname.Text = Session("se_name")
    End Sub

    Protected Sub Btnsend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btnsend.Click
        If txtsay.Text <> "" Then
            '获取发言的有关信息
            Dim say, mycolor, myemote, user_name As String          '声明变量待用
            user_name = lblname.Text
            say = Server.HtmlEncode(txtsay.Text)                    '返回发言，并用HtmlEncode编码
            mycolor = drdcolor.SelectedValue                        '返回本次发言的颜色
            myemote = drdmotion.SelectedValue                       '返回本次发言表情
            If myemote = "无" Then
                myemote = ""
            End If
            Dim myemotepic As String
            If (RBbq.SelectedIndex <> -1) Then
                myemotepic = "<img src='images/" + RBbq.SelectedIndex.ToString + ".gif' />"
            Else
                myemotepic = ""
            End If
            '下面三句将得到本次发言的字符串
            Dim sayStr As String
            sayStr = "<small>" & user_name & "在" & Now.ToLongTimeString & myemote & "说：</small>"
            sayStr = sayStr & "<font color='" & mycolor & "'>" & say & "</font>" & myemotepic
            '下面几句将本次发言信息保存到Application中
            Application.Lock()
            Application("show") = sayStr & "<br>" & Application("show")
            If Len(Application("show")) > 10000 Then                 '如果发言总长度超过10000个字符，则截断为10000
                Application("show") = Mid(Application("show"), 1, 10000)
            End If
            Application.UnLock()
            txtsay.Text = ""                                          '将发言框清空
        End If

    End Sub

    Protected Sub drdcolor_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drdcolor.SelectedIndexChanged
        'Response.Write(drdcolor.SelectedItem.Text)
        Select Case drdcolor.SelectedItem.Text
            Case "红色"
                drdcolor.ForeColor = Drawing.Color.Red
            Case "蓝色"
                drdcolor.ForeColor = Drawing.Color.Blue
            Case "黄色"
                drdcolor.ForeColor = Drawing.Color.Yellow
            Case "绿色"
                drdcolor.ForeColor = Drawing.Color.Green
            Case Else
                drdcolor.ForeColor = Drawing.Color.Black
        End Select
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Application.Lock()                          '先锁定
        Application("show") = ""
        Application.UnLock()                        '先锁定
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        'Response.Redirect("chatexit.aspx")                                  '重定向回首页
        Response.Write("<script>window.parent.location.href='chatexit.aspx'</script>")
    End Sub
End Class
