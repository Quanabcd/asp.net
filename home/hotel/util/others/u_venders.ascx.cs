using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_products_util_others_u_venders : System.Web.UI.UserControl
{
    public string valias = "";
    public string vender = "";
    public string from = "0";
    public string to = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        valias = WEB.Common.GeturlParam("alias");
        vender = WEB.Common.GeturlParam("vender");
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("from")))
            from = WEB.Common.GeturlParam("from");
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("to")))
            to = WEB.Common.GeturlParam("to");
                
        DataTable dt = new DataTable();
        DataTable dti = WEB.Items.getitembyfield("valias", valias);
        if (dti.Rows.Count > 0)
        {
            dt = WEB.Category.getcatebyfield("icid", dti.Rows[0]["icid"].ToString());
            valias = dt.Rows[0]["valias"].ToString();
        }
        else
            dt = WEB.Category.getcatebyfield("valias", valias);

        if (dt.Rows.Count > 0)
        {
            loadvender(dt.Rows[0]["icid"].ToString());
        }
    }
    public void loadvender(string cid)
    {
        DataTable dt = WEB.Category.getlistcate("HEV", "vlan='" + WEB.Common.Lang + "' and vicon like '%|" + cid + "|%'", "iorders asc", "1");
        rpvenders.DataSource = dt;
        rpvenders.DataBind();
    }
    public string getselected(string s)
    {
        if (s == vender)
            return " selected";
        else
            return "";
    }
    public string geturl(string s)
    {
        string str = "/" + valias + "?vender=" + s;
        if (from != "0")
        {
            str +="&from=" + from ;
        }
        if(to!="0")
            str += "&to=" + to;
        return str;
    }
}