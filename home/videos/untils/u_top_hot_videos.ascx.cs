using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_videos_untils_u_top_hot_videos : System.Web.UI.UserControl
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
        dt = WEB.Items.getlistitembypage(new string[0], "", "vcode ='" + WEB.Common.mod_videos + "' and vparam4 like '%2%' and istatus=1 and vlan='" + WEB.Common.Lang + "'", 0, 5, " iparam1 asc, dcreatedate DESC ");
        if (dt.Rows.Count > 0)
        {
            string url = dt.Rows[0]["vparam6"].ToString();
            int pos1 = url.IndexOf("?v=");
            int pos2 = url.IndexOf("&");
            string videoCode = pos2 > pos1 ? url.Substring(pos1 + 3, pos2 - pos1 - 3) : url.Substring(pos1 + 3);
            ltvideo.Text = "<iframe width='99%' height='180' src='http://www.youtube.com/embed/" + videoCode + "'  frameborder='0' allowfullscreen ></iframe>";
            dt.Rows.RemoveAt(0);
        }
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