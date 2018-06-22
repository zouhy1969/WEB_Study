
Imports System.Data
Imports System.Data.OleDb
Partial Class t_upload
    Inherits System.Web.UI.Page

    Protected Sub Enter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles enter.Click
        If (FileUpload1.HasFile) Then
            Dim filePath As String = "~/images/" & FileUpload1.FileName '获取文件名称
            FileUpload1.SaveAs(MapPath(filePath)) ' 将上传的图片保存 images 文件夹中，名称为上传时获取的名称
            '   Image1.ImageUrl = filePath
        End If
        Dim conn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & _
                        Server.MapPath("~/App_Data/temp.mdb"))
        '建立Command对象,要注意其中含有多个参数
        Dim cmd As New OleDbCommand("Insert Into uploadfile(filename,filesize," & _
        "fileintro,fileContentType,submit_date) Values(@filename,@filesize,@fileintro,@fileContentType,@Submit_Date)", conn)

        '给参数赋值
        cmd.Parameters.Add(New OleDbParameter("@filename", OleDbType.Char, 50))
        cmd.Parameters("@filename").Value = FileUpload1.FileName
        ' 其余两种赋值方式
        'cmd.Parameters.Add(New OleDbParameter("@filename", OleDbType.Char, 50)).Value = FileUpload1.FileName
        'cmd.Parameters.Add("@filename", OleDbType.Char, 50).Value = FileUpload1.FileName

        cmd.Parameters.Add(New OleDbParameter("@filesize", OleDbType.Integer))
        cmd.Parameters("@filesize").Value = FileUpload1.PostedFile.ContentLength

        cmd.Parameters.Add(New OleDbParameter("@fileintro", OleDbType.Char, 250))
        cmd.Parameters("@fileintro").Value = intro.Text

        cmd.Parameters.Add(New OleDbParameter("@fileContentType", OleDbType.Char, 50))
        cmd.Parameters("@fileContentType").Value = FileUpload1.PostedFile.ContentType

        cmd.Parameters.Add(New OleDbParameter("@submit_date", OleDbType.Date))
        cmd.Parameters("@submit_date").Value = Now()
        '执行操作，插入记录
        conn.open()                             '打开数据库
        cmd.ExecuteNonQuery()                   '执行SQL命令并返回受影响的行数
        'cmd.ExecuteReader()                    '执行SQL命令并返回 DataReader 类
        conn.close()                            '关闭数据库

        '下面可以重定向回首页
        Response.Redirect("t-uploadpic.aspx")

    End Sub
End Class
