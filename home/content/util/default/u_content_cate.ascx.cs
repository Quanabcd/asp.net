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

public partial class home_news_default_u_news_cate : System.Web.UI.UserControl
{
    public string catename = TN.Common.GetLabel("lb_noidung", "Nội dung", TN.Common.Lang);
    public int p = 0;
    public string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
    public int numitems = 0;
    public int icid = -1;
    public string alias = "";
    public ArrayList ar = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {

        string desc_web = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, lang);
        string key_web = WEB.Config.getvaluebykey(WEB.Config.k_webkeyword, lang);
        string t_web = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, lang);
        //cate detail
        alias = WEB.Common.GeturlParam("alias");
        DataTable dtcate = WEB.Category.getcatebyfield("valias", alias);
        if (dtcate.Rows.Count > 0)
        {
           ltname.Text= this.catename = dtcate.Rows[0]["vname"].ToString();
            //ltcatename.Text = dtcate.Rows[0]["vname"].ToString();
            icid = Convert.ToInt32(dtcate.Rows[0]["icid"]);
            roadlink(dtcate.Rows[0]["icid"].ToString());
            icid = Convert.ToInt32(dtcate.Rows[0]["icid"]);
            numitems = WEB.Items.getnumitems("", new string[0], WEB.Common.mod_content, icid.ToString(), lang, "", "1");
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
    protected void LoadItemsList()
    {
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("p")))
        {
            p = Convert.ToInt32(WEB.Common.GeturlParam("p"));
        }
        DataTable dicid = WEB.Category.getcatebyfield("valias", alias);
        string[] fieldsearch = { };
        string condition = "";
        int itemperpage = 20;
        itemperpage = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_nwsperpage, lang));
        string key = "";
        DataTable dt = new DataTable();
        numitems = WEB.Items.getnumitems(key, fieldsearch, WEB.Common.mod_content, icid.ToString(), lang, condition, "1");
        dt = WEB.Items.getlistitembypage(icid.ToString(), fieldsearch, key, WEB.Common.mod_content, lang, condition, "1", p - 1, itemperpage, "iparam2 asc, dcreatedate DESC ");
        //dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, p, itemperpage, "iparam1 asc, dcreatedate DESC ");
        if (dt.Rows.Count == 1)
            Response.Redirect(weburl + dt.Rows[0]["valias"].ToString());
        if (alias == "" && icid == -1)
            alias = "noi-dung";
        rpitems.DataSource = dt;
        rpitems.DataBind();
        ltpage.Text = WEB.Common.PhanTrangRewrite(weburl + alias, p, numitems, itemperpage);
    }

    protected void roadlink(string cid)
    {
        string str = "";
        ar.Add(cid);
        DataTable dt = WEB.Category.getcatebyfield("icid", cid);
        if (dt.Rows.Count > 0)
        {
            getpar(dt.Rows[0]["iparcid"].ToString());
        }
        if (ar.Count > 0)
        {
            for (int i = ar.Count - 1; i >= 0; i--)
            {
                DataTable dtc = WEB.Category.getcatebyfield("icid", ar[i].ToString());
                if (dtc.Rows.Count > 0)
                {

                    DataTable dtcc = new DataTable();
                    WEB.Category.getcategory(ref dtcc, dtc.Rows[0]["icid"].ToString(), WEB.Common.mod_news, lang, "", "1");
                    if (dtcc.Rows.Count > 0)
                    {

                        str += "<li><a href='/" + dtc.Rows[0]["valias"].ToString() + "' class='' title='" + dtc.Rows[0]["vname"].ToString() + "'>" + dtc.Rows[0]["vname"].ToString() + "</a>";

                        for (int j = 0; j < dtcc.Rows.Count; j++)
                        {

                            str += "<li><a href='/" + dtcc.Rows[j]["valias"].ToString() + "'  title='" + dtcc.Rows[j]["vname"].ToString() + "'>" + dtcc.Rows[j]["vname"].ToString() + "</a></li>";
                        }
                    }
                    else
                    {

                        str += "<li><a href='/" + dtc.Rows[0]["valias"].ToString() + "' class='' title='" + dtc.Rows[0]["vname"].ToString() + "'>" + dtc.Rows[0]["vname"].ToString() + "</a>";
                    }


                }
            }
        }
        ltrl.Text = str;
    }
    protected void getpar(string cid)
    {
        if (cid != "-1")
            ar.Add(cid);
        DataTable dt = WEB.Category.getcatebyfield("icid", cid);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["iparcid"].ToString() != "-1")
            {
                //   ar.Add(dt.Rows[0]["iparcid"].ToString());
                getpar(dt.Rows[0]["iparcid"].ToString());
            }
        }
    }
}
