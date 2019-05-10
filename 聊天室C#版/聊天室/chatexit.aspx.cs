using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chatexit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //下面几句返回离开者信息
        String sayStr;
        sayStr = "来自" + Request.ServerVariables["Remote_Addr"] + "的";      //来访者IP地址
        sayStr = sayStr + "<b>" + Session["se_name"] + "</b>";                //来访者昵称 
        sayStr = sayStr + "于" + DateTime.Now.ToLongTimeString() + "高兴而去";           //离开时间
        sayStr = "<font color='blue'>" + sayStr + "</font>";                  //红色显示
        //下面几句将来访信息保存到application中
        Application.Lock();                                                   //先锁定
        Application["show"] = sayStr + "<br>" + Application["show"];
        try
        {
            Application["user_online"] = (int)Application["user_online"] - 1;    //在线人数减1
        }
        catch(Exception ex)
        {
            Console.Write(ex);
        }
        Application.UnLock();                                                 //解除锁定
        Response.Redirect("chatlogin.aspx");                                  //重定向回首页

    }
}