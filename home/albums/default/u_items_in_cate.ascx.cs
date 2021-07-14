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
public partial class home_videos_default_u_items_in_cate : System.Web.UI.UserControl
{
    public string catename =WEB.Common.Getlabel("lb_thuvienanh", "Thư viện ảnh",WEB.Common.Lang);
    public int p = 0;
    public string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
    public int numitems = 0;
    public int icid = -1;
    public string strroad = "";
    public string alias = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string desc_web = "";
            string key_web = "";
            string t_web = catename;
            //cate detail
            alias = WEB.Common.GeturlParam("alias");
            string title = "";
            DataTable dtcate = WEB.Category.getcatebyfield("valias", alias);
            if (dtcate.Rows.Count > 0)
            {
                for (int i = 0; i < dtcate.Rows.Count; i++)
                {
                    if (dtcate.Rows[0]["ccode"].ToString().Trim() == WEB.Common.mod_albums)
                    {
                        this.catename = dtcate.Rows[i]["vname"].ToString();
                        t_web = this.catename;
                        icid = Convert.ToInt32(dtcate.Rows[i]["icid"]);
                        numitems = WEB.Items.getnumitems("", new string[0], WEB.Common.mod_albums, icid.ToString(), lang, "", "1");
                        key_web = this.catename + "," + WEB.Common.GetNewTitle(this.catename);
                        desc_web = this.catename + ", " + WEB.Config.getvaluebykey(WEB.Config.k_webdesc, lang);
                        
                        if (dtcate.Rows[i]["vparam3"].ToString().Length > 1)
                        {
                            desc_web = dtcate.Rows[i]["vparam3"].ToString();
                        }
                        if (dtcate.Rows[i]["vparam2"].ToString().Length > 1)
                        {
                            key_web = dtcate.Rows[i]["vparam2"].ToString();
                        }
                        if (dtcate.Rows[i]["vparam1"].ToString().Length > 1)
                        {
                            t_web = dtcate.Rows[i]["vparam1"].ToString();
                        }
                       
                    }
                }
            }
            DataTable dtc = new DataTable();
            WEB.Category.getcategorylevel1(ref dtc, icid.ToString(), WEB.Common.mod_albums, lang, "1");
            if (dtc.Rows.Count > 0)
            {
                rpcates.DataSource = dtc;
                rpcates.DataBind();
            }
            else
                loaditems();
            ltcatename.Text = this.catename;
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
                            hm1.Content = weburl +"thu-vien-anh/" + alias;
                        }
                        HtmlLink linkcanonical = c as HtmlLink;
                        if (linkcanonical != null && linkcanonical.Attributes["rel"].Equals("canonical", StringComparison.InvariantCultureIgnoreCase))
                        {
                            linkcanonical.Attributes.Add("href", weburl +"thu-vien-anh/" + alias);
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
           
        }
    }
    protected void loadlink(string icid)
    {
        DataTable dt = new DataTable();
        dt = WEB.Category.getcatebyid(icid);
        if (dt.Rows.Count > 0)
        {
            strroad += "<a href='" + WEB.Common.Weburl + WEB.Common.GetNewTitle(dt.Rows[0]["vname"].ToString()) + "' title='" + dt.Rows[0]["vname"].ToString() + "'>" + dt.Rows[0]["vname"].ToString() + "</a>|";
            loadlink(dt.Rows[0]["iparcid"].ToString());
        }
    }
    public void loaditems()
    {
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("p")))
        {
            p = Convert.ToInt32(WEB.Common.GeturlParam("p"));
        }
        string listcid_child = WEB.Category.getlistcate_string(icid.ToString(), WEB.Common.mod_albums, lang, "1");
        string[] fieldsearch = { };
        string condition = " vcode ='" + WEB.Common.mod_albums + "'  and istatus=1 and vlan='" + lang + "' ";
        if (icid != -1)
        {
            listcid_child = WEB.Category.getlistcate_string(icid.ToString(), WEB.Common.mod_albums, lang, "1");
            condition = " vcode ='" + WEB.Common.mod_albums + "' and icid in (" + listcid_child + ") and istatus=1 and vlan='" + lang + "' ";
        }
        int itemperpage = 20;
        string key = "";
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, p, itemperpage, " iparam1 asc, dcreatedate DESC ");
        rpitems.DataSource = dt;
        rpitems.DataBind();
        ltpage.Text = WEB.Common.PhanTrangRewrite(weburl + "thu-vien-anh/" + alias, p, numitems, itemperpage);
    }
    public string getimg(string img, string alt)
    {
        if (img.Length > 0)
        {
            return "<img src='" + WEB.Common.Weburl + "uploads/albums/" + img + "' alt='" + alt + "' />";
        }
        else
            return "<img src='" + WEB.Common.Weburl + "uploads/default/albumdefault.png' alt='" + alt + "' />";
    }
    public string getimgcate(string img, string alt)
    {
        if (img.Length > 0)
        { 
            return "<img src='" + WEB.Common.Weburl + "uploads/albums/categories/" + img + "' alt='" + alt + "' />";
        }
        else
            return "<img src='" + WEB.Common.Weburl + "uploads/default/albumdefault.png' alt='" + alt + "' />";
    }
    
}