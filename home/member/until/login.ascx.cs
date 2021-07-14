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

public partial class home_member_login : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string lan = WEB.Common.Lang;
    public string urlredirect = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        urlredirect = WEB.Common.GeturlParam("url");
        urlredirect = weburl + urlredirect;
        if (!IsPostBack)
        {
            try
            {
                if (Session["user"] !=null)
                {
                    Response.Redirect(weburl + "account/info");
                }
            }
            catch
            {
                Session["user"] = null;
            }
            btnlogin.Text = WEB.Common.Getlabel("lt_titlelogin", "Đăng nhập", lan);
            Page.Title = WEB.Common.Getlabel("lt_titlelogin", "Đăng nhập", lan);
        }
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        if (txtaccount.Text.Length == 0)
        {
            this.ltmess.Text = WEB.Common.Getlabel("lt_emailempty", "Email không được để trống", lan);
            ltmess.Visible = true;
            txtaccount.Focus();
            return;
        }
        if (txtpass.Text.Length == 0)
        {
            this.ltmess.Text = WEB.Common.Getlabel("lt_passempty", "Mật khẩu không được để trống", lan);
            ltmess.Visible = true;
            txtpass.Focus();
            return;
        }
        //check user
        DataTable dt = new DataTable();
        dt = WEB.Member.getuser_byemail_pass(txtaccount.Text.Trim().ToLower(),WEB.Common.md5encode(txtpass.Text.Trim()));
        if(dt.Rows.Count>0)
        {
            Session["user"] = dt.Rows[0]["vemail"].ToString();
            Response.Redirect(urlredirect);
        }
        else
        {
            this.ltmess.Text = WEB.Common.Getlabel("lt_emailorpassvalid", "Email hoặc mật khẩu không hợp lệ", lan);
            ltmess.Visible = true;
            return;
        }
    }
    
    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Response.Cookies["useraccount"].Value = "";
        Response.Redirect(weburl);
    }
    public string getlabel(string key, string vvalue)
    {
        return WEB.Common.Getlabel(key, vvalue, lan);
    }
}
