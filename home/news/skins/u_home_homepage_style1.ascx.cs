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
    protected void Page_Load(object sender, EventArgs e)
    {

        string alias = TN.Common.GetUrlParam("alias");
        if (alias.Length > 0)
        {
            DataTable dt = TN.Categories.GetCateDetailByField("valias", alias);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (dt.Rows[i]["ccode"].ToString().Trim() == TN.Common.mod_news )
                    {
                        //ltname.Text = dt.Rows[i]["vname"].ToString();
                        loadlink(dt.Rows[i]["icid"].ToString());
                        string[] road = { };
                        road = strroad.Split('|');
                        if (road.Length > 0)
                        {
                            //  ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + WEB.Common.Getlabel("lb_trangchu", "Trang chá»§", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chá»§", WEB.Common.Lang) + "</a></li>";
                            for (int j = road.Length - 2; j >= 0; j--)
                            {
                                //ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\">" + road[j] + "</li>";
                            }
                        }
                        phcontrol.Controls.Add(LoadControl("../util/default/u_news_cate.ascx"));
                    }
                }
            }
            else
            {
                dt = TN.Items.GetItemByField("valias", alias);
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i]["vcode"].ToString().Trim() == TN.Common.mod_news)
                        {
                            // ltname.Text = dt.Rows[i]["vtitle"].ToString();
                            loadlink(dt.Rows[i]["icid"].ToString());
                            string[] road = { };
                            road = strroad.Split('|');
                            if (road.Length > 0)
                            {
                                // ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + WEB.Common.Getlabel("lb_trangchu", "Trang chá»§", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chá»§", WEB.Common.Lang) + "</a></li>";
                                for (int j = road.Length - 2; j >= 0; j--)
                                {
                                    //ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\">" + road[j] + "</li>";
                                }
                            }
                            phcontrol.Controls.Add(LoadControl("../util/default/u_news_detail.ascx"));
                        }
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
            if (TN.Common.GetUrlParam("c") == "tag")
            {

                //  ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + TN.Common.GetLabel("lbhome", "Trang chá»§", TN.Common.Lang) + "' href='" + TN.Common.Weburl + "'>" + TN.Common.GetLabel("lbhome", "Trang chá»§", TN.Common.Lang) + "</a></li><li>Tag</li>";
                phcontrol.Controls.Add(LoadControl("../util/default/u_news_tag.ascx"));
                // ltname.Text = "Danh sÃ¡ch tin cÃ¹ng tag";
            }
            else
            {
                //  ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + TN.Common.GetLabel("lb_trangchu", "Trang chá»§", TN.Common.Lang) + "' href='" + TN.Common.Weburl + "'>" + TN.Common.GetLabel("lb_trangchu", "Trang chá»§", TN.Common.Lang) + "</a></li><li>" + TN.Common.GetLabel("lb_dichvu", "Dá»‹ch vá»¥", TN.Common.Lang) + "</li>";
                phcontrol.Controls.Add(LoadControl("../util/default/u_news_cate.ascx"));
            }
        }

    }
    protected void loadlink(string icid)
    {
        DataTable dt = new DataTable();
        dt = TN.Categories.GetCateDetailByField("icid", icid);
        if (dt.Rows.Count > 0)
        {
            strroad += "<strong><span><a href='" + TN.Common.Weburl + dt.Rows[0]["valias"].ToString() + "' title='" + dt.Rows[0]["vname"].ToString() + "'>" + dt.Rows[0]["vname"].ToString() + "</a></span></strong>|";
            loadlink(dt.Rows[0]["iparcid"].ToString());
        }
    }
}
