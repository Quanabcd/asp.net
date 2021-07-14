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

public partial class admin_email_register : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int numitems = 0;
    public int iorder = 0;
    public int iordertype = 0;
    public int curpage = 1;
    public string key = "";
    public int icid = -1;
    public int istatus = -1;
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
            this.UpdateList();
            lttitle.Text = "Quản lý đăng ký email";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            txtkeysearch.Text = key;
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlorder, iorder.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlstatus, istatus.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlordertype, iordertype.ToString());
        }
    }
    protected void clear()
    {
        txtemail.Text = "";
    }
    protected void UpdateList()
    {

        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = true;
        lnkdelete.Visible = true;
        pndetail.Visible = false;
        pnlist.Visible = true;
        DataTable dt = new DataTable();
        string[] fieldsearch = { "vemail"};
        string condition = "";
        string sorder = "iid desc";
        if (iorder == 0)
            sorder = "dcreate";
        else if (iorder == 1)
            sorder = "vemail";
        else
            sorder = "dcreate";
        if (iordertype == 1)
            sorder += " asc";
        else
            sorder += " desc";
        clear();
        numitems = WEB.EmailRegister.getnumitems(key, fieldsearch,  condition, istatus.ToString());
        dt = WEB.EmailRegister.getlistitembypage(fieldsearch, key, condition,istatus.ToString(),curpage-1, 30,sorder);
        lt_count.Text = "Tổng số email: <span style='color: #A52A2A;'>" + numitems.ToString() + "</span>";
        rpitems.DataSource = dt;
        rpitems.DataBind();
        ltpage.Text = WEB.Common.PhanTrang("?mod=utilities&c=emailregister&key=" + key.Trim() + "&st=" + istatus.ToString() + "&order=" + iorder.ToString() + "&ordertype=" + iordertype.ToString(), curpage, numitems, 30);
        lt_pagebotom.Text = ltpage.Text;
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
                lnkadd.Visible = false;
                lnkdelete.Visible = false;
                lttitle.Text = "Cập nhật đăng ký email";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                this.hdid.Value = p.Trim();
                DataTable dt = new DataTable();
                dt = WEB.EmailRegister.getitembyid(p);
                if (dt.Rows.Count > 0)
                {
                    hdemail.Value= txtemail.Text = dt.Rows[0]["vemail"].ToString();
                    if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                        chkstatus.Checked = false;
                    else
                        chkstatus.Checked = true;

                }

                break;
            case"delete":
                WEB.EmailRegister.db_email_register_delete(p);
                UpdateList();
                break;
            case "ChangeStatus":
                p = e.CommandArgument.ToString().Trim().Substring(0, e.CommandArgument.ToString().IndexOf("|"));
                string status = e.CommandArgument.ToString().Substring(e.CommandArgument.ToString().IndexOf("|") + 1, e.CommandArgument.ToString().Length - e.CommandArgument.ToString().IndexOf("|") - 1);
                if (status == "1")
                    status = "0";
                else
                    status = "1";
                WEB.EmailRegister.updatestatus(p, status);
                this.UpdateList();
                break;

        }
    }

    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        
        if (txtemail.Text.Length == 0)
        {
            ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Xin mời nhập email</p>";
            ltdetailmsg.Visible = true;
            txtemail.Focus();
            return;
        }
      
        string istatus = "0";
        if (chkstatus.Checked == true)
            istatus = "1";
        if (hd_insertupdate.Value.Equals("insert"))
        {
            DataTable dt = WEB.EmailRegister.getitembyfield("vemail", txtemail.Text);
            if (dt.Rows.Count > 0)
            {
                ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Email đã tồn tại, xin mời nhập email khác</p>";
                ltdetailmsg.Visible = true;
                txtemail.Focus();
                return;
            }
            try
            {
                string[] s = { "vemail", "istatus" };
                object[] o = { txtemail.Text, istatus };
                WEB.EmailRegister.save(-1, s, o);
                UpdateList();
            }
            catch
            {
                ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;;'>Lỗi thêm dữ liệu</p>";
                ltdetailmsg.Visible = true;
            }
        }
        else if (hd_insertupdate.Value.Equals("update"))
        {
            if (txtemail.Text != hdemail.Value)
            {
                DataTable dt = WEB.EmailRegister.getitembyfield("vemail", txtemail.Text);
                if (dt.Rows.Count > 0)
                {
                    ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Email đã tồn tại, xin mời nhập email khác</p>";
                    ltdetailmsg.Visible = true;
                    txtemail.Focus();
                    return;
                }
            }
            try
            {
                string[] s = { "vemail","istatus"};
                object[] o = {txtemail.Text,istatus };
                WEB.EmailRegister.save(Convert.ToInt32( hdid.Value),s,o);
                lttitle.Text = "Quản lý đăng ký email - Cập nhật đăng ký email thành công";
                //ghi log
                //WEB.Logs.writelog("Cập nhật đăng ký email ID: " + hdid.Value);
                UpdateList();
            }
            catch
            {
                ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Lỗi cập nhật dữ liệu</p>";
                ltdetailmsg.Visible = true;
            }

        }

        UpdateList();
    }

    protected void lnkadd_Click(object sender, EventArgs e)
    {
        clear();
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        lttitle.Text = "Thêm đăng ký email";
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
                            WEB.EmailRegister.db_email_register_delete(s[i].ToString());

                        }
                    }
                }
            }
        }
        UpdateList();
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        Response.Redirect(weburl + "admin/?mod=utilities&c=emailregister&key=" + txtkeysearch.Text.Trim() + "&st=" + ddlstatus.SelectedValue + "&order=" + ddlorder.SelectedValue + "&ordertype=" + ddlordertype.SelectedValue);
    }
}