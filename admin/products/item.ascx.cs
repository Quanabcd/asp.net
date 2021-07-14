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
using System.Data.OleDb;
using System.Text.RegularExpressions;
using System.Text;

public partial class admin_products_item : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int iorder = 0;
    public int iordertype = 0;
    public int curpage =1;
    public string key = "";
    public int icid = -1;
    public int istatus = -1;
    public int numitems = 0;
    public int icurrent = 0;
    public int n = 0;
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
        if (!IsPostBack)
        {
            CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
            _FileBrowser.BasePath = "../ckfinder";          
            _FileBrowser.SetupCKEditor(txtcontent);
         
            CKFinder.FileBrowser _FileBrowser1 = new CKFinder.FileBrowser();
            _FileBrowser1.BasePath = "../ckfinder";
            _FileBrowser1.SetupCKEditor(txtdesc);
            numitems = WEB.Products.getnumitem();
            //lttitle.Text = numitems.ToString();
             
            lttitle.Text = "Danh sách sản phẩm";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            DataTable dt = new DataTable();
            dt = WEB.Category.getcate("-1", WEB.Common.mod_product, vlan, "1", "-1");
            ddlcate.Items.Clear();
            ddlcateadditem.Items.Clear();
            ddlcatesearch.Items.Clear();
            //ddlcate.Items.Add(new ListItem("Tất cả", "-1"));
            ddlcatesearch.Items.Add(new ListItem("Tất cả", "-1"));
            ddlcateexport.Items.Clear();
            ddlcateimport.Items.Clear();
            string dml = ",";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string space = "";
                for (int j = 1; j < Convert.ToInt32(dt.Rows[i]["ilevel"].ToString()); j++)
                {
                    space += "..";
                }
                if (dt.Rows[i]["vparam6"].ToString().Contains(',' + Session["userid"].ToString() + ",") || dt.Rows[i]["vparam6"].ToString().Contains(",-1,"))
                {
                    dml += dt.Rows[i]["icid"].ToString() + ",";
                    this.ddlcate.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                    this.ddlcateadditem.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                    this.ddlcatesearch.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                    this.ddlcateexport.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                    this.ddlcateimport.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                }
                space = "";
                //ltcatesrelative.Text += "<li class='space" + dt.Rows[i]["ilevel"].ToString() + "'><a class='prd-cate-lnk' title='" + dt.Rows[i]["vname"].ToString() + "' href='javascript:0' data='" + dt.Rows[i]["icid"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a></li>";
            }
            hddmql.Value = dml;
            txtkeysearch.Text = key;
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlcatesearch, icid.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlcateadditem, icid.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlcateexport, icid.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlcateimport, icid.ToString());

            WEB.Common.SetSelectedIndexInDropDownList(ref ddlorder, iorder.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlstatus,istatus.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlordertype, iordertype.ToString());
            loadfeature("");
            this.UpdateList();
        }
    }
    public bool checkrole(string s)
    {
        if (role.Contains("|" + s + "|"))
            return true;
        else
            return false;
    }
    public string checkrolecss(string s)
    {
        if (role.Contains("|" + s + "|"))
            return " style='display:inline-block' ";
        else
            return " style='display:none' ";
    }
    protected void loadvendor()
    {
        DataTable  dt = WEB.Category.getcate("-1", WEB.Common.mod_product_vendor, vlan, "1", "-1");
        ddlvendor.Items.Clear();
        this.ddlvendor.Items.Add(new ListItem("Chọn nhà sản xuất", "-1"));
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            this.ddlvendor.Items.Add(new ListItem(dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
        }
    }
    public int getstt()
    {
        icurrent++;
        return icurrent;
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
    protected void loadfeature(string sdefault)
    {
        DataTable dtv = new DataTable();
        DataTable dtf = WEB.Features.Items.getlisitem(vlan, "vprdcidlist like '%|" + ddlcate.SelectedValue + "|%'", "iorder asc");
        string s = "";
        string unit="";
        if (dtf.Rows.Count > 0)
        {
            for (int i = 0; i < dtf.Rows.Count; i++)
            {
                unit = "";
                if (dtf.Rows[i]["itype"].ToString() != "0")
                    dtv = WEB.Features.Values.getlisitem(Convert.ToInt32(dtf.Rows[i]["icid"]), "", "iorder asc");
                else if (dtf.Rows[i]["itype"].ToString() == "1")
                    unit = dtf.Rows[i]["vunit"].ToString();
                s += genfeature(Convert.ToInt32(dtf.Rows[i]["itype"]), Convert.ToInt32(dtf.Rows[i]["icid"]), dtf.Rows[i]["vname"].ToString(), dtv, "", unit, sdefault);
            }
        }
       // ltfeature.Text = s;
    }
    protected void loadtab(string iid)
    {
        DataTable dt = WEB.Item_other.getlisitem("TAB", WEB.Common.LangAdmin, "iid=" + iid, "ino asc"); 
        rptabs.DataSource = dt;
        rptabs.DataBind();
        n = dt.Rows.Count + 1;
    }
    protected void loadpb(string iid)
    {
        DataTable dt = WEB.Item_other.getlisitem("PHB", WEB.Common.LangAdmin, "iid=" + iid, "ino asc");
        rpsubprd.DataSource = dt;
        rpsubprd.DataBind();
        subnum = dt.Rows.Count + 1;
    }
    protected string  genfeature(int type,int icid,string title,DataTable dtvalues,string svalue,string unit,string sdefault)
    {
        string s = "<div class='ad-ft-tt-item'>";
        string s1 = "";
        if (type == 0)
            s += "<div class='ad-ft-tt-l'>" + title + "</div><div class='ad-ft-nd-r'>" + "<textarea class='inputbox' rows='3' cols='50'  name='txt" + icid.ToString() + "' id='txt" + icid.ToString() + "'>" + svalue + "</textarea></div><div class='clear'></div>";
        else if (type == 1)
        {
            if (dtvalues.Rows.Count > 0)
            {
                for (int i = 0; i < dtvalues.Rows.Count; i++)
                {
                    s1 += "<option value='" + dtvalues.Rows[i]["vvalue"].ToString() + "'>" + dtvalues.Rows[i]["vvalue"].ToString() + "</option>";
                }
                if (s1.Length > 0)
                    s1 = "<select name='ddl" + icid.ToString() + "' id='ddl" + icid.ToString() + "' class='inputbox'>" + s1 + "</select> " + unit;

            }
            s += "<div class='ad-ft-tt-l'>" + title + "</div><div class='ad-ft-nd-r'>" + s1 + "</div><div class='clear'></div>";
        }
        else if (type == 2)
        {
            for (int i = 0; i < dtvalues.Rows.Count; i++)
            {
                s1 += "<option value='" + dtvalues.Rows[i]["vvalue"].ToString() + "'>" + dtvalues.Rows[i]["vvalue"].ToString() + "</option>";
            }
            if (s1.Length > 0)
                s1 = "<select name='ddl" + icid.ToString() + "' id='ddl" + icid.ToString() + "' class='inputbox'>" + s1 + "</select>";
            s += "<div class='ad-ft-tt-l'>" + title + "</div><div class='ad-ft-nd-r'>" + s1 + "</div><div class='clear'></div>";
        }
        else if (type == 3)
        {
            for (int i = 0; i < dtvalues.Rows.Count; i++)
            {
                s1 += "<li><input type='checkbox' name='chk" + icid.ToString() + "' value='" + dtvalues.Rows[i]["vvalue"].ToString() + "'> " + dtvalues.Rows[i]["vvalue"].ToString() + "</li>";
            }
            s += "<div class='ad-ft-tt-l'>" + title + "</div><div class='ad-ft-nd-r'><ul>" + s1 + "</ul></div><div class='clear'></div>";
        }
        s += "</div>";
        return s;
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
            lnkadd.Visible = true;
            if (checkrole("2004"))
            ltaddmulti.Text = "<a href='#ex1' class='nhanban' title='Thêm nhanh sản phẩm'><span class='icon-ok-new'></span>Thêm nhanh sản phẩm</a>";
        }
        else
        {
            lnkadd.Visible = false;
            ltaddmulti.Text = "";
        }
        if (checkrole("2006"))
        {
            ltxuatexcel.Text = "<a href='#ex2' class='xuat' title='Xuất ra excel'><span class='fa fa-arrow-circle-o-down'></span> Xuất ra excel</a>";
        }
        else
        {
            ltxuatexcel.Text = "";
        }
        if (checkrole("2007"))
        {
            ltnhapexcel.Text = "<a href='#ex3' class='nhap' title='Nhập từ excel'><span class='fa fa-arrow-circle-up'></span> Nhập từ excel</a>";
        }
        else
        {
            ltnhapexcel.Text = "";
        }
        if (checkrole("2023"))
            lnkdelete.Visible = true;
        else
            lnkdelete.Visible = false;

        pndetail.Visible = false;
        pnlist.Visible = true;
        lnkupdatepriceandorder.Visible = true;
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
        numitems = WEB.Items.getnumitems(key, fieldsearch, WEB.Common.mod_product, icid.ToString(), vlan, condition, istatus.ToString());
        dt = WEB.Items.getlistitembypage(icid.ToString(), fieldsearch, key, WEB.Common.mod_product, vlan, condition, istatus.ToString(), curpage-1, 20, sorder);
        lt_count.Text = "Tổng số sản phẩm: <span style='color: #A52A2A;'>" + numitems.ToString() + "</span>";
        rpitems.DataSource = dt;
        rpitems.DataBind();
       lt_pagebotom.Text= ltpage.Text = WEB.Common.PhanTrang("?mod=prod&c=items&cid=" + icid.ToString() + "&key=" + key.Trim() + "&st=" + istatus.ToString() + "&order=" + iorder.ToString() + "&ordertype=" + iordertype.ToString(), curpage, numitems, 20);
    }
    protected void loadgroup()
    {
        DataTable dt = WEB.Category.getcate("-1", WEB.Common.mod_product_group, vlan, "1", "1");
        rpgroup.DataSource = dt;
        rpgroup.DataBind();
    }
    protected string checkgroup(string cid)
    {
        if (hdgroup.Value.Contains("|" + cid + "|"))
            return "checked ='checked'";
        else
            return "";
    }
    protected string loadfe(string cid, string capp, string listcur,string icate)
    {
        string strresult = "";
        DataTable dt = new DataTable();
        WEB.CategoryOther.getcategorylevel1(ref dt, cid, capp, "vparam1 like'%|" + icate + "|%'",vlan, "1");
        if (dt.Rows.Count > 0)
        {
            strresult += "<ul>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                strresult += "<li><input type='checkbox'   name='chk' value='" + dt.Rows[i]["icid"].ToString() + "' ";
                if (listcur.Contains(dt.Rows[i]["icid"].ToString()))
                    strresult += " checked='checked' ";
                strresult += "> " + dt.Rows[i]["vname"].ToString();
                strresult += loadfe(dt.Rows[i]["icid"].ToString(), capp, listcur, icate);
                strresult += "</li>";

            }
            strresult += "</ul>";
        }
        return strresult;
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
                    Session["url"] = "admin/?mod=prod&c=items&cid=" + icid.ToString() + "&key=" + key.Trim() + "&st=" + istatus.ToString() + "&order=" + iorder.ToString() + "&ordertype=" + iordertype.ToString();
                    Response.Redirect(weburl + "admin/?mod=prod&c=items&id=" +p );
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
    protected string getname(string id)
    {
        DataTable dt = WEB.Items.getitembyid(id);
        if (dt.Rows.Count > 0)
            return dt.Rows[0]["vtitle"].ToString();
        else
            return "";
    }
    protected void clear()
    {
        txturl.Text = "";
        txttitleweb.Text = "";
        txtproductname.Text = "";
        txtproductkey.Text = "";
        txtpriceold.Text = "0";
        txtpricenew.Text = "0";
        txtmetadesc.Text = "";
        txtkeyword.Text = "";
        txtdesc.Text = "";
        txtorder.Text = "1";
        txtcontent.Text = "";
        txtweight.Text = "0";
        txtnumprdsale.Text = "0";
        chkupdatedate.Checked = false;
        chkstatus.Checked = true;
        chkacceptbuy.Checked = true;
        chkdisplaytt.Checked = true;
        ltimage.Text = "";
        txtnumber.Text = "0";
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
   
    protected void lnkadd_Click(object sender, EventArgs e)
    {
        Session["url"]="admin/?mod=prod&c=items&cid=" + icid.ToString() + "&key=" + key.Trim() + "&st=" + istatus.ToString() + "&order=" + iorder.ToString() + "&ordertype=" + iordertype.ToString();
        Response.Redirect(weburl + "admin/?mod=prod&c=items&f=add&cid="+ icid.ToString());
    }

    protected void lnkclose_Click(object sender, EventArgs e)
    {
        lttitle.Text = "Quản lý sản phẩm";
        UpdateList();
    }
    public string formatdate(DateTime date)
    {

        return WEB.Common.Formatdate(date);
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
                    WEB.Logs.writelog("Xóa sản phẩm hàng loạt");
                    for (int i = 0; i < s.Length; i++)
                    {
                        if (s[i].Length > 0)
                        {
                            WEB.Items.db_items_delete(s[i].ToString());
                            WEB.Group.db_group_items_delete_by_iid(s[i].ToString());
                        }
                    }
                }
            }
        }
        
        UpdateList();
    }
    public void btnsearch_Click(object sender, EventArgs e)
    {
        Response.Redirect(weburl + "admin/?mod=prod&c=items&cid=" + ddlcatesearch.SelectedValue + "&st=" + ddlstatus.SelectedValue + "&key=" + txtkeysearch.Text.Trim() + "&order=" + ddlorder.SelectedValue + "&ordertype=" + ddlordertype.SelectedValue);
    }

    protected void lnkupdatepriceandorder_Click(object sender, EventArgs e)
    {
        string[] fieldsearch = { "vkey", "vtitle", "vtitle_no", "valias" };
        string condition = "";
        if (icid == -1)
        {
            string s = hddmql.Value;
            if (s.Length > 1)
                condition = " icid in (" + s.Substring(1, s.Length - 2) + ")";
            else
                condition =  " 1=2 " ;
        }
        string key = "";
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
        DataTable dt = WEB.Items.getlistitembypage(icid.ToString(), fieldsearch, key, WEB.Common.mod_product, vlan, condition, istatus.ToString(), curpage-1, 20, sorder);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            try
            {
                string[] sf = { "fnewprice", "foldprice", "iparam2" };
                object[] vf = { Request.Form["txtnewprice_" + dt.Rows[i]["iid"].ToString()].ToString().Trim(), Request.Form["txtoldprice_" + dt.Rows[i]["iid"].ToString()].ToString().Trim(), Request.Form["txtorder_" + dt.Rows[i]["iid"].ToString()].ToString().Trim() };
                WEB.Items.save(Convert.ToInt32(dt.Rows[i]["iid"]), sf, vf);
            }
            catch { }
        }
        lttitle.Text += " - Cập nhật thành công";
        UpdateList();
    }
    protected void lnk_Click(object sender, EventArgs e)
    {
        Session["url"] = "admin/?mod=prod&c=items&cid=" + icid.ToString() + "&key=" + key.Trim() + "&st=" + istatus.ToString() + "&order=" + iorder.ToString() + "&ordertype=" + iordertype.ToString();
        Response.Redirect(weburl + "admin/?mod=prod&c=items&f=addmulti&cid=" +ddlcateadditem.SelectedValue);
    }
    protected void export()
    {
        DataTable pBang = new DataTable();
        string name_ = ""; //Tên file excel mà bạn lưu về máy
        string[] fieldsearch = { "vkey", "vtitle", "vtitle_no", "valias" };
        string condition = "";
        if (icid == -1)
        {
            string s = hddmql.Value;
            if (s.Length > 1)
                condition = " icid in (" + s.Substring(1, s.Length - 2) + ")";
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
        if (ddlexport.SelectedValue == "0")
        {
            name_ = "san-pham-tren-trang-" + DateTime.Now.Day.ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Year.ToString() ;
            pBang = WEB.Items.getlistitembypage(icid.ToString(), fieldsearch, key, WEB.Common.mod_product, vlan, condition, istatus.ToString(), curpage - 1, 20, sorder);
            Response.Write(condition);
        }
        else if (ddlexport.SelectedValue == "1")
        {
            name_ = "san-pham-" + WEB.Common.GetNewTitle(ddlcateexport.SelectedItem.Text) + "-" + DateTime.Now.Day.ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Year.ToString();
            condition = "";
            pBang = WEB.Items.getlistitembypage(ddlcateexport.SelectedValue, fieldsearch, "", WEB.Common.mod_product, vlan, condition, "-1",0, 300, sorder);
        }
        else if (ddlexport.SelectedValue == "2")
        {
            name_ = "tat-ca-san-pham-"  + DateTime.Now.Day.ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Year.ToString();
            pBang = WEB.Items.getlistitembypage("-1", fieldsearch, "", WEB.Common.mod_product, vlan, condition, "-1", 0, 500, sorder);
        }
        

        Table tb = new Table();
        tb.BorderColor = System.Drawing.Color.FromName("red");
        tb.CellPadding = 4;
        tb.GridLines = GridLines.Both;
        tb.CellSpacing = 0;
        tb.Width = Unit.Percentage(100);
        TableCell cell;
        TableRow row;
        int from = 0;
        int to = pBang.Rows.Count;
        int header = 0;
        for (int i = from; i < to ; i++)
        {
            DataRow dr = pBang.Rows[i];
            if (header == 0)
            {
                row = new TableRow();
                cell = new TableCell();
                cell.Height = 50;
                cell.BackColor = System.Drawing.Color.FromName("red");
                cell.Width = 50;
                cell.Text = "<b>ID</b>";
                cell.HorizontalAlign = HorizontalAlign.Center;
                row.Cells.Add(cell);

                cell = new TableCell();
                cell.Height = 50;
                cell.Width = 140;
                cell.BackColor = System.Drawing.Color.FromName("red");
                cell.Text = "<b>Mã SP</b>";
                cell.HorizontalAlign = HorizontalAlign.Center;
                row.Cells.Add(cell);

                cell = new TableCell();
                cell.Height = 50;
                cell.BackColor = System.Drawing.Color.FromName("red");
                cell.Width = 300;
                cell.Text = "<b>Tên sản phẩm</b>";
                cell.HorizontalAlign = HorizontalAlign.Center;
                row.Cells.Add(cell);
                tb.Rows.Add(row);
                
                cell = new TableCell();
                cell.Height = 50;
                cell.BackColor = System.Drawing.Color.FromName("red");
                cell.Width = 100;
                cell.Text = "<b>Giá bán</b>";
                cell.HorizontalAlign = HorizontalAlign.Center;
                row.Cells.Add(cell);
                tb.Rows.Add(row);

                cell = new TableCell();
                cell.Height = 50;
                cell.BackColor = System.Drawing.Color.FromName("red");
                cell.Width = 100;
                cell.Text = "<b>Giá so sánh</b>";
                cell.HorizontalAlign = HorizontalAlign.Center;
                row.Cells.Add(cell);
                tb.Rows.Add(row);

                cell = new TableCell();
                cell.Height = 50;
                cell.BackColor = System.Drawing.Color.FromName("red");
                cell.Width = 100;
                cell.Text = "<b>Trạng thái</b>";
                cell.HorizontalAlign = HorizontalAlign.Center;
                row.Cells.Add(cell);
                tb.Rows.Add(row);
            }
            header++;
            row = new TableRow();
            cell = new TableCell();
            cell.Height = 50;
            cell.Text = dr["iid"].ToString();
            cell.HorizontalAlign = HorizontalAlign.Left;
            row.Cells.Add(cell);

            cell = new TableCell();
            cell.Height = 50;
            cell.Text = dr["vkey"].ToString();
            cell.HorizontalAlign = HorizontalAlign.Left;
            row.Cells.Add(cell);

            cell = new TableCell();
            cell.Height = 50;
            cell.Text = dr["vtitle"].ToString();
            cell.HorizontalAlign = HorizontalAlign.Left;
            row.Cells.Add(cell);

            cell = new TableCell();
            cell.Height = 50;
            cell.Text = dr["fnewprice"].ToString().Trim();
            cell.HorizontalAlign = HorizontalAlign.Left;
            row.Cells.Add(cell);
            tb.Rows.Add(row);

            cell = new TableCell();
            cell.Height = 50;
            cell.Text = dr["foldprice"].ToString().Trim();
            cell.HorizontalAlign = HorizontalAlign.Left;
            row.Cells.Add(cell);
            tb.Rows.Add(row);

            cell = new TableCell();
            cell.Height = 50;
            cell.Text = dr["istatus"].ToString().Trim();
            cell.HorizontalAlign = HorizontalAlign.Left;
            row.Cells.Add(cell);
            tb.Rows.Add(row);
        }
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.ClearContent();
        HttpContext.Current.Response.ClearHeaders();
        HttpContext.Current.Response.Buffer = true;
        string ex_ = "xls";
        Context.Response.AddHeader("Content-Disposition", "attachment; filename=" + name_ + "." + ex_);
        Response.ContentType = "application/vnd.ms-excel";
        Response.Charset = "UTF-8";
        this.EnableViewState = false;
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        tb.RenderControl(oHtmlTextWriter);
        Response.Write(oStringWriter.ToString());
        HttpContext.Current.Response.Flush();
        HttpContext.Current.Response.End();
    }
    protected void ExporttoExcel()
    {
        string[] s = {"ID", "MASP", "TENSP", "GIAMOI", "GIACU",  "TRANGTHAI" };
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.ClearContent();
        HttpContext.Current.Response.ClearHeaders();
        HttpContext.Current.Response.Buffer = true;
        HttpContext.Current.Response.ContentType = "application/ms-excel";
        //HttpContext.Current.Response.ContentType = "application/ms-word";
        HttpContext.Current.Response.Write(@"<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">");
        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=Sheet1.xlsx");
        // HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=Reports.doc");
        HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
        HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.UTF8;
        HttpContext.Current.Response.Charset = "utf-8";
        // HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1250");
        HttpContext.Current.Response.Write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
        HttpContext.Current.Response.Write("<font style='font-size:12.0pt; font-family:Times New Roman;'>");
        HttpContext.Current.Response.Write("<BR><BR><BR>");
        HttpContext.Current.Response.Write("<Table border='0'  cellSpacing='0' cellPadding='0' style='font-size:11.0pt; font-family:Times New Roman; '> <TR>");

        for (int j = 0; j < s.Length; j++)
        {
            HttpContext.Current.Response.Write("<Td>");
            HttpContext.Current.Response.Write("<B>");
            HttpContext.Current.Response.Write(s[j]);
            HttpContext.Current.Response.Write("</B>");
            HttpContext.Current.Response.Write("</Td>");
        }
        HttpContext.Current.Response.Write("</TR>");
        string[] fieldsearch = { "vkey", "vtitle", "vtitle_no", "valias" };
        string condition = "";
        string key = "";
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
        DataTable dt = WEB.Items.getlistitembypage(icid.ToString(), fieldsearch, key, WEB.Common.mod_product, vlan, condition, istatus.ToString(), curpage - 1, 20, sorder);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            HttpContext.Current.Response.Write("<TR>");
            HttpContext.Current.Response.Write("<Td>");
            HttpContext.Current.Response.Write(dt.Rows[i]["vkey"].ToString());
            HttpContext.Current.Response.Write("</Td>");
            HttpContext.Current.Response.Write("<Td>");
            HttpContext.Current.Response.Write(dt.Rows[i]["vtitle"].ToString());
            HttpContext.Current.Response.Write("</Td>");

            HttpContext.Current.Response.Write("<Td>");
            HttpContext.Current.Response.Write(dt.Rows[i]["fnewprice"].ToString());
            HttpContext.Current.Response.Write("</Td>");
            HttpContext.Current.Response.Write("<Td>");
            HttpContext.Current.Response.Write(dt.Rows[i]["foldprice"].ToString());
            HttpContext.Current.Response.Write("</Td>");
            
            //HttpContext.Current.Response.Write("<Td>");
            //HttpContext.Current.Response.Write(dt.Rows[i]["vdesc"].ToString());
            //HttpContext.Current.Response.Write("</Td>");
            //HttpContext.Current.Response.Write("<Td>");
            //HttpContext.Current.Response.Write("");
            //HttpContext.Current.Response.Write("</Td>");
            HttpContext.Current.Response.Write("<Td>");
            HttpContext.Current.Response.Write(dt.Rows[i]["istatus"].ToString());
            HttpContext.Current.Response.Write("</Td>");
            //HttpContext.Current.Response.Write("<Td>");
            //HttpContext.Current.Response.Write(dt.Rows[i]["iparam5"].ToString());
            //HttpContext.Current.Response.Write("</Td>");
            //HttpContext.Current.Response.Write("<Td>");
            //HttpContext.Current.Response.Write(dt.Rows[i]["iparam3"].ToString());
            //HttpContext.Current.Response.Write("</Td>");
            //HttpContext.Current.Response.Write("<Td>");
            //HttpContext.Current.Response.Write(dt.Rows[i]["vparam6"].ToString());
            //HttpContext.Current.Response.Write("</Td>");
            //string[] str = dt.Rows[i]["vparam4"].ToString().Split('|');
            //string snew = "0";
            //string shot = "0";
            //string ssale = "0";
            //if (str.Length == 3)
            //{
            //    snew = str[0];
            //    shot = str[1];
            //    ssale = str[2];
            //    if (shot == "2")
            //        shot = "1";
            //    if (ssale == "3")
            //        ssale = "1";
            //}
            //HttpContext.Current.Response.Write("<Td>");
            //HttpContext.Current.Response.Write(snew);
            //HttpContext.Current.Response.Write("</Td>");
            //HttpContext.Current.Response.Write("<Td>");
            //HttpContext.Current.Response.Write(shot);
            //HttpContext.Current.Response.Write("</Td>");
            //HttpContext.Current.Response.Write("<Td>");
            //HttpContext.Current.Response.Write(ssale);
            //HttpContext.Current.Response.Write("</Td>");
            HttpContext.Current.Response.Write("</TR>");
        }

        HttpContext.Current.Response.Write("</Table>");
        HttpContext.Current.Response.Write("</font>");
        HttpContext.Current.Response.Flush();
        HttpContext.Current.Response.End();
    }
   
    protected void lnkexport_Click1(object sender, EventArgs e)
    {
        export();
    }
    protected void lnkimport_Click(object sender, EventArgs e)
    {
        string sfile = "";
        if (this.flexcel.FileName.Trim().Length > 0)
        {
            string tempname = System.IO.Path.GetFileName(flexcel.PostedFile.FileName);
            string fileextention = "";
            fileextention = System.IO.Path.GetExtension(tempname).ToLower();

            if (fileextention.Equals(".xls") || fileextention.Equals(".xlsx"))
            {
                if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/files/" + tempname) == false)
                    sfile = tempname;
                else
                    sfile = DateTime.Now.Second + "-" + tempname;

                flexcel.SaveAs(Server.MapPath("~/") + "/uploads/files/" + sfile);
            }
            else
            {
                ltdetailmsg1.Visible = true;
                ltdetailmsg1.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ định dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.xls,*.xlsx</p>";
                return;
            }
        }
        try
        {
            DataTable dtExcel = new DataTable();
            string SourceConstr = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + Server.MapPath("~/") + "/uploads/files/" + sfile + "';Extended Properties= 'Excel 8.0;HDR=Yes;IMEX=1'";
            OleDbConnection con = new OleDbConnection(SourceConstr);
            con.Open();
            DataTable dtExcelSheetName = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            string getExcelSheetName = dtExcelSheetName.Rows[0]["Table_Name"].ToString();
            string query = "Select * from [" + getExcelSheetName + "]";
            OleDbDataAdapter data = new OleDbDataAdapter(query, con);
            data.Fill(dtExcel);
            string id = "-1";
            for (int i = 0; i <= dtExcel.Rows.Count - 1; i++)
            {
                if (WEB.Common.Check_number(dtExcel.Rows[i][0].ToString()))
                    id = dtExcel.Rows[i][0].ToString();
                if (WEB.Common.Check_number(dtExcel.Rows[i][3].ToString()) == true && WEB.Common.Check_number(dtExcel.Rows[i][4].ToString()) && WEB.Common.Check_number(dtExcel.Rows[i][5].ToString()) == true && dtExcel.Rows[i][2].ToString().Length > 0)
                    save(id,dtExcel.Rows[i][1].ToString(), dtExcel.Rows[i][2].ToString(), "default.png", dtExcel.Rows[i][3].ToString(), dtExcel.Rows[i][4].ToString(),"", "", "","", dtExcel.Rows[i][5].ToString(),"1","0","", "", "", "");
            }
            con.Close();
        }
        catch (Exception ex)
        {
            ltdetailmsg1.Visible = true;
            ltdetailmsg1.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật, xin mời chọn đúng định dạng file excel <a target=\"_blank\" href='/uploads/files/temp/temp.xls'>tại đây</a>"+ "</p>";
            return;
        }
        ltdetailmsg1.Text = "<p style='color: #06f;margin: 0;padding: 12px 15px 0px 0px;font-size: 12px;'>Cập nhật thành công</p>";
        ltdetailmsg1.Visible = true;
        UpdateList();
    }
    protected void save(string iid, string masp, string tensp, string hinhanh, string giamoi, string giacu, string nhasx, string thuonghieu, string mota, string chitiet, string trangthai, string tinhtrang, string trongluong, string baohanh, string spm, string spbc, string spkm)
    {
        if (spbc == "1")
            spbc = "2";
        if (spkm == "1")
            spkm = "3";
        //if (nhasx.Length > 0)
        //    nhasx = geticidbyname(nhasx);
        //if (thuonghieu.Length > 0)
        //    thuonghieu = geticidbyname(thuonghieu);
        if (masp == "")
            masp = WEB.Cart.Carts.PrdCode;
        if (iid == "-1")
        {
            string alias = "";
            if (vlan != "ENG" && vlan != "VIE")
                alias = WEB.Common.getalias("product");
            else
                alias = WEB.Common.getalias(tensp);
            string keyword = tensp + ", " + WEB.Common.GetNosign(tensp);
            string metadicription = tensp + ", " + WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan);
            WEB.Items.db_items_insert(ddlcateimport.SelectedValue, WEB.Common.mod_product, vlan, convertToAlias(alias), masp, tensp, WEB.Common.GetNosign(tensp), mota, chitiet, hinhanh, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), giamoi, giacu, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", trangthai, tensp, keyword, metadicription, spm + "|" + spbc + "|" + spkm, "", baohanh, "", "", "", "", nhasx, "", "", "", "", "0", "0", trongluong, "0", tinhtrang, "1", "1", thuonghieu, "0", "0", "0", "0", "0");
            string prc = WEB.Config.getvaluebykey("prdcode", WEB.Common.LangAdmin);
            if (WEB.Common.Check_number(prc))
            {
                WEB.Config.updatekey("prdcode", WEB.Common.LangAdmin, (Convert.ToInt32(prc) + 1).ToString());
            }
            else
                WEB.Config.updatekey("prdcode", WEB.Common.LangAdmin, "2");
        }
        else
        {
            string[] sf = { "vkey", "valias", "vtitle", "vtitle_no", "fnewprice", "foldprice",  "istatus", "dupdate"};
            object[] ov = { masp, getalias(iid,tensp), tensp, WEB.Common.GetNosign(tensp), giamoi, giacu, trangthai, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss") };
            WEB.Items.save(Convert.ToInt32(iid), sf, ov);
        }
    }
    protected string getalias(string id, string tensp)
    {
        string str = "";
        DataTable dt = WEB.Items.getitembyfield("iid", id);
        if (dt.Rows.Count > 0)
        {
            if (tensp == dt.Rows[0]["vtitle"].ToString())
                str = dt.Rows[0]["valias"].ToString();
            else
            {
                if (vlan != "ENG" && vlan != "VIE")
                {
                }
                else
                    str = WEB.Common.getalias(tensp);
            }
        }
        else
            str = "";
        return str;
    }
    protected int checkmasp(string msp)
    {
        if (msp.Length == 0)
            return -1;
        DataTable dt = WEB.Items.getitembyfield("vkey", msp);
        if (dt.Rows.Count > 0)
            return Convert.ToInt32(dt.Rows[0]["iid"]);
        else
            return -1;
    }
    public static string convertToAlias(string s)
    {
        Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
        string temp = s.Normalize(NormalizationForm.FormD);
        return regex.Replace(temp, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
    }
    public static string convertToImages(string s)
    {
        string temp = "";
        string tempspace = "";
        string replace_s = string.Join(" ", s.Split(new char[] { ' ' },
        StringSplitOptions.RemoveEmptyEntries));
        Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
        temp = replace_s.Normalize(NormalizationForm.FormD);
        tempspace = regex.Replace(temp, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
        return Regex.Replace(tempspace, " ", "-"); ;
    }
}
