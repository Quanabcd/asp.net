using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_videos_untils_u_list_cates : System.Web.UI.UserControl
{
    public string vlan = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = WEB.Category.getcate("-1", WEB.Common.mod_videos, vlan, "1", "1");
            rpcates.DataSource = dt;
            rpcates.DataBind();
        }
    }
}