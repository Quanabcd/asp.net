using System;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI.WebControls;

public partial class admin_products_item : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.Lang;
    public int iorder = 0;
    public int iordertype = 0;
    public int curpage = 1;
    public string key = "";
    public int icid = -1;
    public int istatus = -1;
    public int numitems = 0;
    public int iid = -1;
    public string tags = "";
    public string tagsnosign = "";
    public int stttag = 0;
    public string itemtitle = "";
    public string itemurl = "";
    public string itemdescription = "";
    public string role = "";
    public int id = -1;
    public DataTable dtgroupite = new DataTable();

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
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("ordertype")))
        {
            iordertype = Convert.ToInt32(WEB.Common.GeturlParam("ordertype"));
        }
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("st")))
        {
            istatus = Convert.ToInt32(WEB.Common.GeturlParam("st"));
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

            numitems = WEB.Products.getnumitem();
            //lttitle.Text = numitems.ToString();

            lttitle.Text = "Danh sách tin tức";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            DataTable dt = new DataTable();
            dt = WEB.Category.getcate("-1", WEB.Common.mod_news, vlan, "1", "-1");
            ddlcate.Items.Clear();
            ddlcatesearch.Items.Clear();
            //ddlcate.Items.Add(new ListItem("Tất cả", "-1"));
            ddlcatesearch.Items.Add(new ListItem("Tất cả", "-1"));
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
                    this.ddlcatesearch.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                }
                space = "";
            }
            txtkeysearch.Text = key;
            hddmql.Value = dml;
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlcatesearch, icid.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlorder, iorder.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlstatus, istatus.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlordertype, iordertype.ToString());
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

    protected void loadgroup()
    {
        DataTable dt = WEB.Category.getcate("-1", WEB.Common.mod_news_group, vlan, "1", "1");
        rpgroup.DataSource = dt;
        rpgroup.DataBind();
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

    public bool check(string str)
    {
        if (str == "1")
            return true;
        else
            return false;
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

    public string chkcheck(System.Web.UI.WebControls.CheckBox chk)
    {
        if (chk.Checked == true)
            return "1";
        else
            return "0";
    }

    protected void clear()
    {
        txturl.Text = "";
        txtnewsname.Text = "";
        txtdesc.Text = "";
        txtcontent.Text = "";
        txt_tag.Text = "";
        txtkeyword.Text = "";
        txtmetadesc.Text = "";
        txtorder.Text = "";
        txttitleweb.Text = "";
        ltimage.Text = "";
        ltdetailmsg.Text = "";
        ddlhour.Items.Clear();
        txtorder.Text = "1";
        chkstatus.Checked = true;
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

    protected void btnnhanban_Click(object sender, EventArgs e)
    {
        DataTable dtd = WEB.Items.getitembyid(hdiid.Value);
        if (dtd.Rows.Count > 0)
        {
            string url = "";

            if (vlan != "ENG" && vlan != "VIE")
                url = WEB.Common.getalias("news");
            else
                url = WEB.Common.getalias(txtnamecopy.Text.Trim());

            WEB.Items.db_items_insert(dtd.Rows[0]["icid"].ToString(), WEB.Common.mod_news, vlan, url, dtd.Rows[0]["vkey"].ToString(), txtnamecopy.Text.Trim(), WEB.Common.GetNosign(txtnamecopy.Text.Trim()), dtd.Rows[0]["vdesc"].ToString(), dtd.Rows[0]["vcontent"].ToString(), "default.png", Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), dtd.Rows[0]["fnewprice"].ToString(), dtd.Rows[0]["foldprice"].ToString(), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", dtd.Rows[0]["istatus"].ToString(), dtd.Rows[0]["vparam1"].ToString(), dtd.Rows[0]["vparam2"].ToString(), dtd.Rows[0]["vparam3"].ToString(), dtd.Rows[0]["vparam4"].ToString(), dtd.Rows[0]["vparam5"].ToString(), dtd.Rows[0]["vparam6"].ToString(), dtd.Rows[0]["vparam7"].ToString(), dtd.Rows[0]["vparam8"].ToString(), dtd.Rows[0]["vparam9"].ToString(), "", dtd.Rows[0]["vparam11"].ToString(), dtd.Rows[0]["vparam12"].ToString(), dtd.Rows[0]["vparam13"].ToString(), dtd.Rows[0]["vparam14"].ToString(), dtd.Rows[0]["vparam15"].ToString(), dtd.Rows[0]["iparam1"].ToString(), dtd.Rows[0]["iparam2"].ToString(), dtd.Rows[0]["iparam3"].ToString(), dtd.Rows[0]["iparam4"].ToString(), dtd.Rows[0]["iparam5"].ToString(), dtd.Rows[0]["iparam6"].ToString(), dtd.Rows[0]["iparam7"].ToString(), dtd.Rows[0]["iparam8"].ToString(), dtd.Rows[0]["iparam9"].ToString(), dtd.Rows[0]["iparam10"].ToString(), dtd.Rows[0]["fparam1"].ToString(), dtd.Rows[0]["fparam2"].ToString(), dtd.Rows[0]["fparam3"].ToString());
            int iprd = WEB.Dataprovider.getmax("db_items", "iid", "");

            lttitle.Text = "Thêm tin tức thành công";
            //ghi log
            hdiid.Value = WEB.Dataprovider.getmax("db_items", "iid", "vcode ='" + WEB.Common.mod_news + "'").ToString();
            WEB.Logs.writelog("Thêm tin tức : " + txtnamecopy.Text);
            Response.Redirect(weburl + "admin/?mod=news&c=items&id=" + hdiid.Value);
        }
    }

    protected void UpdateList()
    {
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        ltcopy.Text = "";
        if (checkrole("2121"))
            lnkadd.Visible = true;
        else
            lnkadd.Visible = false;
        if (checkrole("2123"))
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
                condition = " 1 = 2 ";
        }
        string sorder = "iid desc";
        if (iorder == 0)
            sorder = "dcreatedate";
        else if (iorder == 1)
            sorder = "dupdate";
        else if (iorder == 2)
            sorder = "vtitle";
        else if (iorder == 3)
            sorder = "iparam1";
        else if (iorder == 4)
            sorder = "iviews";
        if (iordertype == 1)
            sorder += " asc";
        else
            sorder += " desc";
        //key = WEB.Common.remove_specical_char(txtkeysearch.Text);
        numitems = WEB.Items.getnumitems(key, fieldsearch, WEB.Common.mod_news, icid.ToString(), vlan, condition, istatus.ToString());
        //dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, curpage,20, sorder);
        dt = WEB.Items.getlistitembypage(icid.ToString(), fieldsearch, key, WEB.Common.mod_news, vlan, condition, istatus.ToString(), curpage - 1, 20, sorder);
        lt_count.Text = "Tổng số tin tức: <span style='color: #A52A2A;'>" + numitems.ToString() + "</span>";
        rpitems.DataSource = dt;
        rpitems.DataBind();
        ltpage.Text = WEB.Common.PhanTrang("?mod=news&c=items&cid=" + icid.ToString() + "&key=" + key.Trim() + "&st=" + istatus.ToString() + "&order=" + iorder.ToString() + "&ordertype=" + iordertype.ToString(), curpage, numitems, 20);
        lt_pagebotom.Text = ltpage.Text;
    }

    protected void rpitems_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        string c = e.CommandName.Trim();
        string p = e.CommandArgument.ToString().Trim();
        switch (c)
        {
            case "EditDetail":
                if (checkrole("2121"))
                {
                    ltcopy.Text = "<a href='#ex1' class='nhanban' title='Nhân bản tin tức'><span class='icon-ok-update'></span>Nhân bản tin tức</a>";
                    ltdetailmsg.Text = "";
                    lnkupdate.Visible = true;
                    lnkclose.Visible = true;
                    lnkadd.Visible = false;
                    lnkdelete.Visible = false;
                    lnkupdatepriceandorder.Visible = false;
                    lttitle.Text = "Cập nhật tin tức";
                    pnlist.Visible = false;
                    pndetail.Visible = true;
                    this.hd_insertupdate.Value = "update";
                    this.hdiid.Value = p.Trim();
                    id = Convert.ToInt32(p);
                    DataTable dt = new DataTable();
                    clear();
                    dt = WEB.Items.getitembyid(p);
                    if (dt.Rows.Count > 0)
                    {
                        iid = Convert.ToInt32(p);
                        WEB.Common.SetSelectedIndexInDropDownList(ref ddlcate, dt.Rows[0]["icid"].ToString());
                        txtdesc.Text = dt.Rows[0]["vdesc"].ToString();
                        txtnamecopy.Text = "Nhân bản của " + dt.Rows[0]["vtitle"].ToString();
                        txtcontent.Text = dt.Rows[0]["vcontent"].ToString();
                        hdimg_old.Value = dt.Rows[0]["vimg"].ToString();
                        hdname.Value = txtnewsname.Text = dt.Rows[0]["vtitle"].ToString().Trim();
                        if (dt.Rows[0]["vimg"].ToString().Length > 0)
                            ltimage.Text = "<img src='" + weburl + "uploads/news/" + dt.Rows[0]["vimg"].ToString() + "' style='max-width:500px;height:80px' >";
                        txt_updatetime.Text = Convert.ToDateTime(dt.Rows[0]["dcreatedate"].ToString()).ToString("dd/MM/yyyy");
                        WEB.Common.SetSelectedIndexInDropDownList(ref ddlhour, Convert.ToDateTime(dt.Rows[0]["dcreatedate"].ToString()).Hour.ToString());
                        WEB.Common.SetSelectedIndexInDropDownList(ref ddlminute, Convert.ToDateTime(dt.Rows[0]["dcreatedate"].ToString()).Minute.ToString());
                        hdiusercreate.Value = dt.Rows[0]["iusercreate"].ToString();
                        hdvusercreate.Value = dt.Rows[0]["vusercreate"].ToString();
                        txt_tag.Text = dt.Rows[0]["vkey"].ToString();
                        txtorder.Text = dt.Rows[0]["iparam1"].ToString();
                        hdiviews.Value = dt.Rows[0]["iviews"].ToString();
                        hdtitle.Value = dt.Rows[0]["vtitle"].ToString().Trim();
                        txturl.Text = hdalias.Value = dt.Rows[0]["valias"].ToString().Trim();
                        if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                            chkstatus.Checked = false;
                        else
                            chkstatus.Checked = true;
                        itemtitle = txttitleweb.Text = dt.Rows[0]["vparam1"].ToString();
                        txtkeyword.Text = dt.Rows[0]["vparam2"].ToString();
                        hdgroup.Value = dt.Rows[0]["vparam9"].ToString();
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
                        tags = dt.Rows[0]["vparam7"].ToString();
                        string[] s = tags.Split(',');
                        lttags.Text = "";
                        for (int i = 0; i < s.Length; i++)
                        {
                            if (s[i].Length > 0)
                                lttags.Text += "<span class='tag label label-tags'><span class='tagname'>" + s[i] + "</span><span class='rmtag' data-role='remove'></span></span>";
                        }
                        dtgroupite = WEB.Group.getgroupitembyfield("iid", p);
                        loadtags();
                        loadgroup();
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
                WEB.Items.updatestatus(p, status);
                this.UpdateList();
                break;

            case "delete":
                if (checkrole("2123"))
                {
                    //lt_iid.Text = p;
                    WEB.Logs.writelog("Xóa tin tức: " + getname(p));
                    WEB.Items.db_items_delete(p);
                    WEB.Group.db_group_items_delete_by_iid(p);
                    UpdateList();
                }
                break;

            case "cloning":
                if (checkrole("2123"))
                {
                    DataTable dtd = WEB.Items.getitembyid(hdiid.Value);
                    if (dtd.Rows.Count > 0)
                    {
                        string url = "";

                        if (vlan != "ENG" && vlan != "VIE")
                            url = WEB.Common.getalias("news");
                        else
                            url = WEB.Common.getalias(txtnamecopy.Text.Trim());

                        WEB.Items.db_items_insert(dtd.Rows[0]["icid"].ToString(), WEB.Common.mod_news, vlan, url, dtd.Rows[0]["vkey"].ToString(), txtnamecopy.Text.Trim(), WEB.Common.GetNosign(txtnamecopy.Text.Trim()), dtd.Rows[0]["vdesc"].ToString(), dtd.Rows[0]["vcontent"].ToString(), "default.png", Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), dtd.Rows[0]["fnewprice"].ToString(), dtd.Rows[0]["foldprice"].ToString(), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", dtd.Rows[0]["istatus"].ToString(), dtd.Rows[0]["vparam1"].ToString(), dtd.Rows[0]["vparam2"].ToString(), dtd.Rows[0]["vparam3"].ToString(), dtd.Rows[0]["vparam4"].ToString(), dtd.Rows[0]["vparam5"].ToString(), dtd.Rows[0]["vparam6"].ToString(), dtd.Rows[0]["vparam7"].ToString(), dtd.Rows[0]["vparam8"].ToString(), dtd.Rows[0]["vparam9"].ToString(), "", dtd.Rows[0]["vparam11"].ToString(), dtd.Rows[0]["vparam12"].ToString(), dtd.Rows[0]["vparam13"].ToString(), dtd.Rows[0]["vparam14"].ToString(), dtd.Rows[0]["vparam15"].ToString(), dtd.Rows[0]["iparam1"].ToString(), dtd.Rows[0]["iparam2"].ToString(), dtd.Rows[0]["iparam3"].ToString(), dtd.Rows[0]["iparam4"].ToString(), dtd.Rows[0]["iparam5"].ToString(), dtd.Rows[0]["iparam6"].ToString(), dtd.Rows[0]["iparam7"].ToString(), dtd.Rows[0]["iparam8"].ToString(), dtd.Rows[0]["iparam9"].ToString(), dtd.Rows[0]["iparam10"].ToString(), dtd.Rows[0]["fparam1"].ToString(), dtd.Rows[0]["fparam2"].ToString(), dtd.Rows[0]["fparam3"].ToString());
                        int iprd = WEB.Dataprovider.getmax("db_items", "iid", "");

                        lttitle.Text = "Thêm tin tức thành công";
                        //ghi log
                        hdiid.Value = WEB.Dataprovider.getmax("db_items", "iid", "vcode ='" + WEB.Common.mod_news + "'").ToString();
                        WEB.Logs.writelog("Thêm tin tức : " + txtnamecopy.Text);
                        Response.Redirect(weburl + "admin/?mod=news&c=items&id=" + hdiid.Value);
                    }

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

    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtnewsname.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tiêu đề tin tức</p>";
                ltdetailmsg.Visible = true;
                txtnewsname.Focus();
                return;
            }
            if (txtnewsname.Text.Length > 150)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Tiêu đề tin tức không được quá 150 ký tự</p>";
                ltdetailmsg.Visible = true;
                txtnewsname.Focus();
                return;
            }
            if (txtcontent.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập nội dung tin tức</p>";
                ltdetailmsg.Visible = true;
                txtcontent.Focus();
                return;
            }
            if (txtdesc.Text.Length > 4000)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Mô tả tối đa 4000 ký tự</p>";
                ltdetailmsg.Visible = true;
                txtdesc.Focus();
                return;
            }
            if (WEB.Common.Check_number(txtorder.Text) == false)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Thứ tự phải là số</p>";
                ltdetailmsg.Visible = true;
                txtorder.Focus();
                return;
            }
            if (ddlcate.Items.Count == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Chưa có danh mục nào, chọn <a href='/admin/?mod=news&c=cates'>thêm mới danh mục</a></p>";
                ltdetailmsg.Visible = true;
                ddlcate.Focus();
                return;
            }
            if (ltimage.Text == "")
            {
                if (flupload.FileName.Trim().Length == 0)
                {
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời chọn hình ảnh đại diện</p>";
                    ltdetailmsg.Visible = true;
                    flupload.Focus();
                    return;
                }
            }
            if (hd_insertupdate.Value.Equals("insert"))
            {
                if (txturl.Text.Length == 0)
                {
                    if (vlan != "ENG" && vlan != "VIE")
                        txturl.Text = WEB.Common.getalias("news");
                    else
                        txturl.Text = WEB.Common.getalias(txtnewsname.Text);
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
                        txturl.Text = WEB.Common.getalias("news");
                    else
                        txturl.Text = WEB.Common.getalias(txtnewsname.Text);
                }
                else
                {
                    if (txturl.Text != hdalias.Value)
                    {
                        txturl.Text = WEB.Common.getalias1(txturl.Text);
                    }
                    else
                    {
                        if (txtnewsname.Text != hdname.Value)
                        {
                            if (vlan != "ENG" && vlan != "VIE")
                            {
                            }
                            else
                                txturl.Text = WEB.Common.getalias(txtnewsname.Text);
                        }
                    }
                }
            }

            string image = "";
            if (this.flupload.FileName.Trim().Length > 0)
            {
                string tempname = convertToImages(System.IO.Path.GetFileName(flupload.PostedFile.FileName));
                string fileextention = "";
                fileextention = System.IO.Path.GetExtension(tempname).ToLower();
                tempname = WEB.Common.GetNewTitle(tempname.Replace(fileextention, "")) + fileextention;

                if (fileextention.Equals(".jpg") || fileextention.Equals(".jpeg") || fileextention.Equals(".gif") || fileextention.Equals(".png"))
                {
                    if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/news/" + tempname) == false)
                        image = tempname;
                    else
                        image = DateTime.Now.Second + "-" + tempname;
                    System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(flupload.PostedFile.InputStream);
                    int thumbwidth = 0;
                    int thumbheight = 0;
                    if (WEB.Config.getvaluebykey(WEB.Config.k_nwsimgthumbwidth, vlan).Length > 0)
                        thumbwidth = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_nwsimgthumbwidth, vlan));
                    if (WEB.Config.getvaluebykey(WEB.Config.k_nwsimgthumbheight, vlan).Length > 0)
                        thumbheight = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_nwsimgthumbheight, vlan));

                    System.Drawing.Image objImage = WEB.Common.ScaleImage(bmpPostedImage, fileextention, thumbwidth, thumbheight);
                    if (fileextention == ".png")
                        objImage.Save(Server.MapPath("~/") + "/uploads/news/thumbs/" + image, System.Drawing.Imaging.ImageFormat.Png);
                    if (fileextention == ".jpg" || fileextention == ".jpeg")
                        objImage.Save(Server.MapPath("~/") + "/uploads/news/thumbs/" + image, System.Drawing.Imaging.ImageFormat.Jpeg);
                    if (fileextention == ".gif")
                        objImage.Save(Server.MapPath("~/") + "/uploads/news/thumbs/" + image, System.Drawing.Imaging.ImageFormat.Gif);

                    int nwswidth = 0;
                    int nwsheight = 0;
                    if (WEB.Config.getvaluebykey(WEB.Config.k_nwsimgwidth, vlan).Length > 0)
                        nwswidth = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_nwsimgwidth, vlan));
                    if (WEB.Config.getvaluebykey(WEB.Config.k_nwsimgheight, vlan).Length > 0)
                        nwsheight = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_nwsimgheight, vlan));
                    System.Drawing.Image objImage1 = WEB.Common.ScaleImage(bmpPostedImage, fileextention, nwswidth, nwsheight);
                    if (fileextention == ".png")
                        objImage1.Save(Server.MapPath("~/") + "/uploads/news/" + image, System.Drawing.Imaging.ImageFormat.Png);
                    if (fileextention == ".jpg" || fileextention == ".jpeg")
                        objImage1.Save(Server.MapPath("~/") + "/uploads/news/" + image, System.Drawing.Imaging.ImageFormat.Jpeg);
                    if (fileextention == ".gif")
                        objImage1.Save(Server.MapPath("~/") + "/uploads/news/" + image, System.Drawing.Imaging.ImageFormat.Gif);
                }
                else
                {
                    ltdetailmsg.Visible = true;
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.jpeg,*.gif,*.bmp,*.png</p>";
                    return;
                }
            }
            string istatus = "0";
            if (chkstatus.Checked == true)
                istatus = "1";
            string newhotsale = "";
            if (chknew.Checked == true)
                newhotsale += "1|";
            if (chkhot.Checked == true)
                newhotsale += "2|";

            if (txtkeyword.Text == "")
                txtkeyword.Text = txtnewsname.Text + ", " + WEB.Common.GetNosign(txtnewsname.Text.Trim());
            if (txttitleweb.Text == "")
                txttitleweb.Text = txtnewsname.Text;
            if (txtmetadesc.Text == "")
                txtmetadesc.Text = txtnewsname.Text + ", " + WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan);
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
            //if (txtmetadesc.Text.Length > 160)
            //{
            //    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Thẻ mô tả (Hỗ trợ SEO) tối đa 160 ký tự</p>";
            //    ltdetailmsg.Visible = true;
            //    txtmetadesc.Focus();
            //    return;
            //}
            DateTime dcreate = DateTime.Now;
            if (txt_updatetime.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Ngày đăng không hợp lệ. Ngày đăng phải có định dạng ngày/tháng/năm . VD: 01/01/2017</p>";
                ltdetailmsg.Visible = true;
                txt_updatetime.Focus();
                return;
            }
            else
            {
                try
                {
                    string[] s = txt_updatetime.Text.Trim().Split('/');
                    dcreate = new DateTime(Convert.ToInt32(s[2]), Convert.ToInt32(s[1]), Convert.ToInt32(s[0]), Convert.ToInt32(ddlhour.SelectedValue), Convert.ToInt32(ddlminute.SelectedValue), 0);
                }
                catch
                {
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Ngày đăng không hợp lệ. Ngày đăng phải có định dạng ngày/tháng/năm . VD: 01/01/2017</p>";
                    ltdetailmsg.Visible = true;
                    txt_updatetime.Focus();
                    return;
                }
            }
            if (hd_insertupdate.Value.Equals("insert"))
            {
                try
                {
                    WEB.Items.db_items_insert(ddlcate.SelectedValue, WEB.Common.mod_news, vlan, convertToAlias(txturl.Text), txt_tag.Text, txtnewsname.Text, WEB.Common.GetNosign(txtnewsname.Text.Trim()), txtdesc.Text, txtcontent.Text, image, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), "0", "0", DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.AddYears(10).ToString("MM/dd/yyyy hh:mm:ss tt"), "0", istatus, txttitleweb.Text, txtkeyword.Text, txtmetadesc.Text, newhotsale, txt_updatetime.Text, "", WEB.Common.GetFormValue("taglist").ToString(), WEB.Common.GetNosign(WEB.Common.GetFormValue("taglist").ToString()), "", "", "", "", "", "", "", txtorder.Text, "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0");
                    lttitle.Text = "Quản lý tin tức - Thêm tin tức thành công";
                    //ghi log
                    int id = WEB.Dataprovider.getmax("db_items", "iid", "vcode ='" + WEB.Common.mod_news + "'");
                    inserttag(id, WEB.Common.GetFormValue("taglist").ToString());
                    string[] lgroup = WEB.Common.GetFormValue("chkgr").ToString().Split(',');
                    for (int i = 0; i < lgroup.Length; i++)
                    {
                        if (WEB.Common.Check_number(lgroup[i]))
                            WEB.Group.db_group_items_insert(lgroup[i], id.ToString(), "1", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "1", "0", "0", "0");
                    }
                    WEB.Logs.writelog("Thêm tin tức: " + txtnewsname.Text);
                    UpdateList();
                }
                catch
                {
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi thêm dữ liệu</p>";
                    ltdetailmsg.Visible = true;
                }
            }
            else if (hd_insertupdate.Value.Equals("update"))
            {
                string newtags = WEB.Common.GetFormValue("taglist").ToString();
                string oldtags = WEB.Common.GetFormValue("tagtemp").ToString();
                if (newtags != oldtags)
                {
                    string[] sn = newtags.Split(',');
                    string[] so = oldtags.Split(',');
                    for (int i = 0; i < sn.Length; i++)
                    {
                        if (oldtags.Contains("," + sn[i] + ",") == false)
                        {
                            inserttag(Convert.ToInt32(hdiid.Value), "," + sn[i] + ",");
                        }
                    }
                    for (int i = 0; i < so.Length; i++)
                    {
                        if (newtags.Contains("," + so[i] + ",") == false)
                        {
                            WEB.Tags.db_tags_deletebyiidandtag(hdiid.Value, so[i]);
                        }
                    }
                }
                try
                {
                    //xóa ảnh cũ
                    if (image == "")
                        image = hdimg_old.Value;
                    else
                    {
                        try
                        {
                            System.IO.File.Delete(Server.MapPath("~/") + "/uploads/news/" + hdimg_old.Value);
                            System.IO.File.Delete(Server.MapPath("~/") + "/uploads/news/thumbs/" + hdimg_old.Value);
                        }
                        catch
                        {
                        }
                    }

                    WEB.Items.db_items_update(hdiid.Value, ddlcate.SelectedValue, WEB.Common.mod_news, vlan, convertToAlias(txturl.Text), txt_tag.Text, txtnewsname.Text, WEB.Common.GetNosign(txtnewsname.Text.Trim()), txtdesc.Text, txtcontent.Text, image, "0", "0", dcreate.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.AddYears(10).ToString("MM/dd/yyyy hh:mm:ss tt"), istatus, txttitleweb.Text, txtkeyword.Text, txtmetadesc.Text, newhotsale, txt_updatetime.Text, Session["admin"].ToString(), newtags, WEB.Common.GetNosign(newtags), "", "", txtorder.Text, "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0");
                    string[] lgroup = WEB.Common.GetFormValue("chkgr").ToString().Split(',');
                    WEB.Group.db_group_items_delete_by_iid(hdiid.Value);
                    for (int i = 0; i < lgroup.Length; i++)
                    {
                        if (WEB.Common.Check_number(lgroup[i]))
                        {
                            WEB.Group.db_group_items_insert(lgroup[i], hdiid.Value, "1", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "1", "0", "0", "0");
                        }
                    }
                    lttitle.Text = "Quản lý tin tức - Cập nhật tin tức thành công";
                    //ghi log
                    WEB.Logs.writelog("Cập nhật tin tức: " + txtnewsname.Text);
                    UpdateList();
                }
                catch
                {
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật dữ liệu</p>";
                    ltdetailmsg.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật tin tức không thành công</p>" + ex.ToString();
            ltdetailmsg.Visible = true;
        }
    }

    protected void loadtags()
    {
        rptags.DataSource = WEB.Tags.getlistitembypage(new string[0], "", "capp='NWS'", 0, 40, "vtagfull asc");
        rptags.DataBind();
    }

    protected string gettagselected(string s)
    {
        if (tags.Contains("," + s + ","))
            return "disabled";
        else
            return "selecttag";
    }

    protected string getssttag()
    {
        stttag++;
        return stttag.ToString();
    }

    protected void inserttag(int iid, string taglist)
    {
        string[] s = taglist.Split(',');
        for (int i = 0; i < s.Length; i++)
        {
            if (s[i].Length > 0)
            {
                if (WEB.Tags.getitembyfield("vtagfull", s[i]).Rows.Count == 0)
                {
                    string[] sf = { "iid", "capp", "vtag", "vtagfull" };
                    object[] of = { iid, "NWS", WEB.Common.GetNosign(s[i]), s[i] };
                    WEB.Tags.save(-1, sf, of);
                }
            }
        }
    }

    protected void lnkadd_Click(object sender, EventArgs e)
    {
        clear();
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        lnkupdatepriceandorder.Visible = false;
        lttitle.Text = "Thêm tin tức";
        pnlist.Visible = false;
        pndetail.Visible = true;
        txt_updatetime.Text = Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy");
        WEB.Common.SetSelectedIndexInDropDownList(ref ddlhour, DateTime.Now.Hour.ToString());
        WEB.Common.SetSelectedIndexInDropDownList(ref ddlminute, DateTime.Now.Minute.ToString());
        loadtags();
        itemtitle = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, vlan);
        itemdescription = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan);
        itemurl = weburl;
        this.hd_insertupdate.Value = "insert";
        loadgroup();
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

    protected void lnkclose_Click(object sender, EventArgs e)
    {
        lttitle.Text = "Quản lý tin tức";
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
            return "<img height='40' style='max-width:300px' src='" + weburl + "uploads/news/" + str + "'>";
        }
        else
            return "<img height='40' style='max-width:300px' src='" + weburl + "uploads/news/default.png'>";
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
                    WEB.Logs.writelog("Xóa tin tức hàng loạt");
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
        Response.Redirect(weburl + "admin/?mod=news&c=items&cid=" + ddlcatesearch.SelectedValue + "&key=" + txtkeysearch.Text.Trim() + "&st=" + ddlstatus.SelectedValue + "&order=" + ddlorder.SelectedValue + "&ordertype=" + ddlordertype.SelectedValue);
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
                condition = " 1 = 2 ";
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
        if (iordertype == 1)
            sorder += " asc";
        else
            sorder += " desc";
        DataTable dt = WEB.Items.getlistitembypage(icid.ToString(), fieldsearch, key, WEB.Common.mod_news, vlan, condition, istatus.ToString(), curpage - 1, 20, sorder);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            try
            {
                string[] sf = { "iparam1" };
                object[] vf = { Request.Form["txtorder_" + dt.Rows[i]["iid"].ToString()].ToString().Trim() };
                WEB.Items.save(Convert.ToInt32(dt.Rows[i]["iid"]), sf, vf);
            }
            catch { }
        }
        lttitle.Text += " - Cập nhật thành công";
        UpdateList();
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