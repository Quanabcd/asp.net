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

public partial class home_news_default_u_news_tag : System.Web.UI.UserControl
{
    public string catename = "Tin tức";
    public int p = 0;
    public string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
    public int numitems = 0;
    public int icid = -1;
    public string alias = "";
    public string tag = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            string desc_web = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, lang);
            string key_web = WEB.Config.getvaluebykey(WEB.Config.k_webkeyword, lang);
            string t_web = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, lang);
            tag = WEB.Common.GeturlParam("tag");
            Page.Title = t_web;
            try
            {
                if (this.Page.Header != null)
                {
                    foreach (Control c in this.Page.Header.Controls)
                    {
                        HtmlMeta hm1 = c as HtmlMeta;
                        if (hm1 != null && hm1.Name.Equals("description", StringComparison.InvariantCultureIgnoreCase))
                        {
                            hm1.Content = desc_web;
                        }
                        if (hm1 != null && hm1.Name.Equals("keywords", StringComparison.InvariantCultureIgnoreCase))
                        {
                            hm1.Content = key_web;
                        }
                    }
                }
                this.Page.Title = t_web;
            }
            catch { }
            LoadItemsList();
        }
    }
    protected void LoadItemsList()
    {
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("p")))
        {
            p = Convert.ToInt32(WEB.Common.GeturlParam("p"));
            if (p < 1)
                p = 1;
        }
        DataTable dicid = WEB.Category.getcatebyfield("valias", alias);
        string[] fieldsearch = { };
        string condition = " vcode ='" + WEB.Common.mod_news + "'  and istatus=1 and vlan='"  + lang + "'";
        string listcid_child = "";
        if (icid != -1)
        {
            listcid_child = WEB.Category.getlistcate_string(icid.ToString(), WEB.Common.mod_news, lang, "1");
            condition = " vcode ='" + WEB.Common.mod_news + "' and icid in (" + listcid_child + ") and istatus=1 and vlan='" + lang + "'";
        }
        if (tag.Length > 0)
            condition += " and vparam8 like '%," + tag + ",%' ";
        numitems = WEB.Items.getnumitems("", new string[0], WEB.Common.mod_news, icid.ToString(), lang,condition, "1");
        int itemperpage = 20;
        if (WEB.Common.Check_number(WEB.Config.getvaluebykey(WEB.Config.k_nwsperpage, lang)))
        {
            itemperpage = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_nwsperpage, lang));
        }
        string key = "";
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, p-1, itemperpage, "iparam1 asc, dcreatedate DESC ");
        rpitems.DataSource = dt;
        rpitems.DataBind();
        ltpage.Text = WEB.Common.PhanTrangRewrite(weburl +"tag/" + alias, p, numitems, itemperpage);
    }
}
