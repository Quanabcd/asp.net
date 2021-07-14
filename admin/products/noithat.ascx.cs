﻿using System;
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

public partial class admin_products_noithat : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.Lang;
    public int n = 0;
    public string role = "";
    public string itemtitle = "";
    public string itemurl = "";
    public string itemdescription = "";
    public int iid = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        role = Session["role"].ToString();
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("id")))
        {
            iid = Convert.ToInt32(WEB.Common.GeturlParam("id"));
        }
        if (!IsPostBack)
        {
           
       
            CKFinder.FileBrowser _FileBrowser1 = new CKFinder.FileBrowser();
            _FileBrowser1.BasePath = "../ckfinder";
            _FileBrowser1.SetupCKEditor(txtcontent);

            this.UpdateList();
            lttitle.Text = "Quản lý hình ảnh";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            ltlink.Text = "";
            
        }
      
    }
    public bool checkrole(string s)
    {
        if (role.Contains("|" + s + "|"))
            return true;
        else
            return false;
    }
 
    public int getstt()
    {
        n++;
        return n;
    }
    public string getdatecreateupdate(string dcreate, string dupdate)
    {
        string str = "";
        if (dcreate == dupdate)
        {
            str = "<p class='sptime'><i class='ico-dcreate'  title='Ngày tạo'></i>" + Convert.ToDateTime(dcreate).ToString("dd/MM/yyyy HH:mm") + "</p>";
            str += "<p class='sptime'><i class='ico-dupdate'  title='Ngày cập nhật'></i>...</p>";
        }
        else
        {
            str = "<p class='sptime'><i class='ico-dcreate'  title='Ngày tạo'></i>" + Convert.ToDateTime(dcreate).ToString("dd/MM/yyyy HH:mm") + "</p>";
            str += "<p class='sptime'><i class='ico-dupdate'  title='Ngày cập nhật'></i>" + Convert.ToDateTime(dupdate).ToString("dd/MM/yyyy HH:mm") + "</p>";
        }
        return str;
    }
    public void clear()
    {
        chkdeleteimg.Visible = false;
        txt_mota.Text = "";
        txtcontent.Text = "";
        txtname.Text = "";
        txtorder.Text = "1";
        lt_mess.Text = "";
   
        ltimage.Text = "";
        ltdetailmsg.Text = "";
        chkstatus.Checked = true;
       
    }
    protected void UpdateList()
    {
        n = 0;
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = true;
        lnkdelete.Visible = true;
        pndetail.Visible = false;
        pnlist.Visible = true;
        DataTable dt = new DataTable();
        dt = WEB.Item_other.getlistitembypage(new string[0], "", "vcode='NOT' and iid=" + iid.ToString(), 0, 100, "vparam2 asc,iorders asc");
        rpitems.DataSource = dt;
        rpitems.DataBind();
    }
    public string getpic(string str)
    {
        if (str.Length > 0)
        {
            return "<img height='40' style='max-width:300px' src='" + weburl + "uploads/products/noithat/" + str + "'>";
        }
        else
            return "";
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
                lttitle.Text = "Cập nhật hình ảnh";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                this.hdino.Value = p.Trim();
                DataTable dt = new DataTable();
                dt = WEB.Item_other.getitembyino(p);
                if (dt.Rows.Count > 0)
                {
                    txtname.Text = dt.Rows[0]["vtitle"].ToString().Trim();                
                    txtorder.Text = dt.Rows[0]["iorders"].ToString().Trim();
                    hdimg_old.Value = dt.Rows[0]["vparam1"].ToString().Trim();
                    txt_mota.Text=dt.Rows[0]["vdesc"].ToString().Trim();
                   txtcontent.Text = dt.Rows[0]["vcontent"].ToString().Trim();
                   WEB.Common.SetSelectedIndexInDropDownList(ref ddltype, dt.Rows[0]["iparam1"].ToString());
                    if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                        chkstatus.Checked = false;
                    else
                        chkstatus.Checked = true;
                    if (dt.Rows[0]["vparam2"].ToString().Equals("0"))
                    {
                        chklist.Checked = true;
                        chkalbum.Checked = false;
                    }
                    else
                    {
                        chkalbum.Checked = true;
                        chklist.Checked = false;
                    }
                    if (dt.Rows[0]["vparam1"].ToString().Length > 0)
                    {
                        chkdeleteimg.Visible = true;
                        hdimg_old.Value = dt.Rows[0]["vparam1"].ToString();
                        ltimage.Text = "<img src='" + weburl + "uploads/products/noithat/" + dt.Rows[0]["vparam1"].ToString() + "' style='max-width:100px;height:80px' >";
                    }
                    else
                        chkdeleteimg.Visible = false;
                   
                }

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
            case "delete":
                    WEB.Item_other.db_items_other_deletebyino(p);
                    UpdateList();
                break;

        }
    }

    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtname.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tiêu đề</p>";
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
            string istatus = "0";
            if (chkstatus.Checked == true)
                istatus = "1";
            string displayinhome = "0";
            string type = "0";
            if (chkalbum.Checked == true)
                type = "1";
            else
                if (chklist.Checked == true)
                    type = "0";
            string image = "";
            if (this.flupload.FileName.Trim().Length > 0)
            {
                string tempname = System.IO.Path.GetFileName(flupload.PostedFile.FileName);
                string fileextention = "";
                fileextention = System.IO.Path.GetExtension(tempname).ToLower();

                if (fileextention.Equals(".jpg") || fileextention.Equals(".gif") || fileextention.Equals(".bmp") || fileextention.Equals(".png"))
                {
                    if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/products/noithat/" + tempname) == false)
                        image = tempname;
                    else
                        image = DateTime.Now.Second + "-" + tempname;

                    flupload.SaveAs(Server.MapPath("~/") + "/uploads/products/noithat/" + image);
                }
                else
                {
                    ltdetailmsg.Visible = true;
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.bmp,*.png</p>";
                    return;
                }

            }
          
            if (hd_insertupdate.Value.Equals("insert"))
            {
                try
                {
                    hdalias.Value = WEB.Common.getalias(txtname.Text.Trim());
                    //WEB.Item_other.db_items_other_insert(WEB.Common.mod_adv,vlan, txtname.Text, txtlink.Text,image, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), adv_type, txtorder.Text, istatus,ddlposition.SelectedValue,txtwidth.Text,txtheight.Text, "", "", "0", "0");
                    WEB.Item_other.db_items_other_insert(iid.ToString(), "NOT", vlan, txtname.Text, txt_mota.Text, txtcontent.Text, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", txtorder.Text, istatus, image,type, "", "", "", ddltype.SelectedValue, "0");
                    lttitle.Text = "Quản lý hình ảnh - Thêm hình ảnh thành công";
                    
                    UpdateList();
                }
                catch (Exception ex)
                {
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật không thành công</p>";
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
                            System.IO.File.Delete(Server.MapPath("~/") + "/uploads/products/noithat/" + hdimg_old.Value);
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
                            System.IO.File.Delete(Server.MapPath("~/") + "/uploads/products/noithat/" + hdimg_old.Value);
                        }
                        catch
                        {
                        }
                    }
                 
                    string alias = "";
                    if (txtname.Text.Trim() != hdtitle.Value.Trim())
                        alias = WEB.Common.getalias(txtname.Text.Trim());
                    else
                        alias = hdalias.Value;
                    WEB.Item_other.db_items_other_update(hdino.Value, iid.ToString(), "NOT", vlan, txtname.Text, txt_mota.Text, txtcontent.Text, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", txtorder.Text, istatus, image, type, "", "", "",ddltype.SelectedValue, "0");
                    lttitle.Text = "Quản lý hình ảnh - Cập nhật hình ảnh thành công";
                   
                    UpdateList();
                }
                catch
                {
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật không thành công</p>";
                    ltdetailmsg.Visible = true;
                }

            }
        }
        catch (Exception ex) { Response.Write(ex.ToString()); }
        clear();
    }
    public string getusercreateupdate(string ucreate, string uupdate)
    {
        string str = "";
        if (uupdate == "")
        {
            str = "<p class='sptime'><i class='ico-ucreate'  title='Người tạo'></i>" + ucreate + "</p>";
            str += "<p class='sptime'><i class='ico-uupdate'  title='Người cập nhật'></i>...</p>";
        }
        else
        {
            str = "<p class='sptime'><i class='ico-ucreate'  title='Người tạo'></i>" + ucreate + "</p>";
            str += "<p class='sptime'><i class='ico-uupdate'  title='Người cập nhật'></i>" + uupdate + "</p>";
        }
        return str;
    }
    protected void lnkadd_Click(object sender, EventArgs e)
    {
        clear();
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        lttitle.Text = "Thêm hình ảnh";
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
