<%@ Page Language="C#" debug="true"%>

<!DOCTYPE html>
<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label2.Text = "今天是" + year.SelectedValue + "年" + month.SelectedValue + "月" + day.SelectedValue + "日";
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int y = int.Parse(year.SelectedValue);
        int m = int.Parse(month.SelectedValue);
        day.Items.Clear();
        for (int i = 1; i < cyy.judgeDate(y, m); i++)
            day.Items.Add(i.ToString());
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        int y = int.Parse(year.SelectedValue);
        int m = int.Parse(month.SelectedValue);
        day.Items.Clear();
        for (int i = 1; i < cyy.judgeDate(y, m); i++)
            day.Items.Add(i.ToString());
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            for (int i = DateTime.Now.Year - 10; i < DateTime.Now.Year + 11; i++) year.Items.Add(i.ToString());
            for (int i = 1; i <= 12; i++) month.Items.Add(i.ToString());
            for (int i = 1; i <= 31; i++) day.Items.Add(i.ToString());
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int y = 2019, m = 4, d = 19;
        if (TextBox1.Text.Equals(""))
            Label2.Text = "Please enter a date";
        else
        {
            string[] ans = TextBox1.Text.Split('.');
            y = int.Parse(ans[0].Trim());
            m = int.Parse(ans[1].Trim());
            d = int.Parse(ans[2].Trim());
            try
            {
                year.SelectedValue = y.ToString();
                month.SelectedValue = m.ToString();
                day.SelectedValue = d.ToString();
            }
            catch(Exception ex)
            {
                Label2.Text = ex.ToString();
            }
        }
    }
</script>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>    
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">   
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="请选择年月日："></asp:Label>
                </td>
            </tr>
            <tr>
                <td>   
        <asp:DropDownList ID="year" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
        </asp:DropDownList>
                    年<asp:DropDownList ID="month" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true">
        </asp:DropDownList>
                    月<asp:DropDownList ID="day" runat="server" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="true">
        </asp:DropDownList>
                    日</td>
            </tr>
            <tr>
                <td>
        <asp:Button ID="Button3" runat="server" Text="今天" OnClick="Button1_Click" />
        <asp:Button ID="Button4" runat="server" Text="确定" OnClick="Button2_Click" />
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <br />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
