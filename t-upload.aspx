<%@ Page Language="VB" AutoEventWireup="false" CodeFile="t-upload.aspx.vb" Inherits="t_upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span style="font-size: 16pt; color: #3300ff">
        上传文件到数据库
        <br />
        </span>
        <br />
            选择图片文件：
            <asp:FileUpload ID="FileUpload1" runat="server" /><br />
            文件说明：<asp:TextBox ID="intro" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="enter" runat="server" OnClick="Enter_Click" Text="提交" />
   
    </div>
    </form>
</body>
</html>
