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

public partial class home_news_default_u_services_detail : System.Web.UI.UserControl
{
    public string WebURL = TN.Common.Weburl;
    public string lang = TN.Common.Lang;
    public int iid = 0;
    public int icid = 0;
    public string alias = "";
    DataTable prodetail = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

        alias = TN.Common.GetUrlParam("alias");
        string title = "";
        DataTable dt = WEB.Items.getitembyfield("valias", alias);
        string desc_web = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, lang);
        string key_web = WEB.Config.getvaluebykey(WEB.Config.k_webkeyword, lang);
        string t_web = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, lang);
        string image = "";
        if (dt.Rows.Count > 0)
        {

            icid = Convert.ToInt32(dt.Rows[0]["icid"].ToString());
            iid = Convert.ToInt32(dt.Rows[0]["iid"].ToString());
            lttitle.Text = dt.Rows[0]["vtitle"].ToString();
            ltcontent.Text = dt.Rows[0]["vcontent"].ToString();
            t_web = dt.Rows[0]["vparam1"].ToString();
            key_web = dt.Rows[0]["vparam2"].ToString();
            desc_web = dt.Rows[0]["vparam3"].ToString();
            image = dt.Rows[0]["vimg"].ToString();
            iid = Convert.ToInt32(dt.Rows[0]["iid"]);
            ltdate.Text = Convert.ToDateTime(dt.Rows[0]["dcreatedate"]).ToString("dd/MM/yyyy");
            ltviews.Text = dt.Rows[0]["iviews"].ToString();
            if (TN.Common.getCookie("services-views") == null || TN.Common.getCookie("services-views") == "" || TN.Common.getCookie("services-views").Contains("|" + iid.ToString() + "|") == false)
            {
                string s = TN.Common.getCookie("services-views");
                WEB.Items.updateview(iid.ToString());
                TN.Common.SetCookie("services-views", s + "|" + iid.ToString() + "|", 24 * 60);
            }
            string[] arrtagfull = dt.Rows[0]["vparam7"].ToString().Split(',');
            string[] arrtagnosign = dt.Rows[0]["vparam8"].ToString().Split(',');
            if (arrtagfull.Length > 0)
            {
                lttag.Text = "Tag: ";
                for (int i = 0; i < arrtagfull.Length; i++)
                {
                    if (i < arrtagfull.Length - 1)
                        lttag.Text += "<a href='/tags/" + arrtagnosign[i] + "' title='" + arrtagfull[i] + "'>" + arrtagfull[i] + "</a>" + " , ";
                    else
                        lttag.Text += "<a href='/tags/" + arrtagnosign[i] + "' title='" + arrtagfull[i] + "'>" + arrtagfull[i] + "</a>";
                }
            }
            loaditemother(5);

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
                        hm1.Content = WebURL + "uploads/services/" + image;
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
            loaditemother(5);
            //this.Page.Title = t_web;
        }
        catch { }



    }

    protected void loaditemother(int num)
    {

        string[] fieldsearch = { };
        string condition = "  iid !=" + iid.ToString();
        DataTable dt = new DataTable();
        dt = TN.Items.GetListItemInCateByPage(icid.ToString(), fieldsearch, "", TN.Common.mod_service, lang, condition, "1", 0, num, " iparam1 asc, dcreatedate DESC ");
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
        rpitems.DataSource = dt;
        rpitems.DataBind();
        //if (dt.Rows.Count < 1)
        //    rpitems.Visible = false;

    }
}
