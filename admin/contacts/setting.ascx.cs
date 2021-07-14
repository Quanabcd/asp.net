using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_settings_systememail : System.Web.UI.UserControl
{
    public string vlan = WEB.Common.LangAdmin;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lttitle.Text = "Cấu hình Email liên hệ";
            txtsmtp.Text = WEB.Config.getvaluebykey(WEB.Config.k_contact_smtp, vlan);
            txtport.Text = WEB.Config.getvaluebykey(WEB.Config.k_contact_port, vlan);
            txtemail.Text = WEB.Config.getvaluebykey(WEB.Config.k_contact_email, vlan);
        }
    }
    protected void update_Click(object sender, EventArgs e)
    {
        WEB.Config.updatekey(WEB.Config.k_contact_smtp, vlan, txtsmtp.Text.Trim());
        WEB.Config.updatekey(WEB.Config.k_contact_port, vlan, txtport.Text);
        WEB.Config.updatekey(WEB.Config.k_contact_email, vlan, txtemail.Text);
        if (chkupdatepass.Checked == true)
        {
            WEB.Config.updatekey(WEB.Config.k_contact_pass, vlan, txtpass.Text);
        }
        ltdetailmsg.Text = "<p style='color: #16757c;margin: 0;font-size: 11px;padding: 12px 15px 0px 15px;font-style: italic;'>Cập nhật thành công</p>";
    }
}