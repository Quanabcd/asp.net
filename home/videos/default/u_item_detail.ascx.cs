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
public partial class home_videos_default_u_item_detail : System.Web.UI.UserControl
{
    public string WebURL = WEB.Common.Weburl;
    public string lang = WEB.Common.Lang;
    public int iid = 0;
    public int icid = 0;
    public string alias = "";
    DataTable prodetail = new DataTable();
    public string strroad = "";
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
                ltdetail.Text = dt.Rows[0]["vtitle"].ToString();
                iid = Convert.ToInt32(dt.Rows[0]["iid"].ToString());
                icid = Convert.ToInt32(dt.Rows[0]["icid"].ToString());
                ltcontent.Text = dt.Rows[0]["vcontent"].ToString();
                image = dt.Rows[0]["vimg"].ToString();
                ltdesc.Text = dt.Rows[0]["vdesc"].ToString();
                t_web = dt.Rows[0]["vparam1"].ToString();
                key_web = dt.Rows[0]["vparam2"].ToString();
                desc_web = dt.Rows[0]["vparam3"].ToString();
                ltdate.Text = Convert.ToDateTime(dt.Rows[0]["dcreatedate"]).ToString("dd/MM/yyyy");
                ltviews.Text = dt.Rows[0]["iviews"].ToString();
                if (WEB.Common.getCookie("vd-views") == null || WEB.Common.getCookie("vd-views") == "" || WEB.Common.getCookie("vd-views").Contains("|" + iid.ToString() +"|") == false )
                {
                    string s = WEB.Common.getCookie("vd-views");
                    WEB.Items.updateview(iid.ToString());
                    WEB.Common.SetCookie("vd-views", s+ "|" + iid.ToString() + "|", 24 * 60);
                }
                string url = dt.Rows[0]["vparam6"].ToString();
                int pos1 = url.IndexOf("?v=");
                int pos2 = url.IndexOf("&");
                string videoCode = pos2 > pos1 ? url.Substring(pos1 + 3, pos2 - pos1 - 3) : url.Substring(pos1 + 3);
                ltvideo.Text = "<iframe width='90%' height='380' src='http://www.youtube.com/embed/" + videoCode + "'  frameborder='0' allowfullscreen ></iframe>";
                loaditemother(12);
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
                            hm1.Content = WebURL + "uploads/videos/" + image;
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
                            hm1.Content = WebURL +"videos/" +  alias;
                        }
                        HtmlLink linkcanonical = c as HtmlLink;
                        if (linkcanonical != null && linkcanonical.Attributes["rel"].Equals("canonical", StringComparison.InvariantCultureIgnoreCase))
                        {
                            linkcanonical.Attributes.Add("href", WebURL + "videos/" + alias);
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
            }
            catch { }

        }

    }
    public string getimg(string img, string alt)
    {
        if (img.Length > 0)
        {
            return "<img src='" + WEB.Common.Weburl + "uploads/videos/" + img + "' alt='" + alt + "' />";
        }
        else
            return "<img src='" + WEB.Common.Weburl + "uploads/default/videodefault.png' alt='" + alt + "' />";
    }
    protected void loaditemother(int num)
    {
        string listcid_child = WEB.Category.getlistcate_string(icid.ToString(), WEB.Common.mod_videos, lang, "1");
        string[] fieldsearch = { };
        string condition = " vcode ='" + WEB.Common.mod_videos + "' and icid in (" + listcid_child + ") and iid != " + iid.ToString();
        string key = "";
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, 0, num, " iparam1 asc, dcreatedate DESC ");
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
        rpsames.DataSource = dt;
        rpsames.DataBind();
        if (dt.Rows.Count < 1)
            rpsames.Visible = false;
    }
}