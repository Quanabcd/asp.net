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

public partial class home_news_default_u_news_detail : System.Web.UI.UserControl
{
    public string WebURL = WEB.Common.Weburl;
    public string lang = WEB.Common.Lang;
    public int iid = 0;
    public int icid = 0;
    public string alias = "";
    DataTable prodetail = new DataTable();
    public ArrayList ar = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {

        alias = WEB.Common.GeturlParam("alias");
        string title = "";
        DataTable dt = WEB.Items.getitembyfield("valias", alias);
        string desc_web = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, lang);
        string key_web = WEB.Config.getvaluebykey(WEB.Config.k_webkeyword, lang);
        string t_web = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, lang);
        string image = "";
        if (dt.Rows.Count > 0)
        {
            lttitle.Text = dt.Rows[0]["vtitle"].ToString();
            //ltdesc.Text = dt.Rows[0]["vdesc"].ToString();
            icid = Convert.ToInt32(dt.Rows[0]["icid"].ToString());
            roadlink(dt.Rows[0]["icid"].ToString());
            iid = Convert.ToInt32(dt.Rows[0]["iid"].ToString());
            ltcontent.Text = dt.Rows[0]["vcontent"].ToString();
            t_web = dt.Rows[0]["vparam1"].ToString();
            key_web = dt.Rows[0]["vparam2"].ToString();
            desc_web = dt.Rows[0]["vparam3"].ToString();
            iid = Convert.ToInt32(dt.Rows[0]["iid"]);
            image = dt.Rows[0]["vimg"].ToString();
            if (image.Length == 0)
                image = "default.jpg";
            ltdate.Text = Convert.ToDateTime(dt.Rows[0]["dcreatedate"]).ToString("dd/MM/yyyy");
            //ltviews.Text = dt.Rows[0]["iviews"].ToString();
            if (WEB.Common.getCookie("cont-views") == null || WEB.Common.getCookie("cont-views") == "" || WEB.Common.getCookie("cont-views").Contains("|" + iid.ToString() + "|") == false)
            {
                string s = WEB.Common.getCookie("cont-views");
                WEB.Items.updateview(iid.ToString());
                WEB.Common.SetCookie("cont-views", s + "|" + iid.ToString() + "|", 24 * 60);
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
                    if (hm1 != null && hm1.Name.ToString().Trim() == "ogimage")
                    {
                        hm1.Content = WebURL + "uploads/contents/" + image;
                    }
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
                        hm1.Content = WebURL + alias;
                    }
                    HtmlLink linkcanonical = c as HtmlLink;
                    if (linkcanonical != null && linkcanonical.Attributes["rel"].Equals("canonical", StringComparison.InvariantCultureIgnoreCase))
                    {
                        linkcanonical.Attributes.Add("href", WebURL + alias);
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

            //this.Page.Title = t_web;
        }
        catch { }



    }
    protected void loaditemother(int num)
    {
        string listcid_child = WEB.Category.getlistcate_string(icid.ToString(), WEB.Common.mod_news, lang, "1");
        string[] fieldsearch = { };
        string condition = " vcode ='" + WEB.Common.mod_news + "' and icid in (" + listcid_child + ") and iid !=" + iid.ToString();
        string key = "";
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, 0, num, " dupdate DESC ");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["iid"].ToString().Equals(iid.ToString()))
                {
                    dt.Rows.RemoveAt(i);
                    break;
                }
            }
        }
        //rpitems.DataSource = dt;
        //rpitems.DataBind();
        //if (dt.Rows.Count < 1)
        //    rpitems.Visible = false;
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
