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

public partial class home_products_default_u_products_detail : System.Web.UI.UserControl
{
    public string WebURL = TN.Common.Weburl;
    public string lang = TN.Common.Lang;
    public int iid = 0;
    public int iparam8 = 0;
    public int icid = 0;
    public string alias = "";
    DataTable prodetail = new DataTable();
    public float price = 0;
    public string vkey = "";
    public string vname = "";
    public string vimg = "";
    public string weight = "0";
    public int n = 0;
    public ArrayList ar = new ArrayList();
    public string link = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        //  pnbuy.Visible = false;

        alias = TN.Common.GetUrlParam("alias");
        string desc_web = "";
        string key_web = "";
        string t_web = "";
        dt = TN.Items.GetItemByField("valias", alias);
        prodetail = dt;
        string image = "";
        if (dt.Rows.Count > 0)
        {
            ltname.Text = vname = dt.Rows[0]["vtitle"].ToString();
            // lt_time.Text = "Cập nhật lúc cuối:&nbsp<b>" + TN.Common.Formatdate(Convert.ToDateTime(dt.Rows[0]["dupdate"].ToString())) + "</b>,&nbsp Đã xem:&nbsp" + dt.Rows[0]["iviews"].ToString();
            // ltprdkey.Text =  dt.Rows[0]["vkey"].ToString() ;
            vkey = dt.Rows[0]["vkey"].ToString();
            loaditemsincate(dt.Rows[0]["icid"].ToString());
            if (dt.Rows[0]["vparam7"].ToString().Length>0)
            {
                txtxuatxu.Text = dt.Rows[0]["vparam7"].ToString();
            }
            else
            {
                txtxuatxu.Text = WEB.Common.Getlabel("lb_watings_update", "Đang được cập nhật ..", WEB.Common.Lang);

            }
           
            iid = Convert.ToInt32(dt.Rows[0]["iid"]);
            iparam8 = Convert.ToInt32(dt.Rows[0]["iparam8"]);
            loadtab(iid.ToString());
            roadlink(dt.Rows[0]["icid"].ToString());
            // ltcontentindependent.Text = TN.Independents.GetContentByCode("CHITIETSP");
            ltsale.Text = getsale(dt.Rows[0]["foldprice"].ToString(), dt.Rows[0]["fnewprice"].ToString());
            // ltimg.Text += "<div class=\"slick-slide\"><div class=\"img\"><img id=\"proimage\" class=\"img-responsive\" itemprop=\"image\" src='" + WebURL + "uploads/products/" + dt.Rows[0]["vimg"].ToString() + "' data-zoom-image='" + WebURL + "uploads/products/" + dt.Rows[0]["vimg"].ToString() + "' alt='" + dt.Rows[0]["vtitle"].ToString() + "'></div></div>";
            ltdesc.Text = dt.Rows[0]["vdesc"].ToString();
            loadimg(iid, dt.Rows[0]["vimg"].ToString());
            image = dt.Rows[0]["vimg"].ToString();
            if (dt.Rows[0]["iparam7"].ToString().Contains("1"))
            {
                if (dt.Rows[0]["iparam5"].ToString() == "1")
                {
                    lt_status.Text ="Liên hệ " + WEB.Config.getvaluebykey(WEB.Config.k_comphone,lang);
                }
                else
                {
                    lt_status.Text = "Liên hệ " + WEB.Config.getvaluebykey(WEB.Config.k_comphone, lang);
                }
            }
            link = dt.Rows[0]["vparam7"].ToString();
            if (dt.Rows[0]["vparam4"].ToString().Contains("3"))
            {
                // ltsale.Text = "<div class='sale-flash'>Sale!</div>";
            }

            if (dt.Rows[0]["vparam6"].ToString().Length > 0)
            {
                ltbh.Text =  dt.Rows[0]["vparam6"].ToString() ;
            }
            else
            {
                ltbh.Text = WEB.Common.Getlabel("lb_watings_update", "Đang được cập nhật ..", WEB.Common.Lang);
            }
            if (Convert.ToInt32(dt.Rows[0]["iparam8"].ToString()) > 1)
            {
                DataTable dthsx = TN.Categories.GetCateDetailByField("icid", dt.Rows[0]["iparam8"].ToString());
                if (dthsx.Rows.Count > 0)
                {
                    lthsx.Text = dthsx.Rows[0]["vname"].ToString() ;
                }
            }
            if (Convert.ToInt32(dt.Rows[0]["iparam9"].ToString()) > 1)
            {
                string ipar = dt.Rows[0]["iparam9"].ToString();
                DataTable dtratings = TN.Categories.GetCateDetailByField("icid", dt.Rows[0]["iparam9"].ToString());
                DataTable dtaimg =  WEB.Category.getcatebyid(ipar);
                if (dtratings.Rows.Count > 0)
                {
                    //ltratings.Text += dtratings.Rows[0]["vname"].ToString();
                    ltratings.Text += " <img src='/uploads/products/cates/"+ dtaimg.Rows[0]["vimg"].ToString() + "'>";
                }
                
            }
            else
            {
                ltratings.Text +=  WEB.Common.Getlabel("lb_watings_update", "Đang được cập nhật ..", WEB.Common.Lang);
            }
            icid = Convert.ToInt32(dt.Rows[0]["icid"].ToString());
            if (TN.Configs.GetValueByKey(TN.Configs.k_prdpricenew, lang).Equals("1"))
            {
                ltpricenew.Text = getprice(dt.Rows[0]["foldprice"].ToString(), dt.Rows[0]["fnewprice"].ToString());
            }
            if (TN.Common.getCookie("prd-views") == null || TN.Common.getCookie("prd-views") == "" || TN.Common.getCookie("prd-views").Contains("|" + iid.ToString() + "|") == false)
            {
                string s = TN.Common.getCookie("prd-views");
                TN.Items.UpdateViewItem(iid.ToString());
                TN.Common.SetCookie("prd-views", s + "|" + iid.ToString() + "|", 24 * 60);
            }
            if (TN.Common.getCookie("prdlistviewed") == null || TN.Common.getCookie("prdlistviewed") == "" || TN.Common.getCookie("prdlistviewed").Contains("|" + iid.ToString() + "|") == false)
            {
                string s = TN.Common.getCookie("prdlistviewed");
                TN.Common.SetCookie("prdlistviewed", s + "|" + iid.ToString() + "|", 24 * 60);
            }

            price = Convert.ToSingle(dt.Rows[0]["fnewprice"]);
            ltcontent.Text = dt.Rows[0]["vcontent"].ToString();
            key_web = dt.Rows[0]["vparam2"].ToString();
            desc_web = dt.Rows[0]["vparam3"].ToString();
            weight = dt.Rows[0]["iparam3"].ToString();
            vimg = dt.Rows[0]["vimg"].ToString();
            DataTable dtmoreimages = new DataTable();
            //dtmoreimages = INGACMS.classes.MSSQLMulticates.dicts_items_subitems.dicts_items_subitems_getlist_byiid(0, getfields, INGACMS.classes.MoreCommon.app_item_more_images, Convert.ToInt32(iid), "", "", INGACMS.classes.DBController.SysConString);

            //if (TN.Configs.GetValueByKey(TN.Configs.k_prdbuyenable, lang) == "1")
            //    pnbuy.Visible = true;
            //else
            //    pnbuy.Visible = true;


        }

