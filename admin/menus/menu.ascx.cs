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

public partial class admin_menus_menu : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int num = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlcate.Items.Clear();
            this.UpdateList();
            lttitle.Text = "Quản lý menu chính";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            lt_mess.Visible = false;
            
        }
        DataTable dt = new DataTable();
        dt = WEB.Category.getcate("-1", WEB.Common.mod_menu, vlan, "1","-1");
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
        dt = WEB.Category.getcate("-1", WEB.Common.mod_module, "-1", "1", "1");
        ddllinkfrommodule.Items.Clear();
        ddllinkfrommodule.Items.Add(new ListItem("Trang chủ", "/"));
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            this.ddllinkfrommodule.Items.Add(new ListItem(dt.Rows[i]["vname"].ToString(),"/" + dt.Rows[i]["vdesc"].ToString()));
        }

        dt = WEB.Category.getlistcate( WEB.Common.mod_module,"iparam1=1", "", "1");
        ddllinkfromcate.Items.Clear();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            this.ddllinkfromcate.Items.Add(new ListItem("Danh mục " + dt.Rows[i]["vname"].ToString().ToLower(), dt.Rows[i]["vicon"].ToString()));
        }
    }
    public int getstt()
    {
        num++;
        return num;
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
        clear();
        dt= WEB.Category.getcate( "-1", WEB.Common.mod_menu, vlan, "1","-1");
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
                lttitle.Text = "Cập nhật menu";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                this.hdicid.Value = p.Trim();
                rdlinkfromcate.Checked = false;
                DataTable dt = new DataTable();
                dt = WEB.Category.getcatebyid(p);
                if (dt.Rows.Count > 0)
                {
                    txtname.Text = dt.Rows[0]["vname"].ToString().Trim();      
                    
                    txtorder.Text = dt.Rows[0]["iorders"].ToString().Trim();
                    for (int i = 0; i < ddlcate.Items.Count; i++)
                    {
                        if (ddlcate.Items[i].Value.Equals(hdicid.Value))
                        {
                            ddlcate.Items.RemoveAt(i);
                            break;
                        }
                    }
                    if (dt.Rows[0]["vicon"].ToString().Length > 0)
                    {
                        lticon.Text = "<img src='" + weburl + "uploads/menus/" + dt.Rows[0]["vicon"].ToString() + "' alt='icon' />";
                        hdicon.Value = dt.Rows[0]["vicon"].ToString();
                        chkdeleteimg.Visible = true;
                    }
                    else
                        chkdeleteimg.Visible = false;
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlcate, dt.Rows[0]["iparcid"].ToString());
                    try
                    {
                        int n = Convert.ToInt32(dt.Rows[0]["vimg"].ToString());
                        if (n > 0 && n < 100)
                        {
                            rdlinkfrommodule.Checked = true;
                            WEB.Common.SetSelectedIndexInDropDownList(ref ddllinkfrommodule, dt.Rows[0]["vimg"].ToString());
                            ddllinkfrommodule.Enabled = true;
                            ddllinkfromcate.Enabled = false;
                            txtlink.Enabled = false;
                        }
                        else if (n > 100)
                        {
                            rdlinkfrommodule.Checked = false;
                            WEB.Common.SetSelectedIndexInDropDownList(ref ddllinkfromcate, dt.Rows[0]["vimg"].ToString());
                            ddllinkfrommodule.Enabled = false;
                            ddllinkfromcate.Enabled = true;
                            txtlink.Enabled = false;
                        }
                        else
                        {
                            rdlinkinput.Checked = true;
                            ddllinkfrommodule.Enabled = false;
                            ddllinkfromcate.Enabled = false;
                            txtlink.Enabled = true;
                        }
                    }
                    catch { }
                    if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                        chkstatus.Checked = false;
                    else
                        chkstatus.Checked = true;
                    ltdatetime.Text = WEB.Common.Formatdate(Convert.ToDateTime(dt.Rows[0]["dcreatedate"].ToString()));
                    txtlink.Text = dt.Rows[0]["vdesc"].ToString().Trim();
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
                num = 0;
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
        if (WEB.Common.Check_number(txtorder.Text)==false)
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
        string type = "-1";
        if (rdlinkinput.Checked == true)
            type = "-1";
        else if(rdlinkfrommodule.Checked==true)
            type = ddllinkfrommodule.SelectedValue;
        else if (rdlinkfromcate.Checked == true)
            type =ddllinkfromcate.SelectedValue;
        string image = "";
        if (this.flicon.FileName.Trim().Length > 0)
        {
            string tempname = System.IO.Path.GetFileName(flicon.PostedFile.FileName);
            string fileextention = "";
            fileextention = System.IO.Path.GetExtension(tempname).ToLower();

            if (fileextention.Equals(".jpg") || fileextention.Equals(".jpeg") || fileextention.Equals(".gif") || fileextention.Equals(".bmp") || fileextention.Equals(".png"))
            {
                if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/menus/" + tempname) == false)
                    image = tempname;
                else
                    image = DateTime.Now.Second + "-" + image;
                flicon.SaveAs(Server.MapPath("~/") + "/uploads/menus/" + image);
                
            }
            else
            {
                lt_mess.Visible = true;
                lt_mess.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.jpeg,*.gif,*.bmp,*.png</p>";
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
                WEB.Category.db_categories_insert(WEB.Common.mod_menu, vlan, ddlcate.SelectedValue, "", txtname.Text.Trim(), txtlink.Text.Trim(), type, image, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), ilevel, txtorder.Text, istatus,txtdesc.Text,hdicate.Value, "", "", "", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý menu - Thêm menu thành công";
                //ghi log
                string id = WEB.Dataprovider.getmax("db_categories", "icid","").ToString();
                WEB.Logs.writelog("Thêm menu chính: " + txtname.Text);
                UpdateList();
            }
            catch
            {
                lt_mess.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật dữ liệu</p>";
                lt_mess.Visible = true;
            }
        }
        else if (hd_insertupdate.Value.Equals("update"))
        {
            if (image == "")
                image = hdicon.Value;
            else
            {
                try
                {
                    System.IO.File.Delete(Server.MapPath("~/") + "/uploads/menus/" + hdicon.Value);
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
                    System.IO.File.Delete(Server.MapPath("~/") + "/uploads/menus/" + hdicon.Value);
                }
                catch
                {
                }
            }
            try
            {

                WEB.Category.db_categories_update(hdicid.Value, WEB.Common.mod_menu, vlan, ddlcate.SelectedValue, "", txtname.Text.Trim(), txtlink.Text.Trim(), type, image, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), ilevel, txtorder.Text, istatus, txtdesc.Text, hdicate.Value, "", "", "", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý menu - Cập nhật menu thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật menu chính: " + txtname.Text);
                UpdateList();
            }
            catch
            {
                lt_mess.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật dữ liệu</p>";
                lt_mess.Visible = true;
            }

        }
        num = 0;
        UpdateList();
    }

    protected void lnkadd_Click(object sender, EventArgs e)
    {
        clear();
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        lttitle.Text = "Thêm menu";
        pnlist.Visible = false;
        pndetail.Visible = true;
        ltdatetime.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
        this.hd_insertupdate.Value = "insert";
    }

    protected void lnkclose_Click(object sender, EventArgs e)
    {
        num = 0;
        UpdateList();
    }
    public string formatdate(DateTime date)
    {

        return WEB.Common.Formatdate(date);
    }
    public void clear()
    {
        txtlink.Text = "";
        txtorder.Text = "1";
        txtname.Text = "";
        lticon.Text = "";
        chkstatus.Checked = true;
        rdlinkfromcate.Checked = false;
        
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
