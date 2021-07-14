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

public partial class admin_weblinks_weblink: System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int curpage = 0;
    public int n = 0;
    public int numitems = 0;
    public int iorder = 0;
    public int iordertype = 0;
    public string key = "";
    public int istatus = -1;
    public int m = 0;
    public int numitemincart = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (WEB.Common.Check_number(WEB.Common.GeturlParam("p")))
            {
                curpage = Convert.ToInt32(WEB.Common.GeturlParam("p"));
            }
            if (WEB.Common.Check_number(WEB.Common.GeturlParam("order")))
            {
                iorder = Convert.ToInt32(WEB.Common.GeturlParam("order"));
            }
            if (WEB.Common.Check_number(WEB.Common.GeturlParam("st")))
            {
                istatus = Convert.ToInt32(WEB.Common.GeturlParam("st"));
            }
            if (WEB.Common.Check_number(WEB.Common.GeturlParam("ordertype")))
            {
                iordertype = Convert.ToInt32(WEB.Common.GeturlParam("ordertype"));
            }
            if (WEB.Common.GeturlParam("key").Length > 0)
            {
                key = WEB.Common.GeturlParam("key");
            }
            numitems = WEB.Products.getnumcart();
            txtkeysearch.Text = key;
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlorder, iorder.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlstatus, istatus.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlordertype, iordertype.ToString());
            this.UpdateList();
            lttitle.Text = "Quản lý đơn đặt hàng";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = false;
            lnkdelete.Visible = false;
            ltdetailmsg.Visible = false;
        }
    }
    public int stt()
    {
        m++;
        return m;
    }
    protected void UpdateList()
    {
        clear();
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        pndetail.Visible = false;
        pnlist.Visible = true;
        DataTable dt = new DataTable();
        string[] fieldsearch = { "vkey", "vtitle", "vtitle_no", "valias" };
        string condition = "";
        string key = "";
        string sorder = "icartid desc";
        if (iorder == 0)
            sorder = "dcreate";
        else if (iorder == 1)
            sorder = "dtime";
        else if (iorder == 2)
            sorder = "dupdate";
        else if (iorder == 3)
            sorder = "vcname";
        else if (iorder == 4)
            sorder = "fmoney";
        if (iordertype == 1)
            sorder += " asc";
        else
            sorder += " desc";
        numitems = WEB.Cart.Carts.getnumitems(key, fieldsearch, condition, istatus.ToString());
        dt = WEB.Cart.Carts.getlistitembypage(fieldsearch, key,condition, curpage, 20, sorder);
        lt_count.Text = "Tổng số đơn hàng: <span style='color: #A52A2A;'>" + numitems.ToString() + "</span>";
        rpitems.DataSource = dt;
        rpitems.DataBind();
        ltpage.Text = WEB.Common.PhanTrang("admin/?mod=prod&c=orders&key=" + key.Trim() + "&st=" + istatus.ToString() + "&order=" + iorder.ToString() + "&ordertype=" + iordertype.ToString(), curpage, numitems, 20);
    }
    protected void rpitems_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        string c = e.CommandName.Trim();
        string p = e.CommandArgument.ToString().Trim();
        switch (c)
        {
            case "EditDetail":
                ltdetailmsg.Text = "";
                lnkupdate.Visible = true;
                lnkclose.Visible = true;
                //lnkadd.Visible = false;
                lnkdelete.Visible = false;
                lttitle.Text = "Cập nhật đơn đặt hàng";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                this.hdid.Value = p.Trim();
                DataTable dtdetail = new DataTable();
                dtdetail = WEB.Products.getcartdetailbyid(p);
                numitemincart = dtdetail.Rows.Count;
                rpcartdetail.DataSource = dtdetail;
                rpcartdetail.DataBind();
                clear();
                DataTable dt = new DataTable();
                dt = WEB.Products.getcartbyid(p);
                if (dt.Rows.Count > 0)
                {
                    txtname.Text = dt.Rows[0]["vcname"].ToString();
                    //lttitlecontact.Text = dt.Rows[0]["vdesc"].ToString();                 
                    txtcontent.Text = dt.Rows[0]["vcontent"].ToString();
                    txtemail.Text = dt.Rows[0]["vcemail"].ToString();
                    txtphone.Text = dt.Rows[0]["vcphone"].ToString();
                    txtaddress.Text = dt.Rows[0]["vcaddress"].ToString();

                    txtdname.Text = dt.Rows[0]["vdname"].ToString();
                    //lttitlecontact.Text = dt.Rows[0]["vdesc"].ToString();                 
                    txtdemail.Text = dt.Rows[0]["vdemail"].ToString();
                    txtdphone.Text = dt.Rows[0]["vdphone"].ToString();
                    txtdaddress.Text = dt.Rows[0]["vdaddress"].ToString();
                    txtship.Text = dt.Rows[0]["vpr1"].ToString();
                    if (txtship.Text.Length == 0)
                        txtship.Text = "0";
                    double pvc = 0;
                    try
                    {
                        pvc = Convert.ToSingle(dt.Rows[0]["vpr1"]);
                    }
                    catch { }
                    loadmember(dt.Rows[0]["iuserid"].ToString());
                    lttotal.Text = WEB.Products.FomatPrice(dt.Rows[0]["fmoney"].ToString(),vlan);
                    double fdiscount = Convert.ToSingle(dt.Rows[0]["fdiscount"]);
                    double total = pvc + Convert.ToSingle(dt.Rows[0]["fmoney"]) - fdiscount;
                    lttotalvnd.Text = WEB.Products.FomatPrice(total.ToString(), vlan);
                  //  ltvanchuyen.Text = WEB.Products.FomatPrice(pvc.ToString(), vlan);
                    ltcoupon.Text = WEB.Products.FomatPrice(fdiscount.ToString());
                    ltcode.Text = dt.Rows[0]["vcode"].ToString();
                    ltcodecoupon.Text = dt.Rows[0]["vcoupon"].ToString();
                    txtpayment.Text = dt.Rows[0]["vpay"].ToString();
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlstatusdt, dt.Rows[0]["istatus"].ToString());
                    ltdatetime.Text = WEB.Common.Formatdate(Convert.ToDateTime(dt.Rows[0]["dcreate"].ToString()));
                    if (dt.Rows[0]["dcreate"].ToString() != dt.Rows[0]["dupdate"].ToString())
                    {
                        ltupdate.Text = WEB.Common.Formatdate(Convert.ToDateTime(dt.Rows[0]["dupdate"].ToString()));
                    }
                    else
                        ltupdate.Text = "...";
                    if (dt.Rows[0]["dcreate"].ToString() != dt.Rows[0]["dtime"].ToString())
                    {
                        txtgh.Text = Convert.ToDateTime(dt.Rows[0]["dtime"]).ToString("dd/MM/yyyy");
                        WEB.Common.SetSelectedIndexInDropDownList(ref ddlminute, Convert.ToDateTime(dt.Rows[0]["dtime"]).ToString("mm"));
                        WEB.Common.SetSelectedIndexInDropDownList(ref ddlhour, Convert.ToDateTime(dt.Rows[0]["dtime"]).ToString("HH"));
                    }
                    else
                        txtgh.Text = "";

                }

                break;

            case "delete":
                WEB.Cart.Cartdetail.db_cartsdetail_delete_by_icart(e.CommandArgument.ToString());
                WEB.Cart.Carts.db_carts_delete(e.CommandArgument.ToString());
                UpdateList();
                break;
        }
    }
    public string gettotal(string s, string vc,string dc)
    {
        double pvc = 0;
        try
        {
            pvc = Convert.ToSingle(vc);
        }
        catch { }

        double total = pvc + Convert.ToSingle(s) - Convert.ToSingle(dc);
        return WEB.Products.FomatPrice(total.ToString());
        //ltvanchuyen.Text = WEB.Products.FomatPrice(pvc.ToString());
    }
    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        
            try
            {
                double total = 0;
                DataTable dt = WEB.Cart.Cartdetail.getlisitem(hdid.Value, "", "icartdetail asc");
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string[] s = { "inumber", "fvalue" };
                        string num = WEB.Common.GetFormValue(dt.Rows[i]["iitemid"].ToString()).ToString();
                        string pr = (Convert.ToDouble(num) * Convert.ToDouble(dt.Rows[i]["fprice"])).ToString();
                        total += Convert.ToDouble(num) * Convert.ToDouble(dt.Rows[i]["fprice"]);
                        string[] v = { num, pr };
                        string[] sf = { "icartdetail" };
                        string[] of = { dt.Rows[i]["icartdetail"].ToString() };
                        WEB.Cart.Cartdetail.updatebyfields(s, v, sf, of);
                    }
                }

                string[] sv = {"fmoney", "vcname", "vcaddress", "vcphone", "vcemail", "vcontent", "istatus", "vpay", "dupdate", "vdname", "vdaddress", "vdphone", "vdemail","vpr1"};
                object[] ov = {total.ToString(), txtname.Text,txtaddress.Text,txtphone.Text,txtemail.Text,txtcontent.Text,ddlstatusdt.SelectedValue,txtpayment.Text ,DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"),txtdname.Text,txtdaddress.Text,txtdphone.Text,txtdemail.Text,txtship.Text};
                WEB.Cart.Carts.save(Convert.ToInt32(hdid.Value), sv, ov);


                //WEB.Cart.Carts.updatestatus(hdid.Value,ddlstatusdt.SelectedValue);
                lttitle.Text = "Quản lý đơn đặt hàng - Cập nhật đơn đặt hàng thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật đơn đặt hàng ID: " + hdid.Value);
                UpdateList();
            }
            catch (Exception ex)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật dữ liệu</p>" ;
                ltdetailmsg.Visible = true;
            }
            try
            {
                string[] s = txtgh.Text.Trim().Split('/');
                DateTime dgh = new DateTime(Convert.ToInt32(s[2]), Convert.ToInt32(s[1]), Convert.ToInt32(s[0]), Convert.ToInt32(ddlhour.SelectedValue), Convert.ToInt32(ddlminute.SelectedValue), 0);
                string[] sf = { "dtime"};
                object[] ovf = {dgh.ToString("MM/dd/yyyy HH:mm:ss") };
                WEB.Cart.Carts.save(Convert.ToInt32(hdid.Value), sf, ovf);
            }
            catch
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Ngày giao hàng phải có định dạng ngày/tháng/năm</p>";
                ltdetailmsg.Visible = true;
                //txt_updatetime.Focus();
                return;
            }

         UpdateList();
    }
    public void loadmember(string id)
    {
        DataTable dt = WEB.Member.getuser_byid(id);
        if (dt.Rows.Count > 0)
        {
            ltname.Text = dt.Rows[0]["vlname"].ToString();
            ltphone.Text = dt.Rows[0]["vphone"].ToString();
            ltemail.Text = dt.Rows[0]["vemail"].ToString();
            ltaddress.Text = dt.Rows[0]["vaddress"].ToString();
            if (dt.Rows[0]["igender"].ToString() == "0")
                ltgender.Text = "Nữ";
            else
                ltgender.Text = "Nam";
            ltngaysinh.Text = Convert.ToDateTime( dt.Rows[0]["dbirthday"]).ToString("dd/MM/yyyy");
        }
    }
    protected void lnkadd_Click(object sender, EventArgs e)
    {
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        //lnkadd.Visible = false;
        lnkdelete.Visible = false;
        lttitle.Text = "Thêm đơn đặt hàng";
        pnlist.Visible = false;
        pndetail.Visible = true;
        ltdatetime.Text = DateTime.Now.ToString();
        this.hd_insertupdate.Value = "insert";
    }
    public int getstt()
    {
        n++;
        return n;
    }
    protected void lnkclose_Click(object sender, EventArgs e)
    {
        UpdateList();
    }
    public string formatdate(DateTime date)
    {

        return WEB.Common.Formatdate(date);
    }
    public string endablestatus(string str)
    {
        if (str == "0")
        {
            return "Mới đặt";
        }
        else if (str == "1")
        {
            return "Đã giao hàng và thanh toán";
        }
        else if (str == "2")
        {
            return "Đã thanh toán và đang chờ giao hàng";
        }
        else if (str == "3")
        {
            return "Đã thanh toán";
        }
        else if (str == "-3")
        {
            return "Đã hủy";
        }
        return "...";
    }
    protected void lnkdelete_Click(object sender, EventArgs e)
    {
        if (HttpContext.Current.Request.Form["cb_"] != null)
        {
            if (!HttpContext.Current.Request.Form["cb_"].ToString().Equals(""))
            {
                string choose = Request.Form["cb_"].ToString().Trim() + ",";
                string[] s = choose.Split(Convert.ToChar(","));
                if (s.Length > 0)
                {
                    for (int i = 0; i < s.Length; i++)
                    {
                        if (s[i].Length > 0)
                        {
                            WEB.Products.db_carts_delete(s[i].ToString());
                            WEB.Products.db_cartdetails_delete(s[i].ToString());
                        }
                    }
                }
            }
        }
        UpdateList();
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        Response.Redirect(weburl + "admin/?mod=prod&c=orders&st=" + ddlstatus.SelectedValue + "&key=" + txtkeysearch.Text.Trim() + "&order=" + ddlorder.SelectedValue + "&ordertype=" + ddlordertype.SelectedValue);
    }
    public string getdatecreateupdate(string dcreate, string dupdate)
    {
        string str = "";
        if (dcreate == dupdate)
        {
            str = "<p class='sptime'><i class='ico-dstart'  title='Ngày đặt'></i>" + Convert.ToDateTime(dcreate).ToString("dd/MM/yyyy HH:mm") + "</p>";
            str += "<p class='sptime'><i class='ico-dend'  title='Ngày giao hàng'></i>...</p>";
        }
        else
        {
            str = "<p class='sptime'><i class='ico-dstart'  title='Ngày đặt'></i>" + Convert.ToDateTime(dcreate).ToString("dd/MM/yyyy HH:mm") + "</p>";
            str += "<p class='sptime'><i class='ico-dend'  title='Ngày giao hàng'></i>" + Convert.ToDateTime(dupdate).ToString("dd/MM/yyyy HH:mm") + "</p>";
        }
        return str;
    }
    protected bool checkdelete(string status)
    {
        if (status == "0" || status == "-3" )
            return true;
        else
            return false;
    }
    protected void clear()
    {
        ddlhour.Items.Clear();
        txtcontent.Text = "";
        txtname.Text = "";
        txtphone.Text = "";
        txtemail.Text = "";
        txtpayment.Text = "";
        for (int i = 0; i < 24; i++)
        {
            ddlhour.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }
        ddlminute.Items.Clear();
        for (int i = 0; i < 60; i++)
        {
            ddlminute.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }
    }
}
