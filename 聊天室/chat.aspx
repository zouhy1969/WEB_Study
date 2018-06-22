<%@ Page Language="VB" AutoEventWireup="false" CodeFile="chat.aspx.vb" Inherits="chat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>聊天室</title>
</head>
<body>
    <div>
        <iframe id="f1" name="message" src="chatshow.aspx" width="600px" scrolling="auto" frameborder="0"></iframe>
    </div>
	<div>
        <iframe id="f2" name="say" src="chatsend.aspx" width="600px" height="300px" scrolling="no" frameborder="0"></iframe>
	</div>
</body>
</html>
