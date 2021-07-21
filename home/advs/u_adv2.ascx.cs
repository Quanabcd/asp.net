using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_advs_u_adv2 : System.Web.UI.UserControl
{
    public int n = 0;
    public string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        load();
    }
    public void load()
    {
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(new string[0], "", "vcode ='" + WEB.Common.mod_videos + "' and istatus=1 and vlan='" + WEB.Common.Lang + "'", 0, 3, " iparam1 asc, dcreatedate DESC ");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i == 0)
                {
                    ltvideo.Text = "<iframe title='TPHCM - Hiệu quả từ chương trình tích hợp - Thời sự - HTV9 HD - 04/07/2017' width='1060' height='596' src='https://www.youtube.com/embed/" + dt.Rows[i]["vparam6"].ToString() + "?feature=oembed' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>";
                }
                if (i > 0)
                {
                    ltvideoright.Text += "<div class='wpb_video_widget wpb_content_element vc_clearfix   vc_video-aspect-ratio-169 vc_video-el-width-100 vc_video-align-left'>";
                    ltvideoright.Text += "<div class='wpb_wrapper'>";
                    ltvideoright.Text += "<div class='wpb_video_wrapper'>";
                    ltvideoright.Text += "<div class='video-container'>";
                    ltvideoright.Text += "<iframe title='Why International Students Should Take the ACT Test' width='1060' height='596' src='https://www.youtube.com/embed/" + dt.Rows[i]["vparam6"].ToString() + "?feature=oembed' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>";
                    ltvideoright.Text += "</div>";
                    ltvideoright.Text += "</div>";
                    ltvideoright.Text += "</div>";
                    ltvideoright.Text += "</div>";
                }
            }
        }
    }
    protected void loadcate()
    {
        DataTable dtcate = new DataTable();
        string conditions = "istatus=1 and vparam4='1'";
        dtcate = WEB.Category.getlisitem(WEB.Common.mod_albums, lang, conditions, "iorders ASC");
        rpcates.DataSource = dtcate;
        rpcates.DataBind();
    }
    protected DataTable loaditem(string icid)
    {
        string listcid_child = WEB.Category.getlistcate_string(icid, WEB.Common.mod_albums, lang, "1");
        string[] fieldsearch = { "vparam4" };
        string condition = " vcode ='" + WEB.Common.mod_albums + "' and icid in (" + listcid_child + ") and istatus=1 ";
        int itemperpage = 8;
        string key = "";
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, 0, itemperpage, "iparam2 asc , dupdate DESC ");
        return dt;
    }
}