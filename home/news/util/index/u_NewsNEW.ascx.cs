using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_news_util_index_u_NewsNEW : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadItemsList();
    }
    protected void LoadItemsList()
    {
        string str = "";
        string str1 = "";
        int top = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_prdnumnew, lang));
        string condition = " vcode ='" + WEB.Common.mod_news + "' and istatus = 1";
        string[] fieldsearch = { "vparam4" };
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, "1", condition, 0, 4, "iparam1 asc , dupdate asc");
        rp_items.DataSource = dt;
        rp_items.DataBind();
    }
}