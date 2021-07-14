<%@ page language="C#" autoeventwireup="true" inherits="admin_index, App_Web_ywncmfio" validaterequest="false" enableeventvalidation="false" %>
<%@ Register Src="controls.ascx" TagName="controls" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản trị website</title>
    <link rel="stylesheet" href="../templates/admin/css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="../templates/admin/css/general.css" type="text/css" />
    <link rel="stylesheet" href="../templates/admin/css/style.css" type="text/css" />
    <link rel="stylesheet" href="../templates/admin/css/font-awesome.min.css" type="text/css" />
    <script type="text/javascript" src="<%=weburl %>templates/admin/js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="<%=weburl %>templates/admin/js/jquery.socket-1.0.1.js"></script>
	<script type="text/javascript" src="<%=weburl %>templates/admin/js/utils.js"></script>
    <script type="text/javascript" src="<%=weburl %>templates/admin/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=weburl %>templates/admin/js/ddaccordion.js"></script>
	<script type="text/javascript" src="<%=weburl %>templates/admin/js/script.js"></script>
<link rel="stylesheet" type="text/css" href="../templates/admin/css/tab/easy-responsive-tabs.css " />
    <script src="<%=weburl%>templates/admin/js/tab/easyResponsiveTabs.js"></script>
     	<script type="text/javascript" src="<%=weburl %>templates/admin/js/jquery.validate.js"></script>
	<script type="text/javascript">
		function heartBeat() {
		    $.get("KeepSession.ashx?", function (data) {  });
		}
		$(function () {
            setInterval("heartBeat()", 1000 * 60); // 60s gửi request một lần
		});
	</script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1"  EnableCdn="true" runat="server">
    </asp:ScriptManager>
        <uc1:controls ID="controls1" runat="server" />
    </form>
</body>
</html>
