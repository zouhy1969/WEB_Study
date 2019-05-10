using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["se_name"].Equals(""))
            Response.Redirect("chatlogin.aspx");
        if (!IsPostBack) 
        {
            //下面几句返回来访者信息
            String sayStr;
            sayStr = "来自" + Request.ServerVariables["Remote_Addr"] + "的";  //来访者IP
            sayStr = sayStr + "<b>" + Session["se_name"] + "</b>";            //来访者昵称  
            sayStr = sayStr + "于" + DateTime.Now.ToLongTimeString() + "大驾光临";       //来访时间               
            sayStr = "<font color='red'>" + sayStr + "</font>";               //红色显示 

            //下面几句将来访信息保存到Application中
            Application.Lock();                                            //先锁定
            Application["show"] = sayStr + "<br>" + Application["show"];        //返回聊天信息
            try
            {
                Application["user_online"] = (int)(Application["user_online"]) + 1;      //在线人数加1
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }
            Application.UnLock();                                                //解除锁定
        }
    }
}