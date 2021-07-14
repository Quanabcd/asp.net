using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class admin_products_features : System.Web.UI.UserControl
{
    public string role = "";
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int curpage = 0;
    public int numitems = 0;
    public int n = 1;
    public int icurrent = 0;
    public int a = 0;
    DataTable dtd = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        role = Session["role"].ToString();
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("p")))
        {
            curpage = Convert.ToInt32(WEB.Common.GeturlParam("p"));
        }
        if (!IsPostBack)
        {
            numitems = WEB.Products.getnumitem();
            lttitle.Text = "Danh sách thuộc tính";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            loadc();
            this.UpdateList();
        }
    }
    public void loadc()
    {
        DataTable dt = new DataTable();
        dt = WEB.CategoryOther.getcate("-1", "FT", vlan, "1", "-1");
        ddlcate.Items.Clear();
        ddlcate.Items.Add(new ListItem("Thuộc tính chính", "-1"));
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
    public int getstt1()
    {
        a++;
        return a;
    }
    public int getstt()
    {
        icurrent++;
        return icurrent;
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
    public bool checkrole(string s)
    {
        if (role.Contains("|" + s + "|"))
            return true;
        else
            return false;
    }
    protected void UpdateList()
    {
        clear();
        a = 0;
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;

        if (checkrole("2051"))
            lnkadd.Visible = true;
        else
            lnkadd.Visible = false;
        if (checkrole("2053"))
            lnkdelete.Visible = true;
        else
            lnkdelete.Visible = false;
       
        pndetail.Visible = false;
        pnlist.Visible = true;
        DataTable dt = new DataTable();
        dt = WEB.CategoryOther.getcate("-1", "FT", vlan, "1", "-1");
        //lt_count.Text = "Tổng số thuộc tính: <span style='color: #A52A2A;'>" + dt.Rows.Count.ToString() + "</span>";
        rpitems.DataSource = dt;
        rpitems.DataBind();
        //ltpage.Text = WEB.Common.PhanTrang("index.aspx?mod=prod&c=item", curpage, numitems, 10);
    }
    protected void rpitems_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        string c = e.CommandName.Trim();
        string p = e.CommandArgument.ToString().Trim();
        switch (c)
        {
            case "EditDetail":
                if (checkrole("2052"))
                {
                    ltdetailmsg.Text = "";
                    lnkupdate.Visible = true;
                    lnkclose.Visible = true;
                    lnkadd.Visible = false;
                    lnkdelete.Visible = false;
                    lttitle.Text = "Cập nhật thuộc tính";
                    pnlist.Visible = false;
                    pndetail.Visible = true;
                    this.hd_insertupdate.Value = "update";
                    this.hdicid.Value = p.Trim();
                    DataTable dt = new DataTable();
                    loadc();
                    dt = WEB.CategoryOther.getcatebyid(p);
                    if (dt.Rows.Count > 0)
                    {
                        hdicid.Value = dt.Rows[0]["icid"].ToString();
                        hdprdicidlist.Value = dt.Rows[0]["vparam1"].ToString();
                        ltcatesck.Text = loadcates("-1", WEB.Common.mod_product);
                        txtname.Text = dt.Rows[0]["vname"].ToString();

                        txtorder.Text = dt.Rows[0]["iorders"].ToString();
                        WEB.Common.SetSelectedIndexInDropDownList(ref ddlcate, dt.Rows[0]["iparcid"].ToString());

                        if (dt.Rows[0]["istatus"].ToString().Equals("1"))
                            chkstatus.Checked = true;
                        else
                            chkstatus.Checked = false;
                        //dtd = WEB.Features.Values.getlisitem(Convert.ToInt32(hdicid.Value), "", "iorder asc");
                        //n = dtd.Rows.Count + 1;
                        //rpvalues.DataSource = dtd;
                        //rpvalues.DataBind();
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
                WEB.CategoryOther.updatestatus(p, status);
                this.UpdateList();
                break;
            case "delete":
                if (checkrole("2053"))
                {
                    p = e.CommandArgument.ToString().Trim();
                    WEB.CategoryOther.db_categories_other_delete(p);
                    this.UpdateList();
                }
                break;

        }
    }
    protected void clear()
    {
        txtorder.Text = "0";
        txtunit.Text = "";
        txtname.Text = "";
    }
    protected  string loadcates(string cid, string capp)
    {
        string strresult = "";
        DataTable dt = new DataTable();
        WEB.Category.getcategorylevel1(ref dt, cid, capp, vlan, "1");
        if (dt.Rows.Count > 0)
        {
            strresult += "<ul>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                strresult += "<li><input type='checkbox'   name='chk' value='" + dt.Rows[i]["icid"].ToString() + "' ";
                if(hdprdicidlist.Value.Contains(dt.Rows[i]["icid"].ToString()))
                    strresult += " checked='checked' ";
                strresult += "> " + dt.Rows[i]["vname"].ToString();
                strresult += loadcates(dt.Rows[i]["icid"].ToString(), WEB.Common.mod_product);
                strresult += "</li>";
                
            }
            strresult += "</ul>";
        }
        return strresult;
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
    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        if (txtname.Text.Length == 0)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tên thuộc tính</p>";
            ltdetailmsg.Visible = true;
            txtname.Focus();
            return;
        }
        string lcates = "|" + WEB.Common.GetFormValue("chk").ToString().Replace(",", "|") + "|";
        int istatus = 0;
        if (chkstatus.Checked == true)
            istatus = 1;
        int num = Convert.ToInt32(Request.Form["hdnum"]);
        string ilevel = "1";
        if (!ddlcate.SelectedValue.Equals("-1"))
        {
            DataTable dt = new DataTable();
            dt = WEB.CategoryOther.getcatebyid(ddlcate.SelectedValue);
            if (dt.Rows.Count > 0)
                ilevel = (Convert.ToInt32(dt.Rows[0]["ilevel"].ToString()) + 1).ToString();
        }
        if (hd_insertupdate.Value.Equals("insert"))
        {

            try
            {
                WEB.CategoryOther.db_categories_other_insert("FT", vlan, ddlcate.SelectedValue, WEB.Common.GetNewTitle(txtname.Text), txtname.Text.Trim(), "", "", "", Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), ilevel, txtorder.Text, istatus.ToString(), lcates, "", "", "", "", "0", "0", "0", "0", "0");
            
                lttitle.Text = "Quản lý thuộc tính - Thêm thuộc tính thành công";
                //ghi log
                string id = WEB.Dataprovider.getmax("db_features", "icid", "").ToString();
                WEB.Logs.writelog("Thêm thuộc tính: " + txtname.Text);
               
                UpdateList();
            }
            catch (Exception exx)
            {
                ltdetailmsg.Text += "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi thêm dữ liệu</p>";
                ltdetailmsg.Visible = true;
            }
        }
        else if (hd_insertupdate.Value.Equals("update"))
        {

            try
            {

                //WEB.Items.db_items_update(hdicid.Value, ddlcate.SelectedValue, WEB.Common.mod_product, vlan, WEB.Common.getalias(txtproductname.Text.Trim()), txtproductkey.Text, txtproductname.Text, WEB.Common.GetNosign(txtproductname.Text), txtdesc.Text, txtcontent.Text, image, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), txtpricenew.Text, txtpriceold.Text, Convert.ToDateTime(hdcreatedate.Value), dupdate, DateTime.Now, hdiviews.Value, istatus, txttitleweb.Text, txtkeyword.Text, txtmetadesc.Text, newhotsale, "", "", "", "", "", "", txt_soluong.Text, txtorder.Text, "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0");
                WEB.CategoryOther.db_categories_other_update(hdicid.Value, "FT", vlan, ddlcate.SelectedValue, WEB.Common.GetNewTitle(txtname.Text), txtname.Text.Trim(), "", "", "", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), txtorder.Text, istatus.ToString(), lcates, "", "", "", Session["admin"].ToString(), "0", "0", "0", "0", "0");
               
                lttitle.Text = "Quản lý thuộc tính - Cập nhật thuộc tính thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật thuộc tính: " + txtname.Text);

                
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
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        lttitle.Text = "Thêm thuộc tính";
        pnlist.Visible = false;
        pndetail.Visible = true;
        //ltdatetime.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
        this.hd_insertupdate.Value = "insert";
        loadc();
        ltcatesck.Text = loadcates("-1", WEB.Common.mod_product);
    }

    protected void lnkclose_Click(object sender, EventArgs e)
    {
        lttitle.Text = "Quản lý thuộc tính";
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

    public string getcatename(string icid)
    {
        DataTable dt = new DataTable();
        dt = WEB.Category.getcatebyid(icid);
        if (dt.Rows.Count > 0)
            return dt.Rows[0]["vname"].ToString();
        else
            return "";
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
                            WEB.CategoryOther.db_categories_other_delete(s[i]);
                        }
                    }
                }
            }
        }
        UpdateList();
    }
    public void btnsearch_Click(object sender, EventArgs e)
    {
        UpdateList();
    }
}