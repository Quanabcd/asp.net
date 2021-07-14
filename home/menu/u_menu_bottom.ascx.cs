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

public partial class home_menu_u_menu_bottom : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    protected void Page_Load(object sender, EventArgs e)
    {
        Loaditems();
    }
    protected void Loaditems()
    {
        string conditions = "";
        DataTable dt = WEB.Category.getlistcate("MNT", conditions, "iorders ASC", "1");
        if (dt.Rows.Count > 0)
        {
            lt_items.Text += "<ul>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                lt_items.Text += "<li>";
                lt_items.Text += "<a href='" + dt.Rows[i]["vdesc"].ToString() + "' title='" + dt.Rows[i]["vname"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a>";
                lt_items.Text += "</li>";
            }
            lt_items.Text += "</ul>";
        }
    }
}