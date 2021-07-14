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

public partial class admin_products_control : System.Web.UI.UserControl
{
    public string role = "";
   
    protected void Page_Load(object sender, EventArgs e)
    {
        string c = "";
        role = Session["role"].ToString();
        c = WEB.Common.GeturlParam("c");
        int id = -1;
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("id")))
        {
            id = Convert.ToInt32(WEB.Common.GeturlParam("id"));
        }
        string f = "";
        if (WEB.Common.GeturlParam("f").Length>0)
        {
            f = WEB.Common.GeturlParam("f");
        }
        switch (c)
        {
            case "cates":
               
                    Controls.Add(LoadControl("category.ascx"));
                break;
            case "items":
              
                    if(f=="add")
                        Controls.Add(LoadControl("item_edit.ascx"));
                    else if(f=="addmulti")
                        Controls.Add(LoadControl("item_add_multi.ascx"));
                    else if(id!=-1)
                        Controls.Add(LoadControl("item_edit.ascx"));
                    else
                        Controls.Add(LoadControl("item.ascx"));
                
                break;
            case "features":
               
                Controls.Add(LoadControl("features.ascx"));
                break;
            case "vendors":
                
                Controls.Add(LoadControl("vendor.ascx"));
                break;
            case "groups":
              
                Controls.Add(LoadControl("group.ascx"));
                break;
            case "settings":
                
                Controls.Add(LoadControl("setting.ascx"));
                break;
            case "orders":
               
                Controls.Add(LoadControl("order.ascx"));
                break;
            case "coupons":
                
                Controls.Add(LoadControl("coupons.ascx"));
                break;
            case "prices":
                
                    Controls.Add(LoadControl("price.ascx"));
                break;
            default:
              
                Controls.Add(LoadControl("category.ascx"));
                break;
        }
        
    }
    public bool checkrole(string s)
    {
        if (role.Contains("|" + s + "|"))
            return true;
        else
            return false;
    }
}
