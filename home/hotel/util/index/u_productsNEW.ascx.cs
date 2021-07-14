using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_products_util_index_u_productsNEW : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        ltitems.Text= LoadItemsList();
    }
    protected string LoadItemsList()
    {
        string str = "";
        int top = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_prdnumnew, lang));
        string condition = " vcode ='" + WEB.Common.mod_product + "' and istatus = 1";
        string[] fieldsearch = { "vparam4" };
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, "1", condition, 0, 20, "dupdate DESC");
        for (int i = 0; i < dt.Rows.Count; i++)
        {



            str += "<div class='swiper-slide product-box a-center'>";
            str += "<div class='product-thumbnail'>";
            str += "<div class='sale-flash'> " + dt.Rows[i]["iparam3"].ToString() + "G</div>";
            str += "<a href='/" + dt.Rows[i]["valias"].ToString() + "' title='" + dt.Rows[i]["vtitle"].ToString() + "'>";
            str += "<img src='/uploads/products/" + dt.Rows[i]["vimg"].ToString() + "' alt='" + dt.Rows[i]["vtitle"].ToString() + "'>";
            str += "</a>";
            str += "<div class='product-action clearfix'>";
            str += "<div  class='variants form-nut-grid'>";
            str += "<div>";
            str += "</div>";
            str += "</div>";
            str += "</div>";
            str += "</div>";
            str += "<div class='product-info'>";
            str += "<h3 class='product-name'><a href='/" + dt.Rows[i]["valias"].ToString() + "' title='" + dt.Rows[i]["vtitle"].ToString() + "'>" + dt.Rows[i]["vtitle"].ToString() + "</a></h3>";
            str += "<div class='price-box clearfix'>";
            str += "<div class='left_price special-price '>";
            str += "<span class='price product-price'>" + WEB.Common.FomatPrice(dt.Rows[i]["fnewprice"].ToString()) + "</span>";
            str += "</div>";
            str += "<a href='/add-to-cart/" + dt.Rows[i]["valias"].ToString() + "' class='readmore_p_h btn-buy btn-cart btn btn-primary left-to add_to_cart ' title='Cho vào giỏ hàng'>";
            str += "<span> Mua hàng</span>";
            str += "</a>";
            str += "</div>";
            str += "</div>";
            str += "</div>";

            


        }
        return str;
    }
}