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

public partial class home_contact_u_contact_index : System.Web.UI.UserControl
{
    public string lang = WEB.Common.Lang;
    DataTable dt = new DataTable(); //get ra tat ca danh mục
    protected void Page_Load(object sender, EventArgs e)
    {
        loadcopyright("content_contact");
    }
    protected void loadcopyright(string key)
    {
        string condition = "vcode ='" + WEB.Common.mod_independent + "' and istatus=1 and vdesc='" + key + "' and vlan='" + WEB.Common.Lang + "' ";
        DataTable dt = WEB.Item_other.getlistitembypage(new string[0], "", condition, 0, 30, " iid DESC");
        rpcontent_contact.DataSource = dt;
        rpcontent_contact.DataBind();
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
    }
}