        this.Page.Title = vname;

        if (this.Page.Header != null)
        {
            foreach (Control c in this.Page.Header.Controls)
            {



                HtmlMeta hm1 = c as HtmlMeta;
                if (hm1 != null && hm1.Name.ToString().Trim() == "ogimage")
                {
                    hm1.Content = WebURL + "uploads/products/" + image;
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
                        str += "<li><a href='/" + dtc.Rows[0]["valias"].ToString() + "' class='pathway' title='" + dtc.Rows[0]["vname"].ToString() + "'>" + dtc.Rows[0]["vname"].ToString() + "<span class='parent'></span></a>";

                        str += "<ul>";
                        for (int j = 0; j < dtcc.Rows.Count; j++)
                        {
                            str += "<li><a href='/" + dtcc.Rows[j]["valias"].ToString() + "'  title='" + dtcc.Rows[j]["vname"].ToString() + "'>" + dtcc.Rows[j]["vname"].ToString() + "</a>";
                        }
                        str += "</ul>";
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
    protected void loaditemsincate(string icid)
    {
        //DataTable dt = TN.Categories.GetCateDetailByField(icid);
        //if (dt.Rows.Count > 0)
        //    ltcatesname.Text = dt.Rows[0]["vname"].ToString();
        //int top = Convert.ToInt32(TN.Configs.GetValueByKey(TN.Configs.k_prdnumhot, lang));
        //string condition = " vcode ='" + "HEL" + "' and istatus = 1";
        //string[] fieldsearch = { "vparam4" };
        //DataTable dtc = new DataTable();
        //dtc = WEB.Items.getlistitembypage(fieldsearch, "2", condition, 0, top, "dupdate DESC");
        //rpitemsbc.DataSource = dtc;
        //rpitemsbc.DataBind();
    }
    protected void loadtab(string iid)
    {
        DataTable dt = TN.ItemsOther.GetListItemByPage(new string[0], "", "TAB", TN.Common.Lang, "iid=" + iid, "1", 0, 20, "ino asc");
        //rptabs.DataSource = dt;
        //rptabs.DataBind();
        //rptabcontent.DataSource = dt;
        //rptabcontent.DataBind();
    }
    public void loadimg(int iid, string img)
    {
        string str = "";

        DataTable dtimg = WEB.Item_other.getlisitem("PRD", WEB.Common.Lang, "iid=" + iid.ToString(), "");
        DataTable dt = WEB.Items.getitembyfield("valias", alias);
        if (dtimg.Rows.Count == 0)
        {
            str += " <div class='item'>";
            str += "<img src='" + WebURL + "uploads/products/" + img + "' class='img-responsive center-block' />";
            str += "</div>";

        }
        else if (dtimg.Rows.Count > 0)
        {
            for (int i = 0; i < dtimg.Rows.Count; i++)
            {
                str += " <div class='item'>";
                str += "<img src='" + WebURL + "uploads/products/relative/" + dtimg.Rows[i]["vtitle"].ToString() + "' class='img-responsive center-block' />";
                str += "</div>";

            }
        }
        ltimg.Text = str;
        ltimgthumb.Text = str;
    }
    public string getprice(string fold, string fnew)
    {
        string str = "";
        if (fnew != "0")
        {
            str += "<ins>" + TN.Common.FomatPrice(fnew, lang) + "</ins>";
        }
        else
            str += "<ins>Liên hệ</ins>";
        if (fold != fnew && fold != "0")
            str += "<del>" + TN.Common.FomatPrice(fold, lang) + "</del>";
        return str;


    }
    public string getsale(string fold, string fnew)
    {
        if (fold != fnew && fold != "0")
            return " <div class='sale-flash'> - " + (Math.Round(((Convert.ToSingle(fold) - Convert.ToSingle(fnew)) / Convert.ToSingle(fold)) * 100)).ToString() + " %</div>";
        else
            return "";
    }
    public string getsale(string s)
    {
        if (s.Contains("3"))
            return "<span class=\"label-sale\">Sale</span>";
        else
            return "";
    }
    protected string getcaption(string strkey)
    {
        try
        {
            return TN.Common.GetLabel(strkey, "", lang);
        }
        catch { }
        return "";
    }

    protected void loaditemrelative(int num)
    {
        string[] fieldsearch = { };
        string condition = "iid != " + iid.ToString();
        int itemperpage = 20;
        
        string key = "";
        DataTable dt = new DataTable();
        dt = TN.Items.GetListItemInCateByPage(icid.ToString(), fieldsearch, key, "HEL", lang, "", "1", 0, num, " dupdate DESC ");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["iid"].ToString().Equals(iid.ToString()))
            {
                dt.Rows.RemoveAt(i);
                break;
            }
        }
        rpother.DataSource = dt;
        rpother.DataBind();
    }

    protected void loaditemrelative1(int num)
    {
        string[] fieldsearch = { };
        string condition = "iparam8 != " + iparam8.ToString();
        int itemperpage = 20;
       
        string key = "";
        DataTable dt = new DataTable();
        dt = TN.Items.GetListItemInCateByPage(icid.ToString(), fieldsearch, key, "HEL", lang, "", "1", 0, num, " dupdate DESC ");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["iparam8"].ToString().Equals(iparam8.ToString()))
            {
                dt.Rows.RemoveAt(i);
                break;
            }
        }
        RP.DataSource = dt;
        RP.DataBind();
    }
    protected void btnbuy_Click(object sender, EventArgs e)
    {
        if (link.Length > 0)
            Response.Redirect(link);
        if (TN.Common.CheckNumber(TN.Common.GetFormValueByName("quantity").ToString()) == true)
        {
            if (Convert.ToInt32(TN.Common.GetFormValueByName("quantity").ToString().Trim()) > 0)
            {
                string caridtmp = "1000";
                if (null != TN.Common.getCookie("tn-cart") && TN.Common.getCookie("tn-cart").Length > 0)
                {
                    caridtmp = TN.Common.getCookie("tn-cart");
                }
                else
                {
                    Random r = new Random();
                    caridtmp = r.Next(1000, 99999).ToString();
                    TN.Common.SetCookie("tn-cart", caridtmp, 24 * 60);
                }
                DataTable dt = WEB.Cart.Cartdetail.getitembycartanditem(caridtmp, iid.ToString());
                if (dt.Rows.Count > 0)
                {
                    int num = Convert.ToInt32(TN.Common.GetFormValueByName("quantity").ToString().Trim()) + Convert.ToInt32(dt.Rows[0]["inumber"]);
                    float mn = price * num;
                    string[] s = { "inumber", "fvalue" };
                    object[] o = { num, mn };
                    TN.Carts.SaveItemInCart(Convert.ToInt32(dt.Rows[0]["icartdetail"]), s, o);
                }
                else
                {
                    float mn = price * Convert.ToInt32(TN.Common.GetFormValueByName("quantity").ToString().Trim());
                    string[] s = { "icartid", "iitemid", "vkey", "valias", "vtitle", "vimg", "fprice", "inumber", "fvalue", "istatus", "ipr1" };
                    object[] o = { caridtmp, iid.ToString(), vkey, alias, vname, vimg, price, TN.Common.GetFormValueByName("quantity").ToString().Trim(), mn, "0", weight };
                    WEB.Cart.Cartdetail.save(-1, s, o);
                }
                Response.Redirect(WebURL + "gio-hang");
            }
        }
    }
    public string stt()
    {
        n++;
        return n.ToString();
    }
}
