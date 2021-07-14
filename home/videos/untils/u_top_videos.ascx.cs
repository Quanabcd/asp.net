using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_videos_untils_u_top_videos : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load();
        }
    }
    public void load()
    {
        
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(new string[0], "", "vcode ='" + WEB.Common.mod_videos + "' and istatus=1 and vlan='" + WEB.Common.Lang + "'", 0, 5, " iparam1 asc, dcreatedate DESC ");
        rpitems.DataSource = dt;
        rpitems.DataBind();
    }
    public string getimg(string img, string alt)
    {
        if (img.Length > 0)
        {
            return "<img src='" + WEB.Common.Weburl + "uploads/videos/" + img + "' alt='" + alt + "' />";
        }
        else
            return "<img src='" + WEB.Common.Weburl + "uploads/default/videodefault.png' alt='" + alt + "' />";
    }
}