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

public partial class home_news_default_u_services_cate : System.Web.UI.UserControl
{
    public string catename = TN.Common.GetLabel("lb_dichvu", "Dịch vụ", TN.Common.Lang);
    public int p = 1;
    public string lang = TN.Common.Lang;
    public string weburl = TN.Common.Weburl;
    public int numitems = 0;
    public int icid = -1;
    public string alias = "";
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (TN.Common.CheckNumber(TN.Common.GetUrlParam("p")))
        {
            p = Convert.ToInt32(TN.Common.GetUrlParam("p"));
            if (p < 1)
                p = 1;
        }
        string desc_web = TN.Configs.GetValueByKey(WEB.Config.k_webdesc, lang);
        string key_web = TN.Configs.GetValueByKey(WEB.Config.k_webkeyword, lang);
        string t_web = TN.Configs.GetValueByKey(WEB.Config.k_webtitle, lang);
        //cate detail
        alias = TN.Common.GetUrlParam("alias");
        DataTable dtcate = TN.Categories.GetCateDetailByField("valias", alias);
        if (dtcate.Rows.Count > 0)
        {
            this.catename = dtcate.Rows[0]["vname"].ToString();
            icid = Convert.ToInt32(dtcate.Rows[0]["icid"]);
            numitems = TN.Items.GetNumItemsInCate(icid.ToString(), new string[0], "", TN.Common.mod_service, lang, "", "1");
            t_web = this.catename;
            key_web = this.catename;
            desc_web = this.catename + ", " + TN.Configs.GetValueByKey(WEB.Config.k_webdesc, lang);
            if (dtcate.Rows[0]["vparam3"].ToString().Length > 1)
            {
                desc_web = dtcate.Rows[0]["vparam3"].ToString();
            }
            if (dtcate.Rows[0]["vparam2"].ToString().Length > 1)
            {
                key_web = dtcate.Rows[0]["vparam2"].ToString();
            }
            if (dtcate.Rows[0]["vparam1"].ToString().Length > 1)
            {
                t_web = dtcate.Rows[0]["vparam1"].ToString();
            }
        }
        if (p > 1)
        {
            t_web += " | trang " + p.ToString();
            desc_web += " | trang " + p.ToString();
        }
        Page.Title = t_web;
        try
        {
            if (this.Page.Header != null)
            {
                string urlparam = "";
                if (p != 0)
                    urlparam = "/trang-" + p.ToString();
                foreach (Control c in this.Page.Header.Controls)
                {
                    HtmlMeta hm1 = c as HtmlMeta;

                    if (hm1 != null && hm1.Name.ToString().Trim() == "ogtitle")
                    {
                        hm1.Content = t_web;
                    }
                    if (hm1 != null && hm1.Name.ToString().Trim().Contains("ogdescription"))
                    {
                        hm1.Content = desc_web;
                    }
                    if (hm1 != null && hm1.Name.Equals("ogurl", StringComparison.InvariantCultureIgnoreCase))
                    {
                        hm1.Content = weburl + alias + urlparam;
                    }
                    HtmlLink linkcanonical = c as HtmlLink;
                    if (linkcanonical != null && linkcanonical.Attributes["rel"].Equals("canonical", StringComparison.InvariantCultureIgnoreCase))
                    {
                        linkcanonical.Attributes.Add("href", weburl + alias + urlparam);
                    }
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
    protected void LoadItemsList()
    {

        DataTable dicid = TN.Categories.GetCateDetailByField("valias", alias);
        string[] fieldsearch = { };
        int itemperpage = 20;
        if (TN.Common.CheckNumber(TN.Configs.GetValueByKey(WEB.Config.k_nwsperpage, lang)))
        {
            itemperpage = Convert.ToInt32(TN.Configs.GetValueByKey(WEB.Config.k_nwsperpage, lang));
        }
        DataTable dt = new DataTable();
        dt = TN.Items.GetListItemInCateByPage(icid.ToString(), fieldsearch, "", TN.Common.mod_service, TN.Common.Lang, "1=1", "1", p - 1, itemperpage, "iparam1 asc, dcreatedate DESC ");
        rpitems.DataSource = dt;
        rpitems.DataBind();
        ltpage.Text = TN.Common.PhanTrangRewrite(weburl + alias, p, numitems, itemperpage);
    }
}
