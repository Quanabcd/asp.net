using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;

public partial class admin_products_dutoan : System.Web.UI.UserControl
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
            this.UpdateList();
            lttitle.Text = "Quản lý dự toán";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            ltlink.Text = "";
        }
    }

    protected void loadcity()
    {
        DataTable dt = new DataTable();
        WEB.CategoryOther.getcategorylevel1(ref dt, "-1", "CI", "-1", "-1");
        ddlcity.Items.Clear();

        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                this.ddlcity.Items.Add(new ListItem(dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
            }
        }
    }

    protected void loaddx()
    {
        DataTable dt = new DataTable();
        dt= WEB.Items.getlisitem(WEB.Common.mod_product,vlan, "istatus=1", "iparam2 asc"); 
        ddldongxe.Items.Clear();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddldongxe.Items.Add(new ListItem(dt.Rows[i]["vtitle"].ToString(), dt.Rows[i]["iid"].ToString()));
            }
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
        txtbhvc.Text = "0";
        txtbhtnds.Text = "0";
        txtphidangkiem.Text = "0";
        txtphidangky.Text = "0";
        txtphitruocba.Text = "0";

        txtname.Text = "";
        txtorder.Text = "1";
        lt_mess.Text = "";

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
        dt = WEB.Item_other.getlistitembypage(new string[0], "", "vcode='DTC'", 0, 100, "iorders asc");
        rpitems.DataSource = dt;
        rpitems.DataBind();
    }

    public string getpic(string str)
    {
        if (str.Length > 0)
        {
            return "<img height='40' style='max-width:300px' src='" + weburl + "uploads/products/phienban/" + str + "'>";
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
                lttitle.Text = "Cập nhật dự toán";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                ltino.Text= this.hdino.Value = p.Trim();
                DataTable dt = new DataTable();
                loaddx();
                loadcity();
                dt = WEB.Item_other.getitembyino(p);
                if (dt.Rows.Count > 0)
                {
                    txtname.Text = dt.Rows[0]["vtitle"].ToString().Trim();

                    txtorder.Text = dt.Rows[0]["iorders"].ToString().Trim();
                    txtphitruocba.Text = dt.Rows[0]["vdesc"].ToString().Trim();
                    txtphidangky.Text = dt.Rows[0]["vcontent"].ToString().Trim();
                    txtphidangkiem.Text = dt.Rows[0]["vparam1"].ToString().Trim();
                    txtbhtnds.Text = dt.Rows[0]["vparam2"].ToString().Trim();
                    txtbhvc.Text = dt.Rows[0]["vparam3"].ToString().Trim();
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddldongxe, dt.Rows[0]["vparam5"].ToString());
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlcity, dt.Rows[0]["vparam4"].ToString());
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
                WEB.Item_other.updatestatus(p, status);
                this.UpdateList();
                break;

            case "delete":
                WEB.Item_other.db_items_other_deletebyino(p);
                UpdateList();
                break;
        }
    }

    public bool Check_float(string number)
    {
        float n;
        if (float.TryParse(number, out n))
        {
            return true;
        }
        else
            return false;
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

            if (Check_float(txtphitruocba.Text) == false)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Phí trước bạ phải là số</p>";
                ltdetailmsg.Visible = true;
                txtphitruocba.Focus();
                return;
            }
            if (Check_float(txtphidangky.Text) == false)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Phí đăng ký phải là số</p>";
                ltdetailmsg.Visible = true;
                txtphidangky.Focus();
                return;
            }
            if (Check_float(txtphidangkiem.Text) == false)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Phí đăng kiểm phải là số</p>";
                ltdetailmsg.Visible = true;
                txtphidangkiem.Focus();
                return;
            }
            if (Check_float(txtbhtnds.Text) == false)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Phí bảo hiểm TNDS phải là số</p>";
                ltdetailmsg.Visible = true;
                txtbhtnds.Focus();
                return;
            }
            if (Check_float(txtbhvc.Text) == false)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Bảo hiểm vật chất phải là số</p>";
                ltdetailmsg.Visible = true;
                txtbhvc.Focus();
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
            string image = "";
            if (hd_insertupdate.Value.Equals("insert"))
            {
                try
                {
                    hdalias.Value = WEB.Common.getalias(txtname.Text.Trim());
                    //WEB.Item_other.db_items_other_insert(WEB.Common.mod_adv,vlan, txtname.Text, txtlink.Text,image, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), adv_type, txtorder.Text, istatus,ddlposition.SelectedValue,txtwidth.Text,txtheight.Text, "", "", "0", "0");
                    WEB.Item_other.db_items_other_insert("-1", "DTC", vlan, txtname.Text, txtphitruocba.Text, txtphidangky.Text, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", txtorder.Text, istatus, txtphidangkiem.Text, txtbhtnds.Text, txtbhvc.Text, ddlcity.SelectedValue, ddldongxe.SelectedValue, "0", "0");
                    lttitle.Text = "Quản lý dự toán - Thêm dự toán thành công";

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
                    hdalias.Value = WEB.Common.getalias(txtname.Text.Trim());
                    WEB.Item_other.db_items_other_update(hdino.Value, "-1", "DTC", vlan, txtname.Text, txtphitruocba.Text, txtphidangky.Text, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", txtorder.Text, istatus, txtphidangkiem.Text, txtbhtnds.Text, txtbhvc.Text, ddlcity.SelectedValue, ddldongxe.SelectedValue, "0", "0");
                    lttitle.Text = "Quản lý dự toán - Cập nhật dự toán thành công";

                    UpdateList();
                }
                catch
                {
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật không thành công</p>";
                    ltdetailmsg.Visible = true;
                }
            }
        }
        catch { }
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
        loaddx();
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        lttitle.Text = "Thêm dự toán";
        pnlist.Visible = false;
        pndetail.Visible = true;
        this.hd_insertupdate.Value = "insert";
        loadcity();
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