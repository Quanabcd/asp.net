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

public partial class home_news_default_u_files_detail : System.Web.UI.UserControl
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
                
                icid = Convert.ToInt32(dt.Rows[0]["icid"].ToString());
                iid = Convert.ToInt32(dt.Rows[0]["iid"].ToString());
                ltcontent.Text = dt.Rows[0]["vcontent"].ToString();
                t_web = dt.Rows[0]["vparam1"].ToString();
                key_web = dt.Rows[0]["vparam2"].ToString();
                image = dt.Rows[0]["vimg"].ToString();
                desc_web = dt.Rows[0]["vparam3"].ToString();
                iid = Convert.ToInt32(dt.Rows[0]["iid"]);
                ltdate.Text = Convert.ToDateTime(dt.Rows[0]["dcreatedate"]).ToString("dd/MM/yyyy");
                ltviews.Text = dt.Rows[0]["iviews"].ToString();
                if (Session["user"] != null)
                {
                    if (dt.Rows[0]["vparam10"].ToString().Length>0)
                        ltdownload.Text = "Tải tài liệu <a href='/uploads/file/" + dt.Rows[0]["vparam10"].ToString() + "' title='Tải tài liệu'>" + dt.Rows[0]["vparam10"].ToString() + "</a>";
                }
                else
                    ltdownload.Text = "<a href='/account/login?url="  + WebURL + "thu-vien-tai-lieu/" + alias + "' title='Đăng nhập tài khoản'>Đăng nhập</a> để tải tài liệu | Nếu bạn chưa có tài khoản xin mời <a href='/account/register' title='Đăng ký tài khoản'>đăng ký</a>";
                if (WEB.Common.getCookie("files-views") == null || WEB.Common.getCookie("files-views") == "" || WEB.Common.getCookie("files-views").Contains("|" + iid.ToString() + "|") == false)
                {
                    string s = WEB.Common.getCookie("files-views");
                    WEB.Items.updateview(iid.ToString());
                    WEB.Common.SetCookie("files-views", s + "|" + iid.ToString() + "|", 24 * 60);
                }
                string[] arrtagfull = dt.Rows[0]["vparam7"].ToString().Split(',');
                string[] arrtagnosign = dt.Rows[0]["vparam8"].ToString().Split(',');
                if (arrtagfull.Length > 0)
                {
                    for (int i = 0; i < arrtagfull.Length; i++)
                    {
                        if(i<arrtagfull.Length-1)
                            lttag.Text += "<a href='/tags/" + arrtagnosign[i]+ "' title='" + arrtagfull[i] + "'>" + arrtagfull[i] + "</a>" + " , ";
                        else
                            lttag.Text += "<a href='/tags/" + arrtagnosign[i] + "' title='" + arrtagfull[i] + "'>" + arrtagfull[i] + "</a>";
                    }
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
                            hm1.Content = WebURL + "uploads/files/images/" + image;
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
                            linkcanonical.Attributes.Add("href", WebURL + "thu-vien-tai-lieu/" + alias);
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
        string listcid_child = WEB.Category.getlistcate_string(icid.ToString(), WEB.Common.mod_files, lang, "1");
        string[] fieldsearch = { };
        string condition = " vcode ='" + WEB.Common.mod_files + "' and icid in (" + listcid_child + ") and iid !=" + iid.ToString();
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
