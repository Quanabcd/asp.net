using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_member_until_wishlist : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
            try
            {
                if (Session["user"] != null)
                {
                    loadlist();
                }
                else
                    Response.Redirect(WEB.Common.Weburl);
            }
            catch
            {
                Session["user"] = null;
            }
        
        this.Page.Title = "Sản phẩm yêu thích";
    }
    public void loadlist()
    {
         DataTable dt = new DataTable();
         string str = "";
        dt = WEB.Member.getuser_byemail(Session["user"].ToString());
        if (dt.Rows.Count > 0)
        {
            string[] s = dt.Rows[0]["vpr1"].ToString().Split('|');
            for (int i = 0; i < s.Length; i++)
            {
                if(WEB.Common.Check_float(s[i]))
                {
                    if(str.Length==0)
                        str = s[i] ;
                    else
                        str = "," + s[i] ;
                }
            }
            string condition = "1=1";
            if (str.Length > 0)
            {
                condition += " and iid in (" + str + ")";
                dt = TN.Items.GetListItemInCateByPage("-1", new string[0], "", TN.Common.mod_product, WEB.Common.Lang, condition, "1", 0, 50, "vtitle asc");
                if (dt.Rows.Count > 0)
                {
                    rpitems.DataSource = dt;
                    rpitems.DataBind(); ltnorecord.Text = "";
                }
                else
                    ltnorecord.Text = "Bạn chưa có sản phẩm yêu thích nào trong danh sách";
            }
            else
                ltnorecord.Text = "Bạn chưa có sản phẩm yêu thích nào trong danh sách";
        }
    }
    protected void Delete_Load(object sender, System.EventArgs e)
    {
        ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn có muốn xóa không?')";
    }
   
    protected void rpitems_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        DataTable dt = new DataTable();
        string c = e.CommandName.ToString();
        string pr = e.CommandArgument.ToString();
        switch (c)
        {
            case "delete":

                dt = WEB.Member.getuser_byemail(Session["user"].ToString());
                if (dt.Rows.Count > 0)
                {
                    string sl = dt.Rows[0]["vpr1"].ToString().Replace("|" + pr + "|", "|");
                    string[] s = { "vpr1" };
                    object[] v = {sl};
                    WEB.Member.save(Convert.ToInt32(dt.Rows[0]["iuserid"]), s, v);
                    Response.Redirect(WEB.Common.Weburl + "account/wishlist");
                    
                }

                break;
        }
    }
}