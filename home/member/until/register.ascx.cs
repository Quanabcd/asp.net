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

public partial class home_member_register : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string lan = WEB.Common.Lang;
    public string urlredirect = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        urlredirect = WEB.Common.GeturlParam("url");
        urlredirect = weburl + urlredirect;
        if (Session["user"] != null)
        {
            Response.Redirect(weburl + "account/info" ) ;
        }

        this.Page.Title = WEB.Common.Getlabel("lt_titleregister", "Đăng ký tài khoản", lan);
    }
 
    protected void btnregister_Click(object sender, EventArgs e)
    {
        if (txtname.Text.Length == 0)
        {
            this.ltmess.Text = WEB.Common.Getlabel("lt_nameempty", "Họ tên không được để trống", lan);
            ltmess.Visible = true;
            txtname.Focus();
            return;
        }
        if (txtemail.Text.Length == 0)
        {
            this.ltmess.Text = WEB.Common.Getlabel("lt_emailempty", "Email không được để trống", lan);
            ltmess.Visible = true;
            txtemail.Focus();
            return;
        }
        //check mail
        if (WEB.Common.IsValidEmail(txtemail.Text.Trim().ToLower()) == false)
        {
            this.ltmess.Text = WEB.Common.Getlabel("lt_emailinvalid", "Email không hợp lệ", lan);
            ltmess.Visible = true;
            txtemail.Focus();
            return;
        }

        //check mail
        DataTable dt = WEB.Member.getuser_byemail(txtemail.Text.Trim().ToLower());
        if (dt.Rows.Count > 0)
        {
            this.ltmess.Text = WEB.Common.Getlabel("lt_emailexist", "Email đã được dùng để đăng kí cho tài khoản khác", lan);
            ltmess.Visible = true;
            txtemail.Focus();
            return;
        }
        if (txtpass.Text.Length == 0)
        {
            this.ltmess.Text = WEB.Common.Getlabel("lt_passempty", "Mật khẩu không được để trống", lan);
            ltmess.Visible = true;
            txtpass.Focus();
            return;
        }
        if (txtpass.Text.Trim() != txtrepass.Text.Trim())
        {
            this.ltmess.Text = WEB.Common.Getlabel("lt_passunlike", "Mật khẩu không khớp", lan);
            ltmess.Visible = true;
            txtpass.Focus();
            return;
        }


        //insert

        try
        {
            WEB.Member.db_users_insert(txtemail.Text, WEB.Common.md5encode(txtpass.Text.Trim()),"", txtname.Text, "0", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "", "", txtemail.Text, DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), "1", "", "", "", "0", "0", "0");
            //sendmail
            string title = "Thông tin tài khoản của bạn tại website: " + WEB.Common.Weburl;
            string content = WEB.Config.getvaluebykey(WEB.Config.key_content_sendmail_while_register, lan);
            content = content.Replace("[WEBSITE]", WEB.Common.Weburl).Replace("[EMAIL]", txtemail.Text.Trim().ToLower()).Replace("[PASS]", txtpass.Text.Trim());
            WEB.Common.SendMail(txtemail.Text, "tamnghiaweb@gmail.com", WEB.Config.getvaluebykey(WEB.Config.k_comemail, lan), title, content);
            Session["user"] = txtemail.Text.Trim().ToLower();
            Response.Redirect(urlredirect);
            //pnregister.Visible = false;
            //pnsussecc.Visible = true;
        }
        catch (Exception ex)
        {
            this.ltmess.Text = WEB.Common.Getlabel("lt_datainvalid", "Dữ liệu nhập vào không đúng", lan) ; 
            ltmess.Visible = true;
            return;
        }
    }
}
