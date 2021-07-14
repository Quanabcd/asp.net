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

public partial class admin_settings_district : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int n = 0;
    public DataTable dttinhthanh = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        WEB.CategoryOther.getcategorylevel1(ref dttinhthanh, "-1", "CI", vlan, "-1");
        if (!IsPostBack)
        {
            
            lttitle.Text = "Quản lý vận chuyển";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            ltlink.Text = "";
            ddlcate.Items.Clear();
            ddlcatesearch.Items.Clear();
            ddlcatesearch.Items.Add(new ListItem("Tất cả các tỉnh thành", "0"));
            ddlcate.Items.Add(new ListItem("Tất cả các tỉnh thành", "0"));
            for (int i = 0; i < dttinhthanh.Rows.Count; i++)
            {
                string space = "";
                for (int j = 1; j < Convert.ToInt32(dttinhthanh.Rows[i]["ilevel"].ToString()); j++)
                {
                    space += "..";
                }

                this.ddlcate.Items.Add(new ListItem(space + dttinhthanh.Rows[i]["vname"].ToString(), dttinhthanh.Rows[i]["icid"].ToString()));
                this.ddlcatesearch.Items.Add(new ListItem(space + dttinhthanh.Rows[i]["vname"].ToString(), dttinhthanh.Rows[i]["icid"].ToString()));
                space = "";
            }
         
            this.UpdateList();
        }
    }
    
    public void clear()
    {
        txtname.Text = "";
        ltdetailmsg.Text = "";
        txtfrom.Text = "0";
        txtto.Text = "1000";
        txtprice.Text = "0";
        ddlcate.Enabled = true;
        trqh.Visible = false;
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
        n = 0;
        WEB.CategoryOther.getcategorylevel1(ref dt,"-1", "TP","iparam1=" +  ddlcatesearch.SelectedValue, vlan, "-1");
        rpitems.DataSource = dt;
        rpitems.DataBind();
    }
    public int getstt()
    {
        n++;
        return n;
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
                lttitle.Text = "Cập nhật vận chuyển";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                this.hdicid.Value = p.Trim();
                DataTable dt = new DataTable();
                dt = WEB.CategoryOther.getcatebyid(p);
                if (dt.Rows.Count > 0)
                {
                    txtname.Text = dt.Rows[0]["vname"].ToString().Trim();
                    txtfrom.Text = dt.Rows[0]["vdesc"].ToString().Trim();
                    txtto.Text = dt.Rows[0]["vimg"].ToString().Trim();
                    txtprice.Text = dt.Rows[0]["vicon"].ToString().Trim();
                    ddlcate.Enabled = false;
                    if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                        chkstatus.Checked = false;
                    else
                        chkstatus.Checked = true;
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlcate, dt.Rows[0]["iparam1"].ToString());
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddltc, dt.Rows[0]["iparam2"].ToString());
                    hdqh.Value = dt.Rows[0]["vparam1"].ToString();
                    hdpriceqh.Value = dt.Rows[0]["vparam2"].ToString();
                    loadqh(dt.Rows[0]["iparam1"].ToString());
                }

                break;
            case "ChangeStatus":
                p = e.CommandArgument.ToString().Trim().Substring(0, e.CommandArgument.ToString().IndexOf("|"));
                string status = e.CommandArgument.ToString().Substring(e.CommandArgument.ToString().IndexOf("|") + 1, e.CommandArgument.ToString().Length - e.CommandArgument.ToString().IndexOf("|") - 1);
                if (status == "1")
                    status = "0";
                else
                    status = "1";
                WEB.CategoryOther.updatestatus(p, status);
                this.UpdateList();
                break;
            case "delete":
                    WEB.CategoryOther.db_categories_other_delete(p);
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
        if (txtname.Text.Length == 0)
        {
            ltdetailmsg.Text = "Xin mời nhập tiêu đề";
            ltdetailmsg.Visible = true;
            txtname.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtfrom.Text.Trim())==false)
        {
            ltdetailmsg.Text = "Hạn mức phải là số";
            ltdetailmsg.Visible = true;
            txtfrom.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtto.Text.Trim()) == false)
        {
            ltdetailmsg.Text = "Hạn mức phải là số";
            ltdetailmsg.Visible = true;
            txtto.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtprice.Text.Trim()) == false)
        {
            ltdetailmsg.Text = "Giá phải là số";
            ltdetailmsg.Visible = true;
            txtprice.Focus();
            return;
        }

        string istatus = "0";
        if (chkstatus.Checked == true)
            istatus = "1";
        txtname.Text = txtname.Text.Trim();
        string qh = "|";
        string prqh = "|";
        DataTable dt = WEB.CategoryOther.getcate(ddlcate.SelectedValue, "CI", vlan, "1", "-1");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                qh += dt.Rows[i]["icid"].ToString() + "|";
            }
        }
        if (hd_insertupdate.Value.Equals("insert"))
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                prqh += txtprice.Text + "|";
            }
            //try
            //{
                //WEB.Item_other.db_items_other_insert("TP",vlan, txtname.Text, txtlink.Text,image, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), adv_type, txtorder.Text, istatus,ddlposition.SelectedValue,txtwidth.Text,txtheight.Text, "", "", "0", "0");
            WEB.CategoryOther.db_categories_other_insert("TP", vlan, "-1", "", txtname.Text.Trim(),txtfrom.Text,txtto.Text,txtprice.Text, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "1", "0", istatus, qh,prqh, "", "", "", ddlcate.SelectedValue, ddltc.SelectedValue, "0", "0", "0");
                lttitle.Text = "Quản lý vận chuyển - Thêm thành công";
                WEB.Logs.writelog("Thêm vận chuyển  " + txtname.Text);
                UpdateList();
            //}
            //catch(Exception ex)
            //{
            //    ltdetailmsg.Text = ex.ToString();
            //    ltdetailmsg.Visible = true;
            //}
        }
        else if (hd_insertupdate.Value.Equals("update"))
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                prqh +=WEB.Common.GetFormValue("txt_" + dt.Rows[i]["icid"].ToString()) + "|";
            }
            try
            {
                WEB.CategoryOther.db_categories_other_update(hdicid.Value, "TP", vlan, "-1","", txtname.Text.Trim(),txtfrom.Text,txtto.Text, txtprice.Text, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "1", "0", istatus, qh,prqh, "", "", "", ddlcate.SelectedValue,ddltc.SelectedValue, "0", "0", "0");
                lttitle.Text = "Quản lý vận chuyển - Cập nhật thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật vận chuyển:  " + txtname.Text);
                UpdateList();
            }
            catch
            {
                ltdetailmsg.Text = "Lỗi cập nhật dữ liệu";
                ltdetailmsg.Visible = true;
            }

        }
        clear();
        UpdateList();
    }
    protected void loadqh(string id)
    {
        DataTable dt = WEB.CategoryOther.getcate(id, "CI", vlan, "1", "-1");
        if (dt.Rows.Count > 0)
        {
            trqh.Visible = true;
            rpqh.DataSource = dt;
            rpqh.DataBind();
        }
    }
    protected string getpricebyqh(string s)
    {
        string str = "0";
        string[] qh = hdqh.Value.Split('|');
        string[] priceqh =  hdpriceqh.Value.Split('|');
        try
        {
            if (qh.Length > 0)
            {
                for (int i = 0; i < qh.Length; i++)
                {
                    if (qh[i] == s)
                        str = priceqh[i];
                }
            }
        }
        catch { }
        return str;
    }
    protected void lnkadd_Click(object sender, EventArgs e)
    {
        clear();
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        lttitle.Text = "Thêm vận chuyển";
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
                           
                                WEB.CategoryOther.db_categories_other_delete(s[i].ToString());
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

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        UpdateList();
    }
}
