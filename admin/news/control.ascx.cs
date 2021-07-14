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

public partial class admin_news_control : System.Web.UI.UserControl
{
    public string role = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = -1;
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("id")))
        {
            id = Convert.ToInt32(WEB.Common.GeturlParam("id"));
        }
        string c = "";
        role = Session["role"].ToString();
        c = WEB.Common.GeturlParam("c");
        switch (c)
        {
            case "cate":
                if (checkrole("211") == true)
                 Controls.Add(LoadControl("category.ascx"));
                break;
            case "items":
                if (checkrole("212") == true)
                {
                    if (id != -1)
                        Controls.Add(LoadControl("item_edit.ascx"));
                    else
                        Controls.Add(LoadControl("item.ascx"));
                }
                break;
            case "settings":
                if (checkrole("213") == true)
                Controls.Add(LoadControl("setting.ascx"));
                break;
            case "group":
                if (checkrole("214") == true)
                    Controls.Add(LoadControl("group.ascx"));
                break;
            default:
                if (checkrole("211") == true)
                Controls.Add(LoadControl("category.ascx"));
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
