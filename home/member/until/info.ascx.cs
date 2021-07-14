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
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["user"] != null)
            {
            }
            else
                Response.Redirect(weburl + "account/login" );
        }
        catch
        {
            Session["user"] = null;
        }
        loadinfo();
        this.Page.Title = "Thông tin thành viên";
    }
    protected void btnsend_Click(object sender, EventArgs e)
    {
       
        if (txtname.Text.Length == 0)
        {
            this.ltmess.Text = "Họ tên không được để trống";
            ltmess.Visible = true;
            txtname.Focus();
            return;
        }
        if (txtemail.Text.Length == 0)
        {
            this.ltmess.Text = "Email không được để trống";
            ltmess.Visible = true;
            txtemail.Focus();
            return;
        }
        if (txtphone.Text.Length == 0)
        {
            this.ltmess.Text = "Số điện thoại không được để trống";
            ltmess.Visible = true;
            txtphone.Focus();
            return;
        }
        //check mail
        if(WEB.Common.IsValidEmail(txtemail.Text.Trim())==false)
        {
            this.ltmess.Text = "Email không hợp lệ";
            ltmess.Visible = true;
            txtemail.Focus();
            return;
        }
        DateTime dbirthday = DateTime.Now;
        if (txtbirthday.Text.Length == 0)
        {
            ltmess.Text = "Ngày sinh không hợp lệ. Ngày sinh phải có định dạng ngày/tháng/năm . VD: 01/01/2017";
            ltmess.Visible = true;
            txtbirthday.Focus();
            return;
        }
        else
        {
            try
            {
                string[] s = txtbirthday.Text.Trim().Split('/');
                dbirthday = new DateTime(Convert.ToInt32(s[2]), Convert.ToInt32(s[1]), Convert.ToInt32(s[0]),0, 0, 0);
            }
            catch
            {
                ltmess.Text = "Ngày sinh không hợp lệ. Ngày sinh phải có định dạng ngày/tháng/năm . VD: 01/01/2017";
                ltmess.Visible = true;
                txtbirthday.Focus();
                return;
            }
        }

        //update

        try
        {
            WEB.Member.db_users_update1(Session["user"].ToString(), "", txtname.Text, ddlsex.SelectedValue.ToString(), dbirthday.ToString("MM/dd/yyyy"), txtaddress.Text, txtphone.Text, txtemail.Text);
            if(chkupdatepass.Checked==true)
                WEB.Member.db_users_updatepass1(Session["user"].ToString(), WEB.Common.md5encode(txtpass.Text.Trim()));
            this.ltmess.Text = "<span style='color:blue'>Cập nhật thành công</span>";
            ltmess.Visible = true;
        }
        catch
        {
            this.ltmess.Text = "Ngày sinh không hợp lệ";
            ltmess.Visible = true;
            return;
        }

    }
    
    protected void loadinfo()
    {
        DataTable dt = new DataTable();
        dt = WEB.Member.getuser_byemail(Session["user"].ToString());
        if (dt.Rows.Count > 0)
        {
            ltaccount.Text = dt.Rows[0]["vusername"].ToString();
            txtaddress.Text = dt.Rows[0]["vaddress"].ToString();
            txtbirthday.Text = Convert.ToDateTime( dt.Rows[0]["dbirthday"].ToString()).ToString("dd/MM/yyyy");
            txtemail.Text = dt.Rows[0]["vemail"].ToString();
            hdemail.Value = dt.Rows[0]["vemail"].ToString();
            txtname.Text = dt.Rows[0]["vlname"].ToString();
            txtphone.Text = dt.Rows[0]["vphone"].ToString();
            WEB.Common.SetSelectedIndexInDropDownList(ref ddlsex,dt.Rows[0]["igender"].ToString());

        }
    }
}
