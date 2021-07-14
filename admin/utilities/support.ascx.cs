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

public partial class admin_supportonline_support : System.Web.UI.UserControl
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
            lttitle.Text = "Quản lý hỗ trợ trực tuyến";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
        }
    }
    protected void clear()
    {
        txt_skype.Text = "";
        txt_yahoo.Text = "";
        txtname.Text = "";
        txtphone.Text = "";
        ltimage.Text = "";
        txtorder.Text = "0";
        ltimage.Text = "";
        chkstatus.Checked = true;
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
        string condition = " vcode ='" + WEB.Common.mod_suportonline + "' and vlan='" + vlan + "'"; 
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
                lttitle.Text = "Cập nhật hỗ trợ trực tuyến";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                this.hdid.Value = p.Trim();
                DataTable dt = new DataTable();
                clear();
                dt = WEB.Item_other.getitembyino(p);
                if (dt.Rows.Count > 0)
                {
                    txtname.Text = dt.Rows[0]["vtitle"].ToString();
                    txtphone.Text = dt.Rows[0]["vdesc"].ToString();
                    txt_skype.Text = dt.Rows[0]["vcontent"].ToString();
                    txt_yahoo.Text=dt.Rows[0]["vparam2"].ToString().Trim();
                    txtorder.Text = dt.Rows[0]["iorders"].ToString();
                    hdimg_old.Value=dt.Rows[0]["vparam3"].ToString();
                    txtdepartment.Text = dt.Rows[0]["vparam4"].ToString();
                    if (dt.Rows[0]["vparam3"].ToString().Length > 0)
                    {
                        ltimage.Text = "<img src='" + weburl + "uploads/supports/" + dt.Rows[0]["vparam3"].ToString() + "' style='max-width:100px' >";
                        chkdeleteimg.Visible = true;
                    }
                    else
                        chkdeleteimg.Visible = false;
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddltype, dt.Rows[0]["vparam1"].ToString());
                    if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                        chkstatus.Checked = false;
                    else
                        chkstatus.Checked = true;

                }

                break;
            case"delete":
                WEB.Item_other.db_items_other_deletebyino(p);
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
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tên</p";
            ltdetailmsg.Visible = true;
            txtname.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtorder.Text) == false)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Thứ tự phải là số</p>";
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
            tempname = WEB.Common.GetNewTitle(tempname.Replace(fileextention, "")) + fileextention;
            if (fileextention.Equals(".jpg") || fileextention.Equals(".gif") || fileextention.Equals(".jpeg") || fileextention.Equals(".png"))
            {
                if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/supports/" + tempname) == false)
                    image = tempname;
                else
                    image = "support_" + DateTime.Now.Second + fileextention;
                flupload.SaveAs(Server.MapPath("~/") + "/uploads/supports/" + image);
                System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(flupload.PostedFile.InputStream);
                System.Drawing.Image objImage = WEB.Common.ScaleImage(bmpPostedImage, fileextention, 100, 0);
                if (fileextention == ".png")
                    objImage.Save(Server.MapPath("~/") + "/uploads/supports/" + image, System.Drawing.Imaging.ImageFormat.Png);
                if (fileextention == ".jpg" || fileextention == ".jpeg")
                    objImage.Save(Server.MapPath("~/") + "/uploads/supports/" + image, System.Drawing.Imaging.ImageFormat.Jpeg);
                if (fileextention == ".gif")
                    objImage.Save(Server.MapPath("~/") + "/uploads/supports/" + image, System.Drawing.Imaging.ImageFormat.Gif);

            }
            else
            {
                ltdetailmsg.Visible = true;
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.jpeg,*.png</p>";
                return;
            }

        }
        string istatus = "0";
        if (chkstatus.Checked == true)
            istatus = "1";

        if (hd_insertupdate.Value.Equals("insert"))
        {

            try
            {
                WEB.Item_other.db_items_other_insert("-1",WEB.Common.mod_suportonline,vlan, txtname.Text, txtphone.Text, txt_skype.Text, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"),"0", txtorder.Text, istatus,ddltype.SelectedValue,txt_yahoo.Text,image,txtdepartment.Text, "", "0", "0");
                lttitle.Text = "Quản lý hỗ trợ trực tuyến - Thêm hỗ trợ trực tuyến thành công";
                //ghi log
                //string id = WEB.Dataprovider.getmax("db_items_other", "iid", "vcode ='" + WEB.Common.mod_suportonline + "'").ToString();
                WEB.Logs.writelog("Thêm hỗ trợ trực tuyến: " + txtname.Text);
                UpdateList();
            }
            catch
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi thêm dữ liệu</p>";
                ltdetailmsg.Visible = true;
            }
        }
        else if (hd_insertupdate.Value.Equals("update"))
        {
            
            try
            {
                if (image == "")
                    image = hdimg_old.Value;
                else
                {
                    try
                    {
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/supports/" + hdimg_old.Value);
                    }
                    catch
                    {
                    }
                }
                if (chkdeleteimg.Checked == true)
                {
                    image = "";
                    try
                    {
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/supports/" + hdimg_old.Value);
                    }
                    catch
                    {
                    }
                }
                WEB.Item_other.db_items_other_update(hdid.Value, "-1", WEB.Common.mod_suportonline, vlan, txtname.Text, txtphone.Text, txt_skype.Text, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", txtorder.Text, istatus, ddltype.SelectedValue, txt_yahoo.Text, image, txtdepartment.Text, "", "0", "0");
                lttitle.Text = "Quản lý hỗ trợ trực tuyến - Cập nhật hỗ trợ trực tuyến thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật hỗ trợ trực tuyến: " + txtname.Text);
                UpdateList();
            }
            catch
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật dữ liệu</p>";
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
        lttitle.Text = "Thêm hỗ trợ trực tuyến";
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

}