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

public partial class admin_products_setting : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
            _FileBrowser.BasePath = "../ckfinder";
            _FileBrowser.SetupCKEditor(txtsuccess);
            lttitle.Text = "Cấu hình sản phẩm";
            lnkupdate.Visible = true;
            ltdetailmsg.Visible = false;
            this.UpdateList();
        }
    }

    protected void UpdateList()
    {
     
        txtunit.Text = WEB.Config.getvaluebykey(WEB.Config.k_prdunit, vlan);
        chkdisplayoldp.Checked = check(WEB.Config.getvaluebykey(WEB.Config.k_prdpriceold, vlan));
        txtnumnew.Text = WEB.Config.getvaluebykey(WEB.Config.k_prdnumnew, vlan);
        txtnumhot.Text = WEB.Config.getvaluebykey(WEB.Config.k_prdnumhot, vlan);
        txtnumsale.Text = WEB.Config.getvaluebykey(WEB.Config.k_prdnumsale, vlan);
        txtpercate.Text = WEB.Config.getvaluebykey(WEB.Config.k_prdpercate, vlan);
        txtperpage.Text = WEB.Config.getvaluebykey(WEB.Config.k_prdperpage, vlan);
    
        chksendmail.Checked = check(WEB.Config.getvaluebykey(WEB.Config.k_prdsendmail, vlan));
        chkrequestmember.Checked = check(WEB.Config.getvaluebykey(WEB.Config.k_prdrequestmember, vlan));
        txtsuccess.Text = WEB.Config.getvaluebykey(WEB.Config.k_prdbuysuccess, vlan);
        chkdisplayvote.Checked = check(WEB.Config.getvaluebykey(WEB.Config.k_prdvote, vlan));
        chkdisplayfacebookcomment.Checked = check(WEB.Config.getvaluebykey(WEB.Config.k_prddisplaycmfc, vlan));
        txtemail.Text = WEB.Config.getvaluebykey(WEB.Config.k_prdemailorder, vlan);
        txtimgthumbheight.Text = WEB.Config.getvaluebykey(WEB.Config.k_imgprdthumbheight, vlan);
        txtimgthumbwidth.Text = WEB.Config.getvaluebykey(WEB.Config.k_imgprdthumbwidth, vlan);
        txtimgwidth.Text = WEB.Config.getvaluebykey(WEB.Config.k_imgprdwidth, vlan);
        txtimgheight.Text = WEB.Config.getvaluebykey(WEB.Config.k_imgprdheight, vlan);
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
            ltdetailmsg.Text = "Số sản phẩm mới phải là số";
            ltdetailmsg.Visible = true;
            txtnumnew.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtnumhot.Text) == false)
        {
            ltdetailmsg.Text = "Số sản bán chạy phải là số";
            ltdetailmsg.Visible = true;
            txtnumhot.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtnumsale.Text) == false)
        {
            ltdetailmsg.Text = "Số sản phẩm khuyến mại phải là số";
            ltdetailmsg.Visible = true;
            txtnumsale.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtpercate.Text) == false)
        {
            ltdetailmsg.Text = "Số sản phẩm mỗi danh mục là số";
            ltdetailmsg.Visible = true;
            txtpercate.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtperpage.Text) == false)
        {
            ltdetailmsg.Text = "Số sản phẩm mỗi trang là số";
            ltdetailmsg.Visible = true;
            txtperpage.Focus();
            return;
        }
   
        if (WEB.Common.Check_number(txtimgthumbwidth.Text) == false)
        {
            ltdetailmsg.Text = "Chiều rộng ảnh nhỏ phải là số";
            ltdetailmsg.Visible = true;
            txtimgthumbwidth.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtimgthumbheight.Text) == false)
        {
            ltdetailmsg.Text = "Chiều cao ảnh nhỏ phải là số";
            ltdetailmsg.Visible = true;
            txtimgthumbheight.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtimgwidth.Text) == false)
        {
            ltdetailmsg.Text = "Chiều rộng ảnh lớn phải là số";
            ltdetailmsg.Visible = true;
            txtimgwidth.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtimgheight.Text) == false)
        {
            ltdetailmsg.Text = "Chiều cao ảnh lớn phải là số";
            ltdetailmsg.Visible = true;
            txtimgheight.Focus();
            return;
        }
        try
        {

            WEB.Config.updatekey(WEB.Config.k_prdunit, vlan,txtunit.Text);
            WEB.Config.updatekey(WEB.Config.k_prdpriceold, vlan,chkcheck(chkdisplayoldp));
            WEB.Config.updatekey(WEB.Config.k_prdvote, vlan, chkcheck(chkdisplayvote));
            WEB.Config.updatekey(WEB.Config.k_prddisplaycmfc, vlan, chkcheck(chkdisplayfacebookcomment));
            WEB.Config.updatekey(WEB.Config.k_prdnumnew, vlan,txtnumnew.Text);
            WEB.Config.updatekey(WEB.Config.k_prdnumhot, vlan,txtnumhot.Text);
            WEB.Config.updatekey(WEB.Config.k_prdnumsale, vlan,txtnumsale.Text);
            WEB.Config.updatekey(WEB.Config.k_prdpercate, vlan,txtpercate.Text);
         
            WEB.Config.updatekey(WEB.Config.k_prdperpage, vlan,txtperpage.Text);
            
            WEB.Config.updatekey(WEB.Config.k_prdsendmail, vlan,chkcheck(chksendmail));
            WEB.Config.updatekey(WEB.Config.k_prdrequestmember, vlan,chkcheck(chkrequestmember));
            WEB.Config.updatekey(WEB.Config.k_prdbuysuccess, vlan,txtsuccess.Text);
            WEB.Config.updatekey(WEB.Config.k_prdemailorder, vlan, txtemail.Text);

            WEB.Config.updatekey(WEB.Config.k_imgprdthumbheight, vlan,txtimgthumbheight.Text);
            WEB.Config.updatekey(WEB.Config.k_imgprdthumbwidth, vlan, txtimgthumbwidth.Text);
            WEB.Config.updatekey(WEB.Config.k_imgprdwidth, vlan, txtimgwidth.Text);
            WEB.Config.updatekey(WEB.Config.k_imgprdheight, vlan, txtimgheight.Text);
            lttitle.Text = "Cấu hình sản phẩm - Cập nhật thành công";
            ltdetailmsg.Text = "<p class='msuccess' style='color: #06f;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật thành công</p>";
            ltdetailmsg.Visible = true;
            //ghi log
            WEB.Logs.writelog("Cập nhật cấu hình sản phẩm");
            UpdateList();
        }
        catch (Exception ex)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật không thành công</p>";
            ltdetailmsg.Visible = true;
        }

        
    }

   

}

