
Partial Class chatexit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '下面几句返回离开者信息
        Dim sayStr
        sayStr = "来自" & Request.ServerVariables("Remote_Addr") & "的"      '来访者IP地址
        sayStr = sayStr & "<b>" & Session("se_name") & "</b>"                '来访者昵称 
        sayStr = sayStr & "于" & Now.ToLongTimeString & "高兴而去"           '离开时间
        sayStr = "<font color='blue'>" & sayStr & "</font>"                  '红色显示
        '下面几句将来访信息保存到application中
        Application.Lock()                                                   '先锁定
        Application("show") = sayStr & "<br>" & Application("show")
        Application("user_online") = CInt(Application("user_online")) - 1          '在线人数减1
        Application.UnLock()                                                 '解除锁定
        Response.Redirect("chatlogin.aspx")                                  '重定向回首页

    End Sub
End Class
