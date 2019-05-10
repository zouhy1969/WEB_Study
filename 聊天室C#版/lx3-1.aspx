<%@ Page Language="C#" Debug="true" %>

<!DOCTYPE html>
<script runat="server">
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Equals(""))
            Label2.Text = "Please enter a number";
        else
        {
            try {
                int a = int.Parse(TextBox1.Text);
                String s = "<table style='border-style: solid; border-width: medium'>";
                for (int i = 1; i <= a; i++)
                {
                    s += "<tr>";
                    for (int j = 1; j <= i; j++)
                        s += "<td style='border-style: solid; vertical-align: middle; text-align: center'>" + i + " * " + j + " = " + i*j + "</td>&ensp;";
                    s += "</tr>";
                }
                s += "</table>";
                Label2.Text = s;
            }
            catch(Exception ex)
            {
                Label2.Text = ex.Message;
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text.Equals(""))
            Label6.Text = "Please enter a number";
        else
        {
            try
            {
                int[] arr = Array.ConvertAll(TextBox2.Text.Split(' ') , int.Parse);
                Array.Sort(arr);
                Array.Reverse(arr);
                Label6.Text = "降序排列的结果是：<br/>";
                int res = 0;
                for (int i = 0; i < arr.Length; i++)
                {
                    res += arr[i];
                    Label6.Text += arr[i] + " ";
                }
                Label6.Text += "<br/>平均值是" + res / arr.Length;
            }
            catch (Exception ex)
            {
                Label6.Text = ex.Message;
            }
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        if (TextBox3.Text.Equals("") || TextBox4.Text.Equals("") || TextBox5.Text.Equals(""))
            Label12.Text = "请确保用户名，密码，验证码输入完整";
        else
        {
            try
            {
                if (!TextBox5.Text.ToLower().Equals(Label11.Text.ToLower()))
                {
                    Label12.Text = "输入错误！请重新输入！";
                    Label11.Text = cyy.getVerCode(4);
                }
                else Label12.Text = "输入正确！！";
            }
            catch (Exception ex)
            {
                Label11.Text = ex.Message;
            }
        }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)//判断是否回传，首次调用不是回传
            Label11.Text = cyy.getVerCode(4);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Label11.Text = cyy.getVerCode(4);
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        if (TextBox6.Text.Equals(""))
            Label14.Text = "请输入数字个数";
        else
        {
            int[] arr = new int[int.Parse(TextBox6.Text)];
            int count = 0;
            Random ran = new Random();
            for (int i = 0; i < arr.Length; i++)
            {
                arr[i] = ran.Next(0, int.Parse(TextBox6.Text));
            }
            int[] temp = new int[arr.Length];
            for (int i = 0; i < temp.Length; i++)
            {
                temp[i] = 0;
            }
            for (int i = 0; i < arr.Length; i++)
            {
                temp[arr[i]] = 1;
            }
            for (int i = 0; i < temp.Length; i++)
            {
                if (temp[i] == 0) count++;
            }
            Label14.Text = "重复的数字个数为" + count;
        }
        
    }
</script>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>    
    </head>
<body>
    <form id="form1" runat="server">   
        <asp:Label ID="Label3" runat="server" Text="乘法口诀表" Font-Bold="True" Font-Size="Larger"></asp:Label>
        <br />
        <asp:Label ID="Label1" runat="server" Text="请输入表的行列数"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定" />
        
        <br />
        <asp:Label ID="Label2" runat="server"></asp:Label> 
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="数组排序" Font-Bold="True" Font-Size="Larger"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="请输入数值，以空格间隔"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Width="447px"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="降序排序" />
        
        <br />
        <asp:Label ID="Label6" runat="server"></asp:Label> 
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="验证码" Font-Bold="True" Font-Size="Larger"></asp:Label>
        <br />
        <asp:Label ID="Label8" runat="server" Text="用户名："></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label9" runat="server" Text="密码："></asp:Label>
        &nbsp;
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label10" runat="server" Text="验证码："></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <asp:Label ID="Label11" runat="server" BackColor="#999999" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True"></asp:Label>
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="看不清楚，换一张" />
        
        <br />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="确定" />
        
        <br />
        <asp:Label ID="Label12" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label13" runat="server" Text="去重" Font-Bold="True" Font-Size="Larger"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="确定" />
        
        <br />
        <asp:Label ID="Label14" runat="server"></asp:Label>
        
        <br />

    </form>
</body>
</html>
