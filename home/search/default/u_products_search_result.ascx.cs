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

public partial class home_products_default_u_products_cate : System.Web.UI.UserControl
{
    public string catename = "Tìm kiếm";
    public int p = 0;
    public string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
    public int numitems = 0;
    public int icid = -1;
    public string alias = "";
    public string vender = "";
    public int sort = -1;
    public string key = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        string desc_web = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, lang);
        string key_web = WEB.Config.getvaluebykey(WEB.Config.k_webkeyword, lang);
        string t_web = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, lang);
        //cate detail

        if (WEB.Common.Check_number(WEB.Common.GeturlParam("sort")))
            sort = Convert.ToInt32(WEB.Common.GeturlParam("sort"));
        key = WEB.Common.GeturlParam("key");
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("cid")))
        {
            icid = Convert.ToInt32(WEB.Common.GeturlParam("cid"));
        }
        if (icid == -1)
        {
            t_web = this.catename;
            key_web = this.catename + "," + WEB.Common.GetNewTitle(this.catename);
            desc_web = this.catename + ", " + WEB.Config.getvaluebykey(WEB.Config.k_webdesc, lang);
        }
        Page.Title = "Tìm kiếm";
        WEB.Common.SetSelectedIndexInDropDownList(ref ddlsorting, sort.ToString());
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
        }
        catch { }
        LoadItemsList();

    }
    protected void LoadItemsList()
    {
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("p")))
        {
            p = Convert.ToInt32(WEB.Common.GeturlParam("p"));
            if (p < 1)
                p = 1;
        }
        string orderby = "iparam2 asc, dcreatedate DESC ";
        if (sort == 0)
            orderby = "fnewprice asc";
        if (sort == 1)
            orderby = "fnewprice desc";
        if (sort == 2)
            orderby = "vtitle asc";
        if (sort == 3)
            orderby = "vtitle desc";
        DataTable dicid = WEB.Category.getcatebyfield("valias", alias);
        string[] fieldsearch = { "vtitle", "vparam2", "vtitle_no", "vkey" };
        string condition = "";

        int itemperpage = 32;
       
        DataTable dt = new DataTable();
        numitems = WEB.Items.getnumitems(key, fieldsearch, WEB.Common.mod_product, icid.ToString(), lang, condition, "1");
        ltnums.Text = numitems.ToString();
        dt = WEB.Items.getlistitembypage(icid.ToString(), fieldsearch, key, WEB.Common.mod_product, lang, condition, "1", p - 1, itemperpage, orderby);
        //dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, p, itemperpage, "iparam2 asc, dcreatedate DESC ");
        rpitems.DataSource = dt;
        rpitems.DataBind();

        string urlparam = "tim-kiem?key=" + key;
       
        if (sort != -1)
        {
            urlparam += "&sort=" + sort.ToString();
           
        }
        if (icid !=-1)
            urlparam = "&cid=" + icid.ToString();
        ltpage.Text = WEB.Common.PhanTrang(weburl  + urlparam, p, numitems, itemperpage);

    }
    public string getprice(string fnew, string fold )
    {
        string str = "";
        if (fnew != "0")
        {
            str += "<span>" + WEB.Common.FomatPrice(fnew) + "</span>";
        }
        if (fold != fnew && fold != "0")
            str += "<span><del>" + WEB.Common.FomatPrice(fold) + "</del></span>";
        if (fold == "0" && fnew == "0")
            str += "<span>Liên hệ</span>";
        return str;
    }
    public string getsale(string s)
    {
        if (s.Contains("3"))
            return "<div class='sale-flash'>Sale</div>";
        else
            return "";
    }
    protected void ddlsorting_SelectedIndexChanged(object sender, EventArgs e)
    {
        string urlparam = "tim-kiem?key=" + key;

        if (sort != -1)
        {
            urlparam += "&sort=" + sort.ToString();

        }
        if (icid != -1)
            urlparam += "&cid=" + icid.ToString();
        urlparam += "&sort=" + ddlsorting.SelectedValue;
        

        Response.Redirect(weburl  + urlparam);
    }

    public string getsale(string pold, string pnew)
    {
        string str = "";
        int sub = (Convert.ToInt32(pold) - Convert.ToInt32(pnew));
        int sub100 = sub * 100;
        if (pold != pnew && pold != "0")
        {
            str += "<div class='sales'>";
            str += " <span>-" + sub100 / Convert.ToInt32(pold) + "%</span>";
            str += "</div>";
        }
        return str;
    }

}
