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

public partial class admin_customer_reviews_category : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int n = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
            _FileBrowser.BasePath = "../ckfinder";
            _FileBrowser.SetupCKEditor(txt_mota);
            
            lttitle.Text = "Quản lý danh mục hỏi đáp";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            this.UpdateList();
            ltlink.Text = "";
            
        }
        DataTable dt = new DataTable();
        dt = WEB.Category.getcate("-1", "FAQ", vlan, "1","-1");
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
    public int getstt()
    {
        n++;
        return n;
    }
    public void clear()
    {
        txturl.Text = "";
        txtdesc.Text = "";
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
        n = 0;
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = true;
        lnkdelete.Visible = true;
        pndetail.Visible = false;
        pnlist.Visible = true;
        DataTable dt = new DataTable();
        lttitle.Text = "Danh mục hỏi đáp";
        dt= WEB.Category.getcate( "-1", "FAQ", vlan, "1","-1");
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
                    txttitleweb.Text = dt.Rows[0]["vparam1"].ToString().Trim();
                    hd_imgicon.Value=dt.Rows[0]["vicon"].ToString().Trim();
                    hdimg_old.Value=dt.Rows[0]["vimg"].ToString().Trim();
                    txtkeyword.Text = dt.Rows[0]["vparam2"].ToString().Trim();
                    txt_mota.Text=dt.Rows[0]["vdesc"].ToString().Trim();
                    txtdesc.Text = dt.Rows[0]["vparam3"].ToString().Trim();
                    hdtitle.Value = dt.Rows[0]["vname"].ToString().Trim();
                   txturl.Text=  hdalias.Value = dt.Rows[0]["valias"].ToString().Trim();    
                    for (int i = 0; i < ddlcate.Items.Count; i++)
                    {
                        if (ddlcate.Items[i].Value.Equals(hdicid.Value))
                        {
                            ddlcate.Items.RemoveAt(i);
                            break;
                        }
                    }
                    hdiusercreate.Value = dt.Rows[0]["iusercreate"].ToString().Trim();
                    hdvusercreate.Value = dt.Rows[0]["vusercreate"].ToString().Trim();
                    hdcreatedate.Value = Convert.ToDateTime(dt.Rows[0]["dcreatedate"]).ToString("dd/MM/yyyy HH:mm");
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
                    {
                        chkdeleteimg.Visible = true;
                        hdimg_old.Value = dt.Rows[0]["vimg"].ToString();
                        ltimage.Text = "<img src='" + weburl + "uploads/contents/images/" + dt.Rows[0]["vimg"].ToString() + "' style='max-width:100px;height:80px' >";
                    }
                    else
                        chkdeleteimg.Visible = false;
                    if (dt.Rows[0]["vicon"].ToString().Length > 0)
                    {
                        chkdeleteicon.Visible = true;
                        hd_imgicon.Value = dt.Rows[0]["vicon"].ToString();
                        lt_icon.Text = "<img src='" + weburl + "uploads/contents/images/" + dt.Rows[0]["vicon"].ToString() + "' style='max-width:100px;height:80px' >";
                    }
                    else
                        chkdeleteicon.Visible = false;
                    hdnguoiquanly.Value = dt.Rows[0]["vparam6"].ToString().Trim();
                    ltnguoiquanly.Text = loadnguoiquanly();
                    ltlink.Text = "<tr><td class='key'><label for='listnhom'>Link danh mục</label></td><td><a target='_blank' href='" + weburl + "hoi-dap/" + dt.Rows[0]["valias"].ToString() + "'>" + weburl + "hoi-dap/" + dt.Rows[0]["valias"].ToString() + "</a></td></tr>";
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
                if (WEB.Items.getlisitem("FAQ", WEB.Common.LangAdmin, "(icid='" + p + "' and istatus='1')", "").Rows.Count > 0)
                {
                    lt_mess.Text = "<p style='color: #16757c;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Bạn phải xóa danh sách hỏi đáp thuộc danh mục này trước*</p>";
                }
                else
                {
                    WEB.Category.db_categories_delete(p);
                    UpdateList();
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
    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        if (txtname.Text.Length == 0)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tiêu đề</p>";
            ltdetailmsg.Visible = true;
            txtname.Focus();
            return;
        }
        if (txtname.Text.Length >150)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Tiêu đề không quá 150 ký tự</p>";
            ltdetailmsg.Visible = true;
            txtname.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtorder.Text)==false)
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
                if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/contents/images/" + tempname) == false)
                    imageicon = tempname;
                else
                    imageicon = DateTime.Now.Second + "-" + tempname;
                flupicon.SaveAs(Server.MapPath("~/") + "/uploads/contents/images/" + imageicon);
            }
            else
            {
                ltdetailmsg.Visible = true;
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.bmp,*.png</p>";
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
                if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/contents/images/" + tempname) == false)
                    image = tempname;
                else
                    image = DateTime.Now.Second + "-" + tempname;
                flupload.SaveAs(Server.MapPath("~/") + "/uploads/contents/images/" + image);
            }
            else
            {
                ltdetailmsg.Visible = true;
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.bmp,*.png</p>";
                return;
            }

        }
        string listnql = "," + WEB.Common.GetFormValue("chknql").ToString() + ",";
        if (hd_insertupdate.Value.Equals("insert"))
        {
            if (txturl.Text.Length == 0)
            {
                if (vlan != "ENG" && vlan != "VIE")
                    txturl.Text = WEB.Common.getalias("Faq category");
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
                    txturl.Text = WEB.Common.getalias("Faq category");
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
        if (txttitleweb.Text == "")
            txttitleweb.Text = txtname.Text.Trim();
        if (txtdesc.Text == "")
            txtdesc.Text = txtname.Text.Trim() + ", " + WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan);
        if (txtkeyword.Text == "")
        {
            txtkeyword.Text = txtname.Text.Trim() + "," + WEB.Common.GetNosign(txtname.Text.Trim());
        }
        if (hd_insertupdate.Value.Equals("insert"))
        {
            
           
            try
            {
                //WEB.Item_other.db_items_other_insert(WEB.Common.mod_adv,vlan, txtname.Text, txtlink.Text,image, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), adv_type, txtorder.Text, istatus,ddlposition.SelectedValue,txtwidth.Text,txtheight.Text, "", "", "0", "0");
                WEB.Category.db_categories_insert("FAQ", vlan, ddlcate.SelectedValue, txturl.Text, txtname.Text.Trim(), txt_mota.Text.Trim(), image, imageicon, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), ilevel, txtorder.Text, istatus, txtname.Text.Trim(), txtname.Text.Trim() + "," + WEB.Common.GetNosign(txtname.Text.Trim()), txtname.Text.Trim() + ", " + WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan), displayinhome, "",listnql, "", "", "", "","0","0","0","0","0");
                lttitle.Text = "Quản lý danh mục hỏi đáp - Thêm danh mục thành công";
                //ghi log
                string id = WEB.Dataprovider.getmax("db_categories", "icid","").ToString();
                WEB.Logs.writelog("Thêm danh mục hỏi đáp: " + txtname.Text);
               
            }
            catch
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
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/contents/images/" + hdimg_old.Value);
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
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/contents/images/" + hdimg_old.Value);
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
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/contents/images/" + hd_imgicon.Value);
                    }
                    catch
                    {
                    }
                }
                if (chkdeleteicon.Checked == true)
                {
                    imageicon = "";
                    try
                    {
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/contents/images/" + hd_imgicon.Value);
                    }
                    catch
                    {
                    }
                }
               
                WEB.Category.db_categories_update(hdicid.Value, "FAQ", vlan, ddlcate.SelectedValue, txturl.Text, txtname.Text.Trim(), txt_mota.Text, image, imageicon, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), txtorder.Text, istatus, txttitleweb.Text, txtkeyword.Text, txtdesc.Text, displayinhome, Session["admin"].ToString(),listnql, "", "", "", "","0","0","0","0","0");
                lttitle.Text = "Quản lý danh mục hỏi đáp - Cập nhật danh mục thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật danh mục hỏi đáp: " + txtname.Text);
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
        lttitle.Text = "Thêm danh mục hỏi đáp";
        pnlist.Visible = false;
        hd_imgicon.Value = "";
        hdimg_old.Value = "";
        lt_icon.Text = "";
        ltimage.Text = "";
        pndetail.Visible = true;
        this.hd_insertupdate.Value = "insert";
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
                    for (int i = 0; i < s.Length; i++)
                    {
                        if (s[i].Length > 0)
                        {
                            if (WEB.Items.getlisitem("FAQ", WEB.Common.LangAdmin, "(icid='" + s[i].ToString() + "' and istatus='1')", "").Rows.Count > 0)
                            {
                                lt_mess.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;font-style: italic;'>Bạn phải xóa danh sách hỏi đáp thuộc danh mục này trước khi xóa danh mục</p>";
                            }
                            else
                            {
                                WEB.Category.db_categories_delete(s[i].ToString());
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
