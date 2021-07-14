using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


public partial class admin_menus_u_menubottom : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int num = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.UpdateList();
            lttitle.Text = "Quản lý menu dưới cùng";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            lt_mess.Visible = false;
            
        }
        DataTable dt = new DataTable();
        dt = WEB.Category.getcate("-1", WEB.Common.mod_menubottom, vlan, "1", "-1");
        ddlcate.Items.Clear();
        ddlcate.Items.Add(new ListItem("Menu chính", "-1"));
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string space = "";
            for (int j = 1; j < Convert.ToInt32(dt.Rows[i]["ilevel"].ToString()); j++)
            {
                space += "..";
            }

            this.ddlcate.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));

            space = "";
        }
    }
    public int getstt()
    {
        num++;
        return num;
    }
    protected void UpdateList()
    {
        clear();
        num = 0;
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = true;
        lnkdelete.Visible = true;
        pndetail.Visible = false;
        pnlist.Visible = true;
        DataTable dt = new DataTable();
        dt = WEB.Category.getcate("-1", WEB.Common.mod_menubottom, vlan, "1", "-1");
        rpitems.DataSource = dt;
        rpitems.DataBind();
    }
   
    protected void rpitems_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        string c = e.CommandName.Trim();
        string p = e.CommandArgument.ToString().Trim();
        switch (c)
        {
            case "EditDetail":
                lt_mess.Text = "";
                lnkupdate.Visible = true;
                lnkclose.Visible = true;
                lnkadd.Visible = false;
                lnkdelete.Visible = false;
                lttitle.Text = "Cập nhật menu dưới cùng";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                clear();
                this.hdicid.Value = p.Trim();
                DataTable dt = new DataTable();
                dt = WEB.Category.getcatebyid(p);
                if (dt.Rows.Count > 0)
                {
                    txtname.Text = dt.Rows[0]["vname"].ToString().Trim();
                    txtorder.Text = dt.Rows[0]["iorders"].ToString().Trim();
                    txtlink.Text = dt.Rows[0]["vdesc"].ToString().Trim();
                    hd_img.Value = dt.Rows[0]["vimg"].ToString();
                    for (int i = 0; i < ddlcate.Items.Count; i++)
                    {
                        if (ddlcate.Items[i].Value.Equals(hdicid.Value))
                        {
                            ddlcate.Items.RemoveAt(i);
                            break;
                        }
                    }
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlcate, dt.Rows[0]["iparcid"].ToString());
                    if (dt.Rows[0]["vimg"].ToString().Length>0)
                        ltimage.Text = "<img src=" + weburl + "uploads/icon/" + dt.Rows[0]["vimg"].ToString() + ">";
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
            lt_mess.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tiêu đề</p>";
            lt_mess.Visible = true;
            txtname.Focus();
            return;
        }
        if (txtname.Text.Length >200)
        {
            lt_mess.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Tiêu đề phải nhỏ hơn 200 ký tự</p>";
            lt_mess.Visible = true;
            txtname.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtorder.Text) == false)
        {
            lt_mess.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Thứ tự phải là số</p>";
            lt_mess.Visible = true;
            txtorder.Focus();
            return;
        }

        string istatus = "0";
        if (chkstatus.Checked == true)
            istatus = "1";
        string ilevel = "1";
        if (!ddlcate.SelectedValue.Equals("-1"))
        {
            DataTable dt = new DataTable();
            dt = WEB.Category.getcatebyid(ddlcate.SelectedValue);
            if (dt.Rows.Count > 0)
                ilevel = (Convert.ToInt32(dt.Rows[0]["ilevel"].ToString()) + 1).ToString();
        }

        string image = "";
        if (this.flupload.FileName.Trim().Length > 0)
        {
            string tempname = System.IO.Path.GetFileName(flupload.PostedFile.FileName);
            string fileextention = "";
            fileextention = System.IO.Path.GetExtension(tempname).ToLower();

            if (fileextention.Equals(".jpg") || fileextention.Equals(".gif") || fileextention.Equals(".bmp") || fileextention.Equals(".png"))
            {
                image = DateTime.Now.Ticks.ToString() + fileextention;
                flupload.SaveAs(Server.MapPath("~/") + "/uploads/icon/" + image);
            }
            else
            {
                lt_mess.Visible = true;
                lt_mess.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.bmp,*.png</p>";
                return;
            }

        }
        if (txtlink.Text.Contains("/") == false)
            txtlink.Text = "/" + txtlink.Text.Trim();
        string[] s = txtlink.Text.Split('/');
        if (s.Length > 0)
        {
            if (s[s.Length - 1].Length > 0)
            {
                DataTable dtc = WEB.Category.getcatebyfield("valias", s[s.Length - 1]);
                if (dtc.Rows.Count > 0)
                    hdicate.Value = dtc.Rows[0]["icid"].ToString();
                else
                    hdicate.Value = "";
            }
            else
                hdicate.Value = "";
        }
        if (hd_insertupdate.Value.Equals("insert"))
        {

            try
            {
                //WEB.Item_other.db_items_other_insert(WEB.Common.mod_adv,vlan, txtname.Text, txtlink.Text,image, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), adv_type, txtorder.Text, istatus,ddlposition.SelectedValue,txtwidth.Text,txtheight.Text, "", "", "0", "0");
                WEB.Category.db_categories_insert(WEB.Common.mod_menubottom, vlan, ddlcate.SelectedValue,"", txtname.Text.Trim(), txtlink.Text.Trim(),"", image, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), ilevel, txtorder.Text, istatus, "",hdicate.Value, "", "", "", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý menu dưới cùng- Thêm menu thành công";
                //ghi log
                string id = WEB.Dataprovider.getmax("db_categories", "icid", "").ToString();
                WEB.Logs.writelog("Thêm menu dưới cùng: " + txtname.Text);
                UpdateList();
            }
            catch (Exception ex)
            {
                lt_mess.Text = ex.ToString();
                lt_mess.Visible = true;
            }
        }
        else if (hd_insertupdate.Value.Equals("update"))
        {

            try
            {

                WEB.Category.db_categories_update(hdicid.Value, WEB.Common.mod_menubottom, vlan, ddlcate.SelectedValue, "", txtname.Text.Trim(), txtlink.Text.Trim(), "", image, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), ilevel, txtorder.Text, istatus, "", hdicate.Value, "", "", "", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý menu dưới cùng - Cập nhật menu thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật menu dưới cùng: " +txtname.Text);
                UpdateList();
            }
            catch
            {
                lt_mess.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật dữ liệu</p>";
                lt_mess.Visible = true;
            }

        }

        UpdateList();
    }
    public void clear()
    {
        txtname.Text = "";
        txtlink.Text = "";
        txtorder.Text = "1";
        chkstatus.Checked = true;
    }
    protected void lnkadd_Click(object sender, EventArgs e)
    {
        clear();
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        lttitle.Text = "Thêm menu dưới cùng";
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
                            WEB.Category.db_categories_delete(s[i].ToString());

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