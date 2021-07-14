using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_cart_default_success : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string lang = WEB.Common.Lang;
    public string orderid = "-1";
    public float ftotal = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(WEB.Common.Check_number(WEB.Common.GeturlParam("orderid")))
        {
            orderid = WEB.Common.GeturlParam("orderid");
        }
        if (orderid != "-1")
        {
            DataTable dt = WEB.Cart.Carts.getitembyid(orderid);
            if (dt.Rows.Count > 0)
            {
                ltordercode.Text = dt.Rows[0]["vcode"].ToString();
                ltmoney.Text = WEB.Products.FomatPriceNoHtml(dt.Rows[0]["fmoney"].ToString(), lang);
                ftotal = Convert.ToSingle(dt.Rows[0]["fmoney"]);
                if (dt.Rows[0]["vpr1"].ToString().Length > 0)
                {
                    ltshipping.Text = WEB.Products.FomatPriceNoHtml(dt.Rows[0]["vpr1"].ToString(), lang);
                    ftotal += Convert.ToSingle(dt.Rows[0]["vpr1"]);
                }
                ltpayment.Text = dt.Rows[0]["vpay"].ToString();
                if (dt.Rows[0]["vcoupon"].ToString().Length == 0)
                    pcoupon.Visible = false;
                else
                {
                    pcoupon.Visible = true;
                    ltcoupon.Text = WEB.Products.FomatPriceNoHtml(dt.Rows[0]["fdiscount"].ToString(), lang);
                    ftotal = ftotal - Convert.ToSingle(dt.Rows[0]["fdiscount"]);
                }
                lttotal.Text = WEB.Products.FomatPriceNoHtml(ftotal.ToString(), lang);
                loadcartdetail(orderid);
            }
            string title = WEB.Config.getvaluebykey(WEB.Config.k_companyname, lang);
            ltweb.Text = "<a class='linkshopname' href='" + weburl + "'>" + title + "</a>";
            Page.Title = "Đặt hàng thành công";
        }
        else
            Response.Redirect(weburl);
    }
    protected void loadcartdetail(string id)
    {
        DataTable dt = WEB.Cart.Cartdetail.getlisitem(id, "", "icartdetail asc");
        rpitems.DataSource = dt;
        rpitems.DataBind();
    }
}