using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_advs_u_adv2 : System.Web.UI.UserControl
{
    public int n = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = TN.Advs.GetAdvByPosition("ADV-BB", WEB.Common.Lang);
        rpitems.DataSource = dt;
        rpitems.DataBind();

    }
}