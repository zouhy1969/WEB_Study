Imports System.Data
Imports System.Data.OleDb
Partial Class T_6_7
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        '建立Connection对象
        'Dim conn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source= H:\sample-6\wwwlink.mdb")
        Dim conn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " & MapPath("~\\App_data\\wwwlink.mdb"))
        '建立Command对象
        Dim cmd As New OleDbCommand("select * from link", conn)
        '----------------------------------------------------------------------------------------------------------
        '打开数据库连接
        conn.Open()
        '建立DataReader对象
        Dim dr As OleDbDataReader = cmd.ExecuteReader()
        '下面开始显示数据，先显示标题
        message.text = "<table width='90%' border='1'><tr bgcolor='#CDCDCD'><td>ID</td><td>名称</td><td>网址</td><td>简介</td><td>评分</td><td>提交时间</td></tr>"
        '再利用循环显示每一条记录
        Do While dr.Read()
            message.Text &= "<tr>"
            message.Text &= "<td>" & dr.Item("Link_id") & "</td>"
            message.Text &= "<td>" & dr.Item("siteName") & "</td>"
            message.Text &= "<td>" & dr.Item("URL") & "</td>"
            message.Text &= "<td>" & dr.Item("intro") & "</td>"
            message.Text &= "<td>" & dr.Item("grade") & "</td>"
            message.Text &= "<td>" & dr.Item("submit_date") & "</td>"
            message.Text &= "</tr>"
        Loop
        message.text &= "</table>"
        '关闭数据库
        conn.Close()

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        '建立Connection对象
        'Dim conn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Inetpub\wwwroot\asp.net\chapter6\wwwlink.mdb")
        Dim conn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & MapPath("~\\App_data\\wwwlink.mdb"))
        '建立Command对象
        Dim strSql As String
        strSql = "Insert Into link(sitename,URL,intro,grade,submit_date) Values('" & sitename.Text & "','" & URL.Text & "','" & intro.Text & "'," & CInt(grade.SelectedItem.Text) & ",#" & Now() & "#)"
        Dim cmd As New OleDbCommand(strSql, conn)
        '执行操作，插入记录
        conn.Open()                             '打开数据库
        cmd.ExecuteNonQuery()
        conn.Close()                            '关闭数据库
        message.Text = "已经成功添加，请自己打开数据库查看结果,也可以继续添加。"

    End Sub
End Class
