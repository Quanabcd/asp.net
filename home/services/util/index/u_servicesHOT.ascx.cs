using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_services_util_index_u_servicesHOT : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadItemsList();
    }
    protected void LoadItemsList()
    {
        //int top = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_prdnumnew, lang));
        string condition = " vcode ='" + WEB.Common.mod_service + "' and vlan='" + lang + "' and istatus = 1";
        string[] fieldsearch = { "vparam4" };
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, "2", condition, 0, 3, "iparam1 desc, dcreatedate DESC");
        rpitems.DataSource = dt;
        rpitems.DataBind();
    }
}