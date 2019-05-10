using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForm1_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "info")
        {
            Label1.Text = "<a href='个人介绍.aspx'>" + "个人介绍" + "</a>";
        }
        else
        {
            Label1.Text = "<a href='https://" + TextBox1.Text + "'>" + TextBox1.Text + "</a>";
            //Response.Redirect(TextBox1.Text, true);
            Label2.Text = cyy.txtToUrl(TextBox1.Text);
        }

        
    }
}