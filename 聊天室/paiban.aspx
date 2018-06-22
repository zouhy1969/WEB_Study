<%@ Page Language="VB" AutoEventWireup="false" CodeFile="paiban.aspx.vb" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <style type="text/css">
        body
        {  margin:0;
           padding:0;
        }
        #header
        {
        	 margin:5px auto;
        	 height:150px;
        	 background:#9F9;
        }
         #mmain
        {
         	 margin:5px auto;
        	 height:600px;
        	 background:#0FF;       } 
        #footer
        {
           	 margin:5px auto;
        	 height:80px;
        	 background:#FF9;       } 
         #left
        {
         	 width:300px;
         	 height:600px;
         	 float:left;
        	 background:#E4E6EB;       } 
          #right
        {
         	 width:700px;
           	 height:600px;
           	 margin-left:300px;
         	 background:#ECB546;       } 
       </style>
    <title>无标题页</title>
</head>
<body style="margin:0">
    <form id="form1" runat="server">
    <div style=" width: 1000px; margin: auto">
    
        <div id="header">
             <iframe src="" name="top" height="150px" width="1000px" frameborder="0" id="top"></iframe>
        </div>
                  <div id="menu">This is the Menu</div>

        <div id="mmain">
            <div id="left">


            </div>
             <div id="right">
                 <iframe  id="message"  name="message" src="chatshow.aspx"   height="600px" width="700px" frameborder="0" ></iframe>
             </div>
       </div>
        <div id="footer"> 
                <iframe  id="say"  name="say" src="chatsend.aspx"   width="1000px" frameborder="0" ></iframe>

        </div>
    </div>
    </form>
</body>
</html>
