using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_skinpart_u_header : System.Web.UI.UserControl
{
    public string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
    protected void Page_Load(object sender, EventArgs e)
    {
        //WEB.Layout.LoadControlToPlaceholder(ref ph_search, "~/home/menu/u_search.ascx");
        //WEB.Layout.LoadControlToPlaceholder(ref ph_searchmobi, "~/home/menu/u_searchmobi.ascx");
        //WEB.Layout.LoadControlToPlaceholder(ref ph_menu, "~/home/menu/menu.ascx");
        //WEB.Layout.LoadControlToPlaceholder(ref ph_menumobi, "~/home/menu/u_menumobile.ascx");
        //WEB.Layout.LoadControlToPlaceholder(ref ph_menucates, "~/home/products/util/menu/u_menu_cates.ascx");
        //WEB.Layout.LoadControlToPlaceholder(ref ph_menucatesmobi, "~/home/products/util/menu/u_menucatesmobi.ascx");
        //loadbanner();
        //loadcart();
        //string face = WEB.Config.getvaluebykey(WEB.Config.k_socialfaceurl, lang);
        //string google = WEB.Config.getvaluebykey(WEB.Config.k_socialgoogleurl, lang);
        //string twitter = WEB.Config.getvaluebykey(WEB.Config.k_socialtwitterurl, lang);
        //string youtube = WEB.Config.getvaluebykey(WEB.Config.k_socialyoutubeurl, lang);
        //string intagram = WEB.Config.getvaluebykey(WEB.Config.k_socialintagramurl, lang);
    }
    //protected void loadbanner()
    //{
    //    string banner = WEB.Config.getvaluebykey(WEB.Config.k_webbanner, lang);
    //    string width = WEB.Config.getvaluebykey(WEB.Config.k_webbanner_width, lang);
    //    string height = WEB.Config.getvaluebykey(WEB.Config.k_webbanner_height, lang);
    //    if (banner.Contains(".swf"))
    //    {

    //    }
    //    else
    //    {
    //        string title = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, lang);

    //        lt_logo.Text = "<a class='logo'  href='/'><img  src='" + weburl + "uploads/banners/" + banner + "'  alt='" + title + "'/></a>";
    //        lt_logomobi.Text = "<a class=''  href='/'><img  src='" + weburl + "uploads/banners/" + banner + "'  alt='" + title + "'/></a>";
    //    }
    //}

    //public void loadcart()
    //{
    //    string str = "";

    //    if (null != WEB.Common.getCookie("tn-cart") && WEB.Common.getCookie("tn-cart").Length > 0)
    //    {
    //        string cartid = WEB.Common.getCookie("tn-cart");
    //        DataTable dt = new DataTable();
    //        dt = WEB.Cart.Cartdetail.getlisitem(cartid, "", "icartdetail asc");
    //        if (dt.Rows.Count > 0)
    //        {
    //            float total = 0;
    //            int num = 0;

    //            for (int i = 0; i < dt.Rows.Count; i++)
    //            {
    //                total += Convert.ToSingle(dt.Rows[i]["fvalue"]);
    //                num += Convert.ToInt32(dt.Rows[i]["inumber"]);

    //            }

    //            lt_num2.Text= num.ToString() +" Sản phẩm";
    //            lt_counts.Text =  num.ToString() ;
    //            lt_counts1.Text =  num.ToString() ;

    //        }
    //        else
    //        {
    //            //lt_num2.Text = "0 Sản phẩm";
    //            lt_counts.Text = "0";
    //            lt_counts1.Text = "0";
    //        }
    //    }
    //    else
    //    {
    //        //lt_num2.Text = "0 Sản phẩm";
    //        lt_counts.Text = "0";
    //        lt_counts1.Text = "0";

    //    }

    //    //lt_cart.Text = str;
    //}
  
  
}