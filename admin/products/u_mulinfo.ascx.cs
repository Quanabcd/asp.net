using System;
using System.Data;

public partial class admin_products_u_mulinfo : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int iorder = 0;
    public int iordertype = 0;
    public int curpage = 1;
    public string key = "";
    public int icid = -1;
    public int istatus = -1;
    public int numitems = 0;
    public int icurrent = 0;
    public int n = 0;
    public int id = -1;
    public int iidtemp = -1;
    public int subnum = 1;
    public string itemtitle = "";
    public string itemurl = "";
    public string itemdescription = "";
    public int subcurrent = 0;
    public string role = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        role = Session["role"].ToString();
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("p")))
        {
            curpage = Convert.ToInt32(WEB.Common.GeturlParam("p"));
        }
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("id")))
        {
            id = Convert.ToInt32(WEB.Common.GeturlParam("id"));
        }

        if (WEB.Common.Check_number(WEB.Common.GeturlParam("order")))
        {
            iorder = Convert.ToInt32(WEB.Common.GeturlParam("order"));
        }
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("st")))
        {
            istatus = Convert.ToInt32(WEB.Common.GeturlParam("st"));
        }
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("ordertype")))
        {
            iordertype = Convert.ToInt32(WEB.Common.GeturlParam("ordertype"));
        }
        if (WEB.Common.GeturlParam("key").Length > 0)
        {
            key = WEB.Common.GeturlParam("key");
        }
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("cid")))
        {
            icid = Convert.ToInt32(WEB.Common.GeturlParam("cid"));
            DataTable dtc = WEB.Category.getcatebyid(icid.ToString());
            if (dtc.Rows.Count > 0)
            {
                if (dtc.Rows[0]["vparam6"].ToString().Contains(',' + Session["userid"].ToString() + ",") || dtc.Rows[0]["vparam6"].ToString().Contains(",-1,"))
                {
                }
                else
                    icid = -1;
            }
            else
                icid = -1;
        }

        if (!IsPostBack)
        {
            numitems = WEB.Products.getnumitem();
            lttitle.Text = "Danh sách thông số";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = false;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;

            this.UpdateList();
            if (id != -1)
                getdetail(id.ToString());
        }
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
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        if (checkrole("2021"))
        {
            lnkadd.Visible = false;
        }
        else
        {
            lnkadd.Visible = false;
        }

        if (checkrole("2023"))
            lnkdelete.Visible = true;
        else
            lnkdelete.Visible = false;

        pndetail.Visible = false;
        pnlist.Visible = true;
        // lnkupdatepriceandorder.Visible = true;
        DataTable dt = new DataTable();
        string[] fieldsearch = { "vkey", "vtitle", "vtitle_no", "valias" };
        string condition = "";
        if (icid == -1)
        {
            string s = hddmql.Value;
            if (s.Length > 1)
                condition = " icid in (" + s.Substring(1, s.Length - 2) + ")";
            else
                condition = "1=2";
        }
        string sorder = "iid desc";
        if (iorder == 0)
            sorder = "dcreatedate";
        else if (iorder == 1)
            sorder = "dupdate";
        else if (iorder == 2)
            sorder = "vtitle";
        else if (iorder == 3)
            sorder = "iparam2";
        else if (iorder == 4)
            sorder = "iviews";
        else if (iorder == 5)
            sorder = "fnewprice";
        if (iordertype == 1)
            sorder += " asc";
        else
            sorder += " desc";
        //key = WEB.Common.remove_specical_char(txtkeysearch.Text);
        numitems = WEB.Items.getnumitems(key, fieldsearch, WEB.Common.mod_product, icid.ToString(), vlan, "", istatus.ToString());
        dt = WEB.Items.getlistitembypage(icid.ToString(), fieldsearch, key, WEB.Common.mod_product, vlan, "", istatus.ToString(), curpage - 1, 20, sorder);
        // lt_count.Text = "Tổng số sản phẩm: <span style='color: #A52A2A;'>" + numitems.ToString() + "</span>";
        rpitems.DataSource = dt;
        rpitems.DataBind();
        lt_pagebotom.Text = WEB.Common.PhanTrang("?mod=prod&c=thongso&cid=" + icid.ToString() + "&key=" + key.Trim() + "&st=" + istatus.ToString() + "&order=" + iorder.ToString() + "&ordertype=" + iordertype.ToString(), curpage, numitems, 20);
    }

    public string checkrolecss(string s)
    {
        if (role.Contains("|" + s + "|"))
            return " style='display:inline-block' ";
        else
            return " style='display:none' ";
    }

    public string getpic(string str)
    {
        if (str.Length > 0)
        {
            return "<img height='40' style='max-width:300px' src='" + weburl + "uploads/products/" + str + "'>";
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
                this.hdiid.Value = p.Trim();
                if (checkrole("2022"))
                {
                    Session["url"] = "admin/?mod=prod&c=thongso&cid=" + icid.ToString();
                    Response.Redirect(weburl + "admin/?mod=prod&c=thongso&id=" + p);
                }
                break;

            case "ChangeStatus":
                p = e.CommandArgument.ToString().Trim().Substring(0, e.CommandArgument.ToString().IndexOf("|"));
                string status = e.CommandArgument.ToString().Substring(e.CommandArgument.ToString().IndexOf("|") + 1, e.CommandArgument.ToString().Length - e.CommandArgument.ToString().IndexOf("|") - 1);
                if (status == "1")
                    status = "0";
                else
                    status = "1";
                WEB.Items.updatestatus(p, status);
                this.UpdateList();
                break;

            case "delete":
                if (checkrole("2023"))
                {
                    WEB.Logs.writelog("Xóa sản phẩm: " + getname(p));
                    WEB.Items.db_items_delete(p);
                    WEB.Group.db_group_items_delete_by_iid(p);
                    UpdateList();
                }
                break;
        }
    }

    public void getdetail(string id)
    {
        if (checkrole("2222"))
        {
            ltdetailmsg.Text = "";
            lnkupdate.Visible = true;
            lnkclose.Visible = true;
            lnkadd.Visible = false;
            lnkdelete.Visible = false;

            lttitle.Text = "Cập nhật Thông số";
            pnlist.Visible = false;
            pndetail.Visible = true;
            this.hd_insertupdate.Value = "update";
            this.hdiid.Value = id;
            DataTable dt = new DataTable();
            clear();
            dt = WEB.Items.getitembyid(id);
            if (dt.Rows.Count > 0)
            {
                string[] ss = dt.Rows[0]["vparam9"].ToString().Split('|');
              
                if (ss.Length >= 3)
                {
                    TextBox1.Text = ss[0];
                    TextBox2.Text = ss[1];
                    TextBox3.Text = ss[2];
                    TextBox4.Text = ss[3];
                    TextBox5.Text = ss[4];
                    TextBox6.Text = ss[5];
                    TextBox7.Text = ss[6];
                    TextBox8.Text = ss[7];
                    TextBox9.Text = ss[8];
                    TextBox10.Text = ss[9];
                    TextBox11.Text = ss[10];
                    TextBox12.Text = ss[11];
                    TextBox13.Text = ss[12];
                    TextBox14.Text = ss[13];
                    TextBox15.Text = ss[14];
                    TextBox16.Text = ss[15];
                    TextBox17.Text = ss[16];
                    TextBox18.Text = ss[17];
                    TextBox19.Text = ss[18];
                    TextBox20.Text = ss[19];
                    TextBox21.Text = ss[20];
                    TextBox22.Text = ss[21];
                    TextBox23.Text = ss[22];
                    TextBox24.Text = ss[23];
                    TextBox25.Text = ss[24];
                    TextBox26.Text = ss[25];
                    TextBox27.Text = ss[26];
                    TextBox28.Text = ss[27];
                    TextBox29.Text = ss[28];
                    TextBox30.Text = ss[29];
                    TextBox31.Text = ss[30];
                    TextBox32.Text = ss[31];
                    TextBox33.Text = ss[32];
                    TextBox34.Text = ss[33];
                    TextBox35.Text = ss[34];
                    TextBox36.Text = ss[35];
                    TextBox37.Text = ss[36];
                    TextBox38.Text = ss[37];
                    TextBox39.Text = ss[38];
                    TextBox40.Text = ss[39];
                    TextBox41.Text = ss[40];
                    TextBox42.Text = ss[41];
                    TextBox43.Text = ss[42];
                    TextBox44.Text = ss[43];
                    TextBox45.Text = ss[44];
                    TextBox46.Text = ss[45];
                    TextBox47.Text = ss[46];
                    TextBox48.Text = ss[47];
                    TextBox49.Text = ss[48];
                    TextBox50.Text = ss[49];
                    TextBox51.Text = ss[50];
                    TextBox52.Text = ss[51];
                    TextBox53.Text = ss[52];
                    TextBox53.Text = ss[53];
                    TextBox55.Text = ss[54];
                    TextBox56.Text = ss[55];
                    TextBox57.Text = ss[56];
                    TextBox58.Text = ss[57];
                    TextBox59.Text = ss[58];
                    TextBox60.Text = ss[59];
                    TextBox61.Text = ss[60];
                    TextBox62.Text = ss[61];
                    TextBox63.Text = ss[62];
                    TextBox64.Text = ss[63];
                    TextBox65.Text = ss[64];
                    TextBox66.Text = ss[65];
                    TextBox67.Text = ss[66];
                }
            }
        }
    }

    protected void clear()
    {
    }

    protected string getname(string id)
    {
        DataTable dt = WEB.Items.getitembyid(id);
        if (dt.Rows.Count > 0)
            return dt.Rows[0]["vtitle"].ToString();
        else
            return "";
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
        string strpb = TextBox1.Text + "|" + TextBox2.Text + "|" + TextBox3.Text + "|" + TextBox4.Text + "|" + TextBox5.Text + "|" + TextBox6.Text + "|" + TextBox7.Text + "|" + TextBox8.Text + "|" + TextBox9.Text + "|" + TextBox10.Text + "|" + TextBox11.Text + "|" + TextBox12.Text + "|" + TextBox13.Text + "|" + TextBox14.Text + "|" + TextBox15.Text + "|" + TextBox16.Text + "|" + TextBox17.Text + "|" + TextBox18.Text + "|" + TextBox19.Text + "|" + TextBox20.Text + "|" + TextBox21.Text + "|" + TextBox22.Text + "|" + TextBox23.Text + "|" + TextBox24.Text + "|" + TextBox25.Text + "|" + TextBox26.Text + "|" + TextBox27.Text + "|" + TextBox28.Text + "|" + TextBox29.Text + "|" + TextBox30.Text + "|" + TextBox31.Text + "|" + TextBox32.Text + "|" + TextBox33.Text + "|" + TextBox34.Text + "|" + TextBox35.Text + "|" + TextBox36.Text + "|" + TextBox37.Text + "|" + TextBox38.Text + "|" + TextBox39.Text + "|" + TextBox40.Text + "|" + TextBox41.Text + "|" + TextBox42.Text + "|" + TextBox43.Text + "|" + TextBox44.Text + "|" + TextBox45.Text + "|" + TextBox46.Text + "|" + TextBox47.Text + "|" + TextBox48.Text + "|" + TextBox49.Text + "|" + TextBox50.Text + "|" + TextBox51.Text + "|" + TextBox52.Text + "|" + TextBox53.Text + "|" + TextBox54.Text + "|" + TextBox55.Text + "|" + TextBox56.Text + "|" + TextBox57.Text + "|" + TextBox58.Text + "|" + TextBox59.Text + "|" + TextBox60.Text + "|" + TextBox61.Text + "|" + TextBox62.Text + "|" + TextBox63.Text + "|" + TextBox64.Text + "|" + TextBox65.Text + "|" + TextBox66.Text + "|" + TextBox67.Text + "|";

        string[] fields = { "vparam9" };
        string[] values = { strpb };

        WEB.Items.save(id, fields, values);
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
    }

    protected void lnkclose_Click(object sender, EventArgs e)
    {
        lttitle.Text = "Quản lý thông số";
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
        //if (HttpContext.Current.Request.Form["cb_"] != null)
        //{
        //    if (!HttpContext.Current.Request.Form["cb_"].ToString().Equals(""))
        //    {
        //        string choose = Request.Form["cb_"].ToString().Trim() + ",";
        //        string[] s = choose.Split(Convert.ToChar(","));
        //        if (s.Length > 0)
        //        {
        //            for (int i = 0; i < s.Length; i++)
        //            {
        //                if (s[i].Length > 0)
        //                {
        //                    WEB.CategoryOther.db_categories_other_delete(s[i]);
        //                }
        //            }
        //        }
        //    }
        //}
        //UpdateList();
    }

    public void btnsearch_Click(object sender, EventArgs e)
    {
        UpdateList();
    }
}