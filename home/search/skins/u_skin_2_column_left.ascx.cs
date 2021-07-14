using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_rooms_skins_u_skin_2_column_left : System.Web.UI.UserControl
{
    public string strroad = "";
    protected void Page_Load(object sender, EventArgs e)
    {
       
        phcontrol.Controls.Add(LoadControl("../default/u_products_search_result.ascx"));
    }
}