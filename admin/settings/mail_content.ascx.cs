using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_settings_mail_content : System.Web.UI.UserControl
{
    public string vlan = WEB.Common.LangAdmin;
    public string weburl = WEB.Common.Weburl;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
            _FileBrowser.BasePath = "../ckfinder";
            _FileBrowser.SetupCKEditor(txtsendmailwhileregister);
            CKFinder.FileBrowser _FileBrowser1 = new CKFinder.FileBrowser();
            _FileBrowser1.BasePath = "../ckfinder";
            _FileBrowser1.SetupCKEditor(txtsendmailwhileresetpass);

            CKFinder.FileBrowser _FileBrowser2 = new CKFinder.FileBrowser();
            _FileBrowser2.BasePath = "../ckfinder";
            _FileBrowser2.SetupCKEditor(txtsendmailconfirmorder);
            lttitle.Text = "Cấu hình nội dung mail gửi đi";
            txtsendmailwhileregister.Text =WEB.Config.getvaluebykey(WEB.Config.key_content_sendmail_while_register, vlan);
            txtsendmailwhileresetpass.Text = WEB.Config.getvaluebykey(WEB.Config.key_content_sendmail_while_resetpass, vlan);
            txtsendmailconfirmorder.Text = WEB.Config.getvaluebykey(WEB.Config.key_content_sendmail_confirm_order, vlan);
        }
    }
    protected void update_Click(object sender, EventArgs e)
    {
        try
        {
            WEB.Config.updatekey(WEB.Config.key_content_sendmail_while_register, vlan, txtsendmailwhileregister.Text);
            WEB.Config.updatekey(WEB.Config.key_content_sendmail_while_resetpass, vlan, txtsendmailwhileresetpass.Text);
            WEB.Config.updatekey(WEB.Config.key_content_sendmail_confirm_order, vlan, txtsendmailconfirmorder.Text);
            ltdetailmsg.Visible = true;
            ltdetailmsg.Text = "<p style='color: #06f;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Cập nhật thành công</p>";
        }
        catch {
            ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;font-style: italic;'>Cập nhật không thành công</p>";
            ltdetailmsg.Visible = true;
        }
    }
}