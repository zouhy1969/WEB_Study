<%@ Page Language="VB" AutoEventWireup="false" CodeFile="T-uploadpic.aspx.vb" Inherits="T_uploadpic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Caption="上传文件一览表"
            CellPadding="4" DataKeyNames="id" DataSourceID="AccessDataSource1" ForeColor="#333333" PageSize="5" AllowPaging="True" AllowSorting="True" EnableModelValidation="True">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" HeaderText="操作" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="filename" HeaderText="图片名" SortExpression="filename" />
                <asp:BoundField DataField="id" HeaderText="编号" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" DataFormatString="{0:00}" />
                <asp:BoundField DataField="filesize" HeaderText="图片大小" SortExpression="filesize" />
                <asp:BoundField DataField="fileintro" HeaderText="图片介绍" SortExpression="fileintro" />
                <asp:BoundField DataField="fileContentType" HeaderText="图片类型" SortExpression="fileContentType" />
                <asp:ImageField DataImageUrlField="filename" DataImageUrlFormatString="~/images/{0}"
                    HeaderText="ImageField图片" DataAlternateTextField="filename" DataAlternateTextFormatString="这是{0}的图片">
                    <ControlStyle BorderStyle="Solid" BorderWidth="2px" Height="80px" Width="120px" />
                </asp:ImageField>
                <asp:BoundField DataField="submit_date" HeaderText="递交日期" SortExpression="submit_date" DataFormatString="{0:D}" />
                <asp:TemplateField HeaderText="TemplateField图片">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("filename") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ControlStyle BorderStyle="Solid" BorderWidth="2px" Height="80px" Width="120px" />
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/" & Eval("filename") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/temp.mdb"
            DeleteCommand="DELETE FROM [uploadfile] WHERE [id] = ?" InsertCommand="INSERT INTO [uploadfile] ([id], [filename], [filesize], [filebody], [fileintro], [fileContentType], [submit_date]) VALUES (?, ?, ?, ?, ?, ?, ?)"
            SelectCommand="SELECT * FROM [uploadfile]" UpdateCommand="UPDATE [uploadfile] SET [filename] = ?, [filesize] = ?, [filebody] = ?, [fileintro] = ?, [fileContentType] = ?, [submit_date] = ? WHERE [id] = ?">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="filename" Type="String" />
                <asp:Parameter Name="filesize" Type="Int32" />
                <asp:Parameter Name="filebody" Type="Object" />
                <asp:Parameter Name="fileintro" Type="String" />
                <asp:Parameter Name="fileContentType" Type="String" />
                <asp:Parameter Name="submit_date" Type="DateTime" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="filename" Type="String" />
                <asp:Parameter Name="filesize" Type="Int32" />
                <asp:Parameter Name="filebody" Type="Object" />
                <asp:Parameter Name="fileintro" Type="String" />
                <asp:Parameter Name="fileContentType" Type="String" />
                <asp:Parameter Name="submit_date" Type="DateTime" />
            </InsertParameters>
        </asp:AccessDataSource>
        <br />
        每页显示<asp:DropDownList ID="ddlps" runat="server" AutoPostBack="True">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>条记录 &nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblmsg" runat="server"></asp:Label>&nbsp;<br />
        <br />
        &nbsp; <a href="t-upload.aspx">上传图片文件</a>
    
    </div>
    </form>
</body>
</html>
