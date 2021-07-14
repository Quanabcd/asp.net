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
            lttitle.Text = "Cấu hình email hệ thống";
            txtsmtp.Text = WEB.Config.getvaluebykey(WEB.Config.k_syssmtp, vlan);
            txtport.Text = WEB.Config.getvaluebykey(WEB.Config.k_sysport, vlan);
            txtemail.Text = WEB.Config.getvaluebykey(WEB.Config.k_sysemail, vlan);
            if (WEB.Config.getvaluebykey(WEB.Config.k_enablessl, vlan) == "1")
                chkssl.Checked = true;
            else
                chkssl.Checked = false;
            if (WEB.Config.getvaluebykey(WEB.Config.k_useemailsys, vlan) == "1")
            {
                rdfromsys.Checked = true;
                txtemail.Enabled = false;
                txtpass.Enabled = false;
                txtport.Enabled = false;
                txtsmtp.Enabled = false;
                chkssl.Enabled = false;
            }
            else
            {
                rdfrompersonal.Checked = true;
                txtemail.Enabled = true;
                txtpass.Enabled = true;
                txtport.Enabled = true;
                txtsmtp.Enabled = true;
                chkssl.Enabled = true;
            }
        }
    }
    protected void update_Click(object sender, EventArgs e)
    {
        if (rdfrompersonal.Checked == true)
        {
            if (WEB.Common.Check_number(txtport.Text) == false)
            {
                ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;font-style: italic;'>Cổng SMTP phải là số</p>";
                ltdetailmsg.Visible = true;
                txtport.Focus();
                return;
            }
            WEB.Config.updatekey(WEB.Config.k_syssmtp, vlan, txtsmtp.Text.Trim());
            WEB.Config.updatekey(WEB.Config.k_sysport, vlan, txtport.Text);
            WEB.Config.updatekey(WEB.Config.k_sysemail, vlan, txtemail.Text);
            if (txtpass.Text.Length > 0)
            {
                WEB.Config.updatekey(WEB.Config.k_sysspass, vlan,WEB.Common.Encodepro( txtpass.Text));
            }
            string enablessl = "0";
            if (chkssl.Checked == true)
                enablessl = "1";
            WEB.Config.updatekey(WEB.Config.k_enablessl, vlan, enablessl);
            WEB.Config.updatekey(WEB.Config.k_useemailsys, vlan, "0");
        }
        else
        {
            WEB.Config.updatekey(WEB.Config.k_useemailsys, vlan, "1");
        }
        ltdetailmsg.Text = "<p style='color: #06f;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Cập nhật thành công</p>";
    }
    protected void rdfromsys_CheckedChanged(object sender, EventArgs e)
    {
        txtemail.Enabled = false;
        txtpass.Enabled = false;
        txtport.Enabled = false;
        txtsmtp.Enabled = false;
        chkssl.Enabled = false;
    }
    protected void rdfrompersonal_CheckedChanged(object sender, EventArgs e)
    {
        txtemail.Enabled = true;
        txtpass.Enabled = true;
        txtport.Enabled = true;
        txtsmtp.Enabled = true;
        chkssl.Enabled = true;
    }

}