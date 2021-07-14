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

public partial class admin_settings_regions : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int n = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.UpdateList();
            lttitle.Text = "Quản lý tỉnh thành";
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
        n = 0;
        WEB.CategoryOther.getcategorylevel1( ref dt, "-1", "CI","", vlan,"-1");
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
                lttitle.Text = "Cập nhật tỉnh thành";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                this.hdicid.Value = p.Trim();
                DataTable dt = new DataTable();
                dt = WEB.CategoryOther.getcatebyid(p);
                if (dt.Rows.Count > 0)
                {
                    txtname.Text = dt.Rows[0]["vname"].ToString().Trim();    
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
                WEB.CategoryOther.updatestatus(p, status);
                this.UpdateList();
                break;
            case "delete":
                
                    WEB.CategoryOther.db_categories_other_delete(p);
                    UpdateList();
                
                break;

        }
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
        
        string istatus = "0";
        if (chkstatus.Checked == true)
            istatus = "1";
        txtname.Text = txtname.Text.Trim();
      
        if (hd_insertupdate.Value.Equals("insert"))
        {
            
           
            //try
            //{
                //WEB.Item_other.db_items_other_insert("CI",vlan, txtname.Text, txtlink.Text,image, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), adv_type, txtorder.Text, istatus,ddlposition.SelectedValue,txtwidth.Text,txtheight.Text, "", "", "0", "0");
            if (txtname.Text.Contains(","))
            {
                string[] s = txtname.Text.Split(',');
                if (s.Length > 0)
                {
                    for (int i = 0; i < s.Length; i++)
                    {
                        if(s[i].Length>0)
                            WEB.CategoryOther.db_categories_other_insert("CI", vlan, "-1", WEB.Common.getalias(s[i].Trim()), s[i].Trim(), "", "", "", Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "1", "0", istatus, "", "", "", "", "", "0", "0", "0", "0", "0");
                    }
                }
            }
            else
                WEB.CategoryOther.db_categories_other_insert("CI", vlan, "-1", WEB.Common.getalias(txtname.Text.Trim()), txtname.Text.Trim(), "", "", "", Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "1", "0", istatus, "", "", "", "", "", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý tỉnh thành - Thêm vị trí thành công";
                //ghi log
                string id = WEB.Dataprovider.getmax("db_categories", "icid","").ToString();
                WEB.Logs.writelog("Thêm tỉnh thành ID: " + id);
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


                WEB.CategoryOther.db_categories_other_update(hdicid.Value, "CI", vlan, "-1", WEB.Common.getalias(txtname.Text.Trim()), txtname.Text.Trim(), "", "", "", Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "1", "0", istatus, "", "", "", "", "", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý tỉnh thành - Cập nhật vị trí thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật tỉnh thành ID: " + hdicid.Value);
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

    protected void lnkadd_Click(object sender, EventArgs e)
    {
        clear();
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        lttitle.Text = "Thêm tỉnh thành";
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
                                WEB.CategoryOther.db_categories_other_delete(s[i].ToString());
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
