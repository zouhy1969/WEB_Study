<%@ Page Language="VB" AutoEventWireup="false" CodeFile="T-6-4.aspx.vb" Inherits="T6_4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
       <script type="text/JavaScript">
	function windowsclose(){
		window.close()
		return true;
	}
	</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
            数据库操作</p>
        <p>
            <asp:Button ID="btnshow" runat="server" OnClick="Btnshow_Click" Text="显示数据库记录" />&nbsp;
            <asp:Button ID="btnsearch" runat="server" OnClick="btnsearch_Click" Text="查找指定数据库记录" />
            <asp:Button ID="btndele" runat="server" OnClick="btndele_Click" Text="删除指定数据库记录" OnClientClick='return confirm("确实要删除该纪录吗？")' />
            <asp:Button ID="btncount" runat="server" Text="统计数据库记录数" />
            <asp:Button ID="Button1" runat="server" Text="退出" OnClientClick="windowsclose()" /></p>
        <p>
            请输入id：
            <asp:TextBox ID="txtid" runat="server"></asp:TextBox>&nbsp;
        </p>
        <p>
            请输入网站名称：
            <asp:TextBox ID="txtsitename" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="Button2"
                runat="server" Text="确定" />
            &nbsp; 支持模糊查询</p>
        <p>
            <asp:Label ID="lbldb" runat="server"></asp:Label>&nbsp;</p>
        <p>
            <asp:Label ID="lbldele" runat="server"></asp:Label>&nbsp;</p>
        <p>
            &nbsp;<asp:Label ID="message" runat="server"></asp:Label></p>
    
    </div>
    </form>
</body>
</html>
