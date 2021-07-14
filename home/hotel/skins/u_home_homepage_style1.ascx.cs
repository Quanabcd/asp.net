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

public partial class home_homepage_u_home_homepage_style1 : System.Web.UI.UserControl
{

    public string strroad = "";
    public string vender = "";
    public string from = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        string alias = TN.Common.GetUrlParam("alias");
        vender = TN.Common.GetUrlParam("vender");
        if (alias.Length > 0)
        {
            DataTable dt = TN.Categories.GetCateDetailByField("valias", alias);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    if (dt.Rows[i]["ccode"].ToString().Trim() == "HEL")
                    {
                        //  ltname.Text = dt.Rows[i]["vname"].ToString();
                        loadlink(dt.Rows[i]["icid"].ToString());
                        string[] road = { };
                        road = strroad.Split('|');
                        if (road.Length > 0)
                        {
                            // ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "</a></li>";
                            for (int j = road.Length - 2; j >= 0; j--)
                            {
                                ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\">" + road[j] + "</li>";
                            }
                        }
                        phcontrol.Controls.Add(LoadControl("../util/default/u_products_cate.ascx"));
                        break;
                    }

                    if (dt.Rows[i]["ccode"].ToString().Trim() == "HGR")
                    {
                        // ltname.Text = dt.Rows[i]["vname"].ToString();
                        loadlink(dt.Rows[i]["icid"].ToString());
                        string[] road = { };
                        road = strroad.Split('|');
                        if (road.Length > 0)
                        {
                             ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "</a></li>";
                            for (int j = road.Length - 2; j >= 0; j--)
                            {
                                 ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\">" + road[j] + "</li>";
                            }
                        }
                        phcontrol.Controls.Add(LoadControl("../util/default/u_products_group.ascx"));
                        break;
                    }
                    if (dt.Rows[i]["ccode"].ToString().Trim() == "HEV")
                    {
                        // ltname.Text = dt.Rows[i]["vname"].ToString();
                        loadlink(dt.Rows[i]["icid"].ToString());
                        string[] road = { };
                        road = strroad.Split('|');
                        if (road.Length > 0)
                        {
                            // ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "</a></li>";
                            for (int j = road.Length - 2; j >= 0; j--)
                            {
                                ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\">" + road[j] + "</li>";
                            }
                        }
                        phcontrol.Controls.Add(LoadControl("../util/default/u_vender_page.ascx"));
                        break;
                    }
                }
            }
            else
            {
                dt = TN.Items.GetItemByField("valias", alias);
                if (dt.Rows.Count > 0)
                {

                    if (dt.Rows[0]["vcode"].ToString().Trim() == "HEL")
                    {
                        //   ltname.Text = dt.Rows[0]["vtitle"].ToString();
                        loadlink(dt.Rows[0]["icid"].ToString());
                        string[] road = { };
                        road = strroad.Split('|');
                        if (road.Length > 0)
                        {
                            //ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "</a></li>";
                            for (int j = road.Length - 2; j >= 0; j--)
                            {
                                ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\">" + road[j] + "</li>";
                            }
                            ltroadlink.Text += " <li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"> <span><i class='fa fa-angle-right'></i></span><strong> " + dt.Rows[0]["vtitle"].ToString() + "</strong></li>";

                        }
                        phcontrol.Controls.Add(LoadControl("../util/default/u_products_detail.ascx"));
                    }

                }
                else
                {
                    Response.Redirect(TN.Common.Weburl);
                }
            }
        }
        else
        {
            if (alias.Contains("gio-hang"))
            {
                phcontrol.Controls.Add(LoadControl("../util/default/u_product_cartdetail.ascx"));
            }
            else
            {
                //   ltname.Text ="Sản phẩm";
                ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + TN.Common.GetLabel("lb_trangchu", "Trang chủ", TN.Common.Lang) + "' href='" + TN.Common.Weburl + "'>" + TN.Common.GetLabel("lb_trangchu", "Trang chủ", TN.Common.Lang) + "</a></li><li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\">" + TN.Common.GetLabel("lb_sanpham", "Sản phẩm", TN.Common.Lang) + "</li>";
                phcontrol.Controls.Add(LoadControl("../util/default/u_products_cate.ascx"));
            }

        }
        //if (vender.Length > 0)
        //{
        //    DataTable dtv = TN.Categories.GetCateDetailByField("valias", vender);
        //    if (dtv.Rows.Count > 0)
        //        ltfilter.Text += TN.Common.GetLabel("lb_dangloctheo", "Đang lọc theo", TN.Common.Lang) + ": <b>" + dtv.Rows[0]["vname"].ToString() + "</b>";
        //}

        //  WEB.Layout.LoadControlToPlaceholder(ref phleft, "/home/products/util/newhotsale/u_new_product.ascx");
        //  WEB.Layout.LoadControlToPlaceholder(ref phleft, "/home/products/util/others/u_views_products.ascx");
        //  WEB.Layout.LoadControlToPlaceholder(ref phleft, "/home/news/util/topnews/topnewnews.ascx");
    }
    protected void loadlink(string icid)
    {
        DataTable dt = new DataTable();
        dt = WEB.Category.getcatebyid(icid);
        if (dt.Rows.Count > 0)
        {
            strroad += "<strong><span><a href='" + TN.Common.Weburl + dt.Rows[0]["valias"].ToString() + "' title='" + dt.Rows[0]["vname"].ToString() + "'>" + dt.Rows[0]["vname"].ToString() + "</a></span></strong>|";
            loadlink(dt.Rows[0]["iparcid"].ToString());
        }
    }
}
