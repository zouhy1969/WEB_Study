Imports System.string
Partial Class chatlogin
    Inherits System.Web.UI.Page

    Dim bluser(,) As String = {{"a", "1111"}, {"b", "2222"}, {"c", "3333"}}
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Application("user_online") Is Nothing Then
            lblrs.Text = 0
        Else
            lblrs.Text = CInt(Application("user_online"))
        End If
        txtname.Focus()
    End Sub

    Protected Sub btnlogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlogin.Click
        Dim i As Integer
        For i = 0 To 2
            If Compare(txtname.Text, bluser(i, 0), False) = 0 And Compare(txtpass.Text, bluser(i, 1), False) = 0 Then
                Session("se_name") = bluser(i, 0)
                Response.Redirect("chat.aspx")
                'Response.Redirect("paiban.aspx")
            End If
        Next
        lblerror.Text = "用户名或密码错！"
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Write("<script>window.close();</script>") '会弹出询问是否关闭
    End Sub
End Class
