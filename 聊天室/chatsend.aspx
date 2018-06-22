<%@ Page Language="VB" AutoEventWireup="false" CodeFile="chatsend.aspx.vb" Inherits="chatdisplay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        发言人：<asp:Label ID="lblname" runat="server" BorderStyle="None"></asp:Label><br />
        <asp:TextBox ID="txtsay" runat="server" Columns="30" Height="64px" TextMode="MultiLine"
            Width="290px"></asp:TextBox>
        <asp:Button ID="Btnsend" runat="server" Text="发送" /><br />
        &nbsp;<br />
        颜色:&nbsp;
        <asp:DropDownList ID="drdcolor" runat="server" AutoPostBack="True">
            <asp:ListItem Value="#000000">黑色</asp:ListItem>
            <asp:ListItem Value="#0000FF">蓝色</asp:ListItem>
            <asp:ListItem Value="#FF0000">红色</asp:ListItem>
            <asp:ListItem Value="#FFFF00">黄色</asp:ListItem>
            <asp:ListItem Value="#00FF00">绿色</asp:ListItem>
       </asp:DropDownList>表情:<asp:DropDownList ID="drdmotion" runat="server">
             <asp:ListItem>无</asp:ListItem>
             <asp:ListItem>回眸一笑</asp:ListItem>
            <asp:ListItem>幸灾乐祸</asp:ListItem>
            <asp:ListItem>号啕大哭</asp:ListItem>
            <asp:ListItem>温柔细语</asp:ListItem>
       </asp:DropDownList>
        &nbsp; &nbsp; 
        <br />
        <asp:RadioButtonList ID="RBbq" runat="server" RepeatColumns="10" 
            RepeatDirection="Horizontal">
        </asp:RadioButtonList>
        &nbsp;<br />
        <asp:Button ID="Button1" runat="server" Text="清空聊天室" />&nbsp; 
        <asp:Button ID="Button2" runat="server" Text="离开聊天室" />
        <br />
        </div>
    </form>
</body>
</html>
