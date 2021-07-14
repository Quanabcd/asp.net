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

public partial class admin_weblinks_control : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string c = "";
        c = WEB.Common.GeturlParam("c");
        switch (c)
        {
            case "supports":
                Controls.Add(LoadControl("support.ascx"));
                break;
            case "hotlines":
                Controls.Add(LoadControl("u_hotline.ascx"));
                break;
            case "advs":
                Controls.Add(LoadControl("adv.ascx"));
                break;
            case "positionsadvs":
                Controls.Add(LoadControl("positionsadvs.ascx"));
                break;
            case "weblinks":
                Controls.Add(LoadControl("weblink.ascx"));
                break;
            case "survey":
                Controls.Add(LoadControl("poll.ascx"));
                break;
            case "independent":
                Controls.Add(LoadControl("independent.ascx"));
                break;
            case "emailregister":
                Controls.Add(LoadControl("email_register.ascx"));
                break;
            default:
                Controls.Add(LoadControl("support.ascx"));
                break;
        }

    }
}
