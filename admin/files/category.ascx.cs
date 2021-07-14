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

public partial class admin_products_category : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int n = 0;
    public string itemtitle = "";
    public string itemurl = "";
    public string itemdescription = "";
    public string role = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        role = Session["role"].ToString();
        if (!IsPostBack)
        {
            
            lttitle.Text = "Quản lý danh mục tài liệu";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            this.UpdateList();
            ltlink.Text = "";
            
        }
        DataTable dt = new DataTable();
        dt = WEB.Category.getcate("-1", WEB.Common.mod_files, vlan, "1","-1");
        ddlcate.Items.Clear();
        ddlcate.Items.Add(new ListItem("Danh mục chính", "-1"));
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
    public void clear()
    {
        txtdesc.Text = ""; txturl.Text = "";
        txt_mota.Text = "";
        txtkeyword.Text = "";
        txtname.Text = "";
        txtorder.Text = "1";
        txttitleweb.Text = "";
        lt_mess.Text = "";
        lt_icon.Text = "";
        ltimage.Text = "";
        ltdetailmsg.Text = "";
        chkstatus.Checked = true;
    }
    protected void UpdateList()
    {
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        if (checkrole("2611"))
            lnkadd.Visible = true;
        else
            lnkadd.Visible = false;
        if (checkrole("2613"))
            lnkdelete.Visible = true;
        else
            lnkdelete.Visible = false;

        pndetail.Visible = false;
        pnlist.Visible = true;
        DataTable dt = new DataTable();
        lttitle.Text = "Danh mục file";
        dt= WEB.Category.getcate( "-1", WEB.Common.mod_files, vlan, "1","-1");
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
                if (checkrole("2612"))
                {
                    clear();
                    ltdetailmsg.Text = "";
                    lnkupdate.Visible = true;
                    lnkclose.Visible = true;
                    lnkadd.Visible = false;
                    lnkdelete.Visible = false;
                    lttitle.Text = "Cập nhật danh mục";
                    pnlist.Visible = false;
                    pndetail.Visible = true;
                    this.hd_insertupdate.Value = "update";
                    this.hdicid.Value = p.Trim();
                    DataTable dt = new DataTable();
                    dt = WEB.Category.getcatebyid(p);
                    if (dt.Rows.Count > 0)
                    {
                        hdname.Value = txtname.Text = dt.Rows[0]["vname"].ToString().Trim();
                        txtorder.Text = dt.Rows[0]["iorders"].ToString().Trim();
                        itemtitle = txttitleweb.Text = dt.Rows[0]["vparam1"].ToString().Trim();
                        hd_imgicon.Value = dt.Rows[0]["vicon"].ToString().Trim();
                        hdimg_old.Value = dt.Rows[0]["vimg"].ToString().Trim();
                        txtkeyword.Text = dt.Rows[0]["vparam2"].ToString().Trim();
                        txt_mota.Text = dt.Rows[0]["vdesc"].ToString().Trim();
                        txtdesc.Text = dt.Rows[0]["vparam3"].ToString().Trim();
                        itemurl = weburl + "thu-vien-tai-lieu/" + dt.Rows[0]["valias"].ToString();
                        txturl.Text = hdalias.Value = dt.Rows[0]["valias"].ToString();
                        itemdescription = txtdesc.Text = dt.Rows[0]["vparam3"].ToString().Trim();
                        for (int i = 0; i < ddlcate.Items.Count; i++)
                        {
                            if (ddlcate.Items[i].Value.Equals(hdicid.Value))
                            {
                                ddlcate.Items.RemoveAt(i);
                                break;
                            }
                        }

                        WEB.Common.SetSelectedIndexInDropDownList(ref ddlcate, dt.Rows[0]["iparcid"].ToString());
                        if (dt.Rows[0]["vparam4"].ToString().Equals("0"))
                            chkdisplayhome.Checked = false;
                        else
                            chkdisplayhome.Checked = true;

                        if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                            chkstatus.Checked = false;
                        else
                            chkstatus.Checked = true;
                        if (dt.Rows[0]["vimg"].ToString().Length > 0)
                            ltimage.Text = "<img src='" + weburl + "uploads/files/categories/" + dt.Rows[0]["vimg"].ToString() + "' style='max-width:100px;height:80px' >";
                        if (dt.Rows[0]["vicon"].ToString().Length > 0)
                            lt_icon.Text = "<img src='" + weburl + "uploads/files/icon/" + dt.Rows[0]["vicon"].ToString() + "' style='max-width:100px;height:80px' >";

                        ltlink.Text = "<tr><td class='key'><label for='listnhom'>Link danh mục</label></td><td><a target='_blank' href='" + weburl + "thu-vien-tai-lieu/" + dt.Rows[0]["valias"].ToString() + "'>" + weburl + "thu-vien-tai-lieu/" + dt.Rows[0]["valias"].ToString() + "</a></td></tr>";
                        hdnguoiquanly.Value = dt.Rows[0]["vparam6"].ToString().Trim();
                        ltnguoiquanly.Text = loadnguoiquanly();
                    }
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
                if (checkrole("2613"))
                {
                    if (WEB.Items.getlistitembypage(p, new string[0], "", WEB.Common.mod_files, vlan, "", "-1", 0, 1, "iid desc").Rows.Count > 0)
                    {
                        lt_mess.Text = "<p  class='merror' style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;font-style: italic;'>Bạn phải xóa danh sách album thuộc danh mục này trước*</p>";
                    }
                    else
                    {
                        WEB.Logs.writelog("Xóa danh mục tài liệu: " + getname(p));
                        WEB.Category.db_categories_delete(p);
                        UpdateList();
                    }
                }
                break;

        }
    }
    protected string loadnguoiquanly()
    {
        string strresult = "";
        DataTable dt = WEB.Webusers.getlistuser();
        if (dt.Rows.Count > 0)
        {
            strresult += "<ul>";
            strresult += "<li><input type='checkbox'   name='chknql' value='-1' ";
            if (hdnguoiquanly.Value.Contains(",-1,"))
                strresult += " checked='checked' ";
            strresult += "> Tất cả";
            strresult += "</li>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                strresult += "<li><input type='checkbox'   name='chknql' value='" + dt.Rows[i]["iuser_web"].ToString() + "' ";
                if (hdnguoiquanly.Value.Contains("," + dt.Rows[i]["iuser_web"].ToString() + ","))
                    strresult += " checked='checked' ";
                strresult += "> " + dt.Rows[i]["vname"].ToString() + " (" + dt.Rows[i]["vusername"].ToString() + ")";
                strresult += "</li>";

            }
            strresult += "</ul>";
        }
        return strresult;
    }
    protected string getname(string cid)
    {
        DataTable dt = WEB.Category.getcatebyid(cid);
        if (dt.Rows.Count > 0)
            return dt.Rows[0]["vname"].ToString();
        else
            return "";
    }
    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        if (txtname.Text.Length == 0)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tiêu đề</p>";
            ltdetailmsg.Visible = true;
            txtname.Focus();
            return;
        }
        if (txtname.Text.Length > 150)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Tiêu đề không quá 150 ký tự</p>";
            ltdetailmsg.Visible = true;
            txtname.Focus();
            return;
        }
        if (txt_mota.Text.Length > 4000)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Mô tả không quá 4000 ký tự</p>";
            ltdetailmsg.Visible = true;
            txt_mota.Focus();
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
        if (chkdisplayhome.Checked == true)
            displayinhome = "1";
        string ilevel = "1";
        if (!ddlcate.SelectedValue.Equals("-1"))
        {
            DataTable dt = new DataTable();
            dt = WEB.Category.getcatebyid(ddlcate.SelectedValue);
            if (dt.Rows.Count > 0)
                ilevel = (Convert.ToInt32(dt.Rows[0]["ilevel"].ToString()) + 1).ToString();
        }
        txtname.Text = txtname.Text.Trim();
        // Luu img icon
        string imageicon = "";
        if (this.flupicon.FileName.Trim().Length > 0)
        {
            string tempname = System.IO.Path.GetFileName(flupicon.PostedFile.FileName);
            string fileextention = "";
            fileextention = System.IO.Path.GetExtension(tempname).ToLower();

            if (fileextention.Equals(".jpg") || fileextention.Equals(".gif") || fileextention.Equals(".bmp") || fileextention.Equals(".png"))
            {
                imageicon = DateTime.Now.Ticks.ToString() + fileextention;
                flupicon.SaveAs(Server.MapPath("~/") + "/uploads/files/icon/" + imageicon);
            }
            else
            {
                ltdetailmsg.Visible = true;
                ltdetailmsg.Text = "Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.bmp,*.png";
                return;
            }

        }
        //
        string image = "";
        if (this.flupload.FileName.Trim().Length > 0)
        {
            string tempname = System.IO.Path.GetFileName(flupload.PostedFile.FileName);
            string fileextention = "";
            fileextention = System.IO.Path.GetExtension(tempname).ToLower();

            if (fileextention.Equals(".jpg") || fileextention.Equals(".gif") || fileextention.Equals(".bmp") || fileextention.Equals(".png"))
            {
                image = DateTime.Now.Ticks.ToString() + fileextention;
                flupload.SaveAs(Server.MapPath("~/") + "/uploads/files/categories/" + image);
            }
            else
            {
                ltdetailmsg.Visible = true;
                ltdetailmsg.Text = "Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.bmp,*.png";
                return;
            }

        }
        if (txttitleweb.Text == "")
            txttitleweb.Text = txtname.Text.Trim();
        if (txtdesc.Text == "")
            txtdesc.Text = txtname.Text.Trim() + ", " + WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan);
        if (txtkeyword.Text == "")
        {
            txtkeyword.Text = txtname.Text.Trim() + "," + WEB.Common.GetNosign(txtname.Text.Trim());
        }
        if (txttitleweb.Text.Length > 70)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Thẻ tiêu đề trang (Hỗ trợ SEO) tối đa 70 ký tự</p>";
            ltdetailmsg.Visible = true;
            txttitleweb.Focus();
            return;
        }
        if (txtkeyword.Text.Length > 160)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Thẻ từ khóa (Hỗ trợ SEO) tối đa 160 ký tự</p>";
            ltdetailmsg.Visible = true;
            txtkeyword.Focus();
            return;
        }
        if (txtdesc.Text.Length > 160)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Thẻ mô tả (Hỗ trợ SEO) tối đa 160 ký tự</p>";
            ltdetailmsg.Visible = true;
            txtdesc.Focus();
            return;
        }
        if (hd_insertupdate.Value.Equals("insert"))
        {
            if (txturl.Text.Length == 0)
            {
                if (vlan != "ENG" && vlan != "VIE")
                    txturl.Text = WEB.Common.getalias("File category");
                else
                    txturl.Text = WEB.Common.getalias(txtname.Text);
            }
            else
            {
                txturl.Text = WEB.Common.getalias1(txturl.Text);
            }
        }
        else
        {
            if (txturl.Text.Length == 0)
            {
                if (vlan != "ENG" && vlan != "VIE")
                    txturl.Text = WEB.Common.getalias("File category");
                else
                    txturl.Text = WEB.Common.getalias(txtname.Text);
            }
            else
            {
                if (txturl.Text != hdalias.Value)
                {
                    txturl.Text = WEB.Common.getalias1(txturl.Text);
                }
                else
                {
                    if (txtname.Text != hdname.Value)
                    {
                        if (vlan != "ENG" && vlan != "VIE")
                        {
                        }
                        else
                            txturl.Text = WEB.Common.getalias(txtname.Text);
                    }
                }
            }
        }
        string listnql = "," + WEB.Common.GetFormValue("chknql").ToString() + ",";
        if (hd_insertupdate.Value.Equals("insert"))
        {
            
           
            try
            {
                //WEB.Item_other.db_items_other_insert(WEB.Common.mod_adv,vlan, txtname.Text, txtlink.Text,image, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), adv_type, txtorder.Text, istatus,ddlposition.SelectedValue,txtwidth.Text,txtheight.Text, "", "", "0", "0");
                WEB.Category.db_categories_insert(WEB.Common.mod_files, vlan, ddlcate.SelectedValue,txturl.Text, txtname.Text.Trim(), txt_mota.Text.Trim(), image, imageicon, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), ilevel, txtorder.Text, istatus, txtname.Text.Trim(), txtname.Text.Trim() + "," + WEB.Common.GetNosign(txtname.Text.Trim()), txtname.Text.Trim() + ", " + WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan), displayinhome, "", listnql, "", "", "", "","0","0","0","0","0");
                lttitle.Text = "Quản lý danh mục tài liệu - Thêm danh mục thành công";
                //ghi log
                string id = WEB.Dataprovider.getmax("db_categories", "icid","").ToString();
                WEB.Logs.writelog("Thêm danh mục tài liệu: " + txtname.Text);
            }
            catch(Exception ex)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Thêm dữ liệu không thành công</p>";
                ltdetailmsg.Visible = true;
                return;
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
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/files/categories/" + hdimg_old.Value);
                    }
                    catch
                    {
                    }
                }
                if (imageicon == "")
                {
                    imageicon = hd_imgicon.Value;
                }
                else
                {
                    
                    try
                    {
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/files/icon/" + hd_imgicon.Value);
                    }
                    catch
                    {
                    }
                }

                WEB.Category.db_categories_update(hdicid.Value, WEB.Common.mod_files, vlan, ddlcate.SelectedValue, txturl.Text, txtname.Text.Trim(), txt_mota.Text, image, imageicon, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), txtorder.Text, istatus, txttitleweb.Text, txtkeyword.Text, txtdesc.Text, displayinhome, "", listnql, "", "", "", "", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý danh mục tài liệu - Cập nhật danh mục thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật danh mục  tài liệu: " + txtname.Text);
              
            }
            catch
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật dữ liệu</p>";
                ltdetailmsg.Visible = true;
                return;
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
        lttitle.Text = "Thêm danh mục tài liệu";
        pnlist.Visible = false;
        hd_imgicon.Value = "";
        hdimg_old.Value = "";
        lt_icon.Text = "";
        ltimage.Text = "";
        pndetail.Visible = true;
        this.hd_insertupdate.Value = "insert";
        itemtitle = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, vlan);
        itemdescription = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan);
        itemurl = weburl;
        hdnguoiquanly.Value = ",-1,";
        ltnguoiquanly.Text = loadnguoiquanly();
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
                    WEB.Logs.writelog("Xóa danh mục tài liệu hàng loạt");
                    for (int i = 0; i < s.Length; i++)
                    {
                        if (s[i].Length > 0)
                        {
                            if (WEB.Items.getlistitembypage(s[i], new string[0], "", WEB.Common.mod_files, vlan, "", "-1", 0, 1, "iid desc").Rows.Count > 0)
                            {
                                lt_mess.Text = "<p  class='merror' style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;font-style: italic;'>Bạn phải xóa danh sách file thuộc danh mục này trước khi xóa danh mục</p>";
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
