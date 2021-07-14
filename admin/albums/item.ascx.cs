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
    public int curpage = 0;
    public string key = "";
    public int icid = -1;
    public int istatus = -1;
    public int numitems = 0;
    public string role = "";
    public int iid = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        role = Session["role"].ToString();
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("id")))
        {
            iid = Convert.ToInt32(WEB.Common.GeturlParam("id"));
        }
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
        if (WEB.Common.GeturlParam("key").Length > 0)
        {
            key = WEB.Common.GeturlParam("key");
        }
        if (!IsPostBack)
        {


            numitems = WEB.Products.getnumitem();
            //lttitle.Text = numitems.ToString();

            lttitle.Text = "Danh sách ảnh";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            DataTable dt = new DataTable();
            dt = WEB.Category.getcate("-1", WEB.Common.mod_albums, vlan, "1", "-1");
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
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlordertype, iordertype.ToString());
            this.UpdateList();
            if (iid != -1)
                getdetail(iid.ToString());
        }
    }
    public void getdetail(string id)
    {
        if (checkrole("2522"))
        {
            ltdetailmsg.Text = "";
            lnkupdate.Visible = true;
            lnkclose.Visible = true;
            lnkadd.Visible = false;
            lnkdelete.Visible = false;
            lttitle.Text = "Cập nhật ảnh";
            pnlist.Visible = false;
            pndetail.Visible = true;
            this.hd_insertupdate.Value = "update";
            this.hdiid.Value = id;
            DataTable dt = new DataTable();
            dt = WEB.Items.getitembyid(id);
            if (dt.Rows.Count > 0)
            {
                WEB.Common.SetSelectedIndexInDropDownList(ref ddlcate, dt.Rows[0]["icid"].ToString());
                txtdesc.Text = dt.Rows[0]["vdesc"].ToString();
                txtcontent.Text = dt.Rows[0]["vcontent"].ToString();
                hdimg_old.Value = dt.Rows[0]["vimg"].ToString();
                txtnewsname.Text = dt.Rows[0]["vtitle"].ToString().Trim();
                if (dt.Rows[0]["vimg"].ToString().Length > 0)
                    ltimage.Text = "<img src='" + weburl + "uploads/albums/" + dt.Rows[0]["vimg"].ToString() + "' style='max-width:500px;height:80px' >";
                hdcreatedate.Value = Convert.ToDateTime(dt.Rows[0]["dcreatedate"].ToString()).ToString("MM/dd/yyyy hh:mm:ss tt");
                hdupdatedate.Value = Convert.ToDateTime(dt.Rows[0]["dupdate"].ToString()).ToString("MM/dd/yyyy hh:mm:ss tt");
                try
                {
                    txt_updatetime.Text = Convert.ToDateTime(dt.Rows[0]["vparam5"].ToString()).ToString("dd/MM/yyyy");
                }
                catch { }
                txt_tag.Text = dt.Rows[0]["vkey"].ToString();
                txtorder.Text = dt.Rows[0]["iparam1"].ToString();
                hdiviews.Value = dt.Rows[0]["iviews"].ToString();
                if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                    chkstatus.Checked = false;
                else
                    chkstatus.Checked = true;
                txttitleweb.Text = dt.Rows[0]["vparam1"].ToString();
                txtkeyword.Text = dt.Rows[0]["vparam2"].ToString();
                txtmetadesc.Text = dt.Rows[0]["vparam3"].ToString();
                txtlink.Text = dt.Rows[0]["vparam6"].ToString();
                if (dt.Rows[0]["vparam4"].ToString().Contains("1"))
                    chknew.Checked = true;
                else
                    chknew.Checked = false;
                if (dt.Rows[0]["vparam4"].ToString().Contains("2"))
                    chkhot.Checked = true;
                else
                    chkhot.Checked = false;

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
    public bool check(string str)
    {
        if (str == "1")
            return true;
        else
            return false;
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
        txtorder.Text = "0";
        txttitleweb.Text = "";
        ltimage.Text = "";
        ltdetailmsg.Text = "";
    }
    protected void UpdateList()
    {
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        if (checkrole("2521"))
            lnkadd.Visible = true;
        else
            lnkadd.Visible = false;
        if (checkrole("2523"))
            lnkdelete.Visible = true;
        else
            lnkdelete.Visible = false;
        pndetail.Visible = false;
        pnlist.Visible = true;
        DataTable dt = new DataTable();
        string[] fieldsearch = { "vkey", "vtitle", "vtitle_no","valias" };
        string condition = ""; 
        string sorder = "iid desc";
        if (iorder == 0)
            sorder = "dcreatedate";
        else if (iorder == 1)
            sorder = "dupdate";
        else if (iorder == 2)
            sorder = "vtitle";
        if (iordertype == 1)
            sorder += " asc";
        else
            sorder += " desc";
        key = WEB.Common.remove_specical_char(txtkeysearch.Text);
        numitems = WEB.Items.getnumitems(key, fieldsearch,WEB.Common.mod_albums, icid.ToString(), vlan, condition, istatus.ToString());
        dt = WEB.Items.getlistitembypage(icid.ToString(), fieldsearch, key, WEB.Common.mod_albums, vlan, condition, istatus.ToString(), curpage - 1, 20, sorder);
     
       lt_count.Text = "Tổng số ảnh: <span style='color: #A52A2A;'>"+numitems.ToString()+"</span>";
        rpitems.DataSource = dt;
        rpitems.DataBind();
        ltpage.Text = WEB.Common.PhanTrang("?mod=albums&c=items&cid=" + icid.ToString()  + "&key=" + key.Trim() + "&order=" + iorder.ToString() + "&ordertype=" + iordertype.ToString(), curpage, numitems, 20);
    }
    protected void rpitems_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        string c = e.CommandName.Trim();
        string p = e.CommandArgument.ToString().Trim();
        switch (c)
        {
            case "EditDetail":
                if (checkrole("2522"))
                {
                    ltdetailmsg.Text = "";
                    lnkupdate.Visible = true;
                    lnkclose.Visible = true;
                    lnkadd.Visible = false;
                    lnkdelete.Visible = false;
                    lttitle.Text = "Cập nhật ảnh";
                    pnlist.Visible = false;
                    pndetail.Visible = true;
                    this.hd_insertupdate.Value = "update";
                    this.hdiid.Value = p.Trim();
                    DataTable dt = new DataTable();
                    dt = WEB.Items.getitembyid(p);
                    if (dt.Rows.Count > 0)
                    {
                        WEB.Common.SetSelectedIndexInDropDownList(ref ddlcate, dt.Rows[0]["icid"].ToString());
                        txtdesc.Text = dt.Rows[0]["vdesc"].ToString();
                        txtcontent.Text = dt.Rows[0]["vcontent"].ToString();
                        hdimg_old.Value = dt.Rows[0]["vimg"].ToString();
                        txtnewsname.Text = dt.Rows[0]["vtitle"].ToString().Trim();
                        if (dt.Rows[0]["vimg"].ToString().Length > 0)
                            ltimage.Text = "<img src='" + weburl + "uploads/albums/" + dt.Rows[0]["vimg"].ToString() + "' style='max-width:500px;height:80px' >";
                        hdcreatedate.Value = Convert.ToDateTime(dt.Rows[0]["dcreatedate"].ToString()).ToString("MM/dd/yyyy hh:mm:ss tt");
                        hdupdatedate.Value = Convert.ToDateTime(dt.Rows[0]["dupdate"].ToString()).ToString("MM/dd/yyyy hh:mm:ss tt");
                        try
                        {
                            txt_updatetime.Text = Convert.ToDateTime(dt.Rows[0]["vparam5"].ToString()).ToString("dd/MM/yyyy");
                        }
                        catch { }
                        txt_tag.Text = dt.Rows[0]["vkey"].ToString();
                        txtorder.Text = dt.Rows[0]["iparam1"].ToString();
                        hdiviews.Value = dt.Rows[0]["iviews"].ToString();
                        if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                            chkstatus.Checked = false;
                        else
                            chkstatus.Checked = true;
                        txttitleweb.Text = dt.Rows[0]["vparam1"].ToString();
                        txtkeyword.Text = dt.Rows[0]["vparam2"].ToString();
                        txtmetadesc.Text = dt.Rows[0]["vparam3"].ToString();
                        txtlink.Text = dt.Rows[0]["vparam6"].ToString();
                        if (dt.Rows[0]["vparam4"].ToString().Contains("1"))
                            chknew.Checked = true;
                        else
                            chknew.Checked = false;
                        if (dt.Rows[0]["vparam4"].ToString().Contains("2"))
                            chkhot.Checked = true;
                        else
                            chkhot.Checked = false;

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
                if (checkrole("2523"))
                {
                    //lt_iid.Text = p;
                    WEB.Logs.writelog("Xóa ảnh: " + getname(p));
                    WEB.Items.db_items_delete(p);
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
        if (txtnewsname.Text.Length == 0)
        {
            ltdetailmsg.Text = "Xin mời nhập tiêu đề ảnh";
            ltdetailmsg.Visible = true;
            txtnewsname.Focus();
            return;
        }
        if (txtnewsname.Text.Length > 200)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Tiêu đề ảnh tối đa 200 ký tự</p>";
            ltdetailmsg.Visible = true;
            txtnewsname.Focus();
            return;
        }
        if (ltimage.Text == "")
        {
            if (flupload.FileName.Trim().Length == 0)
            {
                ltdetailmsg.Text = "Xin mời chọn hình ảnh";
                ltdetailmsg.Visible = true;
                flupload.Focus();
                return;
            }
        }
        if (WEB.Common.Check_number(txtorder.Text).ToString().Length <0)
        {
            ltdetailmsg.Text = "Xin nời nhập thứ tự cho ảnh";
            ltdetailmsg.Visible = true;
            txtorder.Focus();
            return;
        }
        string image = "";
        if (this.flupload.FileName.Trim().Length > 0)
        {
            string tempname =System.IO.Path.GetFileName(flupload.PostedFile.FileName);
            string fileextention = "";
            fileextention = System.IO.Path.GetExtension(tempname).ToLower();
            tempname = WEB.Common.GetNewTitle(tempname.Replace(fileextention, "")) + fileextention;
            if (fileextention.Equals(".jpg") || fileextention.Equals(".jpeg") || fileextention.Equals(".gif") ||  fileextention.Equals(".png"))
            {
                if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/albums/" + tempname) == false)
                    image = tempname;
                else
                    image = DateTime.Now.Second + "-" + tempname;
                System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(flupload.PostedFile.InputStream);
                


                int thumbwidth = 0;
                int thumbheight = 0;
                if (WEB.Config.getvaluebykey("txtalbumwidth", vlan).Length > 0)
                    thumbwidth = Convert.ToInt32(WEB.Config.getvaluebykey("txtalbumwidth", vlan));
                if (WEB.Config.getvaluebykey("txtalbumheight", vlan).Length > 0)
                    thumbheight = Convert.ToInt32(WEB.Config.getvaluebykey("txtalbumheight", vlan));
                System.Drawing.Image objImage = WEB.Common.ScaleImage(bmpPostedImage, fileextention, thumbwidth, thumbheight);

                if (fileextention == ".png")
                    objImage.Save(Server.MapPath("~/") + "/uploads/albums/" + image, System.Drawing.Imaging.ImageFormat.Png);
                if (fileextention == ".jpg" || fileextention == ".jpeg")
                    objImage.Save(Server.MapPath("~/") + "/uploads/albums/" + image, System.Drawing.Imaging.ImageFormat.Jpeg);
                if (fileextention == ".gif")
                    objImage.Save(Server.MapPath("~/") + "/uploads/albums/" + image, System.Drawing.Imaging.ImageFormat.Gif);

              


                int thumbwidththumbs = 0;
                int thumbheightthumbs = 0;
                if (WEB.Config.getvaluebykey("txtalbumwidththumbs", vlan).Length > 0)
                    thumbwidththumbs = Convert.ToInt32(WEB.Config.getvaluebykey("txtalbumwidththumbs", vlan));
                if (WEB.Config.getvaluebykey("txtalbumheightthumbs", vlan).Length > 0)
                    thumbheightthumbs = Convert.ToInt32(WEB.Config.getvaluebykey("txtalbumheightthumbs", vlan));
                System.Drawing.Image objImage1 = WEB.Common.ScaleImage(bmpPostedImage, fileextention, thumbwidththumbs, thumbheightthumbs);
                
                if (fileextention == ".png")
                    objImage1.Save(Server.MapPath("~/") + "/uploads/albums/thumbs/" + image, System.Drawing.Imaging.ImageFormat.Png);
                if (fileextention == ".jpg" || fileextention == ".jpeg")
                    objImage1.Save(Server.MapPath("~/") + "/uploads/albums/thumbs/" + image, System.Drawing.Imaging.ImageFormat.Jpeg);
                if (fileextention == ".gif")
                    objImage1.Save(Server.MapPath("~/") + "/uploads/albums/thumbs/" + image, System.Drawing.Imaging.ImageFormat.Gif);

              
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
        if (hdcreatedate.Value.Length == 0)
        {
            hdcreatedate.Value = DateTime.Now.ToString("dd/MM/yyyy");
        }
        else
        {
            try
            {
                hdcreatedate.Value = Convert.ToDateTime(txt_updatetime.Text.Trim()).ToString("dd/MM/yyyy");
            }
            catch
            {
                hdcreatedate.Value = DateTime.Now.ToString("dd/MM/yyyy");
            }
        }
        if (hd_insertupdate.Value.Equals("insert"))
        {
           
            try
            {
            WEB.Items.db_items_insert(ddlcate.SelectedValue, WEB.Common.mod_albums, vlan, WEB.Common.getalias(txtnewsname.Text.Trim()), txt_tag.Text, txtnewsname.Text, WEB.Common.GetNosign(txtnewsname.Text.Trim()), txtdesc.Text, txtcontent.Text, image, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), "0", "0", Convert.ToDateTime(hdcreatedate.Value).ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", istatus, txttitleweb.Text, txtkeyword.Text, txtmetadesc.Text, newhotsale, txt_updatetime.Text, txtlink.Text, "", "", "", "","","","","","", txtorder.Text, "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý ảnh - Thêm ảnh thành công";
                //ghi log
                string id = WEB.Dataprovider.getmax("db_items", "iid", "vcode ='" + WEB.Common.mod_albums + "'").ToString();
                WEB.Logs.writelog("Thêm ảnh : " + txtnewsname.Text);
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
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/albums/" + hdimg_old.Value);
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/albums/thumbs" + hdimg_old.Value);
                    }
                    catch
                    {
                    }
                }
                WEB.Items.db_items_update(hdiid.Value, ddlcate.SelectedValue, WEB.Common.mod_albums, vlan, WEB.Common.getalias(txtnewsname.Text.Trim()),txt_tag.Text, txtnewsname.Text, WEB.Common.GetNosign(txtnewsname.Text.Trim()), txtdesc.Text, txtcontent.Text, image,"0", "0", DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), istatus, txttitleweb.Text, txtkeyword.Text, txtmetadesc.Text, newhotsale, txt_updatetime.Text, txtlink.Text, "", "", "", "","","","","","", txtorder.Text, "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý ảnh - Cập nhật ảnh thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật ảnh : " +txtnewsname.Text);
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
        clear();
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        lttitle.Text = "Thêm ảnh";
        pnlist.Visible = false;
        pndetail.Visible = true;
        txt_updatetime.Text = Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy");
        this.hd_insertupdate.Value = "insert";
    }

    protected void lnkclose_Click(object sender, EventArgs e)
    {
        lttitle.Text = "Quản lý ảnh";
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
            return "<img height='40' style='max-width:300px' src='" + weburl + "uploads/albums/" + str + "'>";
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
                    WEB.Logs.writelog("Xóa ảnh hàng loạt");
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
        Response.Redirect(weburl + "admin/?mod=albums&c=items&cid=" + ddlcatesearch.SelectedValue  + "&key=" + txtkeysearch.Text.Trim() + "&order=" + ddlorder.SelectedValue + "&ordertype=" + ddlordertype.SelectedValue);
    }

}
