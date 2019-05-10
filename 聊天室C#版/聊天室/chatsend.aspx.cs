using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chatsend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblname.Text = Session["se_name"].ToString();
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        for(int i = 0; i < 31; i++) 
        {
            RBbq.Items.Add("<img src='images/" + i.ToString() + ".gif' />");
            RBbq.Items[i].Value = i.ToString();        
        }
        
          
    }
    protected void Btnsend_Click(object sender, EventArgs e)
    {
        if (!txtsay.Text.Equals("")) 
        {
            String say, mycolor, myemote, user_name;                //声明变量待用
            user_name = lblname.Text;
            say = Server.HtmlEncode(txtsay.Text);                     //返回发言，并用HtmlEncode编码
            mycolor = drdcolor.SelectedValue;                        //返回本次发言的颜色
            myemote = drdmotion.SelectedValue;                       //返回本次发言表情
            if (myemote.Equals("无"))
                myemote = "";
            String myemotepic;
            if(RBbq.SelectedIndex != -1) 
            {
                myemotepic = "<img src='images/" + RBbq.SelectedIndex.ToString() + ".gif' />";
            }
            else 
                 myemotepic = "";
            //下面三句将得到本次发言的字符串
            String sayStr;
            sayStr = "<small>" + user_name + "在" + DateTime.Now.ToLongTimeString() + myemote + "说：</small>";
            sayStr = sayStr + "<font color='" + mycolor + "'>" + say + "</font>" + myemotepic;
            //下面几句将本次发言信息保存到Application中
            Application.Lock();
            Application["show"] = sayStr + "<br>" + Application["show"];
            if (Application["show"].ToString().Length > 10000)                 //如果发言总长度超过10000个字符，则截断为10000
                Application["show"] = Application["show"].ToString().Substring(0, 10000);
            Application.UnLock();
            txtsay.Text = "";                 
        }
    }

    protected void drdcolor_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (drdcolor.SelectedItem.Text)
        {
            case ("红色"):
                drdcolor.ForeColor = System.Drawing.Color.Red;
                break;
            case ("蓝色"):
                drdcolor.ForeColor = System.Drawing.Color.Blue;
                break;
            case ("黄色"):
                drdcolor.ForeColor = System.Drawing.Color.Yellow;
                break;
            case ("绿色"):
                drdcolor.ForeColor = System.Drawing.Color.Green;
                break;
            default:
                drdcolor.ForeColor = System.Drawing.Color.Black;
                break;
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Application.Lock();                          //先锁定
        Application["show"] = "";
        Application.UnLock();                        //先锁定
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Write("<script>window.parent.location.href='chatexit.aspx'</script>");
    }
}