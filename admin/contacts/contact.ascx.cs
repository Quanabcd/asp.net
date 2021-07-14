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

public partial class admin_contacts_contact: System.Web.UI.UserControl
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
            txtkeysearch.Text = key;
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlorder, iorder.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlstatus, istatus.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlordertype, iordertype.ToString());
            //numitems = WEB.Item_other.getnumitem(WEB.Common.mod_contacts, "");
            this.UpdateList();
            lttitle.Text = "Quản lý liên hệ";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = false;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;

        }
    }

    protected void UpdateList()
    {
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = false;
        lnkdelete.Visible = true;
        pndetail.Visible = false;
        pnlist.Visible = true;
        DataTable dt = new DataTable();
        string[] fieldsearch = { "vkey", "vtitle", "vparam1", "vparam2","vparam3" };
        string condition = "";
        string key = "";
        string sorder = "ino desc";
        if (iorder == 0)
            sorder = "dcreatedate";
        else if (iorder == 1)
            sorder = "vtitle";
        
        if (iordertype == 1)
            sorder += " asc";
        else
            sorder += " desc";
        //key = WEB.Common.remove_specical_char(txtkeysearch.Text);
        numitems = WEB.Item_other.getnumitems(key, fieldsearch, WEB.Common.mod_contacts,vlan, condition, istatus.ToString());
        //dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, curpage,20, sorder);
        dt = WEB.Item_other.getlistitembypage(fieldsearch, key, WEB.Common.mod_contacts,vlan,condition, istatus.ToString(), curpage - 1, 15, sorder);
        lt_count.Text = "Tổng số liên hệ: <span style='color: #A52A2A;'>" + numitems.ToString() + "</span>";
        rpitems.DataSource = dt;
        rpitems.DataBind();
        ltpage.Text = WEB.Common.PhanTrang("?mod=contacts&c=items&key=" + key.Trim() + "&st=" + istatus.ToString() + "&order=" + iorder.ToString() + "&ordertype=" + iordertype.ToString(), curpage, numitems, 15);
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
                lttitle.Text = "Cập nhật liên hệ";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                this.hdid.Value = p.Trim();
                DataTable dt = new DataTable();
                dt = WEB.Item_other.getitembyino(p);
                if (dt.Rows.Count > 0)
                {
                    ltname.Text = dt.Rows[0]["vtitle"].ToString();
                    lttitlecontact.Text = dt.Rows[0]["vdesc"].ToString();                 
                    ltcontent.Text = dt.Rows[0]["vcontent"].ToString();
                    ltemail.Text = dt.Rows[0]["vparam1"].ToString();
                    ltphone.Text = dt.Rows[0]["vparam2"].ToString();
                    ltaddress.Text = dt.Rows[0]["vparam3"].ToString();
                    if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                        chkstatus.Checked = false;
                    else
                        chkstatus.Checked = true;

                }
                ltaddress.Enabled = false;
                ltemail.Enabled = false;
                ltname.Enabled = false;
                ltphone.Enabled = false;
                lttitlecontact.Enabled = false;
                ltcontent.Enabled = false;
               
               
                break;
            case "ChangeStatus":
                p = e.CommandArgument.ToString().Trim().Substring(0, e.CommandArgument.ToString().IndexOf("|"));
                string status = e.CommandArgument.ToString().Substring(e.CommandArgument.ToString().IndexOf("|") + 1, e.CommandArgument.ToString().Length - e.CommandArgument.ToString().IndexOf("|") - 1);
                if (status == "1")
                    status = "0";
                else
                    status = "1";
                WEB.Item_other.updatestatus(p, status);
                this.UpdateList();
                break;

        }
    }

    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        
            try
            {
                string istatus = "0";
                if (chkstatus.Checked == true)
                    istatus = "1";
                WEB.Item_other.updatestatus(hdid.Value,istatus);
                lttitle.Text = "Quản lý liên hệ - Cập nhật liên hệ thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật liên hệ ID: " + hdid.Value);
                UpdateList();
            }
            catch
            {
                ltdetailmsg.Text = "Lỗi cập nhật dữ liệu";
                ltdetailmsg.Visible = true;
            }


    }

    protected void lnkadd_Click(object sender, EventArgs e)
    {
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        lttitle.Text = "Thêm liên hệ";
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
                            WEB.Item_other.db_items_other_deletebyino(s[i].ToString());

                        }
                    }
                }
            }
        }
        UpdateList();
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        Response.Redirect(weburl + "admin/?mod=contacts&c=items" + "&key=" + txtkeysearch.Text.Trim() + "&st=" + ddlstatus.SelectedValue + "&order=" + ddlorder.SelectedValue + "&ordertype=" + ddlordertype.SelectedValue);
    }
}
