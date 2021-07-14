using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_untilities_other_u_independent : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadcontent("GIOITHIEU");

    }
   
    protected void loadcontent(string key)
    {
        string condition = "  vdesc='" + key + "'";
        DataTable dt = TN.ItemsOther.GetListItemByPage(new string[0], "", TN.Common.mod_independent, TN.Common.Lang, condition, "1", 0, 30, " iid DESC");
        if (dt.Rows.Count > 0)
        {

            lttitle.Text = dt.Rows[0]["vtitle"].ToString().Trim();
            ltcontent.Text = dt.Rows[0]["vcontent"].ToString().Trim();

            ltlink.Text = "<a href='" + dt.Rows[0]["vparam1"].ToString() + "' class='btn btn-green-3 wow  btn-137464221256a19a1082f94  animated animated animated animated'><span>" + WEB.Common.Getlabel("lbviewmore", "Xem thêm", WEB.Common.Lang) + "</span></a>";

        }
    }
}