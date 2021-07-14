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

public partial class admin_setting_supportedit : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    protected void Page_Load(object sender, EventArgs e)
    {
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "../ckfinder";
        _FileBrowser.SetupCKEditor(txtcontent);
        if (!IsPostBack)
        {
            
            lttitle.Text = "Hướng dẫn quản trị website";
            lnkupdate.Visible = true;
            ltdetailmsg.Visible = false;
           
            this.UpdateList();
        }
    }

    protected void UpdateList()
    {
        txtcontent.Text = WEB.Config.getvaluebykey(WEB.Config.k_supportwebsite, vlan);
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
    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        WEB.Config.updatekey(WEB.Config.k_supportwebsite, vlan, txtcontent.Text);
        ltdetailmsg.Text = "<p style='color: #06f;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Cập nhật thành công</p>";
    }

   

}
