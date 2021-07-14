using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_filelibrarys_topfile_u_topfile : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int top = 10;
        string condition = " vcode ='" + WEB.Common.mod_files + "' and vlan='" + WEB.Common.Lang + "'";
        string[] fieldsearch = { "vparam4" };
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, "1", condition, 0, top, "dupdate DESC");
        rpitems.DataSource = dt;
        rpitems.DataBind();
    }
}