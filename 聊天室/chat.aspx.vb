
Partial Class chat
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("se_name") = "" Then
            Response.Redirect("chatlogin.aspx")
        End If
        If Not IsPostBack Then
            '下面几句返回来访者信息
            Dim sayStr As String
            sayStr = "来自" & Request.ServerVariables("Remote_Addr") & "的"   '来访者IP地址
            sayStr = sayStr & "<b>" & Session("se_name") & "</b>"              '来访者昵称 
            sayStr = sayStr & "于" & Now.ToLongTimeString & "大驾光临"                      '来访时间
            sayStr = "<font color='red'>" & sayStr & "</font>"                 '红色显示


            '下面几句将来访信息保存到Application中
            Application.Lock()                                                 '先锁定
            Application("show") = sayStr & "<br>" & Application("show")        '返回聊天信息
            Application("user_online") = CInt(Application("user_online")) + 1        '在线人数加1	Application.Unlock                                          '解除锁定
            Application.UnLock()                                                 '先锁定
        End If
    End Sub
End Class
