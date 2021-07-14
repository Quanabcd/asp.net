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

public partial class admin_products_item : System.Web.UI.UserControl
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
    public int iid = -1;
    public string tags = "";
    public string tagsnosign = "";
    public int stttag = 0;
    public string itemtitle = "";
    public string itemurl = "";
    public string itemdescription = "";
    public string role = "";
    public DataTable dtgroupite = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        role = Session["role"].ToString();
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("p")))
        {
            curpage = Convert.ToInt32(WEB.Common.GeturlParam("p"));
        }
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("id")))
        {
            iid = Convert.ToInt32(WEB.Common.GeturlParam("id"));
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
            CKFinder.FileBrowser _FileBrowser1 = new CKFinder.FileBrowser();
            _FileBrowser1.BasePath = "../ckfinder";
            _FileBrowser1.SetupCKEditor(txtcontentanswer);
            numitems = WEB.Products.getnumitem();
            //lttitle.Text = numitems.ToString();

            lttitle.Text = "Danh sách bình luận";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            
            txtkeysearch.Text = key;
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
        txtname.Text = "";
        txtphone.Text = "";
        txtemail.Text = "";
        txtnewsname.Text = "";
        txtcontent.Text = "";
        ltdetailmsg.Text = "";
        ddlhour.Items.Clear();
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
      
        lnkdelete.Visible = false;
        pnanswer.Visible = false;
        pndetail.Visible = false;
        pnlist.Visible = true;
     
        DataTable dt = new DataTable();
        string[] fieldsearch = { "vname", "vtitle", "vemail", "vpr1","vcontent" };
        string condition = "";
        string sorder = "icmid desc";
        if (iorder == 0)
            sorder = "dcreatedate";
        else if (iorder == 1)
            sorder = "vname";
        else if (iorder == 2)
            sorder = "vemail";
    
        if (iordertype == 1)
            sorder += " asc";
        else
            sorder += " desc";
        //key = WEB.Common.remove_specical_char(txtkeysearch.Text);
        numitems = WEB.Item_comment.getnumitems(key, fieldsearch, iid.ToString(),  condition, istatus.ToString());
        //dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, curpage,20, sorder);
        dt = WEB.Item_comment.getlistitembypage( fieldsearch, key, iid.ToString(),  condition, istatus.ToString(), curpage-1, 20, sorder);
        lt_count.Text = "Tổng số bình luận: <span style='color: #A52A2A;'>" + numitems.ToString()+ "</span>";
        rpitems.DataSource = dt;
        rpitems.DataBind();
        ltpage.Text = WEB.Common.PhanTrang("?mod=comment&c=items&iid=" + iid.ToString() + "&key=" + key.Trim() + "&st=" + istatus.ToString() + "&order=" + iorder.ToString() + "&ordertype=" + iordertype.ToString(), curpage, numitems, 20);
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
                    lnkdelete.Visible = false;
                    lttitle.Text = "Cập nhật bình luận";
                    pnlist.Visible = false;
                pnanswer.Visible = false;
                    pndetail.Visible = true;
                    this.hd_insertupdate.Value = "update";
                    this.hdiid.Value = p.Trim();
                    DataTable dt = new DataTable();
                    clear();
                    dt = WEB.Item_comment.getitembyicomment(p);
                if (dt.Rows.Count > 0)
                {
                    DataTable dtit = WEB.Items.getitembyid(dt.Rows[0]["iid"].ToString());
                    if (dtit.Rows.Count > 0)
                        ltlink.Text = "<a href='/" + dtit.Rows[0]["valias"].ToString() + "' target='_blank'>" + dtit.Rows[0]["vtitle"].ToString() + "</a>";
                    txtcontent.Text = dt.Rows[0]["vcontent"].ToString();
                    txtname.Text = dt.Rows[0]["vname"].ToString();
                    txtphone.Text = dt.Rows[0]["vpr1"].ToString();
                    txtemail.Text = dt.Rows[0]["vemail"].ToString();
                    txtorder.Text = dt.Rows[0]["ipr1"].ToString();
                    txtnewsname.Text = dt.Rows[0]["vtitle"].ToString();
                    txt_updatetime.Text = Convert.ToDateTime(dt.Rows[0]["dcreatedate"].ToString()).ToString("dd/MM/yyyy");
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlhour, Convert.ToDateTime(dt.Rows[0]["dcreatedate"].ToString()).Hour.ToString());
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlminute, Convert.ToDateTime(dt.Rows[0]["dcreatedate"].ToString()).Minute.ToString());
                    if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                        chkstatus.Checked = false;
                    else
                        chkstatus.Checked = true;
                }
                break;
            case "Answer":
                ltdetailmsg.Text = "";
                lnkupdate.Visible = true;
                lnkclose.Visible = true;
                lnkdelete.Visible = false;
                lttitle.Text = "Trả lời bình luận";
                p = e.CommandArgument.ToString().Trim().Substring(0, e.CommandArgument.ToString().IndexOf("|"));
                hdiid.Value = p;
                string item = e.CommandArgument.ToString().Substring(e.CommandArgument.ToString().IndexOf("|") + 1, e.CommandArgument.ToString().Length - e.CommandArgument.ToString().IndexOf("|") - 1);
                hditem.Value = item;
                DataTable dtita = WEB.Items.getitembyid(item);
                if (dtita.Rows.Count > 0)
                    ltlinkanswer.Text = "<a href='/" + dtita.Rows[0]["valias"].ToString() + "' target='_blank'>" + dtita.Rows[0]["vtitle"].ToString() + "</a>";
                DataTable dtcm = WEB.Item_comment.getitembyicomment(p);
                if (dtcm.Rows.Count > 0)
                {
                    hdlevel.Value = dtcm.Rows[0]["ilevel"].ToString();
                    hdnumanswer.Value = dtcm.Rows[0]["ipr2"].ToString(); 
                }
                pnanswer.Visible = true;
                pndetail.Visible = false;
                pnlist.Visible = false;
                this.hd_insertupdate.Value = "answer";
                txtnameanswer.Text= Session["admin"].ToString();
                
                break;
            case "ChangeStatus":
                p = e.CommandArgument.ToString().Trim().Substring(0, e.CommandArgument.ToString().IndexOf("|"));
                string status = e.CommandArgument.ToString().Substring(e.CommandArgument.ToString().IndexOf("|") + 1, e.CommandArgument.ToString().Length - e.CommandArgument.ToString().IndexOf("|") - 1);
                if (status == "1")
                    status = "0";
                else
                    status = "1";
                DataTable dtc = WEB.Item_comment.getitembyicomment(p);
                if(dtc.Rows.Count>0)
                {
                    double n = 0;
                    DataTable dtl = WEB.Item_comment.getlistitembypage(new string[0], "", dtc.Rows[0]["iid"].ToString(), "","1", 0, 100, "icmid desc");
                    if (dtl.Rows.Count > 0)
                    {
                        for (int i = 0; i < dtl.Rows.Count; i++)
                        {
                            n += Convert.ToInt32(dtl.Rows[i]["ipr1"]);
                        }
                        n = Math.Round(n / dtl.Rows.Count);
                    }
                    else
                        n = Convert.ToDouble(dtc.Rows[0]["ipr1"]);
                    string[] sf = { "iparam9" };
                    object[] vv = { n };
                    WEB.Items.save(Convert.ToInt32(dtc.Rows[0]["iid"].ToString()),sf,vv);
                }
                WEB.Item_comment.updatestatus(p, status);
                this.UpdateList();
                break;
            case "delete":
                    WEB.Logs.writelog("Xóa bình luận: " + p);
                    WEB.Item_comment.db_items_comment_delete(p);
                    UpdateList();
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
            if(hd_insertupdate.Value== "update")
            {
                if (txtname.Text.Length == 0)
                {
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập họ tên</p>";
                    ltdetailmsg.Visible = true;
                    txtname.Focus();
                    return;
                }

                if (txtcontent.Text.Length == 0)
                {
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập nội dung bình luận</p>";
                    ltdetailmsg.Visible = true;
                    txtcontent.Focus();
                    return;
                }

                if (WEB.Common.Check_number(txtorder.Text) == false)
                {
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Số sao phải là số</p>";
                    ltdetailmsg.Visible = true;
                    txtorder.Focus();
                    return;
                }

                string istatus = "0";
                if (chkstatus.Checked == true)
                {
                    DataTable dtc = WEB.Item_comment.getitembyicomment(hdiid.Value);
                    if (dtc.Rows.Count > 0)
                    {
                        double n = 0;
                        DataTable dtl = WEB.Item_comment.getlistitembypage(new string[0], "", dtc.Rows[0]["iid"].ToString(), "", "1", 0, 100, "icmid desc");
                        if (dtl.Rows.Count > 0)
                        {
                            for (int i = 0; i < dtl.Rows.Count; i++)
                            {
                                n += Convert.ToInt32(dtl.Rows[i]["ipr1"]);
                            }
                            n = Math.Round(n / dtl.Rows.Count);
                        }
                        else
                            n = Convert.ToDouble(dtc.Rows[0]["ipr1"]);
                        string[] sf = { "iparam9" };
                        object[] vv = { n };
                        WEB.Items.save(Convert.ToInt32(dtc.Rows[0]["iid"].ToString()), sf, vv);
                    }
                    istatus = "1";
                }
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
                string[] ss = { "vname", "vpr1", "vemail", "vtitle", "vcontent", "istatus", "ipr1" };
                object[] o = { txtname.Text, txtphone.Text, txtemail.Text, txtnewsname.Text, txtcontent.Text, istatus, txtorder.Text };
                WEB.Item_comment.save(Convert.ToInt32(hdiid.Value), ss, o);

                lttitle.Text = "Quản lý bình luận - Cập nhật bình luận thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật bình luận: " + ltlink.Text);
                UpdateList();

            }
            else
            {
                string istatus = "0";
                if (chkstatusanswer.Checked == true)
                    istatus = "1";
                string[] ss = {"iid", "vname", "vpr1", "vemail", "vtitle", "vcontent","ilevel","vparlist", "istatus","iuserid","vusername" };
                object[] o = {hditem.Value, txtnameanswer.Text, txtphoneanswer.Text, txtemailanswer.Text, txttitleanswer.Text, txtcontentanswer.Text, Convert.ToInt32(hdlevel.Value)+1,hdiid.Value, istatus, Session["userid"].ToString(), Session["admin"].ToString() };
                WEB.Item_comment.save(-1, ss, o);
                //update đã có câu trả lời
                string[] sss = { "ipr2" };
                object[] ov = { Convert.ToInt32(hdnumanswer.Value) + 1 };
                WEB.Item_comment.save(Convert.ToInt32(hdiid.Value), sss, ov);
                WEB.Logs.writelog("Trả lời bình luận: " + ltlinkanswer.Text);
                UpdateList();
            }

        }

        catch (Exception ex)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật bình luận không thành công</p>" + ex.ToString();
            ltdetailmsg.Visible = true;
        }
    }
   
  
    protected void lnkadd_Click(object sender, EventArgs e)
    {
        clear();
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkdelete.Visible = false;
        lttitle.Text = "Thêm bình luận";
        pnlist.Visible = false;
        pndetail.Visible = true;
        txt_updatetime.Text = Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy");
        WEB.Common.SetSelectedIndexInDropDownList(ref ddlhour, DateTime.Now.Hour.ToString());
        WEB.Common.SetSelectedIndexInDropDownList(ref ddlminute, DateTime.Now.Minute.ToString());
        itemtitle = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, vlan);
        itemdescription = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan);
        itemurl = weburl;
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
        lttitle.Text = "Quản lý bình luận";
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
                    WEB.Logs.writelog("Xóa bình luận hàng loạt");
                    for (int i = 0; i < s.Length; i++)
                    {
                        if (s[i].Length > 0)
                        {
                            WEB.Item_comment.db_items_comment_delete(s[i].ToString());
                        }
                    }
                }
            }
        }
        UpdateList();
    }
    public void btnsearch_Click(object sender, EventArgs e)
    {
        Response.Redirect(weburl + "admin/?mod=comment&c=items&key=" + txtkeysearch.Text.Trim() + "&st=" + ddlstatus.SelectedValue + "&order=" + ddlorder.SelectedValue + "&ordertype=" + ddlordertype.SelectedValue);
    }

}
