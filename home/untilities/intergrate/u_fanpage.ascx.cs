using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_untilities_intergrate_u_fanpage : System.Web.UI.UserControl
{
    string vlan = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
         if (TN.Configs.GetValueByKey(TN.Configs.k_istatusfacebook, vlan).Equals("1"))
             ltfanpage.Text = TN.Configs.GetValueByKey(TN.Configs.k_facebook, vlan);
    }
}