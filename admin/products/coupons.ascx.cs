using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class admin_products_coupons : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int n = 0;
    public int iorder = 0;
    public int iordertype = 0;
    public int curpage = 1;
    public string key = "";
    public int icid = -1;
    public int istatus = -1;
    public int numitems = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("p")))
        {
            curpage = Convert.ToInt32(WEB.Common.GeturlParam("p"));
        }
     
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("order")))
        {
            iorder = Convert.ToInt32(WEB.Common.GeturlParam("order"));
        }
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("ordertype")))
        {
            iordertype = Convert.ToInt32(WEB.Common.GeturlParam("ordertype"));
        }
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("st")))
        {
            istatus = Convert.ToInt32(WEB.Common.GeturlParam("st"));
        }
        if (WEB.Common.GeturlParam("key").Length > 0)
        {
            key = WEB.Common.GeturlParam("key");
        }
        if (!IsPostBack)
        {
            lttitle.Text = "Quản lý mã khuyến mại";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            txtkeysearch.Text = key;
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlorder, iorder.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlstatus, istatus.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlordertype, iordertype.ToString());
            this.UpdateList();
        }
    }
    public void clear()
    {
        txtcoupon.Text = "";
        ltdetailmsg.Text = "";
        txtdiscount.Text = "0";
        txtmoneystart.Text = "0";
        txtnumber.Text = "100";
        txtstart.Text = DateTime.Now.ToString("dd/MM/yyyy");
        txtend.Text = DateTime.Now.AddDays(10).ToString("dd/MM/yyyy");
    }
    public void btnsearch_Click(object sender, EventArgs e)
    {
        Response.Redirect(weburl + "admin/?mod=prod&c=coupons&key=" + txtkeysearch.Text.Trim() + "&st=" + ddlstatus.SelectedValue + "&order=" + ddlorder.SelectedValue + "&ordertype=" + ddlordertype.SelectedValue);
    }

    protected void UpdateList()
    {
        clear();
        
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = true;
        lnkdelete.Visible = true;
        pndetail.Visible = false;
        pnlist.Visible = true;
        DataTable dt = new DataTable();
        string[] fieldsearch = { "vkey", "vtitle", "vtitle_no", "valias" };
        string condition = "";
        string key = "";
        string sorder = "iid desc";
        if (iorder == 0)
            sorder = "dcreate";
        else if (iorder == 1)
            sorder = "vcoupon";
        else if (iorder == 2)
            sorder = "dstart";
        else if (iorder == 3)
            sorder = "dend";
        else if (iorder == 4)
            sorder = "inumber";
        if (iordertype == 1)
            sorder += " asc";
        else
            sorder += " desc";
        //key = WEB.Common.remove_specical_char(txtkeysearch.Text);
        numitems = WEB.Coupons.getnumitems(key, fieldsearch, condition, istatus.ToString());
        //dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, curpage,20, sorder);
        dt = WEB.Coupons.getlistitembypage( fieldsearch, key, condition, istatus.ToString(), curpage - 1, 10, sorder);
        lt_count.Text = "Tổng số mã khuyến mại: <span style='color: #A52A2A;'>" + numitems.ToString() + "</span>";
        rpitems.DataSource = dt;
        rpitems.DataBind();
        ltpage.Text = WEB.Common.PhanTrang("?mod=prod&c=coupons&key=" + key.Trim() + "&st=" + istatus.ToString() + "&order=" + iorder.ToString() + "&ordertype=" + iordertype.ToString(), curpage, numitems, 10);
        lt_pagebotom.Text = ltpage.Text;
    }
    public int getstt()
    {
        n++;
        return n;
    }
    public string gettype(string type, string options, string fdiscount, string fmonystart)
    {
        string str = "Giảm ";
        if (type == "0")
            str += WEB.Products.FomatPriceNoHtml(fdiscount, vlan);
        else
            str += fdiscount + " %";
        if (options == "0")
            str += " cho tất cả các đơn hàng";
        else
            str += " cho các đơn hàng từ " + WEB.Products.FomatPriceNoHtml(fmonystart, vlan) ;
        return str;
    }
    public string getdatecreateupdate(string dcreate, string dupdate)
    {
        string str = "";
        if (dcreate == dupdate)
        {
            str = "<p class='sptime'><i class='ico-dstart'  title='Ngày bắt đầu'></i>" + Convert.ToDateTime(dcreate).ToString("dd/MM/yyyy HH:mm") + "</p>";
            str += "<p class='sptime'><i class='ico-dend'  title='Ngày kết thúc'></i>...</p>";
        }
        else
        {
            str = "<p class='sptime'><i class='ico-dstart'  title='Ngày bắt đầu'></i>" + Convert.ToDateTime(dcreate).ToString("dd/MM/yyyy HH:mm") + "</p>";
            str += "<p class='sptime'><i class='ico-dend'  title='Ngày kết thúc'></i>" + Convert.ToDateTime(dupdate).ToString("dd/MM/yyyy HH:mm") + "</p>";
        }
        return str;
    }
    protected void rpitems_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        string c = e.CommandName.Trim();
        string p = e.CommandArgument.ToString().Trim();
        switch (c)
        {
            case "EditDetail":
                clear();
                ltdetailmsg.Text = "";
                lnkupdate.Visible = true;
                lnkclose.Visible = true;
                lnkadd.Visible = false;
                lnkdelete.Visible = false;
                lttitle.Text = "Cập nhật mã khuyến mại";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                this.hdicid.Value = p.Trim();
                DataTable dt = new DataTable();
                dt = WEB.Coupons.getitembyid(p);
                if (dt.Rows.Count > 0)
                {
                    txtcoupon.Text = dt.Rows[0]["vcoupon"].ToString().Trim();
                    txtdiscount.Text = dt.Rows[0]["fdiscount"].ToString().Trim();
                    txtstart.Text = Convert.ToDateTime(dt.Rows[0]["dstart"]).ToString("dd/MM/yyyy");
                    txtend.Text = Convert.ToDateTime(dt.Rows[0]["dend"]).ToString("dd/MM/yyyy");
                    txtnumber.Text = dt.Rows[0]["inumber"].ToString().Trim();
                    txtmoneystart.Text = dt.Rows[0]["fmoneystart"].ToString().Trim();
                    hdiused.Value = dt.Rows[0]["inumused"].ToString();
                    //txtto.Text = dt.Rows[0]["vimg"].ToString().Trim();
                    //txtprice.Text = dt.Rows[0]["vicon"].ToString().Trim();
                   
                    if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                        chkstatus.Checked = false;
                    else
                        chkstatus.Checked = true;
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddltype, dt.Rows[0]["itype"].ToString());
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddloptions, dt.Rows[0]["ioptions"].ToString());

                }

                break;
            case "ChangeStatus":
                p = e.CommandArgument.ToString().Trim().Substring(0, e.CommandArgument.ToString().IndexOf("|"));
                string status = e.CommandArgument.ToString().Substring(e.CommandArgument.ToString().IndexOf("|") + 1, e.CommandArgument.ToString().Length - e.CommandArgument.ToString().IndexOf("|") - 1);
                if (status == "1")
                    status = "0";
                else
                    status = "1";
                WEB.Coupons.updatestatus(p, status);
                this.UpdateList();
                break;
            case "delete":
                WEB.Coupons.db_coupons_delete(p);
                UpdateList();
                break;

        }
    }
    public string getunit(string s)
    {
        if (s == "0")
            return "đ";
        else
            return "g";
    }
    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        if (txtcoupon.Text.Length == 0)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập mã coupon</p>";
            ltdetailmsg.Visible = true;
            txtcoupon.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtnumber.Text.Trim()) == false) 
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Số lần sử dụng phải là số</p>";
            ltdetailmsg.Visible = true;
            txtdiscount.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtdiscount.Text.Trim()) == false)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Mức giảm phải là số</p>";
            ltdetailmsg.Visible = true;
            txtdiscount.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtmoneystart.Text.Trim()) == false)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Giá bắt đầu phải là số</p>";
            ltdetailmsg.Visible = true;
            txtdiscount.Focus();
            return;
        }
        int status = 0;
        if (chkstatus.Checked == true)
            status = 1;
        DateTime dstart = DateTime.Now;
        
        if (txtstart.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Ngày bắt đầu không hợp lệ</p>";
                ltdetailmsg.Visible = true;
                txtstart.Focus();
                return;
            }
            else
            {
                try
                {
                    string[] s = txtstart.Text.Trim().Split('/');
                    dstart = new DateTime(Convert.ToInt32(s[2]), Convert.ToInt32(s[1]), Convert.ToInt32(s[0]), 0,0, 0);
                }
                catch
                {
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Ngày bắt đầu không hợp lệ</p>";
                    ltdetailmsg.Visible = true;
                    txtstart.Focus();
                    return;
                }
            }
    DateTime dend = DateTime.Now;
        
        if (txtend.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Ngày kết thúc không hợp lệ</p>";
                ltdetailmsg.Visible = true;
                txtend.Focus();
                return;
            }
            else
            {
                try
                {
                    string[] s = txtend.Text.Trim().Split('/');
                    dend = new DateTime(Convert.ToInt32(s[2]), Convert.ToInt32(s[1]), Convert.ToInt32(s[0]), 0,0, 0);
                }
                catch
                {
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Ngày kết thúc không hợp lệ</p>";
                    ltdetailmsg.Visible = true;
                    txtend.Focus();
                    return;
                }
            }
    
        if (hd_insertupdate.Value.Equals("insert"))
        {

            try
            {
            //WEB.Item_other.db_items_other_insert("TP",vlan, txtcoupon.Text, txtlink.Text,image, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), adv_type, txtorder.Text, istatus,ddlposition.SelectedValue,txtwidth.Text,txtheight.Text, "", "", "0", "0");
                WEB.Coupons.db_coupons_insert(Convert.ToInt32(ddltype.SelectedValue), txtcoupon.Text.Trim(), Convert.ToInt32(txtnumber.Text), Convert.ToSingle(txtdiscount.Text), Convert.ToInt32(ddloptions.SelectedValue), Convert.ToSingle(txtmoneystart.Text),DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), dstart.ToString("MM/dd/yyyy"), dend.ToString("MM/dd/yyyy"), 0, status, "", "", "", "", "", "0", "0", "0", "0", "0");
            lttitle.Text = "Quản lý mã khuyến mại - Thêm thành công";
            WEB.Logs.writelog("Thêm mã khuyến mại  " + txtcoupon.Text);
            UpdateList();
            }
            catch (Exception ex)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi thêm dữ liệu " + ex.ToString()+ "</p>";
                ltdetailmsg.Visible = true;
            }
        }
        else if (hd_insertupdate.Value.Equals("update"))
        {
          
            try
            {
                WEB.Coupons.db_coupons_update(hdicid.Value, Convert.ToInt32(ddltype.SelectedValue), txtcoupon.Text.Trim(), Convert.ToInt32(txtnumber.Text), Convert.ToSingle(txtdiscount.Text), Convert.ToInt32(ddloptions.SelectedValue), Convert.ToSingle(txtmoneystart.Text), dstart.ToString("MM/dd/yyyy"), dend.ToString("MM/dd/yyyy"), Convert.ToInt32(hdiused.Value), status, "", "", "", "", "", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý mã khuyến mại - Cập nhật thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật mã khuyến mại:  " + txtcoupon.Text);
                UpdateList();
            }
            catch
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật dữ liệu</p>";
                ltdetailmsg.Visible = true;
            }

        }
        
    }
   
    protected void lnkadd_Click(object sender, EventArgs e)
    {
        clear();
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        lttitle.Text = "Thêm mã khuyến mại";
        pnlist.Visible = false;
        pndetail.Visible = true;
        this.hd_insertupdate.Value = "insert";
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
        if (str == "1")
        {
            return "<img src='" + weburl + "templates/admin/images/iconupdate_c.png'>";
        }
        else
        {
            return "<img src='" + weburl + "templates/admin/images/iconclose_c.png'>";
        }
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

                            WEB.Coupons.db_coupons_delete(s[i].ToString());
                            UpdateList();
                        }
                    }
                }
            }
        }
        UpdateList();
    }
    public string space(string level)
    {
        switch (level)
        {

            case "2":
                return "......";
                break;
            case "3":
                return ".........";
                break;
            case "4":
                return "............";
                break;
            case "5":
                return "...............";
                break;
            default:
                return "";
                break;
        }
    }

    
}