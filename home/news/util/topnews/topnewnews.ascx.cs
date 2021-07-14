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
    public string weburl = TN.Common.Weburl;
    public string lang = TN.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadItemsList();
    }
    protected void LoadItemsList()
    {
        int top = 5;
        string[] fieldsearch = { "vparam4" };
        DataTable dt = new DataTable();
        dt = TN.Items.GetListItemInCateByPage("-1",fieldsearch, "1", TN.Common.mod_news,lang,"","1", 0, top, "iparam1 asc, dcreatedate DESC");
        rpitems.DataSource = dt;
        rpitems.DataBind();
    }
    
}
