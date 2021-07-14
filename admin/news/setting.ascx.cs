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
        txtperpage.Text = WEB.Config.getvaluebykey(WEB.Config.k_nwsperpage, vlan);
        txtnumsearch.Text = WEB.Config.getvaluebykey(WEB.Config.k_nwsnumsearch, vlan);
        if (WEB.Config.getvaluebykey(WEB.Config.k_nwsdisplaycmfc, vlan).Equals("1"))
            chkdisplayfacebookcomment.Checked = true;
        else
            chkdisplayfacebookcomment.Checked = false;
        txtimgthumbheight.Text = WEB.Config.getvaluebykey(WEB.Config.k_nwsimgthumbheight, vlan);
        txtimgthumbwidth.Text = WEB.Config.getvaluebykey(WEB.Config.k_nwsimgthumbwidth, vlan);
        txtwidthbig.Text = WEB.Config.getvaluebykey(WEB.Config.k_nwsimgwidth, vlan);
        txtheightbig.Text = WEB.Config.getvaluebykey(WEB.Config.k_nwsimgheight, vlan);
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
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 10px 0px;font-size: 12px;'>Số tin mới phải là số</p>";
            ltdetailmsg.Visible = true;
            txtnumnew.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtnumhot.Text) == false)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 10px 0px;font-size: 12px;'>Số tin nổi bật phải là số</p>"; 
            ltdetailmsg.Visible = true;
            txtnumhot.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtperpage.Text) == false)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 10px 0px;font-size: 12px;'>Số tin tức mỗi trang là số</p>";
            ltdetailmsg.Visible = true;
            txtperpage.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtimgthumbheight.Text) == false)
        {
            ltdetailmsg.Text = "Chiều cao ảnh nhỏ phải là số";
            ltdetailmsg.Visible = true;
            txtimgthumbheight.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtimgthumbwidth.Text) == false)
        {
            ltdetailmsg.Text = "Chiều rộng ảnh nhỏ phải là số";
            ltdetailmsg.Visible = true;
            txtimgthumbwidth.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtheightbig.Text) == false)
        {
            ltdetailmsg.Text = "Chiều cao ảnh lớn phải là số";
            ltdetailmsg.Visible = true;
            txtheightbig.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtwidthbig.Text) == false)
        {
            ltdetailmsg.Text = "Chiều rộng ảnh lớn phải là số";
            ltdetailmsg.Visible = true;
            txtwidthbig.Focus();
            return;
        }
        //if (WEB.Common.Check_number(txtnumsearch.Text) == false)
        //{
        //    ltdetailmsg.Text = "Số tin tức trang tìm kiếm phải là số";
        //    ltdetailmsg.Visible = true;
        //    txtnumsearch.Focus();
        //    return;
        //}
        try
        {
            WEB.Config.updatekey(WEB.Config.k_nwsnumnew, vlan,txtnumnew.Text);
            WEB.Config.updatekey(WEB.Config.k_nwsnumhot, vlan,txtnumhot.Text);
            WEB.Config.updatekey(WEB.Config.k_nwsperpage, vlan,txtperpage.Text);
            WEB.Config.updatekey(WEB.Config.k_nwsnumsearch, vlan,txtnumsearch.Text);
            string discmfc = "0";
            if (chkdisplayfacebookcomment.Checked == true)
                discmfc = "1";
            WEB.Config.updatekey(WEB.Config.k_nwsimgthumbheight, vlan, txtimgthumbheight.Text);
            WEB.Config.updatekey(WEB.Config.k_nwsimgthumbwidth, vlan, txtimgthumbwidth.Text);
            WEB.Config.updatekey(WEB.Config.k_nwsimgwidth, vlan, txtwidthbig.Text);
            WEB.Config.updatekey(WEB.Config.k_nwsimgheight, vlan, txtheightbig.Text);
            WEB.Config.updatekey(WEB.Config.k_nwsdisplaycmfc, vlan, discmfc);
            lttitle.Text = "Cấu hình tin tức - Cập nhật thành công";
            ltdetailmsg.Text = "<p style='color: #06f;margin: 0;padding: 12px 15px 10px 0px;font-size: 12px;'>Cập nhật thành công</p>";
            ltdetailmsg.Visible = true;
            //ghi log
            WEB.Logs.writelog("Cập nhật cấu hình tin tức");
            UpdateList();
        }
        catch (Exception ex)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 10px 0px;font-size: 12px;'>Cập nhật không thành công</p>";
            ltdetailmsg.Visible = true;
        }

        
    }

   

}
