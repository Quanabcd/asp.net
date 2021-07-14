using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_cart_default_u_checkout : System.Web.UI.UserControl
{
    public string vlan = WEB.Common.Lang;
    public float fmoney = 0;
    public float ftotal = 0;
    public float fshipping = 0;
    public float fweight = 0;
    public string unit = "đ";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            unit = WEB.Config.getvaluebykey(WEB.Config.k_prdunit, vlan);
            if (Session["user"] != null)
            {
                ltaccount.Text = "";
                DataTable dtm = WEB.Member.getuser_byemail(Session["user"].ToString());
                if (dtm.Rows.Count > 0)
                {
                    txtname.Text = dtm.Rows[0]["vfname"].ToString() + " " + dtm.Rows[0]["vlname"].ToString();
                    txtemail.Text = Session["user"].ToString();
                    txtaddress.Text = dtm.Rows[0]["vaddress"].ToString();
                    txtphone.Text = dtm.Rows[0]["vphone"].ToString();
                }
            }
            else
            {
                ltaccount.Text = "<div class='user-login'><a href='/account/register?url=checkout'>Đăng ký tài khoản mua hàng</a> | <a href='/account/login?url=checkout'>Đăng nhập</a></div>";
                ltmessnoaccount.Text = "<label class='color-blue'>Mua không cần tài khoản</label>";
            }

            loadcity();
            loaddistrict();
            loaditemincart();
            loadshipping();
            loadpayment();
        }
       
        Page.Title = "Thanh toán";
    }
    protected void loadcity()
    {
        DataTable dt = new DataTable();
        WEB.CategoryOther.getcategorylevel1(ref dt, "-1", "CI", vlan, "-1");
        ddlcity.Items.Clear();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            this.ddlcity.Items.Add(new ListItem(dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
        }
    }
    protected void loaddistrict()
    {
        DataTable dt = new DataTable();
        dt= WEB.CategoryOther.getcate(ddlcity.SelectedValue, "CI", vlan, "1", "-1");
        ddldistrict.Items.Clear();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            this.ddldistrict.Items.Add(new ListItem(dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
        }
    }
    protected void loadshipping()
    {
        bool temp = false;
        ddlshipping.Items.Clear();
        ltshipcount.Text = "0";
        DataTable dt = new DataTable();
        WEB.CategoryOther.getcategorylevel1(ref dt, "-1", "TP", "iparam1=" + ddlcity.SelectedValue, vlan, "1");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["iparam2"].ToString() == "0")
                {
                    if (Convert.ToSingle(dt.Rows[i]["vdesc"]) <= ftotal && Convert.ToSingle(dt.Rows[i]["vimg"]) >= ftotal)
                    {
                        ddlshipping.Items.Add(new ListItem(dt.Rows[i]["vname"].ToString() + " - " + WEB.Products.FomatPriceNoHtml(dt.Rows[i]["vicon"].ToString(), vlan), dt.Rows[i]["vicon"].ToString()));
                    }
                }
                else
                {
                    if (Convert.ToSingle(dt.Rows[i]["vdesc"]) <= fweight && Convert.ToSingle(dt.Rows[i]["vimg"]) >= fweight)
                    {
                        ddlshipping.Items.Add(new ListItem(dt.Rows[i]["vname"].ToString() + " - " + WEB.Products.FomatPriceNoHtml(dt.Rows[i]["vicon"].ToString(), vlan), dt.Rows[i]["vicon"].ToString()));
                    }
                }
                
            }
            if (ddlshipping.Items.Count > 0)
            {
                fshipping = Convert.ToSingle(ddlshipping.SelectedValue);
                ltshipcount.Text = WEB.Products.FomatPriceNoHtml(ddlshipping.SelectedValue);
                pnshipping.Visible = true;
                temp = true;
            }
            else
            {
                ltshipcount.Text = "0";
                pnshipping.Visible = false;
                temp = false;
            }
        }
        if(temp==false)
        {
            WEB.CategoryOther.getcategorylevel1(ref dt, "-1", "TP", "iparam1=0", vlan, "1");
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (dt.Rows[i]["iparam2"].ToString() == "0")
                    {
                        if (Convert.ToSingle(dt.Rows[i]["vdesc"]) <= ftotal && Convert.ToSingle(dt.Rows[i]["vimg"]) >= ftotal)
                        {
                            ddlshipping.Items.Add(new ListItem(dt.Rows[i]["vname"].ToString() + " - " + WEB.Products.FomatPriceNoHtml(dt.Rows[i]["vicon"].ToString(), vlan), dt.Rows[i]["vicon"].ToString()));
                        }
                    }
                    else
                    {
                        if (Convert.ToSingle(dt.Rows[i]["vdesc"]) <= fweight && Convert.ToSingle(dt.Rows[i]["vimg"]) >= fweight)
                        {
                            ddlshipping.Items.Add(new ListItem(dt.Rows[i]["vname"].ToString() + " - " + WEB.Products.FomatPriceNoHtml(dt.Rows[i]["vicon"].ToString(), vlan), dt.Rows[i]["vicon"].ToString()));
                        }
                    }
                }
                
                if (ddlshipping.Items.Count > 0)
                {
                    fshipping = Convert.ToSingle(ddlshipping.SelectedValue);
                    ltshipcount.Text = WEB.Products.FomatPriceNoHtml(ddlshipping.SelectedValue);
                    pnshipping.Visible = true;
                }
                else
                {
                    ltshipcount.Text = "0";
                    pnshipping.Visible = false;
                }
            }
            else
            {
                pnshipping.Visible = false;
            }
        }
        ftotal = fmoney + fshipping;
        lttotalvnd.Text = WEB.Products.FomatPriceNoHtml(ftotal.ToString());
    }
    protected void loaditemincart()
    {
        if (null != WEB.Common.getCookie("tn-cart") && WEB.Common.getCookie("tn-cart").Length > 0)
        {
            string cartid = WEB.Common.getCookie("tn-cart");
            DataTable dt = new DataTable();
            dt = WEB.Cart.Cartdetail.getlisitem(cartid, "", "icartdetail asc");
            if (dt.Rows.Count > 0)
            {
                this.rpitems.DataSource = dt;
                this.rpitems.DataBind();
               
                float total = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    total +=  Convert.ToSingle(dt.Rows[i]["fvalue"]);
                    fweight += Convert.ToInt32(dt.Rows[i]["inumber"]) * Convert.ToSingle(dt.Rows[i]["ipr1"]);
                }
                // WEB.Products.Cart_Calculate_Cart(ref dt, ref products, ref totalvnd);
                fmoney = total;
                ltmoney.Text = WEB.Products.FomatPriceNoHtml(total.ToString());
                ltnum.Text = dt.Rows.Count.ToString();
            }
            else
            {
                Response.Redirect(WEB.Common.Weburl + "cart");
            }
        }
        else
        {
            Response.Redirect(WEB.Common.Weburl + "cart");
        }
    }
    protected void loadpayment()
    {
        DataTable dt = WEB.CategoryOther.getcate("-1", "PM", vlan, "1", "1");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["valias"].ToString() == "PAYMENTDIRECT")
                {
                    pnredirect.Visible = true;
                    rdredirect.Checked = true;
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTBANK")
                {
                    pnbank.Visible = true;
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTCOD")
                {
                    pncod.Visible = true;
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTBK")
                {
                    pnbaokim.Visible = true;
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTNL")
                {
                    pnnganluong.Visible = true;
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTPAYPAL")
                {
                    pnpaypal.Visible = true;
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTONEPAY")
                {
                    pnonepay.Visible = true;
                }
            }
        }
    }
    protected void btncheckout_Click(object sender, EventArgs e)
    {
        string code = WEB.Cart.Carts.CartCode;
        string vpay = "123";
        if (rdredirect.Checked == true)
            vpay = "Thanh toán trực tiếp";
        if (rdbank.Checked == true)
            vpay = "Thanh toán qua ngân hàng";
        if (rdbaokim.Checked == true)
            vpay = "Thanh toán qua Bảo Kim";
        if (rdnganluong.Checked == true)
            vpay = "Thanh toán qua Ngân Lượng";
        if (rdpaypal.Checked == true)
            vpay = "Thanh toán qua PayPal";
        if (rdonepay.Checked == true)
            vpay = "Thanh toán qua OnePay";
        int iuser = -1;
        string vuser = "";
        if (Session["user"] != null)
        {
            DataTable dtm = WEB.Member.getuser_byemail(Session["user"].ToString());
            if (dtm.Rows.Count > 0)
            {
                iuser = Convert.ToInt32(dtm.Rows[0]["iuserid"]);
                vuser = Session["user"].ToString();
            }
        }
        string vcoupon = "";
        string fdiscount = "0";
        DataTable dtcoupon = WEB.Coupons.getitembyfield("vcoupon", WEB.Common.GetFormValue("couponcode").ToString());
        if (dtcoupon.Rows.Count > 0)
        {
            vcoupon = WEB.Common.GetFormValue("couponcode").ToString();
            fdiscount = WEB.Common.GetFormValue("hddiscount").ToString();
            WEB.Coupons.updateused(WEB.Common.GetFormValue("couponcode").ToString());
        }
        string cartid = WEB.Common.getCookie("tn-cart");
        DataTable dt = new DataTable();
        dt = WEB.Cart.Cartdetail.getlisitem(cartid, "", "icartdetail asc");
        float total = 0;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            total += Convert.ToSingle(dt.Rows[i]["fvalue"]);
        }
        string[] fields = { "iuserid", "vusername", "vcode", "fmoney","vcoupon", "fdiscount", "vpay", "vcname", "vcaddress", "vcphone", "vcemail", "vdname", "vdaddress", "vdphone", "vdemail", "vcontent", "istatus", "vpr1" };
        object[] values = { iuser, vuser, code, total, vcoupon, fdiscount, vpay, txtname.Text, txtaddress.Text, txtphone.Text, txtemail.Text, "", "", "", "", txtnote.Text, 0, WEB.Common.GetFormValue("ctl31$ctl00$ctl00$ctl00$ddlshipping").ToString() };
        int icart = WEB.Cart.Carts.save(-1, fields, values);
        string[] s = { "icartid" };
        string[] o = { WEB.Common.getCookie("tn-cart") };
        string[] sf = { "icartid", "istatus" };
        string[] ov = { icart.ToString(), "1" };
        WEB.Cart.Cartdetail.updatebyfields(sf, ov, s, o);
        WEB.Common.SetCookie("tn-cart", "", 0);
        //send mail
       // lttotalvnd.Text = WEB.Common.GetFormValue("hdshippingprice").ToString();
        Response.Redirect(WEB.Common.Weburl + "order/" + icart.ToString()); 
    }
}