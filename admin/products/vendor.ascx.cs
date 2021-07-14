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

public partial class admin_products_group : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int n = 0;
    public string role = "";
    public int icid = -1;
    public string itemurl = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        role = Session["role"].ToString();
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("cid")))
        {
            icid = Convert.ToInt32(WEB.Common.GeturlParam("cid"));
        }
        if (!IsPostBack)
        {

            lttitle.Text = "Quản lý nhà sản xuất";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            this.UpdateList();
            if (icid != -1)
                getdetail(icid.ToString());
        }

    }
    public void getdetail(string cid)
    {
        if (checkrole("2042"))
        {
            clear();
            ltdetailmsg.Text = "";
            lnkupdate.Visible = true;
            lnkclose.Visible = true;
            lnkadd.Visible = false;
            lnkdelete.Visible = false;
            lttitle.Text = "Cập nhật nhà sản xuất";
            pnlist.Visible = false;
            pndetail.Visible = true;
            this.hd_insertupdate.Value = "update";
            this.hdicid.Value = cid;
            DataTable dt = new DataTable();
            dt = WEB.Category.getcatebyid(cid);
            if (dt.Rows.Count > 0)
            {
                txtname.Text = dt.Rows[0]["vname"].ToString().Trim();
                hdname.Value = txtname.Text = dt.Rows[0]["vtitle"].ToString();
                txtorder.Text = dt.Rows[0]["iorders"].ToString().Trim();
                txtdesc.Text = dt.Rows[0]["vdesc"].ToString().Trim();
                txtaddress.Text = dt.Rows[0]["vparam4"].ToString().Trim();
                txtphone.Text = dt.Rows[0]["vparam3"].ToString().Trim();
                txturl.Text = hdalias.Value = dt.Rows[0]["valias"].ToString().Trim();
                txtemail.Text = dt.Rows[0]["vparam2"].ToString().Trim();
                itemurl = dt.Rows[0]["valias"].ToString().Trim();
                if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                    chkstatus.Checked = false;
                else
                    chkstatus.Checked = true;
                hdprdicidlist.Value = dt.Rows[0]["vicon"].ToString();
                ltcatesck.Text = loadcates("-1", WEB.Common.mod_product);
                if (dt.Rows[0]["vimg"].ToString().Length > 0)
                {
                    chkdeleteimg.Visible = true;
                    hdimg_old.Value = dt.Rows[0]["vimg"].ToString();
                    ltimage.Text = "<img src='" + weburl + "uploads/products/venders/" + dt.Rows[0]["vimg"].ToString() + "' style='max-width:100px;height:80px' >";
                }
                else
                    chkdeleteimg.Visible = false;
            }
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
        txtaddress.Text = "";
        txtemail.Text = "";
        txtphone.Text = "";
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
    public bool checkrole(string s)
    {
        if (role.Contains("|" + s + "|"))
            return true;
        else
            return false;
    }
    protected void UpdateList()
    {
        n = 0;

        pndetail.Visible = false;
        pnlist.Visible = true;
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        if (checkrole("2041"))
            lnkadd.Visible = true;
        else
            lnkadd.Visible = false;
        if (checkrole("2043"))
            lnkdelete.Visible = true;
        else
            lnkdelete.Visible = false;
        DataTable dt = new DataTable();

        dt = WEB.Category.getcate("-1", WEB.Common.mod_product_vendor, vlan, "1", "-1");
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
                if (checkrole("2042"))
                {
                   
                    ltdetailmsg.Text = "";
                    lnkupdate.Visible = true;
                    lnkclose.Visible = true;
                    lnkadd.Visible = false;
                    lnkdelete.Visible = false;
                    lttitle.Text = "Cập nhật nhà sản xuất";
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
                        txtaddress.Text = dt.Rows[0]["vparam4"].ToString().Trim();
                        txtphone.Text = dt.Rows[0]["vparam3"].ToString().Trim();
                        txtemail.Text = dt.Rows[0]["vparam2"].ToString().Trim();
                        txturl.Text = hdalias.Value = dt.Rows[0]["valias"].ToString().Trim();
                        itemurl = dt.Rows[0]["valias"].ToString().Trim();
                        if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                            chkstatus.Checked = false;
                        else
                            chkstatus.Checked = true;
                        hdprdicidlist.Value = dt.Rows[0]["vicon"].ToString();
                        ltcatesck.Text = loadcates("-1", WEB.Common.mod_product);
                        if (dt.Rows[0]["vimg"].ToString().Length > 0)
                        {
                            chkdeleteimg.Visible = true;
                            hdimg_old.Value = dt.Rows[0]["vimg"].ToString();
                            ltimage.Text = "<img src='" + weburl + "uploads/products/venders/" + dt.Rows[0]["vimg"].ToString() + "' style='max-width:100px;height:80px' >";
                        }
                        else
                            chkdeleteimg.Visible = false;
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
                WEB.Category.updatestatus(p, status);
                this.UpdateList();
                break;
            case "delete":
                if (checkrole("2043"))
                {
                    WEB.Category.db_categories_delete(p);
                    UpdateList();
                }
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
        string lcates = "|" + WEB.Common.GetFormValue("chk").ToString().Replace(",", "|") + "|";
        string image = "";
        if (this.flupload.FileName.Trim().Length > 0)
        {
            string tempname = System.IO.Path.GetFileName(flupload.PostedFile.FileName);
            string fileextention = "";
            fileextention = System.IO.Path.GetExtension(tempname).ToLower();
            tempname = WEB.Common.GetNewTitle(tempname.Replace(fileextention, "")) + fileextention;
            if (fileextention.Equals(".jpg") || fileextention.Equals(".jpeg") || fileextention.Equals(".gif") || fileextention.Equals(".png"))
            {
                if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/products/venders/" + tempname) == false)
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

                //flupload.SaveAs(Server.MapPath("~/") + "/uploads/products/venders/" + image);


                int width = 0;
                int height = 0;
                if (WEB.Config.getvaluebykey(WEB.Config.k_imgprdwidth, vlan).Length > 0)
                    width = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgprdwidth, vlan));
                if (WEB.Config.getvaluebykey(WEB.Config.k_imgprdheight, vlan).Length > 0)
                    height = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgprdheight, vlan));
                System.Drawing.Image oImage = WEB.Common.ScaleImage(bmpPostedImage, fileextention, width, height);
                if (fileextention == ".png")
                    oImage.Save(Server.MapPath("~/") + "/uploads/products/venders/" + image, System.Drawing.Imaging.ImageFormat.Png);
                if (fileextention == ".jpg" || fileextention == ".jpeg")
                    oImage.Save(Server.MapPath("~/") + "/uploads/products/venders/" + image, System.Drawing.Imaging.ImageFormat.Jpeg);
                if (fileextention == ".gif")
                    oImage.Save(Server.MapPath("~/") + "/uploads/products/venders/" + image, System.Drawing.Imaging.ImageFormat.Gif);
            }
            else
            {
                ltdetailmsg.Visible = true;
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.bmp,*.png</p>";
                return;
            }
        }

        if (hd_insertupdate.Value.Equals("insert"))
        {
            if (txturl.Text.Length == 0)
            {
                if (vlan != "ENG" && vlan != "VIE")
                    txturl.Text = WEB.Common.getalias("employer");
                else
                    txturl.Text = WEB.Common.getalias(txtname.Text);
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
                    txturl.Text = WEB.Common.getalias("employer");
                else
                    txturl.Text = WEB.Common.getalias(txtname.Text);
            }
            else
            {
                if (txturl.Text != hdalias.Value)
                {
                    txturl.Text = WEB.Common.getalias1(txturl.Text);
                }
                else
                {
                    if (txtname.Text != hdname.Value)
                    {

                        if (vlan != "ENG" && vlan != "VIE")
                        {
                        }
                        else
                            txturl.Text = WEB.Common.getalias(txtname.Text);
                    }
                }
            }
        }
        if (hd_insertupdate.Value.Equals("insert"))
        {
            try
            {
                //WEB.Item_other.db_items_other_insert(WEB.Common.mod_adv,vlan, txtname.Text, txtlink.Text,image, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), adv_type, txtorder.Text, istatus,ddlposition.SelectedValue,txtwidth.Text,txtheight.Text, "", "", "0", "0");
                WEB.Category.db_categories_insert(WEB.Common.mod_product_vendor, vlan, "-1", txturl.Text, txtname.Text.Trim(), txtdesc.Text, image, lcates, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "1", txtorder.Text, istatus, txtname.Text, txtemail.Text, txtphone.Text, txtaddress.Text, "", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý nhà sản xuất - Thêm nhà sản xuất thành công";
                //ghi log
                string id = WEB.Dataprovider.getmax("db_categories", "icid", "").ToString();
                WEB.Logs.writelog("Thêm nhà sản xuất: " + txtname.Text);
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
                if (image == "")
                    image = hdimg_old.Value;
                else
                {
                    System.IO.File.Delete(Server.MapPath("~/") + "/uploads/products/venders" + hdimg_old.Value);

                }
                if (chkdeleteimg.Checked == true)
                {
                    image = "";
                    System.IO.File.Delete(Server.MapPath("~/") + "/uploads/products/venders" + hdimg_old.Value);

                }
}
            catch
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật dữ liệu</p>";
                ltdetailmsg.Visible = true;
            }
                WEB.Category.db_categories_update(hdicid.Value, WEB.Common.mod_product_vendor, vlan, "-1", txturl.Text, txtname.Text.Trim(), txtdesc.Text, image, lcates, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), txtorder.Text, istatus, txtname.Text, txtemail.Text, txtphone.Text, txtaddress.Text, Session["admin"].ToString(), "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý nhà sản xuất - Cập nhật nhà sản xuất thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật nhà sản xuất: " + txtname.Text);
            

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
        lttitle.Text = "Thêm nhà sản xuất";
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
                if (hd_insertupdate.Value == "insert")
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
