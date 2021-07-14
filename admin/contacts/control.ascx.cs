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
    protected void Page_Load(object sender, EventArgs e)
    {
        string c = "";
        c = WEB.Common.GeturlParam("c");
        switch (c)
        {
            case "items":
                Controls.Add(LoadControl("contact.ascx"));
                break;
            case "contents":
                Controls.Add(LoadControl("contents.ascx"));
                break;
            case "settings":
                Controls.Add(LoadControl("setting.ascx"));
                break;
            default:
                Controls.Add(LoadControl("contact.ascx"));
                break;
        }
    }
}
