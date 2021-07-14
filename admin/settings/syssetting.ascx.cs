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

public partial class admin_setting_syssetting : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
         
            lttitle.Text = "Cấu hình hệ thống";
            lnkupdate.Visible = true;
            ltdetailmsg.Visible = false;
            this.UpdateList();
        }
    }

    protected void UpdateList()
    {

       

        txtbannerheight.Text = WEB.Config.getvaluebykey(WEB.Config.k_imgbannerheight, vlan);
        txtbannerwidth.Text = WEB.Config.getvaluebykey(WEB.Config.k_imgbannerwidth, vlan);
        txticoncatewidth.Text = WEB.Config.getvaluebykey(WEB.Config.k_imgiconcatewidth, vlan);
        txticoncateheight.Text = WEB.Config.getvaluebykey(WEB.Config.k_imgiconcateheight, vlan);
        txtimgcatewidth.Text = WEB.Config.getvaluebykey(WEB.Config.k_imgimgcatewidth, vlan);
        txtimgcateheight.Text = WEB.Config.getvaluebykey(WEB.Config.k_imgimgcateheight, vlan);

        txtalbumheight.Text = WEB.Config.getvaluebykey("txtalbumheight", vlan);
        txtalbumheightthumbs.Text = WEB.Config.getvaluebykey("txtalbumheightthumbs", vlan);
        txtalbumwidth.Text = WEB.Config.getvaluebykey("txtalbumwidth", vlan);
        txtalbumwidththumbs.Text = WEB.Config.getvaluebykey("txtalbumwidththumbs", vlan);

        txtcontentheight.Text = WEB.Config.getvaluebykey("txtcontentheight", vlan);
        txtcontentheightthumbs.Text = WEB.Config.getvaluebykey("txtcontentheightthumbs", vlan);
        txtcontentwidth.Text = WEB.Config.getvaluebykey("txtcontentwidth", vlan);
        txtcontentwidththumbs.Text = WEB.Config.getvaluebykey("txtcontentwidththumbs", vlan);

        txtserviceheight.Text = WEB.Config.getvaluebykey("txtserviceheight", vlan);
        txtserviceheightthumbs.Text = WEB.Config.getvaluebykey("txtserviceheightthumbs", vlan);
        txtservicewidth.Text = WEB.Config.getvaluebykey("txtservicewidth", vlan);
        txtservicewidththumbs.Text = WEB.Config.getvaluebykey("txtservicewidththumbs", vlan);

        txtvideoheight.Text = WEB.Config.getvaluebykey("txtvideoheight", vlan);
        txtvideoheightthumbs.Text = WEB.Config.getvaluebykey("txtvideoheightthumbs", vlan);
        txtvideowidth.Text = WEB.Config.getvaluebykey("txtvideowidth", vlan);
        txtvideowidththumbs.Text = WEB.Config.getvaluebykey("txtvideowidththumbs", vlan);


        txtprojectheight.Text = WEB.Config.getvaluebykey("txtprojectheight", vlan);
        txtprojectheightthumbs.Text = WEB.Config.getvaluebykey("txtprojectheightthumbs", vlan);
        txtprojectwidth.Text = WEB.Config.getvaluebykey("txtprojectwidth", vlan);
        txtprojectwidththumbs.Text = WEB.Config.getvaluebykey("txtprojectwidththumbs", vlan);
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
        
       
        if (WEB.Common.Check_number(txtbannerwidth.Text) == false)
        {
            ltdetailmsg.Text = "Chiều rộng ảnh phải là số";
            ltdetailmsg.Visible = true;
            txtbannerwidth.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtbannerheight.Text) == false)
        {
            ltdetailmsg.Text = "Chiều cao ảnh phải là số";
            ltdetailmsg.Visible = true;
            txtbannerheight.Focus();
            return;
        }
        if (WEB.Common.Check_number(txticoncatewidth.Text) == false)
        {
            ltdetailmsg.Text = "Chiều rộng ảnh phải là số";
            ltdetailmsg.Visible = true;
            txticoncatewidth.Focus();
            return;
        }
        if (WEB.Common.Check_number(txticoncateheight.Text) == false)
        {
            ltdetailmsg.Text = "Chiều cao ảnh phải là số";
            ltdetailmsg.Visible = true;
            txticoncateheight.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtimgcatewidth.Text) == false)
        {
            ltdetailmsg.Text = "Chiều rộng ảnh phải là số";
            ltdetailmsg.Visible = true;
            txtimgcatewidth.Focus();
            return;
        }
        if (WEB.Common.Check_number(txtimgcateheight.Text) == false)
        {
            ltdetailmsg.Text = "Chiều cao ảnh phải là số";
            ltdetailmsg.Visible = true;
            txtimgcateheight.Focus();
            return;
        }
        try
        {

            WEB.Config.updatekey(WEB.Config.k_imgbannerheight, vlan,txtbannerheight.Text);
            WEB.Config.updatekey(WEB.Config.k_imgbannerwidth, vlan, txtbannerwidth.Text);
            WEB.Config.updatekey(WEB.Config.k_imgiconcatewidth, vlan,txticoncatewidth.Text);
            WEB.Config.updatekey(WEB.Config.k_imgiconcateheight, vlan, txticoncateheight.Text);
            WEB.Config.updatekey(WEB.Config.k_imgimgcatewidth, vlan,txtimgcatewidth.Text);
            WEB.Config.updatekey(WEB.Config.k_imgimgcateheight, vlan, txtimgcateheight.Text);

            WEB.Config.updatekey("txtalbumheight", vlan,txtalbumheight.Text);
            WEB.Config.updatekey("txtalbumheightthumbs", vlan,txtalbumheightthumbs.Text);
            WEB.Config.updatekey("txtalbumwidth", vlan,txtalbumwidth.Text);
             WEB.Config.updatekey("txtalbumwidththumbs", vlan,txtalbumwidththumbs.Text);

             WEB.Config.updatekey("txtcontentheight", vlan,txtcontentheight.Text);
             WEB.Config.updatekey("txtcontentheightthumbs", vlan,txtcontentheightthumbs.Text);
             WEB.Config.updatekey("txtcontentwidth", vlan,txtcontentwidth.Text);
             WEB.Config.updatekey("txtcontentwidththumbs", vlan,txtcontentwidththumbs.Text);

             WEB.Config.updatekey("txtserviceheight", vlan,txtserviceheight.Text);
             WEB.Config.updatekey("txtserviceheightthumbs", vlan,txtserviceheightthumbs.Text);
             WEB.Config.updatekey("txtservicewidth", vlan,txtservicewidth.Text);
             WEB.Config.updatekey("txtservicewidththumbs", vlan,txtservicewidththumbs.Text);

             WEB.Config.updatekey("txtvideoheight", vlan,txtvideoheight.Text);
             WEB.Config.updatekey("txtvideoheightthumbs", vlan, txtvideoheightthumbs.Text);
             WEB.Config.updatekey("txtvideowidth", vlan, txtvideowidth.Text);
             WEB.Config.updatekey("txtvideowidththumbs", vlan, txtvideowidththumbs.Text);

             WEB.Config.updatekey("txtprojectheight", vlan, txtprojectheight.Text);
             WEB.Config.updatekey("txtprojectheightthumbs", vlan, txtprojectheightthumbs.Text);
             WEB.Config.updatekey("txtprojectwidth", vlan, txtprojectwidth.Text);
             WEB.Config.updatekey("txtprojectwidththumbs", vlan, txtprojectwidththumbs.Text);

            lttitle.Text = "Cấu hình hệ thống - Cập nhật thành công";
            ltdetailmsg.Text = "<p class='msuccess' style='color: #06f;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật thành công</p>";
            ltdetailmsg.Visible = true;
            //ghi log
            WEB.Logs.writelog("Cập nhật cấu hình hệ thống");
            UpdateList();
        }
        catch (Exception ex)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật không thành công</p>";
            ltdetailmsg.Visible = true;
        }

        
    }

   

}

