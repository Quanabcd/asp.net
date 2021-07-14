<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" EnableViewState="false" EnableEventValidation="false" EnableViewStateMac="false" EnableSessionState="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="vi-vn" lang="vi-vn">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="robots" content="index, follow" />
    <meta http-equiv="Content-Language" content="vi" />
    <meta name="copyright" content="Copyright" />
   
</head>
<body class="">
    <form id="fwrp" runat="server">
        <div id="fb-root"></div>
        <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.0";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>

        <asp:PlaceHolder  ID="phtop" runat="server"></asp:PlaceHolder>
        <asp:PlaceHolder ID="ph_control" runat="server"></asp:PlaceHolder>
        <asp:PlaceHolder ID="phfooter" runat="server"></asp:PlaceHolder>

        <asp:Literal ID="ltremarketing" runat="server"></asp:Literal>
        <asp:Literal ID="ltlivechat" runat="server"></asp:Literal>
    </form>
   
</body>
</html>
