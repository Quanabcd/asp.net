using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_menu_u_searchmobi : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lk_search_Click(object sender, EventArgs e)
    {
        string key = "";
        key = txt_search.Text.Trim();
        if (txt_search.Text.Length > 0)
            Response.Redirect(WEB.Common.Weburl + "tim-kiem?key=" + key);
    }
}