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

public partial class admin_products_price : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int n = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.UpdateList();
            lttitle.Text = "Quản lý khoảng giá";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            
        }
      
    }
    public int getstt()
    {
        n++;
        return n;
    }
    public void clear()
    {
        txtdesc.Text = "";
        txtname.Text = "";
        txtorder.Text = "1";
        txtfrom.Text = "0";
        txtto.Text = "1000000";
       
        chkstatus.Checked = true;
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

        dt= WEB.Category.getcate( "-1", WEB.Common.mod_product_price, vlan, "1","-1");
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
                lttitle.Text = "Cập nhật khoảng giá";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                this.hdicid.Value = p.Trim();
                DataTable dt = new DataTable();
                dt = WEB.Category.getcatebyid(p);
                if (dt.Rows.Count > 0)
                {
                    txtname.Text = dt.Rows[0]["vname"].ToString().Trim();                
                    txtorder.Text = dt.Rows[0]["iorders"].ToString().Trim();
                    txtdesc.Text = dt.Rows[0]["vdesc"].ToString().Trim();
                    
                    txtto.Text = dt.Rows[0]["vparam3"].ToString().Trim();
                    txtfrom.Text = dt.Rows[0]["vparam2"].ToString().Trim();
                    if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                        chkstatus.Checked = false;
                    else
                        chkstatus.Checked = true;
                    hdprdicidlist.Value = dt.Rows[0]["vicon"].ToString();
                    ltcatesck.Text = loadcates("-1", WEB.Common.mod_product);
                   
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
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tiêu đề</p>";
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
        string lcates = "|" + WEB.Common.GetFormValue("chk").ToString().Replace(",", "|") + "|";
        string image = "";
       
        if (hd_insertupdate.Value.Equals("insert"))
        {
            try
            {
                //WEB.Item_other.db_items_other_insert(WEB.Common.mod_adv,vlan, txtname.Text, txtlink.Text,image, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), adv_type, txtorder.Text, istatus,ddlposition.SelectedValue,txtwidth.Text,txtheight.Text, "", "", "0", "0");
                WEB.Category.db_categories_insert(WEB.Common.mod_product_price, vlan, "-1", WEB.Common.getalias(txtname.Text.Trim()), txtname.Text.Trim(), txtdesc.Text, image, lcates, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "1", txtorder.Text, istatus, txtname.Text,txtfrom.Text, txtto.Text, "", "", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý khoảng giá - Thêm khoảng giá thành công";
                //ghi log
                string id = WEB.Dataprovider.getmax("db_categories", "icid","").ToString();
                WEB.Logs.writelog("Thêm khoảng giá: " + txtname.Text);
            }
            catch
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật dữ liệu</p>";
                ltdetailmsg.Visible = true;
            }
        }
        else if (hd_insertupdate.Value.Equals("update"))
        {

            try
            {
                
                WEB.Category.db_categories_update(hdicid.Value, WEB.Common.mod_product_price, vlan, "-1", WEB.Common.getalias(txtname.Text.Trim()), txtname.Text.Trim(), txtdesc.Text,image, lcates, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), txtorder.Text, istatus, txtname.Text,txtfrom.Text, txtto.Text, "", Session["admin"].ToString(), "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý khoảng giá - Cập nhật khoảng giá thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật khoảng giá: " + txtname.Text);
            }
            catch
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật dữ liệu</p>";
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
        lttitle.Text = "Thêm khoảng giá";
        pnlist.Visible = false;
        pndetail.Visible = true;
        this.hd_insertupdate.Value = "insert";
        ltcatesck.Text = loadcates("-1", WEB.Common.mod_product);
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
                                UpdateList();
                            

                        }
                    }
                }
            }
        }
        UpdateList();
    }
   
    protected string loadcates(string cid, string capp)
    {
        string strresult = "";
        DataTable dt = new DataTable();
        WEB.Category.getcategorylevel1(ref dt, cid, capp, vlan, "1");
        if (dt.Rows.Count > 0)
        {
            strresult += "<ul>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                strresult += "<li><span class='" + space(dt.Rows[i]["ilevel"].ToString()) + "'></span><input type='checkbox' name='chk' value='" + dt.Rows[i]["icid"].ToString() + "' ";
                if (hdprdicidlist.Value.Contains(dt.Rows[i]["icid"].ToString()))
                    strresult += " checked='checked' ";
                if(hd_insertupdate.Value == "insert")
                    strresult += " checked='checked' ";
                strresult += "> " + dt.Rows[i]["vname"].ToString() + "</li>";
                strresult += loadcates(dt.Rows[i]["icid"].ToString(), WEB.Common.mod_product);

            }
            strresult += "</ul>";
        }
        return strresult;
    }
    protected string space(string s)
    {
        string str = "";
        for (int i = 1; i < Convert.ToInt32(s); i++)
            str += "space" + i.ToString();
        return str;
    }
}
