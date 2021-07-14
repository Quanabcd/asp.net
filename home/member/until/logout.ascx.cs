using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_member_until_logout : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["user"] = null;
        Response.Redirect(WEB.Common.Weburl);
    }
}