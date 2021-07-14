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

public partial class home_member_controls : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
                Controls.Add(LoadControl("~/home/member/skins/u_skins.ascx"));
               
    }
}
