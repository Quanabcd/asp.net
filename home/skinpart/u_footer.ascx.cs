using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_skinpart_u_footer : System.Web.UI.UserControl
{
    public string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
    protected void Page_Load(object sender, EventArgs e)
    {
        //WEB.Layout.LoadControlToPlaceholder(ref ph_regisemail, "~/home/untilities/emailregister/u_email_register.ascx");
        //loadcopyright("copyright");
        //loadmenucontent();
    }

    //protected void loadcopyright(string key)
    //{
    //    string condition = "vcode ='" + WEB.Common.mod_independent + "' and istatus=1 and vdesc='" + key + "' and vlan='" + WEB.Common.Lang + "' ";
    //    DataTable dt = WEB.Item_other.getlistitembypage(new string[0], "", condition, 0, 30, " iid DESC");
    //    if (dt.Rows.Count > 0)
    //    {
    //        //ltcopyright.Text = dt.Rows[0]["vcontent"].ToString().Trim();

    //    }
    //}
    //protected void loadmenucontent()
    //{

    //    DataTable dt = new DataTable();
    //    WEB.Category.getcategorylevel1(ref dt, "-1", WEB.Common.mod_menucont, lang, "1");
    //    rpitems.DataSource = dt;
    //    rpitems.DataBind();
    //}
    //protected DataTable loadsub(string id)
    //{
    //    DataTable dt = WEB.Category.getlisitem(WEB.Common.mod_menucont, lang, "iparcid='" + id + "'", "iorders desc");
    //    return dt;
    //}


}