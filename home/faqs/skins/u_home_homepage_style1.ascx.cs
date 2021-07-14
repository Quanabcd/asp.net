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

public partial class home_faqs_u_home_homepage_style1 : System.Web.UI.UserControl
{
    public string strroad = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        
            phright.Controls.Add(LoadControl("../util/index/u_faq_form.ascx"));
            phright.Controls.Add(LoadControl("../util/topnews/topnewfaq.ascx"));
            string alias = WEB.Common.GeturlParam("alias");
            if (alias.Length > 0)
            {
                DataTable dt = WEB.Category.getcatebyfield("valias", alias);
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i]["ccode"].ToString().Trim() == "FAQ")
                        {
                          //  ltname.Text = dt.Rows[i]["vname"].ToString();
                            loadlink(dt.Rows[i]["icid"].ToString());
                            string[] road = { };
                            road = strroad.Split('|');
                            if (road.Length > 0)
                            {
                                ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "</a></li>";
                                ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + WEB.Common.Getlabel("lb_hoidap", "Hỏi đáp", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "hoi-dap'>" + WEB.Common.Getlabel("lb_hoidap", "Hỏi đáp", WEB.Common.Lang) + "</a></li>";
                                for (int j = road.Length - 2; j >= 0; j--)
                                {
                                    ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\">" + road[j] + "</li>";
                                }
                            }
                            phcontrol.Controls.Add(LoadControl("../util/default/u_faq_cate.ascx"));
                        
                        }
                    }
                }
                else
                {
                    dt = WEB.Items.getitembyfield("valias", alias);
                    if (dt.Rows.Count > 0)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (dt.Rows[i]["vcode"].ToString().Trim() == "FAQ")
                            {
                              //  ltname.Text = dt.Rows[i]["vtitle"].ToString();
                                loadlink(dt.Rows[i]["icid"].ToString());
                                string[] road = { };
                                road = strroad.Split('|');
                                if (road.Length > 0)
                                {
                                    ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "</a></li>";
                                    ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + WEB.Common.Getlabel("lb_hoidap", "Hỏi đáp", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "hoi-dap'>" + WEB.Common.Getlabel("lb_hoidap", "Hỏi đáp", WEB.Common.Lang) + "</a></li>";
                                    for (int j = road.Length - 2; j >= 0; j--)
                                    {
                                        ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\">" + road[j] + "</li>";
                                    }
                                }
                                phcontrol.Controls.Add(LoadControl("../util/default/u_faq_detail.ascx"));
                              
                            }
                        }
                    }
                    else
                    {
                        Response.Redirect(WEB.Common.Weburl);
                    }
                }
            }
            else
            {
               // ltroadlink.Text += "<a title='Trang chủ' href='" + WEB.Common.Weburl + "'>Trang chủ</a><span class='rdsprt'>»</span>Tin tức";
                phcontrol.Controls.Add(LoadControl("../util/default/u_faq_cate.ascx"));
            }
        
    }
    protected void loadlink(string icid)
    {
        DataTable dt = new DataTable();
        dt = WEB.Category.getcatebyid(icid);
        if (dt.Rows.Count > 0)
        {
            strroad += "<a href='" + WEB.Common.Weburl + "hoi-dap/" + dt.Rows[0]["valias"].ToString() + "' title='" + dt.Rows[0]["vname"].ToString() + "'>" + dt.Rows[0]["vname"].ToString() + "</a>|";
            loadlink(dt.Rows[0]["iparcid"].ToString());
        }
    }


}
