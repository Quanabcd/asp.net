using System;

public partial class admin_integrated_seo : System.Web.UI.UserControl
{
    public string vlan = WEB.Common.LangAdmin;

    protected void Page_Load(object sender, EventArgs e)
    {
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "../ckfinder";
        _FileBrowser.SetupCKEditor(txth1home);

        lttitle.Text = "Tích hợp SEO";
        txttitleweb.Text = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, vlan);
        txtkeyword.Text = WEB.Config.getvaluebykey(WEB.Config.k_webkeyword, vlan);
        txtdesc.Text = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, vlan);
        txtrobot.Text = WEB.Config.getvaluebykey(WEB.Config.k_robotfile, vlan);
        txtsitemap.Text = WEB.Config.getvaluebykey(WEB.Config.k_sitemapfile, vlan);
     
     

        txth1home.Text = WEB.Config.getvaluebykey("h1_homepage", vlan);
    }

    protected void update_Click(object sender, EventArgs e)
    {
        WEB.Config.updatekey(WEB.Config.k_webtitle, vlan, txttitleweb.Text);
        WEB.Config.updatekey(WEB.Config.k_webkeyword, vlan, txtkeyword.Text);
        WEB.Config.updatekey(WEB.Config.k_webdesc, vlan, txtdesc.Text);
        WEB.Config.updatekey(WEB.Config.k_robotfile, vlan, txtrobot.Text);
        WEB.Config.updatekey(WEB.Config.k_sitemapfile, vlan, txtsitemap.Text);
        WEB.Config.updatekey("h1_homepage", vlan, txth1home.Text);
        //
        ltdetailmsg.Visible = true;
        ltdetailmsg.Text = "<p style='color: #06f;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;'>Cập nhật thành công</p>";
    }
}