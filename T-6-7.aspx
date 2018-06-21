<%@ Page Language="VB" AutoEventWireup="false" CodeFile="T-6-7.aspx.vb" Inherits="T_6_7" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
 	<table border="1" width="80%"  cellspacing="0">
		<tr>
			<td>网站名称：</td>
			<td><asp:Textbox id="sitename" runat="server"/></td>
		</tr>
		<tr>
			<td>网站地址：</td>
			<td>http://<asp:Textbox id="URL" columns="40"  runat="server"/></td>
		</tr>
		<tr>
			<td>网站简介：</td>
			<td><asp:Textbox id="intro" Textmode="multiline" columns="40" rows="4" runat="server"/></td>
		</tr>
		<tr>
			<td>网站评分：</td>
			<td>
				<asp:dropdownlist id="grade" runat="server">
					<asp:listitem>1</asp:listitem>
					<asp:listitem>2</asp:listitem>
					<asp:listitem selected="True">3</asp:listitem>
					<asp:listitem>4</asp:listitem>
					<asp:listitem>5</asp:listitem>
				</asp:dropdownlist >
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="浏　览" />
                <asp:Button ID="Button2" runat="server" Text="提交" />
            </td>
		</tr>
	</table>
	<asp:Label id="message" runat="server"/>
            <br />
            <a href="T-6-1.aspx">打开T-6-1.aspx,按submit_date降序显示数据表</a>
    </div>
    </form>
</body>
</html>
