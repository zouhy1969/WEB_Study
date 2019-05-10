<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lx2-2.aspx.cs" Inherits="lx2_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="用户名"></asp:Label>
            <br/>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <hr />
            <asp:Label ID="Label2" runat="server" Text="密码"></asp:Label>
            <br/>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="重置" />
        </div>
    </form>
</body>
</html>
