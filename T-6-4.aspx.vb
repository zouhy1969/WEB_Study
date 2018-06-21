Imports System.Data
Imports System.Data.OleDb
Partial Class T6_4
    Inherits System.Web.UI.Page

    Protected Sub Btnshow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnshow.Click
        '建立Connection对象
        Dim conn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " & MapPath("~//app_data//wwwlink.mdb"))
        '建立Command对象
        Dim strsql As String
        strsql = "select * from link order by  submit_date desc"
        Dim cmd As New OleDbCommand(strsql, conn)
        '----------------------------------------------------------------------------------------------------------
        Try
            '打开数据库连接
            conn.Open()
            '建立DataReader对象
            Dim dr As OleDbDataReader = cmd.ExecuteReader()
            '下面开始显示数据，先显示标题
            lbldb.Text = "<table width='90%' border='1'><tr bgcolor='#CDCDCD'><td>ID</td><td>名称</td><td>网址</td><td>简介</td><td>评分</td><td>提交时间</td></tr>"
            '再利用循环显示每一条记录
            Do While dr.Read()
                lbldb.Text &= "<tr>"
                lbldb.Text &= "<td>" & dr.Item("Link_id") & "</td>"
                lbldb.Text &= "<td>" & dr.Item("siteName") & "</td>"
                lbldb.Text &= "<td><a href='http://" & dr.Item("URL") & "'>" & dr.Item("URL") & "</a></td>"
                lbldb.Text &= "<td>" & dr.Item("intro") & "</td>"
                lbldb.Text &= "<td>" & dr.Item("grade") & "</td>"
                lbldb.Text &= "<td>" & dr.Item("submit_date") & "</td>"
                lbldb.Text &= "</tr>"
            Loop
            message.Text &= "</table>"
            '关闭数据库
            conn.Close()
        Catch ex As Exception
            message.Text = ex.Message
        End Try

    End Sub

    Protected Sub btnsearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsearch.Click
        '建立Connection对象
        Dim conn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " & MapPath("~//app_data//wwwlink.mdb"))
        '建立Command对象
        Dim strsql As String
        If txtid.Text = "" Then
            strsql = "select * from link "
        Else
            strsql = "select * from link where link_id=" & CInt(txtid.Text) ' & "'"
        End If
        'Response.Write(strsql)
        ' Response.End()
        Try
            Dim cmd As New OleDbCommand(strsql, conn)
            '----------------------------------------------------------------------------------------------------------
            '打开数据库连接
            conn.Open()
            '建立DataReader对象
            Dim dr As OleDbDataReader = cmd.ExecuteReader()
            '下面开始显示数据，先显示标题
            lbldele.Text = "<table width='90%' border='1'><tr bgcolor='#CDCDCD'><td>ID</td><td>名称</td><td>网址</td><td>简介</td><td>评分</td><td>提交时间</td></tr>"
            '再利用循环显示每一条记录
            Do While dr.Read()
                lbldele.Text &= "<tr>"
                lbldele.Text &= "<td>" & dr.Item("Link_id") & "</td>"
                lbldele.Text &= "<td>" & dr.Item("siteName") & "</td>"
                lbldele.Text &= "<td><a href='http://" & dr.Item("URL") & "'>" & dr.Item("URL") & "</a></td>"
                lbldele.Text &= "<td>" & dr.Item("intro") & "</td>"
                lbldele.Text &= "<td>" & dr.Item("grade") & "</td>"
                lbldele.Text &= "<td>" & dr.Item("submit_date") & "</td>"
                lbldele.Text &= "</tr>"
            Loop
            lbldele.Text &= "</table>"
            '关闭数据库
            conn.Close()
        Catch ex As Exception
            message.Text = ex.Message
        End Try

    End Sub

    Protected Sub btndele_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btndele.Click
        '建立Connection对象
        Dim conn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " & Server.MapPath("~\\App_data\\wwwlink.mdb"))
        '建立Command对象
        Dim strsql As String
        If txtid.Text <> "" Then
            strsql = "delete * from link where link_id=" & Int(txtid.Text)
            Try
                Dim cmd As New OleDbCommand(strsql, conn)
                '执行操作，删除记录
                conn.Open()                             '打开数据库
                cmd.ExecuteNonQuery()
                conn.Close()                            '关闭数据库
                message.Text = "已经成功删除!"
            Catch ex As Exception
                message.Text = ex.Message
            End Try
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' lbldb.Text = ""
        message.Text = ""
    End Sub

    Protected Sub btncount_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btncount.Click
        '建立Connection对象
        Dim conn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " & MapPath("~//app_data//wwwlink.mdb"))
        '建立Command对象
        Dim strsql As String
        strsql = "select count(*) from link"
        Dim cmd As New OleDbCommand(strsql, conn)
        conn.Open()                             '打开数据库
        Dim i As Integer
        i = cmd.ExecuteScalar()
        conn.Close()                            '关闭数据库
        message.Text = "数据库的记录数共有：" & i.ToString

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        '  Response.Write("<script>window.close();</script>") '会弹出询问是否关闭
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        '建立Connection对象
        Dim conn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " & MapPath("~//app_data//wwwlink.mdb"))
        '建立Command对象
        Dim strsql As String
        If txtsitename.Text <> "" Then
            strsql = "select * from link where sitename like  '%" & txtsitename.Text & "%'"
            Dim cmd As New OleDbCommand(strsql, conn)
            Try
                conn.Open()
                '建立DataReader对象
                Dim dr As OleDbDataReader = cmd.ExecuteReader()
                '下面开始显示数据，先显示标题
                ' Response.Write(strsql)
                lbldele.Text = "<table width='90%' border='1'><tr bgcolor='#CDCDCD'><td>ID</td><td>名称</td><td>网址</td><td>简介</td><td>评分</td><td>提交时间</td></tr>"
                '再利用循环显示每一条记录
                Do While dr.Read()
                    lbldele.Text &= "<tr>"
                    lbldele.Text &= "<td>" & dr.Item("Link_id") & "</td>"
                    lbldele.Text &= "<td>" & dr.Item("siteName") & "</td>"
                    lbldele.Text &= "<td><a href='http://" & dr.Item("URL") & "'>" & dr.Item("URL") & "</a></td>"
                    lbldele.Text &= "<td>" & dr.Item("intro") & "</td>"
                    lbldele.Text &= "<td>" & dr.Item("grade") & "</td>"
                    lbldele.Text &= "<td>" & dr.Item("submit_date") & "</td>"
                    lbldele.Text &= "</tr>"
                Loop
                lbldele.Text &= "</table>"
                '关闭数据库
                conn.Close()
            Catch ex As Exception
                message.Text = ex.Message
            End Try

        End If

    End Sub
End Class
