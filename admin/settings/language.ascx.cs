using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class admin_settings_language : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int n = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.UpdateList();
            lttitle.Text = "Quản lý ngôn ngữ";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            ltlink.Text = "";

        }
    }
    public void clear()
    {
        txtname.Text = "";
        txtorder.Text = "1";
        txt_code.Text = "";
        txt_code.Enabled = true;
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
        dt = WEB.Category.getcate("-1","LAN","-1", "1", "-1");
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
                lttitle.Text = "Cập nhật ngôn ngữ";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                this.hdicid.Value = p.Trim();
                DataTable dt = new DataTable();
                dt = WEB.Category.getcatebyid(p);
                if (dt.Rows.Count > 0)
                {
                    txtname.Text = dt.Rows[0]["vname"].ToString().Trim();
                    txt_code.Text = dt.Rows[0]["vimg"].ToString();
                    txt_code.Enabled = false;
                    txtorder.Text = dt.Rows[0]["iorders"].ToString().Trim();
               
                    if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                        chkstatus.Checked = false;
                    else
                        chkstatus.Checked = true;
                }

                break;
            case "ChangeStatus":
                p = e.CommandArgument.ToString().Trim().Substring(0, e.CommandArgument.ToString().IndexOf("|"));
                string status = e.CommandArgument.ToString().Substring(e.CommandArgument.ToString().IndexOf("|") + 1, e.CommandArgument.ToString().Length - e.CommandArgument.ToString().IndexOf("|") - 1);
                if (status == "1")
                    status = "0";
                else
                    status = "1";
                WEB.Category.updatestatus(p, status);
                this.UpdateList();
                break;
            case "delete":
                WEB.Category.db_categories_delete(p);
                UpdateList();
                break;

        }
    }

    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        if (txtname.Text.Length == 0)
        {
            ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Xin mời nhập tiêu đề</p>";
            ltdetailmsg.Visible = true;
            txtname.Focus();
            return;
        }
        if (txt_code.Text.Length == 0)
        {
            ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Xin mời nhập mã </p>";
            ltdetailmsg.Visible = true;
            txt_code.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtorder.Text) == false)
        {
            ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Thứ tự phải là số</p>";
            ltdetailmsg.Visible = true;
            txtorder.Focus();
            return;
        }

        string istatus = "0";
        if (chkstatus.Checked == true)
            istatus = "1";
        txtname.Text = txtname.Text.Trim();

        if (hd_insertupdate.Value.Equals("insert"))
        {


            //try
            //{
            //WEB.Item_other.db_items_other_insert("LAN",vlan, txtname.Text, txtlink.Text,image, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), adv_type, txtorder.Text, istatus,ddlposition.SelectedValue,txtwidth.Text,txtheight.Text, "", "", "0", "0");
            WEB.Category.db_categories_insert("LAN", "-1", "-1","", txtname.Text.Trim(), "", txt_code.Text, "", Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "1", txtorder.Text, istatus,"","", "", "", "", "0", "0", "0", "0", "0");
            lttitle.Text = "Quản lý ngôn ngữ - Thêm ngôn ngữ thành công";
            //ghi log
           // string id = WEB.Dataprovider.getmax("db_categories", "icid", "").ToString();
            WEB.Logs.writelog("Thêm ngôn ngữ: " + txtname.Text);
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

            try
            {


                WEB.Category.db_categories_update(hdicid.Value,"LAN", vlan, "-1", "", txtname.Text.Trim(), "", txt_code.Text, "", Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "1", txtorder.Text, istatus, "", "", "", "", "", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý ngôn ngữ - Cập nhật ngôn ngữ thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật ngôn ngữ : " + txtname.Text);
                UpdateList();
            }
            catch
            {
                ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Lỗi cập nhật dữ liệu</p>";
                ltdetailmsg.Visible = true;
            }

        }
        clear();
        UpdateList();
    }

    protected void lnkadd_Click(object sender, EventArgs e)
    {
        clear();
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        txt_code.Text = "";
        lttitle.Text = "Thêm ngôn ngữ";
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
                            if (WEB.Items.getlisitem(WEB.Common.mod_news, WEB.Common.LangAdmin, "(icid='" + s[i].ToString() + "' and istatus='1')", "").Rows.Count > 0)
                            {
                                lt_mess.Text = "<p style='color: #16757c;margin: 0;font-size: 11px;padding: 12px 15px 0px 15px;font-style: italic;'>Bạn phải xóa danh sách quảng cáo thuộc vị trí này trước*</p>";
                            }
                            else
                            {
                                WEB.Category.db_categories_delete(s[i].ToString());
                                UpdateList();
                            }

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