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

public partial class admin_customer_reviews_item : System.Web.UI.UserControl
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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("p")))
        {
            curpage = Convert.ToInt32(WEB.Common.GeturlParam("p"));
        }
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("cid")))
        {
            icid = Convert.ToInt32(WEB.Common.GeturlParam("cid"));
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

            lttitle.Text = "Danh sách YKKH";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            DataTable dt = new DataTable();
            dt = WEB.Category.getcate("-1","YKH", vlan, "1", "-1");
            ddlcate.Items.Clear();
            ddlcatesearch.Items.Clear();
            //ddlcate.Items.Add(new ListItem("Tất cả", "-1"));
            ddlcatesearch.Items.Add(new ListItem("Tất cả", "-1"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string space = "";
                for (int j = 1; j < Convert.ToInt32(dt.Rows[i]["ilevel"].ToString()); j++)
                {
                    space += "..";
                }

                this.ddlcate.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                this.ddlcatesearch.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                space = "";
            }
            txtkeysearch.Text = key;
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlcatesearch, icid.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlorder, iorder.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlstatus, istatus.ToString());
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlordertype, iordertype.ToString());
            this.UpdateList();
        }
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
            ddlhour.Items.Add(new ListItem(i.ToString() ,i.ToString()));
        }
        ddlminute.Items.Clear();
        for (int i = 0; i < 60; i++)
        {
             ddlminute.Items.Add(new ListItem(i.ToString() ,i.ToString()));
        }
    }
    protected void UpdateList()
    {
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = true;
        lnkdelete.Visible = true;
        pndetail.Visible = false;
        pnlist.Visible = true;
        lnkupdatepriceandorder.Visible = true;
        DataTable dt = new DataTable();
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
            sorder = "iparam1";
        else if (iorder == 4)
            sorder = "iviews";
        if (iordertype == 1)
            sorder += " asc";
        else
            sorder += " desc";
        //key = WEB.Common.remove_specical_char(txtkeysearch.Text);
        numitems = WEB.Items.getnumitems(key, fieldsearch,"YKH", icid.ToString(), vlan, condition, istatus.ToString());
        //dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, curpage,20, sorder);
        dt = WEB.Items.getlistitembypage(icid.ToString(), fieldsearch, key,"YKH", vlan, condition, istatus.ToString(), curpage-1, 10, sorder);
        lt_count.Text = "Tổng số YKKH: <span style='color: #A52A2A;'>" + numitems.ToString()+ "</span>";
        rpitems.DataSource = dt;
        rpitems.DataBind();
        ltpage.Text = WEB.Common.PhanTrang("index.aspx?mod=customer_reviews&c=items&cid=" + icid.ToString() + "&key=" + key.Trim() + "&st=" + istatus.ToString() + "&order=" + iorder.ToString() + "&ordertype=" + iordertype.ToString(), curpage, numitems, 10);
        lt_pagebotom.Text = ltpage.Text;
    }
    protected void rpitems_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        string c = e.CommandName.Trim();
        string p = e.CommandArgument.ToString().Trim();
        switch (c)
        {
            case "EditDetail":
                ltdetailmsg.Text = "";
                lnkupdate.Visible = true;
                lnkclose.Visible = true;
                lnkadd.Visible = false;
                lnkdelete.Visible = false;
                lnkupdatepriceandorder.Visible = false;
                lttitle.Text = "Cập nhật YKKH";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                this.hdiid.Value = p.Trim();
                DataTable dt = new DataTable();
                clear();
                dt = WEB.Items.getitembyid(p);
                if (dt.Rows.Count > 0)
                {
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlcate, dt.Rows[0]["icid"].ToString());
                    txtdesc.Text = dt.Rows[0]["vdesc"].ToString();
                    txtcompany.Text = dt.Rows[0]["vcontent"].ToString();
                    hdimg_old.Value = dt.Rows[0]["vimg"].ToString();
                    txtnewsname.Text=dt.Rows[0]["vtitle"].ToString().Trim();
                    if (dt.Rows[0]["vimg"].ToString().Length>0)
                        ltimage.Text = "<img src='" + weburl + "uploads/ykienkh/" + dt.Rows[0]["vimg"].ToString() + "' style='max-width:500px;height:80px' >";
                    txt_updatetime.Text = Convert.ToDateTime(dt.Rows[0]["dcreatedate"].ToString()).ToString("dd/MM/yyyy");
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlhour, Convert.ToDateTime(dt.Rows[0]["dcreatedate"].ToString()).Hour.ToString());
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlminute, Convert.ToDateTime(dt.Rows[0]["dcreatedate"].ToString()).Minute.ToString());
                    hdiusercreate.Value = dt.Rows[0]["iusercreate"].ToString();
                    hdvusercreate.Value = dt.Rows[0]["vusercreate"].ToString();
                    txt_tag.Text=dt.Rows[0]["vkey"].ToString();
                    txtorder.Text=dt.Rows[0]["iparam1"].ToString();
                    hdiviews.Value = dt.Rows[0]["iviews"].ToString();
                    hdtitle.Value = dt.Rows[0]["vtitle"].ToString().Trim();
                    hdalias.Value = dt.Rows[0]["valias"].ToString().Trim(); 
                    if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                        chkstatus.Checked = false;
                    else
                        chkstatus.Checked = true;
                    txttitleweb.Text = dt.Rows[0]["vparam1"].ToString();
                    txtkeyword.Text = dt.Rows[0]["vparam2"].ToString();
                    txtmetadesc.Text = dt.Rows[0]["vparam3"].ToString();

                    if (dt.Rows[0]["vparam4"].ToString().Contains("1"))
                        chknew.Checked = true;
                    else
                        chknew.Checked = false;
                    if (dt.Rows[0]["vparam4"].ToString().Contains("2"))
                        chkhot.Checked = true;
                    else
                        chkhot.Checked = false;

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
                //lt_iid.Text = p;
                WEB.Items.db_items_delete(p);
                UpdateList();
                break;

        }
    }
    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtnewsname.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập họ tên khách hàng</p>";
                ltdetailmsg.Visible = true;
                txtnewsname.Focus();
                return;
            }
           

            if (WEB.Common.Check_number(txtorder.Text)==false)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Thứ tự phải là số</p>";
                ltdetailmsg.Visible = true;
                txtorder.Focus();
                return;
            }
            string image = "";
            if (this.flupload.FileName.Trim().Length > 0)
            {
                string tempname = System.IO.Path.GetFileName(flupload.PostedFile.FileName);
                string fileextention = "";
                fileextention = System.IO.Path.GetExtension(tempname).ToLower();

                if (fileextention.Equals(".jpg") || fileextention.Equals(".gif") || fileextention.Equals(".bmp") || fileextention.Equals(".png"))
                {
                    if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/ykienkh/" + tempname) == false)
                        image = tempname;
                    else
                        image = DateTime.Now.Second + "-" + tempname;
                    flupload.SaveAs(Server.MapPath("~/") + "/uploads/ykienkh/" + image);
                }
                else
                {
                    ltdetailmsg.Visible = true;
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.bmp,*.png</p>";
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
           DateTime dcreate= DateTime.Now;
            if (txt_updatetime.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Ngày đăng không hợp lệ</p>";
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
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Ngày đăng không hợp lệ</p>";
                    ltdetailmsg.Visible = true;
                    txt_updatetime.Focus();
                    return;
                }
            }
            if (hd_insertupdate.Value.Equals("insert"))
            {

                try
                {
                    WEB.Items.db_items_insert(ddlcate.SelectedValue,"YKH", vlan, "", txt_tag.Text, txtnewsname.Text, WEB.Common.GetNosign(txtnewsname.Text.Trim()), txtdesc.Text, txtcompany.Text, image, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), "0", "0", DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.AddYears(10).ToString("MM/dd/yyyy hh:mm:ss tt"), "0", istatus, txttitleweb.Text, txtkeyword.Text, txtmetadesc.Text, newhotsale, txt_updatetime.Text, "", "", "", "", "","","","","","", txtorder.Text, "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý YKKH - Thêm YKKH thành công";
                //ghi log
                string id = WEB.Dataprovider.getmax("db_items", "iid", "vcode ='" +"YKH" + "'").ToString();
                WEB.Logs.writelog("Thêm YKKH: " + txtnewsname.Text);
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

                try
                {
                //xóa ảnh cũ
                if (image == "")
                    image = hdimg_old.Value;
                else
                {
                    try
                    {
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/ykienkh/" + hdimg_old.Value);
                    }
                    catch
                    {
                    }
                }

                WEB.Items.db_items_update(hdiid.Value, ddlcate.SelectedValue,"YKH", vlan, "", txt_tag.Text, txtnewsname.Text, WEB.Common.GetNosign(txtnewsname.Text.Trim()), txtdesc.Text,txtcompany.Text, image, "0", "0", dcreate.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.AddYears(10).ToString("MM/dd/yyyy hh:mm:ss tt"), istatus, txttitleweb.Text, txtkeyword.Text, txtmetadesc.Text, newhotsale, txt_updatetime.Text, Session["admin"].ToString(), "", "", "", "", txtorder.Text, "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0");
                
                lttitle.Text = "Quản lý YKKH - Cập nhật YKKH thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật YKKH: " + txtnewsname.Text);
                UpdateList();

                }
                catch
                {
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật dữ liệu</p>";
                    ltdetailmsg.Visible = true;
                }

            }
        }
        catch
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật YKKH không thành công</p>";
            ltdetailmsg.Visible = true;
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
        lttitle.Text = "Thêm YKKH";
        pnlist.Visible = false;
        pndetail.Visible = true;
        txt_updatetime.Text = Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy");
        WEB.Common.SetSelectedIndexInDropDownList(ref ddlhour, DateTime.Now.Hour.ToString());
        WEB.Common.SetSelectedIndexInDropDownList(ref ddlminute, DateTime.Now.Minute.ToString());

        this.hd_insertupdate.Value = "insert";
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
        lttitle.Text = "Quản lý YKKH";
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
            return "<img height='40' style='max-width:300px' src='" + weburl + "uploads/ykienkh/" + str + "'>";
        }
        else
            return "<img height='40' style='max-width:300px' src='" + weburl + "uploads/ykienkh/default.png'>";
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
                            WEB.Items.db_items_delete(s[i].ToString());

                        }
                    }
                }
            }
        }
        UpdateList();
    }
    public void btnsearch_Click(object sender, EventArgs e)
    {
        Response.Redirect(weburl + "admin/?mod=customer_reviews&c=items&cid=" + ddlcatesearch.SelectedValue + "&key=" + txtkeysearch.Text.Trim() + "&st=" + ddlstatus.SelectedValue + "&order=" + ddlorder.SelectedValue + "&ordertype=" + ddlordertype.SelectedValue);
    }

    protected void lnkupdatepriceandorder_Click(object sender, EventArgs e)
    {
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
        if (iordertype == 1)
            sorder += " asc";
        else
            sorder += " desc";
        DataTable dt = WEB.Items.getlistitembypage(icid.ToString(), fieldsearch, key,"YKH", vlan, condition, istatus.ToString(), curpage-1, 10, sorder);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            try
            {
                string[] sf = { "iparam1" };
                object[] vf = {  Request.Form["txtorder_" + dt.Rows[i]["iid"].ToString()].ToString().Trim() };
                WEB.Items.save(Convert.ToInt32(dt.Rows[i]["iid"]), sf, vf);
            }
            catch { }
        }
        lttitle.Text += " - Cập nhật thành công";
        UpdateList();
    }
}
