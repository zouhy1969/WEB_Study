<%@ Page Language="C#" debug="true"%>

<!DOCTYPE html>
<script runat="server">
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    List<RadioButton> rl = new List<RadioButton>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
            DropDownList1.Items.Add("应用化学");
            Label2.Text = cyy.getVerCode(4);
            Button3.Visible = false;

            rl.Add(RadioButton1);
            rl.Add(RadioButton2);
            rl.Add(RadioButton3);
            rl.Add(RadioButton4);
            rl.Add(RadioButton5);
            rl.Add(RadioButton6);
            rl.Add(RadioButton7);
            rl.Add(RadioButton8);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Equals("") || TextBox2.Text.Equals("") || TextBox3.Text.Equals("")) Label1.Text = "请完善信息";
        else if (TextBox1.Text.Trim().Length != 6) Label1.Text = "请重新输入学号";
        else if (!TextBox3.Text.ToLower().Equals(Label2.Text.ToLower()))
        {
            Label1.Text = "请重新输入验证码";
            Label2.Text = cyy.getVerCode(4);
        }
        else
        {
            Label1.Text = "登陆成功!";
            System.Threading.Thread.CurrentThread.Join(1000);
            Button3.Visible = true;

        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Label2.Text = cyy.getVerCode(4);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

    protected void Button4_Click(object sender, EventArgs e)
    {

    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            String filePath = "~/assets";
            FileUpload1.SaveAs(MapPath(filePath));
            Label3.Text = FileUpload1.PostedFile.ContentType + "\t" + FileUpload1.PostedFile.ContentLength;

        }
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        foreach(RadioButton r in rl) {
            if (!r.Equals(RadioButton1)) r.Checked = false;
        }

    }

    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        foreach (RadioButton r in rl)
        {
            if (!r.Equals(RadioButton2)) r.Checked = false;
        }
    }
    protected void RadioButton3_CheckedChanged1(object sender, EventArgs e)
    {
        foreach(RadioButton r in rl) {
            if (!r.Equals(RadioButton3)) r.Checked = false;
        }
    }

    protected void RadioButton4_CheckedChanged(object sender, EventArgs e)
    {
        foreach(RadioButton r in rl) {
            if (!r.Equals(RadioButton4)) r.Checked = false;
        }
    }

    protected void RadioButton5_CheckedChanged(object sender, EventArgs e)
    {
        foreach(RadioButton r in rl) {
            if (!r.Equals(RadioButton5)) r.Checked = false;
        }
    }

    protected void RadioButton6_CheckedChanged(object sender, EventArgs e)
    {
        foreach(RadioButton r in rl) {
            if (!r.Equals(RadioButton6)) r.Checked = false;
        }
    }

    protected void RadioButton7_CheckedChanged(object sender, EventArgs e)
    {
        foreach(RadioButton r in rl) {
            if (!r.Equals(RadioButton7)) r.Checked = false;
        }
    }

    protected void RadioButton8_CheckedChanged(object sender, EventArgs e)
    {
        foreach(RadioButton r in rl) {
            if (!r.Equals(RadioButton8)) r.Checked = false;
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
        .auto-style2 {
            height: 31px;
        }
        .auto-style3 {
            height: 7px;
        }
        .auto-style5 {
            width: 150px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">   

        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">  
        <table class="auto-style1">
            <tr>
                <td>第一步：输入个人信息</td>
            </tr>
            <tr>
                <td class="auto-style2">学号：&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>                     
                    <font style="color:red"> 必须输入学号，为六位数字</font></td>
            </tr>
            <tr>
                <td class="auto-style3">姓名：&nbsp; <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                      
                    <font style="color:red"> 必须输入姓名</font></td>
            </tr>
            <tr>
                <td>验证码：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                      
                    <asp:Label ID="Label2" runat="server" BackColor="#999999" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True"></asp:Label>
                      
                    <font style="color:red">请输入验证码</font>
                    <asp:Button ID="Button2" runat="server" Text="看不清楚换一张" OnClick="Button2_Click" Height="42px" Width="210px" />
                </td>
            </tr>
            <tr>
                <td>专业&nbsp; :&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="225px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="登录" OnClick="Button1_Click" />
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="上传文件" />
                </td>
            </tr>
        </table>
            </asp:View>
            <asp:View ID="View2" runat="server">  

                <table class="auto-style1">
                    <tr>
                        <td class="auto-style5">实验编号</td>
                        <td>每章实验编号 (每个压缩文件规定名规定: 学号-实验编号-<br /> 例 100123-1.rar 为实验一报告)</td>
                    </tr>
                    <tr>
                        <td class="auto-style5">1</td>
                        <td>
                            <asp:RadioButton ID="RadioButton1" runat="server" Text="ASP.NET网站的建立与管理和网页的基本制作" OnCheckedChanged="RadioButton1_CheckedChanged" GroupName="1" AutoPostBack="True" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">2</td>
                        <td>
                            <asp:RadioButton ID="RadioButton2" runat="server" Text="HTML网页的编写与调试" GroupName="1" AutoPostBack="True" OnCheckedChanged="RadioButton2_CheckedChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">3</td>
                        <td>
                            <asp:RadioButton ID="RadioButton3" runat="server" Text="ASP.NET程序设计基础" GroupName="1" AutoPostBack="True" OnCheckedChanged="RadioButton3_CheckedChanged1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">4</td>
                        <td>
                            <asp:RadioButton ID="RadioButton4" runat="server" Text="Web服务器基本控件的设计与使用" GroupName="1" AutoPostBack="True" OnCheckedChanged="RadioButton4_CheckedChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">5</td>
                        <td>
                            <asp:RadioButton ID="RadioButton5" runat="server" Text="内部对象的设计与使用" GroupName="1" AutoPostBack="True" OnCheckedChanged="RadioButton5_CheckedChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">6</td>
                        <td>
                            <asp:RadioButton ID="RadioButton6" runat="server" Text="母版页和站点导航控件" GroupName="1" AutoPostBack="True" OnCheckedChanged="RadioButton6_CheckedChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">7</td>
                        <td>
                            <asp:RadioButton ID="RadioButton7" runat="server" Text="Asp.Net存取数据库的基本操作" GroupName="1" AutoPostBack="True" OnCheckedChanged="RadioButton7_CheckedChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">8</td>
                        <td>
                            <asp:RadioButton ID="RadioButton8" runat="server" Text="Web应用系统设计" GroupName="1" AutoPostBack="True" OnCheckedChanged="RadioButton8_CheckedChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">选择文件</td>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:Button ID="Button5" runat="server" Height="36px" OnClick="Button5_Click" Text="上传" Width="117px" />
                            <asp:Label ID="Label3" runat="server"></asp:Label>
                            <br />
                            当文件名和已经上传的文件重名时，将自动更新文件.除非想替换源文件，否则请避免重名.<br /> 文件最大为5M</td>
                    </tr>
                </table>

            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
