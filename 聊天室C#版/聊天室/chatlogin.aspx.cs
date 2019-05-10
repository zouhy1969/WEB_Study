using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chatlogin : System.Web.UI.Page
{
    String[,] ss = new string[3,2] { { "a", "1111" }, { "b", "2222" }, { "c", "3333" } };
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Application["user_online"] == null)
        {
            lblrs.Text = "0";
        }
        else 
        {
            lblrs.Text = Application["user_online"].ToString();
        }
        txtname.Focus();

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < ss.Length; i++)
        {
            if (txtname.Text.Equals(ss[i, 0]) && txtpass.Text.Equals(ss[i, 1]))
            {
                Session["se_name"] = ss[i, 0];
                Response.Redirect("chat.aspx");
            }
        }
        lblerror.Text = "用户名或密码错！";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<script>window.close();</script>");
    }
}