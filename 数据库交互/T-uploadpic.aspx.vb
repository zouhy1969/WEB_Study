
Partial Class T_uploadpic
    Inherits System.Web.UI.Page

    Protected Sub ddlps_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlps.SelectedIndexChanged
        GridView1.PageSize = CInt(ddlps.SelectedValue) '当DropDownList选项改变时，改变Grid View每页显示的数量

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            ddlps.SelectedValue = GridView1.PageSize
        End If

    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        '呈现 GridView 控件之前，该控件中的每一行必须绑定到数据源中的一条记录。将某个数据行（用 GridViewRow 对象表示）绑定到 GridView 控件中的数据以后，将引发 RowDataBound 事件。
        lblmsg.Text = "当前页为第" & (GridView1.PageIndex + 1).ToString & "页,共有" _
  & GridView1.PageCount.ToString & "页"
    End Sub
End Class
