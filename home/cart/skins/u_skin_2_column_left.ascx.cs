using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_rooms_skins_u_skin_2_column_left : System.Web.UI.UserControl
{
    public string strroad = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        ltroadlink.Text = "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "'>" + WEB.Common.Getlabel("lb_trangchu", "Trang chủ", WEB.Common.Lang) + "</a></li>";
        ltroadlink.Text += "<li itemprop=\"itemListElement\" itemscope='' itemtype=\"http://schema.org/ListItem\"><a title='" + WEB.Common.Getlabel("lb_giohang", "Giỏ hàng", WEB.Common.Lang) + "' href='" + WEB.Common.Weburl + "gio-hang'>" + WEB.Common.Getlabel("lb_giohang", "Giỏ hàng", WEB.Common.Lang) + "</a></li>";
        string c = WEB.Common.GeturlParam("c");
        if(c=="checkout")
            phcontrol.Controls.Add(LoadControl("../default/u_checkout.ascx"));
        else if (c == "order")
            phcontrol.Controls.Add(LoadControl("../default/u_orders.ascx"));
        else if (c == "addtocart")
            phcontrol.Controls.Add(LoadControl("../default/u_add_to_cart.ascx"));
        else
            phcontrol.Controls.Add(LoadControl("../default/u_product_cartdetail.ascx"));
    }
}