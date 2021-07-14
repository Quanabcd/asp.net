using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class admin_content_category : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int n = 0;
    public string itemtitle = "";
    public string itemurl = "";
    public string itemdescription = "";
    public string role = "";
    public int icid = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        role = Session["role"].ToString();
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("cid")))
        {
            icid = Convert.ToInt32(WEB.Common.GeturlParam("cid"));
        }
        if (!IsPostBack)
        {
            CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
            _FileBrowser.BasePath = "../ckfinder";
            _FileBrowser.SetupCKEditor(txt_mota);
           
            lttitle.Text = "Quản lý danh mục trang nội dung";
            lnkupdate.Visible = false;
            lnkclose.Visible = false;
            lnkadd.Visible = true;
            lnkdelete.Visible = true;
            ltdetailmsg.Visible = false;
            this.UpdateList();
            ltlink.Text = "";
            if (icid != -1)
                getdetail(icid.ToString());

        }
        DataTable dt = new DataTable();
        dt = WEB.Category.getcate("-1", WEB.Common.mod_content, vlan, "1","-1");
        ddlcate.Items.Clear();
        ddlcate.Items.Add(new ListItem("Danh mục chính", "-1"));
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string space = "";
            for (int j = 1; j < Convert.ToInt32(dt.Rows[i]["ilevel"].ToString()); j++)
            {
                space += "..";
            }

            this.ddlcate.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));

            space = "";
        }
    }
    public void getdetail(string cid)
    {
        if (checkrole("2222"))
        {
            clear();
            ltdetailmsg.Text = "";
            lnkupdate.Visible = true;
            lnkclose.Visible = true;
            lnkadd.Visible = false;
            lnkdelete.Visible = false;
            lttitle.Text = "Cập nhật danh mục";
            pnlist.Visible = false;
            pndetail.Visible = true;
            this.hd_insertupdate.Value = "update";
            this.hdicid.Value = cid;
            DataTable dt = new DataTable();
            dt = WEB.Category.getcatebyid(cid);
            if (dt.Rows.Count > 0)
            {
                hdname.Value = txtname.Text = dt.Rows[0]["vname"].ToString().Trim();
                txtorder.Text = dt.Rows[0]["iorders"].ToString().Trim();
                itemtitle = txttitleweb.Text = dt.Rows[0]["vparam1"].ToString().Trim();
                hd_imgicon.Value = dt.Rows[0]["vicon"].ToString().Trim();
                hdimg_old.Value = dt.Rows[0]["vimg"].ToString().Trim();
                txtkeyword.Text = dt.Rows[0]["vparam2"].ToString().Trim();
                txt_mota.Text = dt.Rows[0]["vdesc"].ToString().Trim();
                itemurl = weburl + dt.Rows[0]["valias"].ToString();
                itemdescription = txtdesc.Text = dt.Rows[0]["vparam3"].ToString().Trim();
                hdtitle.Value = dt.Rows[0]["vname"].ToString().Trim();
                txturl.Text = hdalias.Value = dt.Rows[0]["valias"].ToString().Trim();
                for (int i = 0; i < ddlcate.Items.Count; i++)
                {
                    if (ddlcate.Items[i].Value.Equals(hdicid.Value))
                    {
                        ddlcate.Items.RemoveAt(i);
                        break;
                    }
                }
                hdiusercreate.Value = dt.Rows[0]["iusercreate"].ToString().Trim();
                hdvusercreate.Value = dt.Rows[0]["vusercreate"].ToString().Trim();
                hdcreatedate.Value = Convert.ToDateTime(dt.Rows[0]["dcreatedate"]).ToString("dd/MM/yyyy HH:mm");
                WEB.Common.SetSelectedIndexInDropDownList(ref ddlcate, dt.Rows[0]["iparcid"].ToString());
                if (dt.Rows[0]["vparam4"].ToString().Equals("0"))
                    chkdisplayhome.Checked = false;
                else
                    chkdisplayhome.Checked = true;

                if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                    chkstatus.Checked = false;
                else
                    chkstatus.Checked = true;
                if (dt.Rows[0]["vimg"].ToString().Length > 0)
                {
                    chkdeleteimg.Visible = true;
                    hdimg_old.Value = dt.Rows[0]["vimg"].ToString();
                    ltimage.Text = "<img src='" + weburl + "uploads/contents/images/" + dt.Rows[0]["vimg"].ToString() + "' style='max-width:100px;height:80px' >";
                }
                else
                    chkdeleteimg.Visible = false;
                if (dt.Rows[0]["vicon"].ToString().Length > 0)
                {
                    chkdeleteicon.Visible = true;
                    hd_imgicon.Value = dt.Rows[0]["vicon"].ToString();
                    lt_icon.Text = "<img src='" + weburl + "uploads/contents/images/" + dt.Rows[0]["vicon"].ToString() + "' style='max-width:100px;height:80px' >";
                }
                else
                    chkdeleteicon.Visible = false;

                ltlink.Text = "<tr><td class='key'><label for='listnhom'>Link danh mục</label></td><td><a target='_blank' href='" + weburl + dt.Rows[0]["valias"].ToString() + "'>" + weburl + dt.Rows[0]["valias"].ToString() + "</a></td></tr>";
                loadmenu();
                hdnguoiquanly.Value = dt.Rows[0]["vparam6"].ToString().Trim();
                ltnguoiquanly.Text = loadnguoiquanly();
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
    public void loadmenu()
    {
        DataTable dt = new DataTable();
        if (checkrole("900") == true)
        {
            dt = WEB.Category.getcate("-1", WEB.Common.mod_menu, vlan, "1", "-1");
            ddlcatemainmenu.Items.Clear();
            ddlcatemainmenu.Items.Add(new ListItem("Menu chính", "-1"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string space = "";
                for (int j = 1; j < Convert.ToInt32(dt.Rows[i]["ilevel"].ToString()); j++)
                {
                    space += "..";
                }
                if (dt.Rows[i]["vparam2"].ToString() != hdicid.Value)
                {
                    this.ddlcatemainmenu.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                }
                else
                {
                    txtordermenumain.Text = dt.Rows[i]["iorders"].ToString().Trim();
                    hdicidmainmenu.Value = dt.Rows[i]["icid"].ToString().Trim();
                    if (dt.Rows[i]["istatus"].ToString() == "1")
                        chkmainmenustatus.Checked = true;
                    else
                        chkmainmenustatus.Checked = false;
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlcatemainmenu, dt.Rows[i]["iparcid"].ToString());
                }
                space = "";
            }
            pnmainmenu.Visible = true;
        }
        else
            pnmainmenu.Visible = false;

        if (checkrole("901") == true)
        {
            dt = WEB.Category.getcate("-1", WEB.Common.mod_menutop, vlan, "1", "-1");
            ddlmenutop.Items.Clear();
            ddlmenutop.Items.Add(new ListItem("Menu chính", "-1"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string space = "";
                for (int j = 1; j < Convert.ToInt32(dt.Rows[i]["ilevel"].ToString()); j++)
                {
                    space += "..";
                }
                if (dt.Rows[i]["vparam2"].ToString() != hdicid.Value)
                {
                    this.ddlmenutop.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                }
                else
                {
                    txtordermenutop.Text = dt.Rows[i]["iorders"].ToString().Trim();
                    hdicidtopmenu.Value = dt.Rows[i]["icid"].ToString().Trim();
                    if (dt.Rows[i]["istatus"].ToString() == "1")
                        chkmenutopstatus.Checked = true;
                    else
                        chkmenutopstatus.Checked = false;
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlmenutop, dt.Rows[i]["iparcid"].ToString());
                }
                space = "";
            }
            pntopmenu.Visible = true;
        }
        else
            pntopmenu.Visible = false;

        if (checkrole("902") == true)
        {
            dt = WEB.Category.getcate("-1", WEB.Common.mod_menubottom, vlan, "1", "-1");
            ddlmenubottom.Items.Clear();
            ddlmenubottom.Items.Add(new ListItem("Menu chính", "-1"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string space = "";
                for (int j = 1; j < Convert.ToInt32(dt.Rows[i]["ilevel"].ToString()); j++)
                {
                    space += "..";
                }
                if (dt.Rows[i]["vparam2"].ToString() != hdicid.Value)
                {
                    this.ddlmenubottom.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                }
                else
                {
                    txtorderbottom.Text = dt.Rows[i]["iorders"].ToString().Trim();
                    hdicidbottommenu.Value = dt.Rows[i]["icid"].ToString().Trim();
                    if (dt.Rows[i]["istatus"].ToString() == "1")
                        chkmenubottomstatus.Checked = true;
                    else
                        chkmenubottomstatus.Checked = false;
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlmenubottom, dt.Rows[i]["iparcid"].ToString());
                }
                space = "";
            }
            pnbottommenu.Visible = true;
        }
        else
            pnbottommenu.Visible = false;

        if (checkrole("903") == true)
        {


            dt = WEB.Category.getcate("-1", WEB.Common.mod_menucont, vlan, "1", "-1");
            ddlmenucontent.Items.Clear();
            ddlmenucontent.Items.Add(new ListItem("Menu chính", "-1"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string space = "";
                for (int j = 1; j < Convert.ToInt32(dt.Rows[i]["ilevel"].ToString()); j++)
                {
                    space += "..";
                }
                if (dt.Rows[i]["vparam2"].ToString() != hdicid.Value)
                {
                    this.ddlmenucontent.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                }
                else
                {
                    txtordermenucontent.Text = dt.Rows[i]["iorders"].ToString().Trim();
                    hdicidcontentmenu.Value = dt.Rows[i]["icid"].ToString().Trim();
                    if (dt.Rows[i]["istatus"].ToString() == "1")
                        chkmenucontentstatus.Checked = true;
                    else
                        chkmenucontentstatus.Checked = false;
                    WEB.Common.SetSelectedIndexInDropDownList(ref ddlmenucontent, dt.Rows[i]["iparcid"].ToString());
                }
                space = "";
            }
            pncontentmenu.Visible = true;
        }
        else
            pncontentmenu.Visible = false;
    }
    public void savemenu()
    {
        string mainmenustatus = "0";
        if (chkmainmenustatus.Checked == true)
            mainmenustatus = "1";
        string imainmenulevel = "1";
        if (!ddlcatemainmenu.SelectedValue.Equals("-1"))
        {
            DataTable dt = new DataTable();
            dt = WEB.Category.getcatebyid(ddlcatemainmenu.SelectedValue);
            if (dt.Rows.Count > 0)
                imainmenulevel = (Convert.ToInt32(dt.Rows[0]["ilevel"].ToString()) + 1).ToString();
        }
        //save
        if ((chkmainmenustatus.Checked == true && hd_insertupdate.Value.Equals("insert")) || (hd_insertupdate.Value.Equals("update") && hdicidmainmenu.Value != "-1") || (hd_insertupdate.Value.Equals("update") && chkmainmenustatus.Checked == true))
        {
            string[] sm = { "vname", "vdesc", "vlan", "ccode", "vimg", "iorders", "ilevel", "iparcid", "istatus", "vparam2" };
            object[] om = { txtname.Text, "/" + hdalias.Value, WEB.Common.LangAdmin, WEB.Common.mod_menu, "-1", txtordermenumain.Text, imainmenulevel, ddlcatemainmenu.SelectedValue, mainmenustatus, hdicid.Value };
            WEB.Category.save(Convert.ToInt32(hdicidmainmenu.Value), sm, om);
        }

        string topmenustatus = "0";
        if (chkmenutopstatus.Checked == true)
            topmenustatus = "1";
        string itopmenulevel = "1";
        if (!ddlmenutop.SelectedValue.Equals("-1"))
        {
            DataTable dt = new DataTable();
            dt = WEB.Category.getcatebyid(ddlmenutop.SelectedValue);
            if (dt.Rows.Count > 0)
                itopmenulevel = (Convert.ToInt32(dt.Rows[0]["ilevel"].ToString()) + 1).ToString();
        }
        //save
        if ((chkmenutopstatus.Checked == true && hd_insertupdate.Value.Equals("insert")) || (hd_insertupdate.Value.Equals("update") && hdicidtopmenu.Value != "-1") || (hd_insertupdate.Value.Equals("update") && chkmenutopstatus.Checked == true))
        {
            string[] st = { "vname", "vdesc", "vlan", "ccode", "vimg", "iorders", "ilevel", "iparcid", "istatus", "vparam2" };
            object[] ot = { txtname.Text, "/" + hdalias.Value, WEB.Common.LangAdmin, WEB.Common.mod_menutop, "-1", txtordermenutop.Text, itopmenulevel, ddlmenutop.SelectedValue, topmenustatus, hdicid.Value };
            WEB.Category.save(Convert.ToInt32(hdicidtopmenu.Value), st, ot);
        }

        string bottommenustatus = "0";
        if (chkmenubottomstatus.Checked == true)
            topmenustatus = "1";
        string ibottommenulevel = "1";
        if (!ddlmenubottom.SelectedValue.Equals("-1"))
        {
            DataTable dt = new DataTable();
            dt = WEB.Category.getcatebyid(ddlmenubottom.SelectedValue);
            if (dt.Rows.Count > 0)
                ibottommenulevel = (Convert.ToInt32(dt.Rows[0]["ilevel"].ToString()) + 1).ToString();
        }
        //save
        if ((chkmenubottomstatus.Checked == true && hd_insertupdate.Value.Equals("insert")) || (hd_insertupdate.Value.Equals("update") && hdicidbottommenu.Value != "-1") || (hd_insertupdate.Value.Equals("update") && chkmenubottomstatus.Checked == true))
        {
            string[] sb = { "vname", "vdesc", "vlan", "ccode", "vimg", "iorders", "ilevel", "iparcid", "istatus", "vparam2" };
            object[] ob = { txtname.Text, "/" + hdalias.Value, WEB.Common.LangAdmin, WEB.Common.mod_menubottom, "-1", txtorderbottom.Text, ibottommenulevel, ddlmenubottom.SelectedValue, bottommenustatus, hdicid.Value };
            WEB.Category.save(Convert.ToInt32(hdicidbottommenu.Value), sb, ob);
        }

        string contentmenustatus = "0";
        if (chkmenucontentstatus.Checked == true)
            contentmenustatus = "1";
        string icontentmenulevel = "1";
        if (!ddlmenucontent.SelectedValue.Equals("-1"))
        {
            DataTable dt = new DataTable();
            dt = WEB.Category.getcatebyid(ddlmenucontent.SelectedValue);
            if (dt.Rows.Count > 0)
                icontentmenulevel = (Convert.ToInt32(dt.Rows[0]["ilevel"].ToString()) + 1).ToString();
        }
        //save
        if ((chkmenucontentstatus.Checked == true && hd_insertupdate.Value.Equals("insert")) || (hd_insertupdate.Value.Equals("update") && hdicidcontentmenu.Value != "-1") || (hd_insertupdate.Value.Equals("update") && chkmenucontentstatus.Checked == true))
        {
            string[] sc = { "vname", "vdesc", "vlan", "ccode", "vimg", "iorders", "ilevel", "iparcid", "istatus", "vparam2" };
            object[] oc = { txtname.Text, "/" + hdalias.Value, WEB.Common.LangAdmin, WEB.Common.mod_menucont, "-1", txtorderbottom.Text, icontentmenulevel, ddlmenucontent.SelectedValue, contentmenustatus, hdicid.Value };
            WEB.Category.save(Convert.ToInt32(hdicidcontentmenu.Value), sc, oc);
        }
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
    public int getstt()
    {
        n++;
        return n;
    }
    public void clear()
    {
        txturl.Text = "";
        txtdesc.Text = "";
        txt_mota.Text = "";
        txtkeyword.Text = "";
        txtname.Text = "";
        txtorder.Text = "1";
        txttitleweb.Text = "";
        lt_mess.Text = "";
        lt_icon.Text = "";
        ltimage.Text = "";
        hdicid.Value = "-1";
        ltdetailmsg.Text = "";
        chkstatus.Checked = true;
        chkmainmenustatus.Checked = false;
        chkmenubottomstatus.Checked = false;
        chkmenucontentstatus.Checked = false;
        chkmenutopstatus.Checked = false;
    }
    protected void UpdateList()
    {
        n = 0;
        lnkupdate.Visible = false;
        lnkclose.Visible = false;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        if (checkrole("2221"))
            lnkadd.Visible = true;
        else
            lnkadd.Visible = false;
        if (checkrole("2223"))
            lnkdelete.Visible = true;
        else
            lnkdelete.Visible = false;
        pndetail.Visible = false;
        pnlist.Visible = true;
        DataTable dt = new DataTable();
        lttitle.Text = "Danh mục trang nội dung";
        dt= WEB.Category.getcate( "-1", WEB.Common.mod_content, vlan, "1","-1");
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
                if (checkrole("2222"))
                {
                    clear();
                    ltdetailmsg.Text = "";
                    lnkupdate.Visible = true;
                    lnkclose.Visible = true;
                    lnkadd.Visible = false;
                    lnkdelete.Visible = false;
                    lttitle.Text = "Cập nhật danh mục";
                    pnlist.Visible = false;
                    pndetail.Visible = true;
                    this.hd_insertupdate.Value = "update";
                    this.hdicid.Value = p.Trim();
                    DataTable dt = new DataTable();
                    dt = WEB.Category.getcatebyid(p);
                    if (dt.Rows.Count > 0)
                    {
                       hdname.Value=  txtname.Text = dt.Rows[0]["vname"].ToString().Trim();
                        txtorder.Text = dt.Rows[0]["iorders"].ToString().Trim();
                        itemtitle = txttitleweb.Text = dt.Rows[0]["vparam1"].ToString().Trim();
                        hd_imgicon.Value = dt.Rows[0]["vicon"].ToString().Trim();
                        hdimg_old.Value = dt.Rows[0]["vimg"].ToString().Trim();
                        txtkeyword.Text = dt.Rows[0]["vparam2"].ToString().Trim();
                        txt_mota.Text = dt.Rows[0]["vdesc"].ToString().Trim();
                        itemurl = weburl + dt.Rows[0]["valias"].ToString();
                        itemdescription = txtdesc.Text = dt.Rows[0]["vparam3"].ToString().Trim();
                        hdtitle.Value = dt.Rows[0]["vname"].ToString().Trim();
                        txturl.Text= hdalias.Value = dt.Rows[0]["valias"].ToString().Trim();
                        for (int i = 0; i < ddlcate.Items.Count; i++)
                        {
                            if (ddlcate.Items[i].Value.Equals(hdicid.Value))
                            {
                                ddlcate.Items.RemoveAt(i);
                                break;
                            }
                        }
                        hdiusercreate.Value = dt.Rows[0]["iusercreate"].ToString().Trim();
                        hdvusercreate.Value = dt.Rows[0]["vusercreate"].ToString().Trim();
                        hdcreatedate.Value = Convert.ToDateTime(dt.Rows[0]["dcreatedate"]).ToString("dd/MM/yyyy HH:mm");
                        WEB.Common.SetSelectedIndexInDropDownList(ref ddlcate, dt.Rows[0]["iparcid"].ToString());
                        if (dt.Rows[0]["vparam4"].ToString().Equals("0"))
                            chkdisplayhome.Checked = false;
                        else
                            chkdisplayhome.Checked = true;

                        if (dt.Rows[0]["istatus"].ToString().Equals("0"))
                            chkstatus.Checked = false;
                        else
                            chkstatus.Checked = true;
                        if (dt.Rows[0]["vimg"].ToString().Length > 0)
                        {
                            chkdeleteimg.Visible = true;
                            hdimg_old.Value = dt.Rows[0]["vimg"].ToString();
                            ltimage.Text = "<img src='" + weburl + "uploads/contents/images/" + dt.Rows[0]["vimg"].ToString() + "' style='max-width:100px;height:80px' >";
                        }
                        else
                            chkdeleteimg.Visible = false;
                        if (dt.Rows[0]["vicon"].ToString().Length > 0)
                        {
                            chkdeleteicon.Visible = true;
                            hd_imgicon.Value = dt.Rows[0]["vicon"].ToString();
                            lt_icon.Text = "<img src='" + weburl + "uploads/contents/images/" + dt.Rows[0]["vicon"].ToString() + "' style='max-width:100px;height:80px' >";
                        }
                        else
                            chkdeleteicon.Visible = false;

                        ltlink.Text = "<tr><td class='key'><label for='listnhom'>Link danh mục</label></td><td><a target='_blank' href='" + weburl + dt.Rows[0]["valias"].ToString() + "'>" + weburl + dt.Rows[0]["valias"].ToString() + "</a></td></tr>";
                        loadmenu();
                        hdnguoiquanly.Value = dt.Rows[0]["vparam6"].ToString().Trim();
                        ltnguoiquanly.Text = loadnguoiquanly();
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
                if (checkrole("2223"))
                {
                    if (WEB.Items.getlistitembypage(p, new string[0], "", WEB.Common.mod_content, vlan, "", "-1", 0, 1, "iid desc").Rows.Count > 0)
                    {

                        lt_mess.Text = "<p  class='merror' style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Bạn phải xóa danh sách trang nội dung thuộc danh mục này trước</p>";
                    }
                    else
                    {
                        WEB.Logs.writelog("Xóa danh mục trang nội dung: " + getname(p));
                        WEB.Category.db_categories_delete(p);
                        UpdateList();
                    }
                }
                break;

        }
    }
    protected string loadnguoiquanly()
    {
        string strresult = "";
        DataTable dt = WEB.Webusers.getlistuser();
        if (dt.Rows.Count > 0)
        {
            strresult += "<ul>";
            strresult += "<li><input type='checkbox'   name='chknql' value='-1' ";
            if (hdnguoiquanly.Value.Contains(",-1,"))
                strresult += " checked='checked' ";
            strresult += "> Tất cả";
            strresult += "</li>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                strresult += "<li><input type='checkbox'   name='chknql' value='" + dt.Rows[i]["iuser_web"].ToString() + "' ";
                if (hdnguoiquanly.Value.Contains("," + dt.Rows[i]["iuser_web"].ToString() + ","))
                    strresult += " checked='checked' ";
                strresult += "> " + dt.Rows[i]["vname"].ToString() + " (" + dt.Rows[i]["vusername"].ToString() + ")";
                strresult += "</li>";

            }
            strresult += "</ul>";
        }
        return strresult;
    }
    protected string getname(string cid)
    {
        DataTable dt = WEB.Category.getcatebyid(cid);
        if (dt.Rows.Count > 0)
            return dt.Rows[0]["vname"].ToString();
        else
            return "";
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
        if (txtname.Text.Length >150)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Tiêu đề không quá 150 ký tự</p>";
            ltdetailmsg.Visible = true;
            txtname.Focus();
            return;
        }
        if (txt_mota.Text.Length > 4000)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Mô tả không quá 4000 ký tự</p>";
            ltdetailmsg.Visible = true;
            txt_mota.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtorder.Text)==false)
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
        if (chkdisplayhome.Checked == true)
            displayinhome = "1";
        string ilevel = "1";
        if (!ddlcate.SelectedValue.Equals("-1"))
        {
            DataTable dt = new DataTable();
            dt = WEB.Category.getcatebyid(ddlcate.SelectedValue);
            if (dt.Rows.Count > 0)
                ilevel = (Convert.ToInt32(dt.Rows[0]["ilevel"].ToString()) + 1).ToString();
        }
        txtname.Text = txtname.Text.Trim();
        // Luu img icon
        string imageicon = "";
        if (this.flupicon.FileName.Trim().Length > 0)
        {
            string tempname = convertToImages(System.IO.Path.GetFileName(flupicon.PostedFile.FileName));
            string fileextention = "";
            fileextention = System.IO.Path.GetExtension(tempname).ToLower();

            if (fileextention.Equals(".jpg") || fileextention.Equals(".jpeg") || fileextention.Equals(".gif") || fileextention.Equals(".bmp") || fileextention.Equals(".png"))
            {
                if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/contents/images/" + tempname) == false)
                    imageicon = tempname;
                else
                    imageicon = DateTime.Now.Second + "-" + tempname;
                int width = 0;
                int height = 0;
                if (WEB.Config.getvaluebykey(WEB.Config.k_imgiconcatecontentwidth, vlan).Length > 0)
                    width = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgiconcatecontentwidth, vlan));
                if (WEB.Config.getvaluebykey(WEB.Config.k_imgiconcatecontentheight, vlan).Length > 0)
                    height = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgiconcatecontentheight, vlan));
                System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(flupicon.PostedFile.InputStream);
                System.Drawing.Image objImage = WEB.Common.ScaleImage(bmpPostedImage, fileextention, width, height);
                objImage.Save(Server.MapPath("~/") + "/uploads/contents/images/" + imageicon);
            }
            else
            {
                ltdetailmsg.Visible = true;
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.jpeg,*.gif,*.bmp,*.png</p>";
                return;
            }

        }
        if (hd_insertupdate.Value.Equals("insert"))
        {
            if (txturl.Text.Length == 0)
            {
                if (vlan != "ENG" && vlan != "VIE")
                    txturl.Text = WEB.Common.getalias("Content category");
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
                    txturl.Text = WEB.Common.getalias("Content category");
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
        //
        string image = "";
        if (this.flupload.FileName.Trim().Length > 0)
        {
            string tempname = convertToImages(System.IO.Path.GetFileName(flupload.PostedFile.FileName));
            string fileextention = "";
            fileextention = System.IO.Path.GetExtension(tempname).ToLower();

            if (fileextention.Equals(".jpg") || fileextention.Equals(".jpeg") || fileextention.Equals(".gif") || fileextention.Equals(".bmp") || fileextention.Equals(".png"))
            {
                if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/contents/images/" + tempname) == false)
                    image = tempname;
                else
                    image = DateTime.Now.Second + "-" + tempname;
                int width = 0;
                int height = 0;
                if (WEB.Config.getvaluebykey(WEB.Config.k_imgimgcatecontentwidth, vlan).Length > 0)
                    width = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgimgcatecontentwidth, vlan));
                if (WEB.Config.getvaluebykey(WEB.Config.k_imgimgcatencontentheight, vlan).Length > 0)
                    height = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgimgcatencontentheight, vlan));
                System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(flupload.PostedFile.InputStream);
                System.Drawing.Image objImage = WEB.Common.ScaleImage(bmpPostedImage, fileextention, width, height);
                objImage.Save(Server.MapPath("~/") + "/uploads/contents/images/" + image);
              
            }
            else
            {
                ltdetailmsg.Visible = true;
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.jpeg,*.gif,*.bmp,*.png</p>";
                return;
            }

        }
        if (txttitleweb.Text == "")
            txttitleweb.Text = txtname.Text.Trim();
        if (txtdesc.Text == "")
            txtdesc.Text = txtname.Text.Trim() + ", " + WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan);
        if (txtkeyword.Text == "")
        {
            txtkeyword.Text = txtname.Text.Trim() + "," + WEB.Common.GetNosign(txtname.Text.Trim());
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
        //if (txtdesc.Text.Length > 160)
        //{
        //    ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Thẻ mô tả (Hỗ trợ SEO) tối đa 160 ký tự</p>";
        //    ltdetailmsg.Visible = true;
        //    txtdesc.Focus();
        //    return;
        //}
        string listnql = "," + WEB.Common.GetFormValue("chknql").ToString() + ",";
        if (hd_insertupdate.Value.Equals("insert"))
        {
            
           
            try
            {
              
                //WEB.Item_other.db_items_other_insert(WEB.Common.mod_adv,vlan, txtname.Text, txtlink.Text,image, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), adv_type, txtorder.Text, istatus,ddlposition.SelectedValue,txtwidth.Text,txtheight.Text, "", "", "0", "0");
                WEB.Category.db_categories_insert(WEB.Common.mod_content, vlan, ddlcate.SelectedValue, convertToAlias(txturl.Text), txtname.Text.Trim(), txt_mota.Text.Trim(), image, imageicon, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), ilevel, txtorder.Text, istatus, txtname.Text.Trim(), txtname.Text.Trim() + "," + WEB.Common.GetNosign(txtname.Text.Trim()), txtname.Text.Trim() + ", " + WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan), displayinhome, "", listnql, "", "", "", "","0","0","0","0","0");
                lttitle.Text = "Quản lý danh mục trang nội dung - Thêm danh mục thành công";
                //ghi log
                string id = WEB.Dataprovider.getmax("db_categories", "icid","").ToString();
                hdicid.Value = id;
                WEB.Logs.writelog("Thêm danh mục trang nội dung: " + txtname.Text);
           
            }
            catch (Exception ex)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Thêm dữ liệu không thành công</p>" + ex.ToString();
                ltdetailmsg.Visible = true;
                return;
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
                    try
                    {
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/contents/images/" + hdimg_old.Value);
                    }
                    catch
                    {
                    }
                }
                if (chkdeleteimg.Checked == true)
                {
                    image = "";
                    try
                    {
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/contents/images/" + hdimg_old.Value);
                    }
                    catch
                    {
                    }
                }
                if (imageicon == "")
                {
                    imageicon = hd_imgicon.Value;
                }
                else
                {
                    
                    try
                    {
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/contents/images/" + hd_imgicon.Value);
                    }
                    catch
                    {
                    }
                }
                if (chkdeleteicon.Checked == true)
                {
                    imageicon = "";
                    try
                    {
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/contents/images/" + hd_imgicon.Value);
                    }
                    catch
                    {
                    }
                }

                WEB.Category.db_categories_update(hdicid.Value, WEB.Common.mod_content, vlan, ddlcate.SelectedValue, convertToAlias(txturl.Text), txtname.Text.Trim(), txt_mota.Text, image, imageicon, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), txtorder.Text, istatus, txttitleweb.Text, txtkeyword.Text, txtdesc.Text, displayinhome, Session["admin"].ToString(),listnql,"","","","", "0", "0", "0", "0", "0");
                lttitle.Text = "Quản lý danh mục trang nội dung - Cập nhật danh mục thành công";
                //ghi log
                WEB.Logs.writelog("Cập nhật danh mục trang nội dung: " + txtname.Text);
            }
            catch
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lỗi cập nhật dữ liệu</p>";
                ltdetailmsg.Visible = true;
                return;
            }

        }
        savemenu();
        clear();
        UpdateList();
    }

    protected void lnkadd_Click(object sender, EventArgs e)
    {
        clear();
        lnkupdate.Visible = true;
        lnkclose.Visible = true;
        lnkadd.Visible = false;
        lnkdelete.Visible = false;
        lttitle.Text = "Thêm danh mục trang nội dung";
        pnlist.Visible = false;
        hd_imgicon.Value = "";
        hdimg_old.Value = "";
        lt_icon.Text = "";
        ltimage.Text = "";
        pndetail.Visible = true;
        this.hd_insertupdate.Value = "insert";
        itemtitle = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, vlan);
        itemdescription = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan);
        itemurl = weburl;
        hdnguoiquanly.Value = ",-1,";
        ltnguoiquanly.Text = loadnguoiquanly();
        loadmenu();
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
                    WEB.Logs.writelog("Xóa danh mục nội dung hàng loạt");
                    for (int i = 0; i < s.Length; i++)
                    {
                        if (s[i].Length > 0)
                        {
                            if (WEB.Items.getlistitembypage(s[i], new string[0], "", WEB.Common.mod_content, vlan, "", "-1", 0, 1, "iid desc").Rows.Count > 0)
                            {
                                lt_mess.Text = "<p class='merror' style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;font-style: italic;'>Bạn phải xóa danh sách trang nội dung thuộc danh mục này trước khi xóa danh mục</p>";
                            }
                            else
                            {
                                WEB.Category.db_categories_delete(s[i].ToString());
                            }

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
