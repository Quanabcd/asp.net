using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_albums_skins_u_skin_2_column_left : System.Web.UI.UserControl
{
    public string strroad = "";
    protected void Page_Load(object sender, EventArgs e)
    {
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
                         if (dt.Rows[i]["ccode"].ToString().Trim() == WEB.Common.mod_albums)
                         {
                             loadlink(dt.Rows[i]["icid"].ToString());
                             string[] road = { };
                             road = strroad.Split('|');
                             if (road.Length > 0)
                             {
                                 ltroadlink.Text += "<a title='" + WEB.Common.Getlabel("lb_title_home_cates", "Inicio", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "</a><span class='rdsprt'>»</span>";
                                 ltroadlink.Text += "<a title='" + WEB.Common.Getlabel("lb_thuvienanh", "Thư viện ảnh", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "thu-vien-anh'>" + WEB.Common.Getlabel("lb_thuvienanh", "Thư viện ảnh", WEB.Common.Lang) + "</a>";
                                 for (int j = road.Length - 2; j >= 0; j--)
                                 {
                                     ltroadlink.Text += "<span class='rdsprt'>»</span>" + road[j];
                                 }
                             }
                             phcontrol.Controls.Add(LoadControl("../default/u_items_in_cate.ascx"));
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
                             if (dt.Rows[i]["vcode"].ToString().Trim() == WEB.Common.mod_albums)
                             {
                                 loadlink(dt.Rows[i]["icid"].ToString());
                                 string[] road = { };
                                 road = strroad.Split('|');
                                 if (road.Length > 0)
                                 {
                                     ltroadlink.Text += "<a title='" + WEB.Common.Getlabel("lb_title_home_cates", "Inicio", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "</a><span class='rdsprt'>»</span>";
                                     ltroadlink.Text += "<a title='" + WEB.Common.Getlabel("lb_thuvienanh", "Galería de fotos", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "thu-vien-anh'>" + WEB.Common.Getlabel("lb_thuvienanh", "Thư viện ảnh", WEB.Common.Lang) + "</a>";
                                     for (int j = road.Length - 2; j >= 0; j--)
                                     {
                                         ltroadlink.Text += "<span class='rdsprt'>»</span>" + road[j];
                                     }
                                 }
                                 phcontrol.Controls.Add(LoadControl("../default/u_item_detail.ascx"));
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
                ltroadlink.Text += "<a title='" + WEB.Common.Getlabel("lb_home", "Trang chủ", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "</a><span class='rdsprt'>»</span>";
                ltroadlink.Text += "<a title='" + WEB.Common.Getlabel("lb_thuvienanh", "Thư viện ảnh", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "thu-vien-anh'>" + WEB.Common.Getlabel("lb_thuvienanh", "Thư viện ảnh", WEB.Common.Lang) + "</a>";
                phcontrol.Controls.Add(LoadControl("../default/u_items_in_cate.ascx"));
            }
        }
    }
    protected void loadlink(string icid)
    {
        DataTable dt = new DataTable();
        dt = WEB.Category.getcatebyid(icid);
        if (dt.Rows.Count > 0)
        {
            strroad += "<a href='" + WEB.Common.Weburl + "thu-vien-anh/" + WEB.Common.GetNewTitle(dt.Rows[0]["vname"].ToString()) + "' title='" + dt.Rows[0]["vname"].ToString() + "'>" + dt.Rows[0]["vname"].ToString() + "</a>|";
            loadlink(dt.Rows[0]["iparcid"].ToString());
        }
    }
}