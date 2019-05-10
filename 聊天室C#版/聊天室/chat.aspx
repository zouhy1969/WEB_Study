<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chat.aspx.cs" Inherits="chat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>聊天室</title>
    <style type="text/css">
        .bbs {
            height:100%;
            width: 100%;
            border: none;
        }
    </style>
</head>
<body>
    <div class="bbs"  >
    <div>
        <iframe id="f1" name="message" src="chatshow.aspx" width="600px" scrolling="auto" frameborder="0"></iframe>
    </div>
	<div>
        <iframe id="f2" name="say" src="chatsend.aspx" width="600px" height="300px" scrolling="no" frameborder="0"></iframe>
	</div>
        </div>
</body>
</html>
