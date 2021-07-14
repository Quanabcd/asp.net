using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_untilities_error_u_404 : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lterror.Text= WEB.Config.getvaluebykey(WEB.Config.k_contenterror404, WEB.Common.Lang);
    }
}