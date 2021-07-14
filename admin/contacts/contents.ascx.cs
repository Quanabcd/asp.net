using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_contacts_contents : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
            _FileBrowser.BasePath = "../ckfinder";
            _FileBrowser.SetupCKEditor(txtcontent);


            CKFinder.FileBrowser _FileBrowser1 = new CKFinder.FileBrowser();
            _FileBrowser1.BasePath = "../ckfinder";
            _FileBrowser1.SetupCKEditor(txt_bando);

            lttitle.Text = "Liên hệ & Bản đồ";
            txtcontent.Text = WEB.Config.getvaluebykey(WEB.Config.k_contact_desc,vlan);
            txt_bando.Text = WEB.Config.getvaluebykey("KEYBANDO", vlan);
        }
    }
    protected void update_Click(object sender, EventArgs e)
    {
        WEB.Config.updatekey(WEB.Config.k_contact_desc, vlan, txtcontent.Text);
        WEB.Config.updatekey("KEYBANDO", vlan, txt_bando.Text);
        ltdetailmsg.Visible = true;
        ltdetailmsg.Text = "<p style='color: #06f;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Cập nhật thành công</p>";
    }
}