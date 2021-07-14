using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class admin_menus_control : System.Web.UI.UserControl
{
    public string role = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        role = Session["role"].ToString();
        string c = "";
        c = WEB.Common.GeturlParam("c");
        switch (c)
        {
            case "mainmenu":
                if (checkrole("900") == true)
                Controls.Add(LoadControl("menu.ascx"));
                break;
            case "upmenu":
                if (checkrole("901") == true)
                Controls.Add(LoadControl("u_menutop.ascx"));
                break;
            case "downmenu":
                if (checkrole("902") == true)
                Controls.Add(LoadControl("u_menubottom.ascx"));
                break;
            case "contents":
                if (checkrole("903") == true)
                Controls.Add(LoadControl("u_menucontent.ascx"));
                break;
            default:
                if (checkrole("900") == true)
                Controls.Add(LoadControl("menu.ascx"));
                break;
        }
        
    }
    public bool checkrole(string s)
    {
        if (role.Contains("|" + s + "|"))
            return true;
        else
            return false;
    }
}
