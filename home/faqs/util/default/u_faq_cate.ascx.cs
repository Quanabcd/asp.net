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

public partial class home_faq_default_u_news_cate : System.Web.UI.UserControl
{
    public string catename =WEB.Common.Getlabel("lb_hoidap", "Hỏi đáp", WEB.Common.Lang);
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

                    icid = Convert.ToInt32(dtcate.Rows[0]["icid"]);
                    numitems = WEB.Items.getnumitems("", new string[0], "FAQ", icid.ToString(), lang, "", "1");
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
            ltcatename.Text = catename;
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
        }
        DataTable dicid = WEB.Category.getcatebyfield("valias", alias);
        string[] fieldsearch = { };
        string condition = "";
        int itemperpage = 10;
     
        string key = "";
        DataTable dt = new DataTable();
        numitems = WEB.Items.getnumitems(key, fieldsearch, "FAQ", icid.ToString(), lang, condition, "1");
        dt = WEB.Items.getlistitembypage(icid.ToString(), fieldsearch, key, "FAQ", lang, condition, "1", p - 1, itemperpage, "iparam2 asc, dcreatedate DESC ");
        //dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, p, itemperpage, "iparam1 asc, dcreatedate DESC ");
     
        if (alias == "" && icid == -1)
            alias = "hoi-dap";
        rpitems.DataSource = dt;
        rpitems.DataBind();
        ltpage.Text = WEB.Common.PhanTrangRewrite(weburl +alias, p, numitems, itemperpage);
    }
}
