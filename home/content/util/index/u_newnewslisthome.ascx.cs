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

public partial class home_news_index_u_newnewslisthome : System.Web.UI.UserControl
{
    public int i = 0;
    public string weburl = WEB.Common.Weburl;
    public string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadItemsList();
    }
    protected void LoadItemsList()
    {
        DataTable dt = new DataTable();
        dt = WEB.Category.getlistcate(WEB.Common.mod_news, "vparam4='1'", "iorders asc", "1");
        if (dt.Rows.Count > 0)
        {
            rp_items.DataSource = dt;
            rp_items.DataBind();
        }
        
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
    public string css()
{
    i++;
	return i.ToString();
}
}
