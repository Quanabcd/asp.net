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

public partial class admin_utilities_u_hotline : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int curpage = 0;
    public int numitems = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.UpdateList();
            lttitle.Text = "Quản lý Hotline";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
        }
    }
    protected void clear()
    {
        txt_vdesc.Text = "";
        ltimage.Text = "";
        txtname.Text = "";
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
        string[] fieldsearch = { };
        string condition = " vcode ='" + WEB.Common.mod_hotline + "'"; ;
        string key = "";
        dt = WEB.Item_other.getlistitembypage(fieldsearch, key, condition, 0, 30, " iid DESC");
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
                ltdetailmsg.Text = "";
                lnkupdate.Visible = true;
                lnkclose.Visible = true;
                lnkadd.Visible = false;
                lnkdelete.Visible = false;
                lttitle.Text = "Cập nhật Hotline";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                this.hdid.Value = p.Trim();
                DataTable dt = new DataTable();
                dt = WEB.Item_other.getitembyino(p);
                if (dt.Rows.Count > 0)
                {
                    txtname.Text = dt.Rows[0]["vtitle"].ToString();
                    txtorder.Text = dt.Rows[0]["iorders"].ToString();
                    txt_vdesc.Text=dt.Rows[0]["vdesc"].ToString();
                    hdimg_old.Value = dt.Rows[0]["vparam1"].ToString();
                    ltimage.Text = "<img src='" + weburl + "uploads/hotline/" + dt.Rows[0]["vparam1"].ToString() + "' style='max-width:100px' >";

                    if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                        chkstatus.Checked = false;
                    else
                        chkstatus.Checked = true;

                }

                break;
            case "delete":
                WEB.Item_other.db_items_other_delete(p);
                UpdateList();
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

        if (txtname.Text.Length == 0)
        {
            ltdetailmsg.Text = "<p style='color: #16757c;margin: 0;font-size: 11px;padding: 12px 15px 0px 15px;font-style: italic;'>Xin mời nhập số hotline</p";
            ltdetailmsg.Visible = true;
            txtname.Focus();
            return;
        }
        //if (WEB.Common.Check_number(txtname.Text)==false)
        //{
        //    ltdetailmsg.Text = "<p style='color: #16757c;margin: 0;font-size: 11px;padding: 12px 15px 0px 15px;font-style: italic;'>Số hotline phải là kiểu số</p";
        //    ltdetailmsg.Visible = true;
        //    txtname.Focus();
        //    return;
        //}
        if (WEB.Common.Check_number(txtorder.Text) == false)
        {
            ltdetailmsg.Text = "<p style='color: #16757c;margin: 0;font-size: 11px;padding: 12px 15px 0px 15px;font-style: italic;'>Thứ tự phải là số</p>";
            ltdetailmsg.Visible = true;
            txtorder.Focus();
            return;
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
                flupload.SaveAs(Server.MapPath("~/") + "/uploads/hotline/" + image);
            }
            else
            {
                ltdetailmsg.Visible = true;
                ltdetailmsg.Text = "<p style='color: #16757c;margin: 0;font-size: 11px;padding: 12px 15px 0px 15px;font-style: italic;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.bmp,*.png</p>";
                return;
            }

        }
        string istatus = "0";
        if (chkstatus.Checked == true)
            istatus = "1";
        if (hd_insertupdate.Value.Equals("insert"))
        {

            //try
            //{
            WEB.Item_other.db_items_other_insert("-1",WEB.Common.mod_hotline, vlan, txtname.Text,txt_vdesc.Text,"", DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", txtorder.Text, istatus,image,"", "", "", "", "0", "0");
            lttitle.Text = "Quản lý Hotline - Thêm Hotline thành công";
            //ghi log
            string id = WEB.Dataprovider.getmax("db_items_other", "iid", "vcode ='" + WEB.Common.mod_hotline + "'").ToString();
            WEB.Logs.writelog("Thêm Hotline ID: " + id);
            UpdateList();
            //}
            //catch
            //{
            //    ltdetailmsg.Text = "Lỗi thêm dữ liệu";
            //    ltdetailmsg.Visible = true;
            //}
        }
        else if (hd_insertupdate.Value.Equals("update"))
        {

            //try
            //{
            if (image == "")
                image = hdimg_old.Value;
            else
            {
                try
                {
                    System.IO.File.Delete(Server.MapPath("~/") + "/uploads/hotline/" + hdimg_old.Value);
                }
                catch
                {
                }
            }
            WEB.Item_other.db_items_other_update(hdid.Value,"-1", WEB.Common.mod_hotline, vlan, txtname.Text,txt_vdesc.Text, "", DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", txtorder.Text, istatus,image,"","", "", "", "0", "0");
            lttitle.Text = "Quản lý Hotline - Cập nhật Hotline thành công";
            //ghi log
            WEB.Logs.writelog("Cập nhật Hotline ID: " + hdid.Value);
            UpdateList();
            //}
            //catch
            //{
            //    ltdetailmsg.Text = "Lỗi cập nhật dữ liệu";
            //    ltdetailmsg.Visible = true;
            //}

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
        lttitle.Text = "Thêm Hotline";
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
                            WEB.Item_other.db_items_other_delete(s[i].ToString());

                        }
                    }
                }
            }
        }
        UpdateList();
    }

}