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

public partial class home_news_controls : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
            phcontrols.Controls.Add(LoadControl("~/home/products/skins/u_home_homepage_style1.ascx"));
        
    }     
}
