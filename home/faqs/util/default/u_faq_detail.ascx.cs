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

public partial class home_faq_default_u_news_detail : System.Web.UI.UserControl
{
    public string WebURL = WEB.Common.Weburl;
    public string lang = WEB.Common.Lang;
    public int iid = 0;
    public int icid = 0;
    public string alias = "";
    DataTable prodetail = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
                lttitle.Text = title = dt.Rows[0]["vtitle"].ToString();
                ltdesc.Text = dt.Rows[0]["vdesc"].ToString();
                icid = Convert.ToInt32(dt.Rows[0]["icid"].ToString());
                iid = Convert.ToInt32(dt.Rows[0]["iid"].ToString());
                ltcontent.Text = dt.Rows[0]["vcontent"].ToString();
                ltname.Text = dt.Rows[0]["vparam8"].ToString();
                if (dt.Rows[0]["vparam8"].ToString().Length > 0)
                    ltinfo.Text += dt.Rows[0]["vparam7"].ToString();
                if (dt.Rows[0]["vparam9"].ToString().Length > 0)
                    ltinfo.Text += " - " + dt.Rows[0]["vparam9"].ToString();
                //t_web = dt.Rows[0]["vparam1"].ToString();
               // key_web = dt.Rows[0]["vparam2"].ToString();
               // desc_web = dt.Rows[0]["vparam3"].ToString();
                iid = Convert.ToInt32(dt.Rows[0]["iid"]);
                image = dt.Rows[0]["vimg"].ToString();
                if (image.Length == 0)
                    image = "default.jpg";
                ltdate.Text = Convert.ToDateTime(dt.Rows[0]["dcreatedate"]).ToString("dd/MM/yyyy");
              //  ltviews.Text = dt.Rows[0]["iviews"].ToString();
                if (WEB.Common.getCookie("faq-views") == null || WEB.Common.getCookie("faq-views") == "" || WEB.Common.getCookie("faq-views").Contains("|" + iid.ToString() + "|") == false)
                {
                    string s = WEB.Common.getCookie("faq-views");
                    WEB.Items.updateview(iid.ToString());
                    WEB.Common.SetCookie("faq-views", s + "|" + iid.ToString() + "|", 24 * 60);
                }
            }
            Page.Title = title;
            try
            {
                if (this.Page.Header != null)
                {
                    foreach (Control c in this.Page.Header.Controls)
                    {

                        HtmlMeta hm1 = c as HtmlMeta;
                        //if (hm1 != null && hm1.Name.ToString().Trim() == "ogimage")
                        //{
                        //    hm1.Content = WebURL + "uploads/contents/" + image;
                        //}
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
                            hm1.Content = WebURL + "hoi-dap/" + alias;
                        }
                        HtmlLink linkcanonical = c as HtmlLink;
                        if (linkcanonical != null && linkcanonical.Attributes["rel"].Equals("canonical", StringComparison.InvariantCultureIgnoreCase))
                        {
                            linkcanonical.Attributes.Add("href", WebURL + "hoi-dap/" + alias);
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
        
    }
    protected void loaditemother(int num)
    {
        string listcid_child = WEB.Category.getlistcate_string(icid.ToString(), "FAQ", lang, "1");
        string[] fieldsearch = { };
        string condition = " vcode ='" + "FAQ" + "' and icid in (" + listcid_child + ") and iid !=" + iid.ToString();
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
        rpitems.DataSource = dt;
        rpitems.DataBind();
        if (dt.Rows.Count < 1)
            rpitems.Visible = false;
    }
}
