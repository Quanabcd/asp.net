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

public partial class home_products_default_u_product_cartdetail : System.Web.UI.UserControl
{
    protected string lang = WEB.Common.Lang;
    protected string products = "";
    protected string totalvnd = "";
    protected string totalusd = "";
    public string iid = "-1";
    public int m = 0;
    public int numitemincart = 0;
    public string dtructiep = " style='display:none' ";
    public string dcod = " style='display:none' ";
    public string dchuyenkhoan = " style='display:none' ";
    public string activetructiep = "";
    public string activeck = "";
    public string activecod = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("iid")) == true)
        {
            iid = WEB.Common.GeturlParam("iid");
        }
        string tt = WEB.Config.getvaluebykey(WEB.Config.k_prdpayment, lang);
        LoadCart();
        btnbuys.Text = WEB.Common.Getlabel("lb_dathang", "Đặt hàng", lang);
        btncancelorder.Text = btncancel.Text = WEB.Common.Getlabel("lb_huydonhang", "Hủy đơn hàng", lang);
        btncontinue.Text = WEB.Common.Getlabel("lb_tieptucmua", "Tiếp tục mua", lang);
        btnorder.Text = WEB.Common.Getlabel("lb_thanhtoan", "Thanh toán", lang);
        btneditcart.Text = WEB.Common.Getlabel("lb_suadonhang", "Sửa đơn hàng", lang);
        Page.Title = WEB.Common.Getlabel("lb_giohang", "Giỏ hàng", lang);
        pnordersuccess.Visible = false;
        int active = 0;
        DataTable dt = WEB.CategoryOther.getcate("-1", "PM", lang, "1", "-1");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["valias"].ToString() == "PAYMENTDIRECT")
                {
                    
                   
                   
                   lttructiep.Text = dt.Rows[i]["vname"].ToString();
                   lttructiepdesc.Text = dt.Rows[i]["vdesc"].ToString();
                   if (dt.Rows[i]["istatus"].ToString() == "1")
                   {
                       dtructiep = " style='display:block' ";
                       activetructiep = "active";
                       active = 1;
                       rdtructiep.Checked = true;
                   }
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTBANK")
                {
                   
                    ltchuyenkhoan.Text = dt.Rows[i]["vname"].ToString();
                    ltchuyenkhoandesc.Text = dt.Rows[i]["vdesc"].ToString();
                    if (dt.Rows[i]["istatus"].ToString() == "1")
                    {
                        dchuyenkhoan = " style='display:block' ";
                        if (active == 0)
                        {
                            bank_transfer.Checked = true;
                            active = 1;
                            activeck = "active";
                        }
                    }
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTCOD")
                {
                    
                    ltcod.Text = dt.Rows[i]["vname"].ToString();
                    ltcoddesc.Text = dt.Rows[i]["vdesc"].ToString();
                    if (dt.Rows[i]["istatus"].ToString() == "1")
                    {
                        dcod = " style='display:block' ";
                        if (active == 0)
                        {
                            cod_payment.Checked = true;
                            active = 1;
                            activecod = "active";
                        }
                    }
                }
               
            }
        }

    }
    public int stt()
    {
        m++;
        return m;
    }
    void LoadCart()
    {
       
        if (null != WEB.Common.getCookie("tn-cart") && WEB.Common.getCookie("tn-cart").Length>0)
        {
            string cartid = WEB.Common.getCookie("tn-cart");
            DataTable dt = new DataTable();
            dt = WEB.Cart.Cartdetail.getlisitem(cartid, "", "icartdetail asc");
            if (dt.Rows.Count > 0)
            {
                numitemincart = dt.Rows.Count;
                this.rpcart.DataSource = dt;
                this.rpcart.DataBind();
                this.rpcartdetail.DataSource = dt;
                rpcartdetail.DataBind();
                double total=0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    total += Convert.ToDouble(dt.Rows[i]["fvalue"]);
                }
                // WEB.Products.Cart_Calculate_Cart(ref dt, ref products, ref totalvnd);
                lttotal1.Text = this.lttotalvnd.Text = WEB.Products.FomatPrice(total.ToString(), lang);

                // this.ltnumberofproducts.Text = products;
                this.pncartdetail.Visible = true;
                this.pnorder.Visible = false;
                //this.pnmessage.Visible = false;
            }
            else
            {
                pnorder.Visible = false;
                pncartdetail.Visible = false;
                pnmessage.Visible = true;
                ltmsg.Text = WEB.Common.Getlabel("lb_giohangtrong", "Giỏ hàng trống", lang);
            }
        }
        else
        {
            pnorder.Visible = false;
            pncartdetail.Visible = false;
            pnmessage.Visible = true;
            ltmsg.Text = WEB.Common.Getlabel("lb_giohangtrong", "Giỏ hàng trống", lang);
        }
        DataTable dtc = new DataTable();
        WEB.CategoryOther.getcategorylevel1(ref dtc, "-1", "CI", lang, "-1");
        ddlcity.Items.Clear();
        ddlqh.Items.Clear();
        ddlpx.Items.Clear();
      //  ddlcity.Items.Add(new ListItem("Tất cả", "-1"));
        for (int i = 0; i < dtc.Rows.Count; i++)
        {

            this.ddlcity.Items.Add(new ListItem(dtc.Rows[i]["vname"].ToString(), dtc.Rows[i]["icid"].ToString()));
         
        }

        WEB.CategoryOther.getcategorylevel1(ref dtc,ddlcity.SelectedValue, "CI", lang, "-1");
       
        //  ddlcity.Items.Add(new ListItem("Tất cả", "-1"));
        for (int i = 0; i < dtc.Rows.Count; i++)
        {

            this.ddlqh.Items.Add(new ListItem(dtc.Rows[i]["vname"].ToString(), dtc.Rows[i]["icid"].ToString()));

        }

        WEB.CategoryOther.getcategorylevel1(ref dtc, ddlqh.SelectedValue, "CI", lang, "-1");

        //  ddlcity.Items.Add(new ListItem("Tất cả", "-1"));
        for (int i = 0; i < dtc.Rows.Count; i++)
        {

            this.ddlpx.Items.Add(new ListItem(dtc.Rows[i]["vname"].ToString(), dtc.Rows[i]["icid"].ToString()));

        }
    }
    protected string loadcontent(string key)
    {
        string condition = "vcode ='" + WEB.Common.mod_independent + "' and istatus=1 and vdesc='" + key + "' and vlan='" + WEB.Common.Lang + "' ";
        DataTable dt = WEB.Item_other.getlistitembypage(new string[0], "", condition, 0, 30, " iid DESC");
        if (dt.Rows.Count > 0)
        {
          return dt.Rows[0]["vcontent"].ToString().Trim();

         
        }
        return "";
    }
    protected void Delete_Load(object sender, System.EventArgs e)
    {
        ((LinkButton)sender).Attributes["onclick"] = "return confirm('" + WEB.Common.Getlabel("lb_bancomuonxoakhong", "Bạn có muốn xóa không", lang) + "?')";
    }
    protected void rpcart_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        DataTable dt = new DataTable();
        string c = e.CommandName.ToString();
        string pr = e.CommandArgument.ToString();
        switch (c)
        {
            case "delete":
                WEB.Cart.Cartdetail.db_cartsdetail_delete(e.CommandArgument.ToString());
                LoadCart();
                break;
        }        
    }
    protected void btncontinue_Click(object sender, EventArgs e)
    {
        Response.Redirect(WEB.Common.Weburl);
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        WEB.Cart.Cartdetail.db_cartsdetail_delete_by_icart(WEB.Common.getCookie("tn-cart"));
        pnmessage.Visible = true;
        pnorder.Visible = false;
        pncartdetail.Visible = false;
    }
    protected void btncancelorder_Click(object sender, EventArgs e)
    {
        WEB.Cart.Cartdetail.db_cartsdetail_delete_by_icart(WEB.Common.getCookie("tn-cart"));
        ltmsg.Text = WEB.Common.Getlabel("lt_huydonhangthanhcong","Hủy đơn hàng thành công", lang);
        pnmessage.Visible = true;
        pnorder.Visible = false;
        pncartdetail.Visible = false;
    }
    protected void btneditcart_Click(object sender, EventArgs e)
    {
       
        pnmessage.Visible = false;
        pnorder.Visible = false;
        pncartdetail.Visible = true;
    }

    protected void btnbuy_Click(object sender, EventArgs e)
    {
        
        if (null != WEB.Common.getCookie("tn-cart") && WEB.Common.getCookie("tn-cart").Length > 0)
        {
            string cartid = WEB.Common.getCookie("tn-cart");
            DataTable dt = new DataTable();
            dt = WEB.Cart.Cartdetail.getlisitem(cartid, "", "icartdetail asc");
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string[] s = { "inumber", "fvalue" };
                    string num = WEB.Common.GetFormValue(dt.Rows[i]["iitemid"].ToString()).ToString();
                    string pr =( Convert.ToDouble(num) * Convert.ToDouble(dt.Rows[i]["fprice"]) ).ToString();
                    string[] v = { num, pr };
                    string[] sf = { "icartdetail" };
                    string[] of = {dt.Rows[i]["icartdetail"].ToString() };
                    WEB.Cart.Cartdetail.updatebyfields(s, v, sf, of);
                }
            }
        }
        pnmessage.Visible = false;
        pnorder.Visible = true;
        pncartdetail.Visible = false;
        if (null != WEB.Common.getCookie("tn-cart") && WEB.Common.getCookie("tn-cart").Length > 0)
        {
            string cartid = WEB.Common.getCookie("tn-cart");
            DataTable dt = new DataTable();
            dt = WEB.Cart.Cartdetail.getlisitem(cartid, "", "icartdetail asc");
            if (dt.Rows.Count > 0)
            {
                this.rpcartdetail.DataSource = dt;
                rpcartdetail.DataBind();
                double total = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    total += Convert.ToDouble(dt.Rows[i]["fvalue"]);
                }
                // WEB.Products.Cart_Calculate_Cart(ref dt, ref products, ref totalvnd);
                lttotal1.Text = this.lttotalvnd.Text = WEB.Products.FomatPrice(total.ToString(), lang);

            }
            else
            {
                pnorder.Visible = false;
                pncartdetail.Visible = false;
                pnmessage.Visible = true;
                ltmsg.Text = WEB.Common.Getlabel("lb_giohangtrong", "Giỏ hàng trống", lang);
            }
        }
        else
        {
            pnorder.Visible = false;
            pncartdetail.Visible = false;
            pnmessage.Visible = true;
            ltmsg.Text = WEB.Common.Getlabel("lb_giohangtrong", "Giỏ hàng trống", lang);
        }
       
    }

    protected void btnorder_Click(object sender, EventArgs e)
    {
        pnmessage.Visible = false;
        pnorder.Visible = true;
        pncartdetail.Visible = false;
        if (txtname.Text == "")
        {
            ltmsgerror.Text = WEB.Common.Getlabel("lb_hotenkhongduocdetrong", "Họ tên không được để trống", lang); 
            txtname.Focus();
            return;
        }
        if (txtaddress.Text == "")
        {
            ltmsgerror.Text = WEB.Common.Getlabel("lb_diachikhongduocdetrong", "Địa chỉ không được để trống", lang);
            txtaddress.Focus();
            return;
        }
        if (txtphone.Text == "")
        {
            ltmsgerror.Text = WEB.Common.Getlabel("lb_sodienthoaikhongduocdetrong", "Số điện thoại không được để trống", lang); 
            txtphone.Focus();
            return;
        }
        if (txtemail.Text == "")
        {
            ltmsgerror.Text = WEB.Common.Getlabel("lb_emailkhongduocdetrong", "Email không được để trống", lang); 
            txtemail.Focus();
            return;
        }
        string code = WEB.Cart.Carts.CartCode;
        string vpay = "";
        string lt = "";
        if (rdtructiep.Checked == true)
        {
            lt = lttructiepdesc.Text;
            vpay = lttructiep.Text;
        }
        if (bank_transfer.Checked == true)
        {
            lt=ltchuyenkhoandesc.Text;
            vpay = ltchuyenkhoan.Text;
        }
        if (cod_payment.Checked == true)
        {
            vpay = ltcod.Text;
            lt = ltcoddesc.Text;
        }
       
        //insert
        int iuser = -1;
        string vuser = "";
        float fdiscount = 0;
        string cartid = WEB.Common.getCookie("tn-cart");
        DataTable dt = new DataTable();
        if(cartid.Length>0)
        dt = WEB.Cart.Cartdetail.getlisitem(cartid, " 1 = 1 ", "icartdetail asc");
        rpcartss.DataSource = dt;
        rpcartss.DataBind();
        ltname.Text = txtname.Text;
        ltphone.Text = txtphone.Text;
        ltemail.Text = txtemail.Text;
        ltaddress.Text = txtaddress.Text;
        ltkv.Text = ddlqh.SelectedItem.Text + ", " + ddlcity.SelectedItem.Text;
        ltghichu.Text = txtcontent.Text;
        float total = 0;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            total += Convert.ToSingle(dt.Rows[i]["fvalue"]);
        }
        lttottalss.Text = lttotal1.Text;
        if (rdmale.Checked == true)
            txtname.Text = "Anh " + txtname.Text;
        if (rdfemale.Checked == true) 
            txtname.Text = "Chị " + txtname.Text;

        txtaddress.Text = txtaddress.Text ;
        string[] fields = { "iuserid", "vusername", "vcode", "fmoney", "fdiscount", "vpay",  "vcname", "vcaddress", "vcphone", "vcemail", "vdname", "vdaddress", "vdphone", "vdemail", "vcontent", "istatus"};
        object[] values = { iuser, vuser, code, total, fdiscount, vpay, txtname.Text, txtaddress.Text, txtphone.Text, txtemail.Text, "", "", "", "", txtcontent.Text, 0 };
        int icart = WEB.Cart.Carts.save(-1, fields, values);
        string[] s = {"icartid" };
        string[] o = { WEB.Common.getCookie("tn-cart") };
        string[] sf = { "icartid" ,"istatus"};
        string[] ov = { icart.ToString(),"1" };
        WEB.Cart.Cartdetail.updatebyfields(sf, ov, s, o);
        WEB.Common.SetCookie("tn-cart", "", 0);

        string content = "<b>1. Thông tin khách hàng</b><br><br> Họ tên : " + txtname.Text + "<br>";
        content += "Điện thoại : " + txtphone.Text + "<br>";
        content += "Email : " + txtemail.Text + "<br>";
        content += "Địa chỉ : " + txtaddress.Text + "<br>";
        content += "Thông tin khác : " + txtcontent.Text + "<br><br><hr/>";
       

        content += "<b>2. Thông tin đơn hàng</b><br><br>";
        content += "<table>";
        content += "<tr>";
        content += "<td width='120'>Tên Sản Phẩm</td>";
        content += "<td width='80'>Số lượng</td>";
        content += "<td width='80'>Đơn giá</td>";
        content += "<tdwidth='80'>Thành tiền</td>";
        content += "</tr>";
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                content += "<tr>";
                content += "<td>" + dt.Rows[i]["vtitle"].ToString() + "</td>";
                content += "<td>" + dt.Rows[i]["inumber"].ToString() + "</td>";
                content += "<td>" +WEB.Products.FomatPrice(dt.Rows[i]["fprice"].ToString(), lang) + "</td>";
                content += "<td>" + WEB.Products.FomatPrice(dt.Rows[i]["fvalue"].ToString(), lang) + "</td>";
                content += "</tr>";
            }
        }


        content += "</table>";
        content += "<br><Br> Tổng tiền: " + lttotal1.Text;

        content += "<br><br><hr/><b>3. Hình thức thanh toán</b><br><br>";
        content += vpay ;
        content += lt;
        string emailsend = WEB.Config.getvaluebykey(WEB.Config.k_comemail, lang);
        string a = "";
        try
        {
           a = WEB.Common.SendMail(txtemail.Text, emailsend, WEB.Config.getvaluebykey(WEB.Config.k_prdemailorder, lang), "Thông tin đơn hàng từ website: " + WEB.Common.Weburl, content);
            txtaddress.Text = "";
            txtcontent.Text = "";
            txtemail.Text = "";
            txtname.Text = "";
            txtphone.Text = "";

        }
        catch
        {
        }
        //string payment_method = Request.Form["option_payment"];
        //string str_bankcode = Request.Form["bankcode"];
        //if (payment_method == "ATM_ONLINE" ||   payment_method == "VISA"  )
        //{
        //    API_NganLuong.RequestInfo info = new API_NganLuong.RequestInfo();
        //    info.Merchant_id = "36680";
        //    info.Merchant_password = "matkhauketnoi";
        //    info.Receiver_email = "demo@nganluong.vn";
        //    info.cur_code = "vnd";
        //    info.bank_code = str_bankcode;
        //    info.Order_code = code;
        //    info.Total_amount = total.ToString();
        //    info.fee_shipping = "0";
        //    info.Discount_amount = "0";
        //    info.order_description = "Thanh toán cho đơn hàng " + code + " tại website: " + WEB.Common.Weburl;
        //    info.return_url = WEB.Common.Weburl;
        //    info.cancel_url = WEB.Common.Weburl;

        //    info.Buyer_fullname = txtname.Text;
        //    info.Buyer_email = txtemail.Text;
        //    info.Buyer_mobile = txtphone.Text;

        //    API_NganLuong.APICheckoutV3 objNLChecout = new API_NganLuong.APICheckoutV3();
        //    API_NganLuong.ResponseInfo result = objNLChecout.GetUrlCheckout(info, payment_method);
        //    //Response.Redirect(result.Error_code + "|" + result.Checkout_url);
        //    if (result.Error_code == "00")
        //    {
        //        Response.Redirect(result.Checkout_url);
        //    }
        //    else
        //        Response.Write(result.Description);
        //}
        //else
        //{
            pnorder.Visible = false;
            pnmessage.Visible = false;
            pncartdetail.Visible = false;
            pnordersuccess.Visible = true;
            ltordersuccess.Text = WEB.Config.getvaluebykey(WEB.Config.k_prdbuysuccess, lang) + a;
            txtphone.Text = "";
            txtname.Text = "";
            txtemail.Text = "";
        //}
    }
    public string getlabelsuccess()
    {
        string result = "";
        result = WEB.Config.getvaluebykey(WEB.Config.k_prdbuysuccess, lang);
        return result;
    }

    public string getname(string id)
    {
        string result = "";
        DataTable dt = WEB.CategoryOther.getcatebyid(id);
        if (dt.Rows.Count > 0)
            result = dt.Rows[0]["vname"].ToString();
        return result;
    }
}
