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

public partial class admin_advs_adv1 : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            lttitle.Text = "Quản lý quảng cáo";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            ddlposition.Items.Clear();
            ddlcatesearch.Items.Clear();
            DataTable dt = WEB.Category.getcate("-1", WEB.Common.mod_adv, vlan, "1", "1");
            //ddlposition.Items.Add(new ListItem("-- Chọn vị trí quảng cáo --","-1"));
            ddlcatesearch.Items.Add(new ListItem("-- Chọn vị trí quảng cáo --","-1"));
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ddlposition.Items.Add(new ListItem(Space(dt.Rows[i]["ilevel"].ToString()) + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                    ddlcatesearch.Items.Add(new ListItem(Space(dt.Rows[i]["ilevel"].ToString()) + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                }
            }
            this.UpdateList();
        }
    }
    public static string Space(string s)
    {
        string str = "";
        for (int i = 1; i < Convert.ToInt32(s); i++)
            str += "space" + i.ToString();
        return str;
    }
    protected void UpdateList()
    {
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = true;
        lnkdelete.Visible = true;
        pndetail.Visible = false;
        pnlist.Visible = true;
        DataTable dt = new DataTable();
        string[] fieldsearch = { "vtitle" };
        string condition = "vcode ='" + WEB.Common.mod_adv + "' and vlan='" + vlan + "'";
        if (ddlcatesearch.SelectedValue != "-1")
            condition = " (vcode ='" + WEB.Common.mod_adv + "' and vparam1 = '" + ddlcatesearch.SelectedValue + "' )";
        string key = txtkeysearch.Text;
        dt = WEB.Item_other.getlistitembypage(fieldsearch, key, condition, 0, 30, " iid DESC");
        lt_count.Text = "Tổng số quảng cáo: <span style='color: #A52A2A;'>" + dt.Rows.Count + "</span>";
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
                ltdetailmsg.Text = "";
                lnkupdate.Visible = true;
                lnkclose.Visible = true;
                lnkadd.Visible = false;
                lnkdelete.Visible = false;
                lttitle.Text = "Cập nhật quảng cáo";
                pnlist.Visible = false;
                pndetail.Visible = true;
                this.hd_insertupdate.Value = "update";
                this.hdid.Value = p.Trim();
                DataTable dt = new DataTable();
                clear();
                dt = WEB.Item_other.getitembyino(p);
                if (dt.Rows.Count > 0)
                {
                    txtname.Text = dt.Rows[0]["vtitle"].ToString();
                    txt_vdesc.Text = dt.Rows[0]["vdesc"].ToString();
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlposition, dt.Rows[0]["vparam1"].ToString());
                    txtorder.Text = dt.Rows[0]["iorders"].ToString();
                    txtwidth.Text = dt.Rows[0]["vparam2"].ToString();
                    txtheight.Text = dt.Rows[0]["vparam3"].ToString();
                    txtlink.Text=dt.Rows[0]["vparam4"].ToString();
                    hdprdicidlist.Value = dt.Rows[0]["vparam5"].ToString();
                    hdadvs_old.Value = dt.Rows[0]["vcontent"].ToString();
                    ltcates.Text = loadcates("-1", WEB.Common.mod_product);
                    ltcates.Text += loadcates("-1", WEB.Common.mod_product_group);
                    ltcates.Text += loadcates("-1", WEB.Common.mod_news);
                    ltcates.Text += loadcates("-1", WEB.Common.mod_service);
                    //hdid.Value = dt.Rows[0]["ino"].ToString();
                    if (dt.Rows[0]["vcontent"].ToString().Contains(".swf"))
                    {
                        ltimageflash.Text = "<embed height=\"100\" name=\"obj1\" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"" + weburl + "uploads/advs/" + dt.Rows[0]["vcontent"].ToString() + "\">";
                    }
                    else
                    {
                        ltimageflash.Text = "<img src='" + weburl + "uploads/qc/" + dt.Rows[0]["vcontent"].ToString() + "' style='max-width:100px' >";
                    }
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
            case"delete":
                WEB.Item_other.db_items_other_deletebyino(p);
                UpdateList();
                break;
        }
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
                strresult += "<li><input type='checkbox'   name='chk' value='" + dt.Rows[i]["icid"].ToString() + "' ";
                if (hdprdicidlist.Value.Contains(dt.Rows[i]["icid"].ToString()))
                    strresult += " checked='checked' ";
                strresult += "> " + dt.Rows[i]["vname"].ToString();
                strresult += loadcates(dt.Rows[i]["icid"].ToString(), WEB.Common.mod_product);
                strresult += "</li>";

            }
            strresult += "</ul>";
        }
        return strresult;
    }
    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        
        if (WEB.Common.Check_number(txtwidth.Text) == false)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Chiều rộng phải là số</p>";
            ltdetailmsg.Visible = true;
            txtwidth.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtheight.Text) == false)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Chiều cao phải là số</p>";
            ltdetailmsg.Visible = true;
            txtheight.Focus();
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
            tempname = WEB.Common.GetNewTitle(tempname.Replace(fileextention, "")) + fileextention;
            if (fileextention.Equals(".jpg") || fileextention.Equals(".gif") || fileextention.Equals(".jpeg") || fileextention.Equals(".png") )
                {
                    if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/qc/" + tempname) == false)
                        image = tempname;
                    else
                        image = DateTime.Now.Second + "-" + tempname;
                    flupload.SaveAs(Server.MapPath("~/") + "/uploads/qc/" + image);
                }
                else
                {
                    ltdetailmsg.Visible = true;
                    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.jpeg,*.png</p>";
                    return;
                }
            
        }
        string istatus = "0";
        if (chkstatus.Checked == true)
            istatus = "1";
        string lcates = "|" + WEB.Common.GetFormValue("chk").ToString().Replace(",", "|") + "|";
        if (hd_insertupdate.Value.Equals("insert"))
        {

            try
            {
                WEB.Item_other.db_items_other_insert("-1", WEB.Common.mod_adv, vlan, txtname.Text, txt_vdesc.Text, image, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", txtorder.Text, istatus, ddlposition.SelectedValue, txtwidth.Text, txtheight.Text, txtlink.Text, lcates, "0", "0");
                lttitle.Text = "Quản lý quảng cáo - Thêm quảng cáo thành công";
                //ghi log
                //string id = WEB.Dataprovider.getmax("db_items_other", "ino", "vcode ='" + WEB.Common.mod_adv + "'").ToString();
                WEB.Logs.writelog("Thêm quảng cáo: " + txtname.Text);
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
                    image = hdadvs_old.Value;
                else
                {
                    try
                    {
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/qc/" + hdadvs_old.Value);
                    }
                    catch
                    {
                    }
                }
                WEB.Item_other.db_items_other_update(hdid.Value, "-1", WEB.Common.mod_adv, vlan, txtname.Text, txt_vdesc.Text, image, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", txtorder.Text, istatus, ddlposition.SelectedValue, txtwidth.Text, txtheight.Text, txtlink.Text, lcates, "0", "0");
                lttitle.Text = "Quản lý quảng cáo - Cập nhật quảng cáo thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật quảng cáo: " + txtname.Text);
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
        lttitle.Text = "Thêm quảng cáo";
        pnlist.Visible = false;
        pndetail.Visible = true;
        this.hd_insertupdate.Value = "insert";
        ltcates.Text = loadcates("-1", WEB.Common.mod_product);
        ltcates.Text += loadcates("-1", WEB.Common.mod_product_group);
        ltcates.Text += loadcates("-1", WEB.Common.mod_news);
        ltcates.Text += loadcates("-1", WEB.Common.mod_service);
    }
    protected void clear()
    {
        txt_vdesc.Text = "";
        txtheight.Text = "0";
        txtlink.Text = "";
        txtname.Text = "";
        txtorder.Text = "0";
        txtwidth.Text = "0";
        ltimageflash.Text = "";
    }
    protected void lnkclose_Click(object sender, EventArgs e)
    {
        UpdateList();
    }
    public string formatdate(DateTime date)
    {

        return WEB.Common.Formatdate(date);
    }
    public string getpic_flash(string str)
    {
        if(str.Length>0)
        {
            if (str.Contains(".swf"))
            {
                return "<embed height=\"50\" name=\"obj1\" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"" + weburl + "uploads/advs/" + str + "\">";
            }
            else
            {
                return "<img height='50' style='max-width:300px' src='" + weburl + "uploads/advs/" + str +  "'>";
            }

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

                        }
                    }
                }
            }
        }
        UpdateList();
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        UpdateList();
    }
}
