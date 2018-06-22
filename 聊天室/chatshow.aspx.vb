
Partial Class charshow
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblmsg.Text = Application("show")    '获取Application信息
    End Sub
End Class
