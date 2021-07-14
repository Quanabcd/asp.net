using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_member_until_infobasic : System.Web.UI.UserControl
{
    public string lan = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            ltinfor.Text = "<li class='mhello'><span>" + WEB.Common.Getlabel("lt_titlehello", "Xin chào: ", lan) + "</span><a href='/account/info'>" + Session["user"] + "</a></li>";
            ltinfor.Text += "<li  class='mlogout'><a href='/account/logout' title='" + WEB.Common.Getlabel("lt_titlelogout", "Thoát", lan) + "'>" + WEB.Common.Getlabel("lt_titlelogout", "Thoát", lan) + "</a></li>";
        }
        else
        {
            ltinfor.Text = "<li class='mlogin'><a href='/account/login' title='" + WEB.Common.Getlabel("lt_titlelogin", "Đăng nhập", lan) + "'>" + WEB.Common.Getlabel("lt_titlelogin", "Đăng nhập", lan) + "</a></li>";
            ltinfor.Text += "<li  class='mregister'><a href='/account/register' title='" + WEB.Common.Getlabel("lt_titleregister1", "Đăng ký", lan) + "'>" + WEB.Common.Getlabel("lt_titleregister1", "Đăng ký", lan) + "</a></li>";
        }
    }
}