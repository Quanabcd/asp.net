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
            
            lttitle.Text = "Cấu hình bình luận";
            lnkupdate.Visible = true;
            ltdetailmsg.Visible = false;
            this.UpdateList();
        }
    }

    protected void UpdateList()
    {
        if (WEB.Config.getvaluebykey("guimailkhicobinhluan", vlan).Equals("1"))
            chksendmail.Checked = true;
        else
            chksendmail.Checked = false;
        txtemail.Text= WEB.Config.getvaluebykey("emailnhanbinhluan", vlan);
     
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
        
        
        try
        {
            WEB.Config.updatekey("emailnhanbinhluan", vlan,txtemail.Text);
            string sendmail = "0";
            if (chksendmail.Checked == true)
                sendmail = "1";
           
            WEB.Config.updatekey("guimailkhicobinhluan", vlan, sendmail);
            lttitle.Text = "Cấu hình bình luận - Cập nhật thành công";
            ltdetailmsg.Text = "<p style='color: #06f;margin: 0;padding: 12px 15px 10px 0px;font-size: 12px;'>Cập nhật thành công</p>";
            ltdetailmsg.Visible = true;
            //ghi log
            WEB.Logs.writelog("Cập nhật cấu hình bình luận");
            UpdateList();
        }
        catch (Exception ex)
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 10px 0px;font-size: 12px;'>Cập nhật không thành công</p>";
            ltdetailmsg.Visible = true;
        }

        
    }

   

}
