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

public partial class admin_albums_control : System.Web.UI.UserControl
{
    public string role = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        role = Session["role"].ToString();
        string c = "";
        c = WEB.Common.GeturlParam("c");
        switch (c)
        {
            case "cates":
                if (checkrole("251") == true)
                Controls.Add(LoadControl("category.ascx"));
                break;
            case "items":
                if (checkrole("252") == true)
                Controls.Add(LoadControl("item.ascx"));
                break;
           
            default:
                if (checkrole("251") == true)
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
