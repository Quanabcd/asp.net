using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using System.Text;

public partial class admin_products_item_edit : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int iorder = 0;
    public int iordertype = 0;
    public int id = -1;
    public int curpage = 1;
    public string key = "";
    public int icid = -1;
    public int icurcid = -1;
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
    public string color = "";
    public string size = "";
    public string material = "";
    public string colorlist = "";
    public string sizelist = "";
    public string materiallist = "";
    public DataTable dtgroupite = new DataTable();
    public string pbsp = " style='display:none' ";
    protected void Page_Load(object sender, EventArgs e)
    {
        role = Session["role"].ToString();
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("id")))
        {
            id = Convert.ToInt32(WEB.Common.GeturlParam("id"));
        }
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("cid")))
        {
            icurcid = Convert.ToInt32(WEB.Common.GeturlParam("cid"));
        }
        
        if (checkrole("2005"))
            {
                pbsp = "";
            }
            CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
            _FileBrowser.BasePath = "../ckfinder";

            _FileBrowser.SetupCKEditor(txtcontent);

            CKFinder.FileBrowser _FileBrowser1 = new CKFinder.FileBrowser();
            _FileBrowser1.BasePath = "../ckfinder";
            _FileBrowser1.SetupCKEditor(txtdesc);
            numitems = WEB.Products.getnumitem();
            //lttitle.Text = numitems.ToString();

            lttitle.Text = "Chỉnh sửa sản phẩm";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            ltdetailmsg.Visible = false;
            DataTable dt = new DataTable();
            dt = WEB.Category.getcate("-1", WEB.Common.mod_product, vlan, "1", "-1");

            ddlcate.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string space = "";
                for (int j = 1; j < Convert.ToInt32(dt.Rows[i]["ilevel"].ToString()); j++)
                {
                    space += "..";
                }
                if (dt.Rows[i]["vparam6"].ToString().Contains(',' + Session["userid"].ToString() + ",") || dt.Rows[i]["vparam6"].ToString().Contains(",-1,"))
                {
                    this.ddlcate.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                }
                space = "";
                //ltcatesrelative.Text += "<li class='space" + dt.Rows[i]["ilevel"].ToString() + "'><a class='prd-cate-lnk' title='" + dt.Rows[i]["vname"].ToString() + "' href='javascript:0' data='" + dt.Rows[i]["icid"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a></li>";
            }
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlcate, icurcid.ToString());
            if (id != -1)
            {

                ltcopy.Text = "<a href='#ex1' class='nhanban' title='Nhân bản sản phẩm'><span class='icon-ok-update'></span>Nhân bản sản phẩm</a>";
                loaddetail(id.ToString());

            }
            else
            {
                lttitle.Text = "Thêm mới sản phẩm";
                lnkupdate.Visible = true;
                lnkclose.Visible = true;
                ltcopy.Text = "";
                clear();
                Random rd = new Random();
                iidtemp = rd.Next(10000, 99999);
                hditemp.Value = iidtemp.ToString();
                txtproductkey.Text = WEB.Cart.Carts.PrdCode;
                loadvendor();
                loadgroup();
                lttt.Text = loadfe("-1", "FT", "", ddlcate.SelectedValue);
                //ltdatetime.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
                this.hd_insertupdate.Value = "insert";
                itemtitle = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, vlan);
                itemdescription = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan);
                itemurl = weburl;

            }
            dt = WEB.CategoryOther.getcate("-1", "FT", vlan, "1", "1");
            if (dt.Rows.Count > 0)
                pntt.Visible = true;
            else
                pntt.Visible = false;
       
    }
    public bool checkrole(string s)
    {
        if (role.Contains("|" + s + "|"))
            return true;
        else
            return false;
    }
    protected void loadvendor()
    {
        DataTable dt = WEB.Category.getcate("-1", WEB.Common.mod_product_vendor, vlan, "1", "-1");
        ddlvendor.Items.Clear();
        this.ddlvendor.Items.Add(new ListItem("Chọn nhà sản xuất", "-1"));
        if (dt.Rows.Count > 0)
        {
            pnvender.Visible = true;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                this.ddlvendor.Items.Add(new ListItem(dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
            }
        }
        else
            pnvender.Visible = false;
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
        string unit = "";
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
    protected string genfeature(int type, int icid, string title, DataTable dtvalues, string svalue, string unit, string sdefault)
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
   
    protected void loadgroup()
    {
        DataTable dt = WEB.Category.getcate("-1", WEB.Common.mod_product_group, vlan, "1", "1");
        if (dt.Rows.Count > 0)
        {
            pngr.Visible = true;
            rpgroup.DataSource = dt;
            rpgroup.DataBind();
        }
        else
            pngr.Visible = false;
       
    }
    protected string checkgroup(string cid)
    {
        if (dtgroupite.Rows.Count > 0)
        {
            for (int i = 0; i < dtgroupite.Rows.Count; i++)
            {
                if (dtgroupite.Rows[i]["icid"].ToString() == cid)
                    return "checked ='checked'";
            }
        }
        return "";
    }
    protected string loadfe(string cid, string capp, string listcur, string icate)
    {
        string strresult = "";
        DataTable dt = new DataTable();
        WEB.CategoryOther.getcategorylevel1(ref dt, cid, capp, "vparam1 like'%|" + icate + "|%'", vlan, "1");
        if (dt.Rows.Count > 0)
        {
           
                pntt.Visible = true;
           
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
    public void loaddetail(string p)
    {
        if (checkrole("2022"))
        {
            ltdetailmsg.Text = "";
            lnkupdate.Visible = true;
            lnkclose.Visible = true;
            lttitle.Text = "Cập nhật sản phẩm";
            chkupdatedate.Visible = true;
            this.hd_insertupdate.Value = "update";
            this.hdiid.Value = p.Trim();
            clear();
            loadvendor();
            DataTable dt = new DataTable();
            dt = WEB.Items.getitembyid(p);
            if (dt.Rows.Count > 0)
            {
                WEB.Common.SetSelectedIndexInDropDownList(ref ddlcate, dt.Rows[0]["icid"].ToString());
                txtproductkey.Text = dt.Rows[0]["vkey"].ToString();
                hdname.Value = txtproductname.Text = dt.Rows[0]["vtitle"].ToString();
                iidtemp = Convert.ToInt32(dt.Rows[0]["iid"]);
                txtnamecopy.Text = "Nhân bản của " + dt.Rows[0]["vtitle"].ToString();
                txtdesc.Text = dt.Rows[0]["vdesc"].ToString();
                txtcontent.Text = dt.Rows[0]["vcontent"].ToString();
                hdimg_old.Value = dt.Rows[0]["vimg"].ToString();
                ltimage.Text = "<img src='" + weburl + "uploads/products/" + dt.Rows[0]["vimg"].ToString() + "' style='max-width:500px;height:80px' >";
                txtpricenew.Text = dt.Rows[0]["fnewprice"].ToString();
                txtpriceold.Text = dt.Rows[0]["foldprice"].ToString();
                ltimagedefault.Text = "";
                hdtitle.Value = dt.Rows[0]["vtitle"].ToString().Trim();
                txturl.Text = hdalias.Value = dt.Rows[0]["valias"].ToString().Trim();
                hdcreatedate.Value = Convert.ToDateTime(dt.Rows[0]["dcreatedate"].ToString()).ToString("MM/dd/yyyy hh:mm:ss tt");
                hdupdatedate.Value = Convert.ToDateTime(dt.Rows[0]["dupdate"].ToString()).ToString("MM/dd/yyyy hh:mm:ss tt");
                hdiviews.Value = dt.Rows[0]["iviews"].ToString();
                if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                    chkstatus.Checked = false;
                else
                    chkstatus.Checked = true;
                itemtitle = txttitleweb.Text = dt.Rows[0]["vparam1"].ToString();
                txtkeyword.Text = dt.Rows[0]["vparam2"].ToString();
                itemdescription = txtmetadesc.Text = dt.Rows[0]["vparam3"].ToString();
                itemurl = weburl + dt.Rows[0]["valias"].ToString();
                if (dt.Rows[0]["vparam4"].ToString().Contains("1"))
                    chknew.Checked = true;
                else
                    chknew.Checked = false;
                if (dt.Rows[0]["vparam4"].ToString().Contains("2"))
                    chkhot.Checked = true;
                else
                    chkhot.Checked = false;
                if (dt.Rows[0]["vparam4"].ToString().Contains("3"))
                    chksale.Checked = true;
                else
                    chksale.Checked = false;
                if (dt.Rows[0]["vparam4"].ToString().Contains("4"))
                    chkhotdeal.Checked = true;
                else
                    chkhotdeal.Checked = false;
                string[] ss = dt.Rows[0]["vparam11"].ToString().Split('|');
                if (ss.Length == 3)
                {
                    color = ss[0].Split(':')[0];
                    colorlist = ss[0].Split(':')[1];
                    string[] cl = colorlist.Split(',');
                    if (cl.Length > 0)
                    {
                        for (int i = 0; i < cl.Length; i++)
                        {
                            if (cl[i].Length > 0)
                                ltcolor.Text += "<span class='tag label label-info'>" + cl[i] + "<span data-role='remove' class='gtremove'></span></span>";
                        }
                    }


                    size = ss[1].Split(':')[0];
                    sizelist = ss[1].Split(':')[1];
                    string[] sz = sizelist.Split(',');
                    if (sz.Length > 0)
                    {
                        for (int i = 0; i < sz.Length; i++)
                        {
                            if (sz[i].Length > 0)
                                ltsize.Text += "<span class='tag label label-info'>" + sz[i] + "<span data-role='remove' class='gtremove'></span></span>";
                        }
                    }

                    material = ss[2].Split(':')[0];
                    materiallist = ss[2].Split(':')[1];
                    string[] mt = materiallist.Split(',');
                    if (mt.Length > 0)
                    {
                        for (int i = 0; i < mt.Length; i++)
                        {
                            if (mt[i].Length > 0)
                                ltmaterial.Text += "<span class='tag label label-info'>" + mt[i] + "<span data-role='remove' class='gtremove'></span></span>";
                        }
                    }
                }

                WEB.Common.SetSelectedIndexInDropDownList(ref ddsprice, dt.Rows[0]["iparam9"].ToString());
                WEB.Common.SetSelectedIndexInDropDownList(ref ddspayload, dt.Rows[0]["iparam10"].ToString());
                WEB.Common.SetSelectedIndexInDropDownList(ref ddsgear, dt.Rows[0]["fparam1"].ToString());


                txtunit.Text = dt.Rows[0]["vparam5"].ToString();
                txtbh.Text = dt.Rows[0]["vparam6"].ToString();
                txtxuatxu.Text = dt.Rows[0]["vparam7"].ToString();
                hdfeature.Value = dt.Rows[0]["vparam8"].ToString();
                hdgroup.Value = dt.Rows[0]["vparam9"].ToString();
                txtnumber.Text = dt.Rows[0]["iparam1"].ToString();
                txtorder.Text = dt.Rows[0]["iparam2"].ToString().Trim();
                txtweight.Text = dt.Rows[0]["iparam3"].ToString();
                txtnumprdsale.Text = dt.Rows[0]["iparam4"].ToString();
                txthotdealdate.Text = Convert.ToDateTime(dt.Rows[0]["dendate"].ToString()).ToString("dd/MM/yyyy");
                WEB.Common.SetSelectedIndexInDropDownList(ref ddlhour, Convert.ToDateTime(dt.Rows[0]["dendate"].ToString()).Hour.ToString());
                WEB.Common.SetSelectedIndexInDropDownList(ref ddlminute, Convert.ToDateTime(dt.Rows[0]["dendate"].ToString()).Minute.ToString());
                WEB.Common.SetSelectedIndexInDropDownList(ref ddltt, dt.Rows[0]["iparam5"].ToString());
                if (dt.Rows[0]["iparam6"].ToString().Contains("1"))
                    chkacceptbuy.Checked = true;
                else
                    chkacceptbuy.Checked = false;
                if (dt.Rows[0]["iparam7"].ToString().Contains("1"))
                    chkdisplaytt.Checked = true;
                else
                    chkdisplaytt.Checked = false;
                WEB.Common.SetSelectedIndexInDropDownList(ref ddlvendor, dt.Rows[0]["iparam8"].ToString());
                //  loadfeature(hdfeature.Value);
                loadtab(hdiid.Value);
                loadpb(hdiid.Value);
                DataTable dtimg = WEB.Item_other.getlisitem("PRD", WEB.Common.LangAdmin, "iid=" + hdiid.Value, "");
                rpsubimg.DataSource = dtimg;
                rpsubimg.DataBind();
                lttt.Text = loadfe("-1", "FT", dt.Rows[0]["vparam8"].ToString(), ddlcate.SelectedValue);
                dtgroupite = WEB.Group.getgroupitembyfield("iid", p);
                loadgroup();
            }
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
        ddlhour.Items.Clear();
        txthotdealdate.Text = DateTime.Now.AddDays(7).ToString("dd/MM/yyyy");
        for (int i = 0; i < 24; i++)
        {
            ddlhour.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }
        ddlminute.Items.Clear();
        for (int i = 0; i < 60; i++)
        {
            ddlminute.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }
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
    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        if (txtproductkey.Text.Length == 0)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập mã sản phẩm</p>";
            ltdetailmsg.Visible = true;
            txtproductkey.Focus();
            return;
        }
        if (txtproductkey.Text.Length > 20)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Mã sản phẩm tối đa 20 ký tự</p>";
            ltdetailmsg.Visible = true;
            txtproductkey.Focus();
            return;
        }
        if (txtproductname.Text.Length == 0)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tên sản phẩm</p>";
            ltdetailmsg.Visible = true;
            txtproductname.Focus();
            return;
        }
        if (txtproductname.Text.Length > 200)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Tên sản phẩm tối đa 200 ký tự</p>";
            ltdetailmsg.Visible = true;
            txtproductname.Focus();
            return;
        }
        if (txtdesc.Text.Length > 4000)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Mô tả tối đa 4000 ký tự</p>";
            ltdetailmsg.Visible = true;
            txtdesc.Focus();
            return;
        }
        if (ltimage.Text == "")
        {
            if (flupload.FileName.Trim().Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời chọn hình ảnh sản phẩm</p>";
                ltdetailmsg.Visible = true;
                flupload.Focus();
                return;
            }
        }
        if (WEB.Common.Check_float(txtpricenew.Text) == false)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Giá mới là số</p>";
            ltdetailmsg.Visible = true;
            txtpricenew.Focus();
            return;
        }
        if (WEB.Common.Check_float(txtpriceold.Text) == false)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Giá so sánh phải là số</p>";
            ltdetailmsg.Visible = true;
            txtpriceold.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtnumber.Text) == false)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Số lượng phải là số</p>";
            ltdetailmsg.Visible = true;
            txtnumber.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtorder.Text) == false)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Thứ tự phải là số</p>";
            ltdetailmsg.Visible = true;
            txtorder.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtweight.Text) == false)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Trọng lượng phải là số</p>";
            ltdetailmsg.Visible = true;
            txtweight.Focus();
            return;
        }
       
        string ltt = "|" + WEB.Common.GetFormValue("chk").ToString().Replace(",", "|") + "|";
        string image = "";
        if (this.flupload.FileName.Trim().Length > 0)
        {
            string tempname = convertToImages(System.IO.Path.GetFileName(flupload.PostedFile.FileName));
            string fileextention = "";
            fileextention = System.IO.Path.GetExtension(tempname).ToLower();
            tempname = WEB.Common.GetNewTitle(tempname.Replace(fileextention, "")) + fileextention;
            if (fileextention.Equals(".jpg") || fileextention.Equals(".jpeg") || fileextention.Equals(".gif") || fileextention.Equals(".png"))
            {
                if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/products/" + tempname) == false)
                    image = tempname;
                else
                    image = DateTime.Now.Second + "-" + tempname;
                System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(flupload.PostedFile.InputStream);
                int thumbwidth = 0;
                int thumbheight = 0;
                if (WEB.Config.getvaluebykey(WEB.Config.k_imgprdthumbwidth, vlan).Length > 0)
                    thumbwidth = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgprdthumbwidth, vlan));
                if (WEB.Config.getvaluebykey(WEB.Config.k_imgprdthumbheight, vlan).Length > 0)
                    thumbheight = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgprdthumbheight, vlan));

                System.Drawing.Image objImage = WEB.Common.ScaleImage(bmpPostedImage, fileextention, thumbwidth, thumbheight);
                if (fileextention == ".png")
                    objImage.Save(Server.MapPath("~/") + "/uploads/products/thumbs/" + image, System.Drawing.Imaging.ImageFormat.Png);
                if (fileextention == ".jpg" || fileextention == ".jpeg")
                    objImage.Save(Server.MapPath("~/") + "/uploads/products/thumbs/" + image, System.Drawing.Imaging.ImageFormat.Jpeg);
                if (fileextention == ".gif")
                    objImage.Save(Server.MapPath("~/") + "/uploads/products/thumbs/" + image, System.Drawing.Imaging.ImageFormat.Gif);

                //flupload.SaveAs(Server.MapPath("~/") + "/uploads/products/" + image);


                int width = 0;
                int height = 0;
                if (WEB.Config.getvaluebykey(WEB.Config.k_imgprdwidth, vlan).Length > 0)
                    width = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgprdwidth, vlan));
                if (WEB.Config.getvaluebykey(WEB.Config.k_imgprdheight, vlan).Length > 0)
                    height = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgprdheight, vlan));
                System.Drawing.Image oImage = WEB.Common.ScaleImage(bmpPostedImage, fileextention, width, height);
                if (fileextention == ".png")
                    oImage.Save(Server.MapPath("~/") + "/uploads/products/" + image, System.Drawing.Imaging.ImageFormat.Png);
                if (fileextention == ".jpg" || fileextention == ".jpeg")
                    oImage.Save(Server.MapPath("~/") + "/uploads/products/" + image, System.Drawing.Imaging.ImageFormat.Jpeg);
                if (fileextention == ".gif")
                    oImage.Save(Server.MapPath("~/") + "/uploads/products/" + image, System.Drawing.Imaging.ImageFormat.Gif);
            }
            else
            {
                ltdetailmsg.Visible = true;
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.bmp,*.png</p>";
                return;
            }
        }
        string brochure = "";
        //if (this.flbrochure.FileName.Trim().Length > 0)
        //{
        //    string tempname = System.IO.Path.GetFileName(flbrochure.PostedFile.FileName);
        //    string fileextention = "";
        //    fileextention = System.IO.Path.GetExtension(tempname).ToLower();
        //    if (fileextention.Equals(".doc") || fileextention.Equals(".docx") || fileextention.Equals(".pdf") || fileextention.Equals(".rar") || fileextention.Equals(".xls") || fileextention.Equals(".xlsx")|| fileextention.Equals(".jpg")|| fileextention.Equals(".jpeg"))
        //    {
        //        if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/files/" + tempname) == false)
        //            brochure = tempname;
        //        else
        //            brochure = DateTime.Now.Second + "-" + tempname;
        //        flbrochure.SaveAs(Server.MapPath("~/") + "/uploads/files/" + brochure);
        //    }
        //    else
        //    {
        //        ltdetailmsg.Visible = true;
        //        ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ file dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.doc,*.docx,*.pdf,*.rar,*.xls,*.xlsx,*.jpg,*.jpeg</p>";
        //        return;
        //    }
        //}
        string istatus = "0";
        if (chkstatus.Checked == true)
            istatus = "1";
        string newhotsale = "";
        if (chknew.Checked == true)
            newhotsale += "1|";
        if (chkhot.Checked == true)
            newhotsale += "2|";
        if (chksale.Checked == true)
            newhotsale += "3|";
        DateTime denddate = DateTime.Now;
        if (chkhotdeal.Checked == true)
        {
            newhotsale += "4|";
        }
        if (txthotdealdate.Text.Length == 0)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Ngày kết thúc hotldeal không hợp lệ. Ngày phải có định dạng ngày/tháng/năm . VD: 20/11/2018</p>";
            ltdetailmsg.Visible = true;
            txthotdealdate.Focus();
            return;
        }
        else
        {
            try
            {
                string[] s = txthotdealdate.Text.Trim().Split('/');
                denddate = new DateTime(Convert.ToInt32(s[2]), Convert.ToInt32(s[1]), Convert.ToInt32(s[0]), Convert.ToInt32(ddlhour.SelectedValue), Convert.ToInt32(ddlminute.SelectedValue), 0);
                if (denddate < DateTime.Now && chkhotdeal.Checked==true)
                {
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Thời gian kết thúc hotldeal phải lớn hơn thời gian hiện tại</p>";
                    ltdetailmsg.Visible = true;
                    txthotdealdate.Focus();
                    return;
                }
            }
            catch
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Ngày kết thúc hotldeal không hợp lệ. Ngày phải có định dạng ngày/tháng/năm . VD: 20/11/2018</p>";
                ltdetailmsg.Visible = true;
                txthotdealdate.Focus();
                return;
            }
        }
        
            
        if (txtkeyword.Text.Trim().Length < 1)
        {
            txtkeyword.Text = txtproductname.Text + ", " + WEB.Common.GetNosign(txtproductname.Text);
        }
        if (txttitleweb.Text.Trim().Length < 1)
        {
            txttitleweb.Text = txtproductname.Text;
        }
        if (txtmetadesc.Text.Trim().Length < 1)
        {
            txtmetadesc.Text = txtproductname.Text + ", " + WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan);
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
      
        string acceptorder = "1";
        if (chkacceptbuy.Checked == false)
            acceptorder = "0";
        string displaytt = "0";
        if (chkdisplaytt.Checked == true)
            displaytt = "1";
        DataTable dtf = WEB.Features.Items.getlisitem(vlan, "vprdcidlist like '%|" + ddlcate.SelectedValue + "|%'", "iorder asc");

        int num = Convert.ToInt32(Request.Form["hdnum"]);
        int numpb = Convert.ToInt32(Request.Form["hdnumprd"]);
        if (hd_insertupdate.Value.Equals("insert"))
        {
            if (txturl.Text.Length == 0)
            {
                if (vlan != "ENG" && vlan != "VIE")
                    txturl.Text = WEB.Common.getalias("product");
                else
                    txturl.Text = WEB.Common.getalias(txtproductname.Text);
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
                    txturl.Text = WEB.Common.getalias("product");
                else
                    txturl.Text = WEB.Common.getalias(txtproductname.Text);
            }
            else
            {
                if (txturl.Text != hdalias.Value)
                {
                    txturl.Text = WEB.Common.getalias1(txturl.Text);
                }
                else
                {
                    if (txtproductname.Text != hdname.Value)
                    {
                        if (vlan != "ENG" && vlan != "VIE")
                        {
                        }
                        else
                            txturl.Text = WEB.Common.getalias(txtproductname.Text);
                    }
                }
            }
        }
        color = WEB.Common.GetFormValue("txtcolor").ToString();
        size = WEB.Common.GetFormValue("txtsize").ToString();
        material = WEB.Common.GetFormValue("txtmaterial").ToString();
        colorlist = WEB.Common.GetFormValue("txtcolortemp").ToString();
        sizelist = WEB.Common.GetFormValue("txtsizetemp").ToString();
        materiallist = WEB.Common.GetFormValue("txtmaterialtemp").ToString();
        string strpb = color + ":" + colorlist + "|" + size + ":" + sizelist + "|" + material + ":" + materiallist;


        if (id==-1)
        {

            try
            {
                WEB.Items.db_items_insert(ddlcate.SelectedValue, WEB.Common.mod_product, vlan, convertToAlias(txturl.Text), txtproductkey.Text, txtproductname.Text, WEB.Common.GetNosign(txtproductname.Text), txtdesc.Text, txtcontent.Text, image, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), txtpricenew.Text, txtpriceold.Text, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"),denddate.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", istatus, txttitleweb.Text, txtkeyword.Text, txtmetadesc.Text, newhotsale, txtunit.Text, txtbh.Text, txtxuatxu.Text, ltt, "", "", strpb, "", "", "", "", txtnumber.Text, txtorder.Text, txtweight.Text, txtnumprdsale.Text, ddltt.SelectedValue, acceptorder, displaytt, ddlvendor.SelectedValue, ddsprice.SelectedValue, ddspayload.SelectedValue, ddsgear.SelectedValue, "0", "0");
                int iprd = WEB.Dataprovider.getmax("db_items", "iid", "");
                string[] lgroup = WEB.Common.GetFormValue("chkgr").ToString().Split(',');
                //update product key auto
                string prc = WEB.Config.getvaluebykey("prdcode", WEB.Common.LangAdmin);
                if (WEB.Common.Check_number(prc))
                {
                    WEB.Config.updatekey("prdcode", WEB.Common.LangAdmin, (Convert.ToInt32(prc) + 1).ToString());
                }
                else
                    WEB.Config.updatekey("prdcode", WEB.Common.LangAdmin, "2");
                for (int i = 0; i < lgroup.Length; i++)
                {
                    if (WEB.Common.Check_number(lgroup[i]))
                        WEB.Group.db_group_items_insert(lgroup[i], iprd.ToString(), "1", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "1", "0", "0", "0");
                }
                string[] lrl = WEB.Common.GetFormValue("hdlistimgrel").ToString().Split('|');
                if (lrl.Length > 0)
                {
                    for (int i = 0; i < lrl.Length; i++)
                    {
                        if (lrl[i].Length > 0)
                        {
                            WEB.Item_other.db_items_other_insert(iprd.ToString(), "PRD", vlan, lrl[i], WEB.Common.GetFormValue("txtaltadd" + i.ToString()).ToString().Replace(",", ""), "", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "0", "0", "1", "", "", "", "", "", "0", "0");
                        }
                    }
                }
                lttitle.Text = "Quản lý sản phẩm - Thêm sản phẩm thành công";
                //ghi log
                hdiid.Value = WEB.Dataprovider.getmax("db_items", "iid", "vcode ='" + WEB.Common.mod_product + "'").ToString();
                WEB.Logs.writelog("Thêm sản phẩm : " + txtproductname.Text);
                for (int i = 1; i <= num; i++)
                {
                    try
                    {
                        if (Request.Form["txttabname-" + i.ToString()].Length > 0)
                        {
                            string[] sb = { "iid", "vcode", "vlan", "vtitle", "vcontent", "istatus" };
                            object[] ob = { iprd, "TAB", WEB.Common.LangAdmin, Request.Form["txttabname-" + i.ToString()], Request.Form["txtcontentcn-" + i.ToString()], "1" };
                            WEB.Item_other.save(-1, sb, ob);
                        }
                    }
                    catch
                    {
                    }
                }

                //them phien ban khac
                //for (int i = 2; i <= numpb; i++)
                //{
                //    try
                //    {
                //        if (WEB.Common.GetFormValue("prdname-" + i.ToString()).ToString().Length > 0)
                //        {
                //            string[] sb = { "iid", "vcode", "vlan", "vtitle", "vdesc", "vcontent", "vparam1", "istatus" };
                //            object[] ob = { iprd, "PHB", vlan, WEB.Common.GetFormValue("prdname-" + i.ToString()).ToString(), "", WEB.Common.GetFormValue("prdprice-" + i.ToString()).ToString(), "", "1" };
                //            WEB.Item_other.save(-1, sb, ob);
                //        }
                //    }
                //    catch
                //    {
                //    }
                //}
                Response.Redirect(weburl + "admin/?mod=prod&c=items&cid=" + ddlcate.SelectedValue);
              //  UpdateList();
            }
            catch
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi thêm dữ liệu</p>";
                ltdetailmsg.Visible = true;
            }
        }
        else if (id != -1)
        {

            try
            {
                //xóa ảnh cũ
                if (image == "")
                    image = hdimg_old.Value;
                else
                {
                    try
                    {
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/products/" + hdimg_old.Value);
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/products/thumbs/" + hdimg_old.Value);
                    }
                    catch
                    {
                    }
                }
                WEB.Items.db_items_update(hdiid.Value, ddlcate.SelectedValue, WEB.Common.mod_product, vlan, convertToAlias(txturl.Text), txtproductkey.Text, txtproductname.Text, WEB.Common.GetNosign(txtproductname.Text), txtdesc.Text, txtcontent.Text, image, txtpricenew.Text, txtpriceold.Text, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), denddate.ToString("MM/dd/yyyy hh:mm:ss tt"), istatus, txttitleweb.Text, txtkeyword.Text, txtmetadesc.Text, newhotsale, txtunit.Text, txtbh.Text, txtxuatxu.Text, ltt, "", Session["admin"].ToString(), strpb, "", "", "", "", txtnumber.Text, txtorder.Text, txtweight.Text, txtnumprdsale.Text, ddltt.SelectedValue, acceptorder, displaytt, ddlvendor.SelectedValue, ddsprice.SelectedValue, ddspayload.SelectedValue, ddsgear.SelectedValue, "0", "0");
                if (chkupdatedate.Checked == true)
                    WEB.Items.updatecreatedate(hdiid.Value);
                string[] lgroup = WEB.Common.GetFormValue("chkgr").ToString().Split(',');
                WEB.Group.db_group_items_delete_by_iid(hdiid.Value);
                for (int i = 0; i < lgroup.Length; i++)
                {
                    if (WEB.Common.Check_number(lgroup[i]))
                    {
                        WEB.Group.db_group_items_insert(lgroup[i], hdiid.Value, "1", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "1", "0", "0", "0");
                    }
                }
                //update ảnh liên quan
                DataTable dtimg = WEB.Item_other.getlisitem("PRD", WEB.Common.LangAdmin, "iid=" + hdiid.Value, "");
                if (dtimg.Rows.Count > 0)
                {
                    for (int i = 0; i < dtimg.Rows.Count; i++)
                    {
                        string[] sfi = { "vdesc" };
                        object[] vv = { WEB.Common.GetFormValue("txtalt" + dtimg.Rows[i]["ino"].ToString()).ToString() };
                        WEB.Item_other.save(Convert.ToInt32(dtimg.Rows[i]["ino"].ToString()), sfi, vv);
                    }
                }
                //insert ảnh liên quan
                string[] lrl = WEB.Common.GetFormValue("hdlistimgrel").ToString().Split('|');
                if (lrl.Length > 0)
                {
                    for (int i = 0; i < lrl.Length; i++)
                    {
                        if (lrl[i].Length > 0)
                        {
                            WEB.Item_other.db_items_other_insert(hdiid.Value, "PRD", vlan, lrl[i], WEB.Common.GetFormValue("txtaltadd" + i.ToString()).ToString().Replace(",", ""), "", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "0", "0", "1", "", "", "", "", "", "0", "0");
                        }
                    }
                }
                lttitle.Text = "Quản lý sản phẩm - Cập nhật sản phẩm thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật sản phẩm: " + txtproductname.Text);

                DataTable dttab = WEB.Item_other.getlisitem("TAB", WEB.Common.LangAdmin, "iid=" + hdiid.Value, "ino asc");
                for (int i = 0; i < dttab.Rows.Count; i++)
                {
                    bool have = false;
                    for (int j = 1; j <= num; j++)
                    {
                        if (dttab.Rows[i]["ino"].ToString() == Request.Form["rc-tab-" + j.ToString()])
                        {
                            have = true;
                            break;
                        }
                    }
                    if (have == false)
                    {
                        WEB.Item_other.db_items_other_deletebyino(dttab.Rows[i]["ino"].ToString());
                    }

                }
                for (int i = 1; i <= num; i++)
                {
                    try
                    {
                        if (Request.Form["txttabname-" + i.ToString()].Length > 0)
                        {
                            string[] sb = { "iid", "vcode", "vlan", "vtitle", "vcontent","istatus" };
                            object[] ob = { hdiid.Value, "TAB", WEB.Common.LangAdmin, Request.Form["txttabname-" + i.ToString()], Request.Form["txtcontentcn-" + i.ToString()] ,"1"};
                            WEB.Item_other.save(Convert.ToInt32(Request.Form["rc-tab-" + i.ToString()]), sb, ob);
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                }

                //xóa 
                //DataTable dtpb = WEB.Item_other.getlisitem("PHB", WEB.Common.LangAdmin, "iid=" + hdiid.Value, "ino asc");
                //for (int i = 0; i < dtpb.Rows.Count; i++)
                //{
                //    bool have = false;
                //    for (int j = 2; j <= numpb; j++)
                //    {
                //        if (dtpb.Rows[i]["ino"].ToString() == WEB.Common.GetFormValue("rc-isub-" + j.ToString()).ToString())
                //        {
                //            have = true;
                //            break;
                //        }
                //    }
                //    if (have == false)
                //    {
                //        WEB.Item_other.db_items_other_deletebyino(dtpb.Rows[i]["ino"].ToString());
                //    }

                //}
                //for (int i = 2; i <= numpb; i++)
                //{

                //    if (WEB.Common.GetFormValue("prdname-" + i.ToString()).ToString().Length > 0)
                //    {
                //        string[] sb = { "iid", "vcode", "vlan", "vtitle", "vdesc", "vcontent", "vparam1", "istatus" };
                //        object[] ob = { hdiid.Value, "PHB", vlan, WEB.Common.GetFormValue("prdname-" + i.ToString()).ToString(), "", WEB.Common.GetFormValue("prdprice-" + i.ToString()).ToString(), "", "1" };
                //        WEB.Item_other.save(Convert.ToInt32(WEB.Common.GetFormValue("rc-isub-" + i.ToString()).ToString()), sb, ob);
                //    }

                //}
                if (Session["url"]!=null && Session["url"].ToString() != "")
                Response.Redirect(weburl + Session["url"]);
                //UpdateList();
            }
            catch
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật dữ liệu</p>";
                ltdetailmsg.Visible = true;
            }

        }


        Response.Redirect(weburl + "admin/?mod=prod&c=items");
        //update tab to item
       // UpdateList();
    }


    protected void lnkclose_Click(object sender, EventArgs e)
    {
        if (Session["url"] != null && Session["url"].ToString() != "")
            Response.Redirect(weburl + Session["url"]);
        else

            Response.Redirect(weburl + "admin/?mod=prod&c=items");
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

    protected void btnnhanban_Click(object sender, EventArgs e)
    {
        
            DataTable dtd = WEB.Items.getitembyid(id.ToString());
            if (dtd.Rows.Count > 0)
            {
                string url = "";
               
                    if (vlan != "ENG" && vlan != "VIE")
                        url = WEB.Common.getalias("product");
                    else
                        url = WEB.Common.getalias(txtnamecopy.Text.Trim());
               
             
                WEB.Items.db_items_insert(dtd.Rows[0]["icid"].ToString(), WEB.Common.mod_product, vlan, url, dtd.Rows[0]["vkey"].ToString(), txtnamecopy.Text.Trim(), WEB.Common.GetNosign(txtnamecopy.Text.Trim()), dtd.Rows[0]["vdesc"].ToString(), dtd.Rows[0]["vcontent"].ToString(), "default.png", Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), dtd.Rows[0]["fnewprice"].ToString(), dtd.Rows[0]["foldprice"].ToString(), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", dtd.Rows[0]["istatus"].ToString(), dtd.Rows[0]["vparam1"].ToString(), dtd.Rows[0]["vparam2"].ToString(), dtd.Rows[0]["vparam3"].ToString(), dtd.Rows[0]["vparam4"].ToString(), dtd.Rows[0]["vparam5"].ToString(), dtd.Rows[0]["vparam6"].ToString(), dtd.Rows[0]["vparam7"].ToString(), dtd.Rows[0]["vparam8"].ToString(), dtd.Rows[0]["vparam9"].ToString(), "", dtd.Rows[0]["vparam11"].ToString(), dtd.Rows[0]["vparam12"].ToString(), dtd.Rows[0]["vparam13"].ToString(), dtd.Rows[0]["vparam14"].ToString(), dtd.Rows[0]["vparam15"].ToString(), dtd.Rows[0]["iparam1"].ToString(), dtd.Rows[0]["iparam2"].ToString(), dtd.Rows[0]["iparam3"].ToString(), dtd.Rows[0]["iparam4"].ToString(), dtd.Rows[0]["iparam5"].ToString(), dtd.Rows[0]["iparam6"].ToString(), dtd.Rows[0]["iparam7"].ToString(), dtd.Rows[0]["iparam8"].ToString(), dtd.Rows[0]["iparam9"].ToString(), dtd.Rows[0]["iparam10"].ToString(), dtd.Rows[0]["fparam1"].ToString(), dtd.Rows[0]["fparam2"].ToString(), dtd.Rows[0]["fparam3"].ToString());
                int iprd = WEB.Dataprovider.getmax("db_items", "iid", "");

                lttitle.Text = "Quản lý sản phẩm - Thêm sản phẩm thành công";
                //ghi log
                hdiid.Value = WEB.Dataprovider.getmax("db_items", "iid", "vcode ='" + WEB.Common.mod_product + "'").ToString();
                WEB.Logs.writelog("Thêm sản phẩm : " + txtnamecopy.Text);
                DataTable dt = WEB.Item_other.getlisitem("TAB", WEB.Common.LangAdmin, "iid=" + id.ToString(), "ino asc");
                for (int i = 0; i < dt.Rows.Count; i++)
                {


                    string[] sb = { "iid", "vcode", "vlan", "vtitle", "vcontent", "istatus" };
                    object[] ob = { iprd, "TAB", WEB.Common.LangAdmin, dt.Rows[i]["vtitle"].ToString(), dt.Rows[i]["vcontent"].ToString(), dt.Rows[i]["istatus"].ToString() };
                    WEB.Item_other.save(-1, sb, ob);


                }

                //them phien ban khac
                //DataTable dtpb = WEB.Item_other.getlisitem("PHB", WEB.Common.LangAdmin, "iid=" + id.ToString(), "ino asc");
                //for (int i = 0; i < dtpb.Rows.Count; i++)
                //{

                //    string[] sb = { "iid", "vcode", "vlan", "vtitle", "vdesc", "vcontent", "vparam1", "istatus" };
                //    object[] ob = { iprd, "PHB", vlan, dtpb.Rows[i]["vtitle"].ToString(), dtpb.Rows[i]["vdesc"].ToString(), dtpb.Rows[i]["vcontent"].ToString(), dtpb.Rows[i]["vparam1"].ToString(), dtpb.Rows[i]["istatus"].ToString() };
                //    WEB.Item_other.save(-1, sb, ob);

                //}
              Response.Redirect(weburl + "admin/?mod=prod&c=items&id=" + iprd.ToString());
            }
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