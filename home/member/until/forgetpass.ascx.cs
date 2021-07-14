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

public partial class home_member_forgetpassword : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (Session["user"]!=null)
                {
                    Response.Redirect(weburl + "account/info");
                }
            }
            catch
            {
                Response.Cookies["useraccount"].Value = "";
            }
        }
        Page.Title =getlabel("lt_titlegetpass","Lấy lại mật khẩu");
        pnforget.Visible = true;
        pnsussecc.Visible = false;
    }
    public string getlabel(string key, string vvalue)
    {
        return WEB.Common.Getlabel(key, vvalue, vlan);
    }
    protected void btnsend_Click(object sender, EventArgs e)
    {
        if (txtemail.Text.Length == 0)
        {
            this.ltmess.Text = getlabel("lt_emailempty", "Email không được để trống");
            ltmess.Visible = true;
            txtemail.Focus();
            return;
        }
        
        //check user
        DataTable dt = new DataTable();
        dt = WEB.Member.getuser_byemail(txtemail.Text.Trim());
        if(dt.Rows.Count>0)
        {
            //update password
            Random rd = new Random();
            int pn = rd.Next(10000, 99999);
            WEB.Member.db_users_updatepassbyemail(txtemail.Text.Trim(),WEB.Common.md5encode(pn.ToString()));
            //send mail
            string title = "Thông tin khôi phục mật khẩu tại website: " + weburl;
            string content = WEB.Config.getvaluebykey(WEB.Config.key_content_sendmail_while_resetpass, vlan);
            content = content.Replace("[WEBSITE]", WEB.Common.Weburl).Replace("[EMAIL]", txtemail.Text.Trim().ToLower()).Replace("[PASS]", pn.ToString());
            try
            {
                WEB.Common.SendMail(txtemail.Text, "tamnghiaweb@gmail.com", "", title, content);
                pnforget.Visible = false;
                pnsussecc.Visible = true;
            }
            catch
            {
            }
            
        }
        else
        {
            this.ltmess.Text = getlabel("lt_emailinvalid", "Email không hợp lệ"); 
            ltmess.Visible = true;
            return;
        }
    }
   
}
