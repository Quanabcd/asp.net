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

public partial class home_untilities_weblink_u_websitelink : System.Web.UI.UserControl
{
    public string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt = WEB.Item_other.getlisitem(WEB.Common.mod_weblink, lang, " istatus='1' ", "iorders ASC");
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ddllink.Items.Add(new ListItem(dt.Rows[i]["vtitle"].ToString(), dt.Rows[i]["vdesc"].ToString()));
                }
            }
        }
    }
    protected void ddllink_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect(ddllink.SelectedValue);
    }
}
