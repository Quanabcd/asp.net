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
public partial class home_products_util_default_u_vender_page : System.Web.UI.UserControl
{
    public string catename = "Sản phẩm";
    public int p = 0;
    public string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
    public int numitems = 0;
    public int icid = -1;
    public string alias = "";
    public string vender = "";
    public int sort = -1;
    protected void Page_Load(object sender, EventArgs e)
    {

        string desc_web = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, lang);
        string key_web = WEB.Config.getvaluebykey(WEB.Config.k_webkeyword, lang);
        string t_web = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, lang);
        //cate detail
        alias = WEB.Common.GeturlParam("alias");
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("sort")))
            sort = Convert.ToInt32(WEB.Common.GeturlParam("sort"));
        if (alias.Length > 0)
        {
            DataTable dtcate = WEB.Category.getcatebyfield("valias", alias);
            if (dtcate.Rows.Count > 0)
            {
               ltname.Text=  this.catename = dtcate.Rows[0]["vname"].ToString();
                icid = Convert.ToInt32(dtcate.Rows[0]["icid"]);
               
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
        if (icid == -1)
        {
            t_web = this.catename;
            key_web = this.catename + "," + WEB.Common.GetNewTitle(this.catename);
            desc_web = this.catename + ", " + WEB.Config.getvaluebykey(WEB.Config.k_webdesc, lang);
        }
        Page.Title = t_web;
        WEB.Common.SetSelectedIndexInDropDownList(ref ddlsorting, sort.ToString());
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
                        linkcanonical.Attributes.Add("href", weburl + alias);
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
        LoadItemsList();

    }
    public string getsale(string fold, string fnew)
    {
        if (fold != fnew && fold != "0")
            return " <div class='sale-flash'> - " + (Math.Round(((Convert.ToSingle(fold) - Convert.ToSingle(fnew)) / Convert.ToSingle(fold)) * 100)).ToString() + " %</div>";
        else
            return "";
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
        string[] fieldsearch = { };
        string condition = "";
        condition = "iparam8=" + icid.ToString();
        int itemperpage = 20;
        if (WEB.Common.Check_number(WEB.Config.getvaluebykey(WEB.Config.k_prdperpage, lang)))
        {
            itemperpage = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_prdperpage, lang));
        }
        if (itemperpage < 1)
            itemperpage = 10;
        string key = "";
        DataTable dt = new DataTable();
        numitems = WEB.Items.getnumitems(key, fieldsearch, WEB.Common.mod_product,"-1", lang, condition, "1");
        ltnums.Text = numitems.ToString();
        dt = WEB.Items.getlistitembypage("-1", fieldsearch, key, WEB.Common.mod_product, lang, condition, "1", p - 1, itemperpage,orderby);
        //dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, p, itemperpage, "iparam2 asc, dcreatedate DESC ");
        rpitems.DataSource = dt;
        rpitems.DataBind();
        if(sort!=-1)
            ltpage.Text = WEB.Common.PhanTrang(weburl + alias + "?sort=" + sort.ToString(), p, numitems, itemperpage);
        else
            ltpage.Text = WEB.Common.PhanTrangRewrite(weburl + alias, p, numitems, itemperpage);
     

    }
    public string getprice(string fold, string fnew)
    {
        string str = "";
        if (fnew != "0")
        {
            str += "<span class=\"price product-price sale-price\">" + WEB.Common.FomatPrice(fnew) + "</span>";
        }
        else
            str += "<span class=\"price product-price sale-price\">Liên hệ</span>";
        if (fold != fnew && fold != "0")
            str += "<span class=\"old-price product-price\">" + WEB.Common.FomatPrice(fold) + "</span>";
        return str;

    }
    public string getsale(string s)
    {
        if (s.Contains("3"))
            return "<span class=\"label-sale\">Sale</span>";
        else
            return "";
    }
    protected void ddlsorting_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect(weburl + alias + "?sort=" + ddlsorting.SelectedValue);
    }
}