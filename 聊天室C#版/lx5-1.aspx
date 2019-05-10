<%@ Page Language="C#" %>

<!DOCTYPE html>
<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Response.Redirect("lx5-1-1.aspx?uname=" + TextBox1.Text + "&unum=" + 
                TextBox2.Text + "&ugender=" + RadioButtonList1.SelectedItem.Text + "&uclass=" + DropDownList1.SelectedItem.Text);
        }
        else
        {
            Label1.Text = "请完善信息";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }
</script>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>    
</head>
<body>
    <form id="form1" runat="server">   
        姓名：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="请输入姓名"></asp:RequiredFieldValidator>
        <br />
        学号：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="请输入学号"></asp:RequiredFieldValidator>
        <br />
        性别：<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="请选择性别"></asp:RequiredFieldValidator>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="15px" RepeatDirection="Horizontal" Width="176px">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
        </asp:RadioButtonList>
        班号：<asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="1"></asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1" ErrorMessage="请选择班级"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="Button1" runat="server" Text="确定 " Width="84px" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="重置" OnClick="Button2_Click" />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
    </form>
    <form id ="form2" method="post" action="lx5-1-1.aspx">
        <div> 
            <strong>form提交<br/></strong>
            姓名:<input id="hidden1" type="text" name="uname"/><br/>
            学号:<input id="hidden2" type="text" name="unum"/><br/>
            性别:
            <input id="hidden4" type="radio" value="男" name="ugender"/>男
            <input id="hidden5" type="radio" value="女" name="ugender"/>女
            <input id="submit1" type="submit" value="提交"/><br/>
        </div>
    </form>
</body>
</html>
