<%@ Page Language="C#" debug="true"%>

<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        String uname = "";
        String unum = "";
        String ugender = "";
        String uclass = "";
        uname = Request.QueryString["uname"];
        unum = Request.QueryString["unum"];
        ugender = Request.QueryString["ugender"];
        uclass = Request.QueryString["uclass"];

        try
        {
            uname = Request.Form["uname"];
            unum = Request.Form["unum"];
            ugender = Request.Form["ugender"];
        } catch (Exception e1)
        {
            Console.WriteLine("Exception caught: {0}", e1);
        }



        Label1.Text = "学生姓名: " + uname + "<br>学生学号: " + unum + "<br>学生性别: " + ugender + "<br>学生班级: " + uclass;
    }
</script>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>    
</head>
<body>
    <form id="form1" runat="server">   
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </form>
</body>
</html>
