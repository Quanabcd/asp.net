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
    public string catename = TN.Common.GetLabel("lb_sanpham", "Sản phẩm", TN.Common.Lang);
    public int p = 0;
    public string lang = TN.Common.Lang;
    public string weburl = TN.Common.Weburl;
    public int numitems = 0;
    public int icid = -1;
    public string alias = "";
    public string vender = "";
    public int sort = -1;
    public string from = "0";
    public string to = "0";
    public ArrayList ar = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {
        WEB.Layout.LoadControlToPlaceholder(ref ph_left, "~/home/products/util/menu/u_vertical_bycate.ascx");
        WEB.Layout.LoadControlToPlaceholder(ref ph_left, "~/home/products/util/newhotsale/u_new_product.ascx");
        WEB.Layout.LoadControlToPlaceholder(ref ph_left, "~/home/untilities/supportonline/u_supportonline_top.ascx");
        string desc_web = TN.Configs.GetValueByKey(TN.Configs.k_webdesc, lang);
        string key_web = TN.Configs.GetValueByKey(TN.Configs.k_webkeyword, lang);
        string t_web = TN.Configs.GetValueByKey(TN.Configs.k_webtitle, lang);
        //cate detail
        alias = TN.Common.GetUrlParam("alias");
        if (TN.Common.CheckNumber(TN.Common.GetUrlParam("sort")))
            sort = Convert.ToInt32(TN.Common.GetUrlParam("sort"));
        if (TN.Common.CheckNumber(TN.Common.GetUrlParam("from")))
            from = TN.Common.GetUrlParam("from");
        if (TN.Common.CheckNumber(TN.Common.GetUrlParam("to")))
            to = TN.Common.GetUrlParam("to");
        vender = TN.Common.GetUrlParam("vender");

        if (alias.Length > 0)
        {
            DataTable dtcate = TN.Categories.GetCateDetailByField("valias", alias);
            if (dtcate.Rows.Count > 0)
            {
                ltname.Text = this.catename = dtcate.Rows[0]["vname"].ToString();
                icid = Convert.ToInt32(dtcate.Rows[0]["icid"]);
                roadlink(icid.ToString());
                t_web = this.catename;
                key_web = this.catename;
                desc_web = this.catename + ", " + TN.Configs.GetValueByKey(TN.Configs.k_webdesc, lang);
                ltdesc.Text = dtcate.Rows[0]["vdesc"].ToString();
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
            ltrl.Text = "<li><a href='/san-pham' title='Sản phẩm'>Sản phẩm</a></li>";


            t_web = this.catename;
            key_web = this.catename;
            desc_web = this.catename + ", " + TN.Configs.GetValueByKey(TN.Configs.k_webdesc, lang);
        }
        Page.Title = t_web;
        TN.Common.SetSelectedIndexInDropDownList(ref ddlsorting, sort.ToString());
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
    protected void roadlink(string cid)
    {
        string str = "";
        ar.Add(cid);
        DataTable dt = TN.Categories.GetCateDetailByField("icid", cid);
        if (dt.Rows.Count > 0)
        {
            getpar(dt.Rows[0]["iparcid"].ToString());
        }
        if (ar.Count > 0)
        {
            for (int i = ar.Count - 1; i >= 0; i--)
            {
                DataTable dtc = TN.Categories.GetCateDetailByField("icid", ar[i].ToString());
                if (dtc.Rows.Count > 0)
                {

                    DataTable dtcc = new DataTable();
                    TN.Categories.GetListChildrenInCate(ref dtcc, dtc.Rows[0]["icid"].ToString(), "", "1");
                    if (dtcc.Rows.Count > 0)
                    {
                        str += "<li><a href='/" + dtc.Rows[0]["valias"].ToString() + "' class='pathway' title='" + dtc.Rows[0]["vname"].ToString() + "'>" + dtc.Rows[0]["vname"].ToString() + "</a>";

                       // str += "<ul>";
                        //for (int j = 0; j < dtcc.Rows.Count; j++)
                        //{
                          //  str += "<li><a href='/" + dtcc.Rows[j]["valias"].ToString() + "'  title='" + dtcc.Rows[j]["vname"].ToString() + "'>" + dtcc.Rows[j]["vname"].ToString() + "</a>";
                        //}
                       // str += "</ul>";
                    }
                    else
                        str += "<li><a href='/" + dtc.Rows[0]["valias"].ToString() + "' class='pathway' title='" + dtc.Rows[0]["vname"].ToString() + "'>" + dtc.Rows[0]["vname"].ToString() + "</a>";


                }
            }
        }
        ltrl.Text = str;
    }
    protected void getpar(string cid)
    {
        if (cid != "-1")
            ar.Add(cid);
        DataTable dt = TN.Categories.GetCateDetailByField("icid", cid);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["iparcid"].ToString() != "-1")
            {
                //   ar.Add(dt.Rows[0]["iparcid"].ToString());
                getpar(dt.Rows[0]["iparcid"].ToString());
            }
        }
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
        if (TN.Common.CheckNumber(TN.Common.GetUrlParam("p")))
        {
            p = Convert.ToInt32(TN.Common.GetUrlParam("p"));
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

        DataTable dicid = TN.Categories.GetCateDetailByField("valias", alias);
        string[] fieldsearch = { };
        string condition = " 1 =1 ";
        if (vender.Length > 0)
        {
            DataTable dtv = TN.Categories.GetCateDetailByField("valias", vender);
            if (dtv.Rows.Count > 0)
                condition += " and iparam8=" + dtv.Rows[0]["icid"].ToString();
        }
        if (from != "0")
            condition += " and fnewprice >=" + from;
        if (to != "0")
            condition += " and fnewprice <" + to;
        if (sort == 4)
            condition += " and vparam4 like '%1%'";
        if (sort == 5)
            condition += " and vparam4 like '%2%'";
        if (sort == 6)
            condition += " and vparam4 like '%3%'";
        int itemperpage = 9;
       
        string key = "";
        DataTable dt = new DataTable();
        numitems = TN.Items.GetNumItemsInCate(icid.ToString(), fieldsearch, key, TN.Common.mod_product, lang, condition, "1");
        ltnums.Text = numitems.ToString();
        dt = TN.Items.GetListItemInCateByPage(icid.ToString(), fieldsearch, key, TN.Common.mod_product, lang, condition, "1", p - 1, itemperpage, orderby);
        rpitems.DataSource = dt;
        rpitems.DataBind();
        if (alias == "" && icid == -1)
            alias = "san-pham";
        string urlparam = "";
        if (vender.Length != 0)
            urlparam = "?vender=" + vender;
        if (sort != -1)
        {
            if (urlparam.Length > 0)
                urlparam += "&sort=" + sort.ToString();
            else
                urlparam = "?sort=" + sort.ToString();
        }
        if (from != "0")
        {
            if (urlparam.Length > 0)
                urlparam += "&from=" + from;
            else
                urlparam = "?from=" + from;
        }
        if (to != "0")
        {
            if (urlparam.Length > 0)
                urlparam += "&to=" + to;
            else
                urlparam = "?to=" + to;
        }

        if (urlparam.Length == 0)
            ltpage.Text = TN.Common.PhanTrangRewrite(weburl + alias, p, numitems, itemperpage);
        else
            ltpage.Text = TN.Common.PhanTrang(weburl + alias + urlparam, p, numitems, itemperpage);

    }
    public string getprice(string fold, string fnew)
    {
        string str = "";
        if (fnew != "0")
        {
            str += "<span class='pro-price'>" + TN.Common.FomatPrice(fnew, lang) + "</span>";
        }
        else
            str += "<span class='pro-price'>Liên hệ</span>";
        if (fold != fnew && fold != "0")
            str += "<del class='pro-compare-price'>" + TN.Common.FomatPrice(fold, lang) + "</del>";
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
        string urlparam = "";
        if (vender.Length != 0)
            urlparam = "?vender=" + vender;
        if (urlparam.Length > 0)
            urlparam += "&sort=" + ddlsorting.SelectedValue;
        else
            urlparam = "?sort=" + ddlsorting.SelectedValue;
        if (from != "0")
        {
            if (urlparam.Length > 0)
                urlparam += "&from=" + from;
            else
                urlparam = "?from=" + from;
        }
        if (to != "0")
        {
            if (urlparam.Length > 0)
                urlparam += "&to=" + to;
            else
                urlparam = "?to=" + to;
        }
        Response.Redirect(weburl + alias + urlparam);
    }
}
