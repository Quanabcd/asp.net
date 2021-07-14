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

public partial class admin_contacts_control : System.Web.UI.UserControl
{
    public string role = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string c = "";
        role = Session["role"].ToString();
        c = WEB.Common.GeturlParam("c");
        switch (c)
        {
            case "items":
                if (checkrole("771") == true)
                    Controls.Add(LoadControl("item_comment.ascx"));
                break;
            case "setting":
                if (checkrole("772") == true)
                    Controls.Add(LoadControl("setting.ascx"));
                break;
         
            default:
                if (checkrole("771") == true)
                    Controls.Add(LoadControl("item_comment.ascx"));
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
