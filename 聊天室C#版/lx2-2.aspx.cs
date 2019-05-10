using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class lx2_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Trim() == "1234" && TextBox2.Text.Trim() == "1234")
        {
            TextBox1.Text = "输入正确！";
            TextBox2.Text = "输入正确！";
        }
        else
        {
            TextBox1.Text = "输入错误！";
            TextBox2.Text = "输入错误！";
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }
}