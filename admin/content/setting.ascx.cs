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

public partial class admin_news_setting : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            lttitle.Text = "Cấu hình tin tức";
            lnkupdate.Visible = true;
            ltdetailmsg.Visible = false;
           
            this.UpdateList();
        }
    }

    protected void UpdateList()
    {
        txtnumnew.Text = WEB.Config.getvaluebykey(WEB.Config.k_nwsnumnew, vlan);
        txtnumhot.Text = WEB.Config.getvaluebykey(WEB.Config.k_nwsnumhot, vlan);
        txtnumview.Text = WEB.Config.getvaluebykey(WEB.Config.k_nwsnumview, vlan);
        txtperpage.Text = WEB.Config.getvaluebykey(WEB.Config.k_nwsperpage, vlan);
        txtnumsearch.Text = WEB.Config.getvaluebykey(WEB.Config.k_nwsnumsearch, vlan); 
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
        
        if (WEB.Common.Check_number(txtnumnew.Text) == false)
        {
            ltdetailmsg.Text = "Số tin tức mới phải là số";
            ltdetailmsg.Visible = true;
            txtnumnew.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtnumhot.Text) == false)
        {
            ltdetailmsg.Text = "Số tin nóng phải là số";
            ltdetailmsg.Visible = true;
            txtnumhot.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtnumview.Text) == false)
        {
            ltdetailmsg.Text = "Số tin xem nhiều phải là số";
            ltdetailmsg.Visible = true;
            txtnumview.Focus();
            return;
        }
        
        if (WEB.Common.Check_number(txtperpage.Text) == false)
        {
            ltdetailmsg.Text = "Số tin tức mỗi trang là số";
            ltdetailmsg.Visible = true;
            txtperpage.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtnumsearch.Text) == false)
        {
            ltdetailmsg.Text = "Số tin tức trang tìm kiếm phải là số";
            ltdetailmsg.Visible = true;
            txtnumsearch.Focus();
            return;
        }
        try
        {


            WEB.Config.updatekey(WEB.Config.k_nwsnumnew, vlan,txtnumnew.Text);
            WEB.Config.updatekey(WEB.Config.k_nwsnumhot, vlan,txtnumhot.Text);
            WEB.Config.updatekey(WEB.Config.k_nwsnumview, vlan,txtnumview.Text);
            WEB.Config.updatekey(WEB.Config.k_nwsperpage, vlan,txtperpage.Text);
            WEB.Config.updatekey(WEB.Config.k_nwsnumsearch, vlan,txtnumsearch.Text);

            lttitle.Text = "Cấu hình tin tức - Cập nhật thành công";
            //ghi log
            WEB.Logs.writelog("Cập nhật cấu hình tin tức");
            UpdateList();
        }
        catch (Exception ex)
        {
            ltdetailmsg.Text = ex.ToString();
            ltdetailmsg.Visible = true;
        }

        
    }

   

}
