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

public partial class home_news_topnews_topnewnews : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadItemsList();
    }
    protected void LoadItemsList()
    {
        int top = 4;
        string condition = " vcode ='" + WEB.Common.mod_news + "'";
        string[] fieldsearch = { "vparam4" };
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, "1", condition, 0, top, "dupdate DESC");
        rpitems.DataSource = dt;
        rpitems.DataBind();
    }
    public string Getlink(string conditon, string url)
    {
        string str = "";
        if (conditon.Length > 0)
            str = weburl + conditon;
        else
            str = weburl + url;
        return str;
    }
}
