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
    public string icid = "";
    public string strroad = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        icid = WEB.Common.GeturlParam("icid");
        if (icid.Equals("-1"))
        {
            ltname.Text = WEB.Common.Getlabel("lb_thuvientailieu", "Thư viện tài liệu", WEB.Common.Lang);
        }
        WEB.Layout.LoadControlToPlaceholder(ref phleft, "~/home/filelibrarys/topfile/u_topfile.ascx");
        WEB.Layout.LoadControlToPlaceholder(ref phleft, "~/home/untilities/supportonline/u_supportonline_top.ascx");

        // WEB.Layout.LoadControlToPlaceholder(ref phleft, "~/home/untilities/intergrate/u_fanpage.ascx");

        //    WEB.Layout.LoadControlToPlaceholder(ref phleft, "~/home/news/util/topnews/topnewnews.ascx");
        WEB.Layout.LoadControlToPlaceholder(ref phleft, "~/home/advs/u_advs.ascx");
        WEB.Layout.LoadControlToPlaceholder(ref phleft, "~/home/untilities/counter/u_counter.ascx");
        WEB.Layout.LoadControlToPlaceholder(ref phleft, "~/home/advs/u_advs1.ascx");

        if (!IsPostBack)
        {
            string alias = WEB.Common.GeturlParam("alias");
            if (alias.Length > 0)
            {
                DataTable dt = WEB.Category.getcatebyfield("valias", alias);
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i]["ccode"].ToString().Trim() == WEB.Common.mod_files)
                        {
                            
                                ltname.Text = dt.Rows[i]["vname"].ToString();
                            
                            loadlink(dt.Rows[i]["icid"].ToString());
                            string[] road = { };
                            road = strroad.Split('|');
                            if (road.Length > 0)
                            {
                                ltroadlink.Text += "<li><a title='" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "</a></li>";
                                for (int j = road.Length - 2; j >= 0; j--)
                                {
                                    ltroadlink.Text += "<li>" + road[j] + "</li>";
                                }
                            }
                            phcontrol.Controls.Add(LoadControl("../default/u_files_cate.ascx"));
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
                            if (dt.Rows[i]["vcode"].ToString().Trim() == WEB.Common.mod_files)
                            {
                                ltname.Text = dt.Rows[i]["vtitle"].ToString();
                                loadlink(dt.Rows[i]["icid"].ToString());
                                string[] road = { };
                                road = strroad.Split('|');
                                if (road.Length > 0)
                                {
                                    ltroadlink.Text += "<li><a title='" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "</a></li>";
                                    for (int j = road.Length - 2; j >= 0; j--)
                                    {
                                        ltroadlink.Text += "<li>" + road[j] + "</li>";
                                    }
                                }
                                phcontrol.Controls.Add(LoadControl("../default/u_files_detail.ascx"));
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

                ltroadlink.Text += "<li><a title='" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "</a></li><li>" + WEB.Common.Getlabel("lb_thuvientailieu", "Thư viện tài liệu", WEB.Common.Lang) + "</li>";
                    phcontrol.Controls.Add(LoadControl("../default/u_files_cate.ascx"));
                
            }
        }
    }
    protected void loadlink(string icid)
    {
        DataTable dt = new DataTable();
        dt = WEB.Category.getcatebyid(icid);
        if (dt.Rows.Count > 0)
        {
            strroad += "<a href='" + WEB.Common.Weburl + "thu-vien-tai-lieu/" + dt.Rows[0]["valias"].ToString() + "' title='" + dt.Rows[0]["vname"].ToString() + "'>" + dt.Rows[0]["vname"].ToString() + "</a>|";
            loadlink(dt.Rows[0]["iparcid"].ToString());
        }
    }
}
