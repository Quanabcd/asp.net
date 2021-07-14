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

public partial class home_news_default_u_files_cate : System.Web.UI.UserControl
{
    public string catename = WEB.Common.Getlabel("lb_thuvientailieu", "Thư viện tài liệu", WEB.Common.Lang);
    public int p = 0;
    public string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
    public int numitems = 0;
    public int icid = -1;
    public string alias = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            string desc_web = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, lang);
            string key_web = WEB.Config.getvaluebykey(WEB.Config.k_webkeyword, lang);
            string t_web = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, lang);
            //cate detail
            alias = WEB.Common.GeturlParam("alias");
            if (alias.Length > 0)
            {
                DataTable dtcate = WEB.Category.getcatebyfield("valias", alias);
                if (dtcate.Rows.Count > 0)
                {
                    this.catename = dtcate.Rows[0]["vname"].ToString();
                    if (WEB.Common.GeturlParam("icid").ToString().Equals("-1"))
                    {
                        icid = -1;
                    }
                    else
                    {
                        icid = Convert.ToInt32(dtcate.Rows[0]["icid"]);
                    }
                    numitems = WEB.Items.getnumitems("", new string[0], WEB.Common.mod_files, icid.ToString(), lang, "", "1");
                    t_web = this.catename;
                    key_web = this.catename + "," + WEB.Common.GetNewTitle(this.catename);
                    desc_web = this.catename + ", " + WEB.Config.getvaluebykey(WEB.Config.k_webdesc, lang);
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
            }
            else
            {
                numitems = WEB.Items.getnumitems("", new string[0], WEB.Common.mod_files, icid.ToString(), lang, "", "1");
                t_web = catename;
            }
            Page.Title = t_web;
            try
            {
                if (this.Page.Header != null)
                {
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
                            hm1.Content = weburl + alias;
                        }
                        HtmlLink linkcanonical = c as HtmlLink;
                        if (linkcanonical != null && linkcanonical.Attributes["rel"].Equals("canonical", StringComparison.InvariantCultureIgnoreCase))
                        {
                            linkcanonical.Attributes.Add("href", weburl +"thu-vien-tai-lieu/" + alias);
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
        string condition = "";
        string listcid_child = "";
        if (icid != -1)
        {
            listcid_child = WEB.Category.getlistcate_string(icid.ToString(), WEB.Common.mod_files, lang, "1");
            condition = " vcode ='" + WEB.Common.mod_files + "' and icid in (" + listcid_child + ") and istatus=1 ";
        }
        else
        {
            condition = " vcode ='" + WEB.Common.mod_files + "'  and istatus=1 ";
        }
        int itemperpage = 20;
        itemperpage = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_nwsperpage, lang));
        string key = "";
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, p - 1, itemperpage, "iparam1 asc, dcreatedate DESC ");
        rpitems.DataSource = dt;
        rpitems.DataBind();
        if (alias == "" && icid == -1)
            alias = "thu-vien-tai-lieu";
        string urlparam = "";
        if (urlparam.Length == 0)
            ltpage.Text = WEB.Common.PhanTrangRewrite(weburl + alias, p, numitems, itemperpage);
        else
            ltpage.Text = WEB.Common.PhanTrang(weburl + alias + urlparam, p, numitems, itemperpage);
    }
}
