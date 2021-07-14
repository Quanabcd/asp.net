using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_products_util_others_u_price : System.Web.UI.UserControl
{
    public string valias = "";
    public string vender = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        valias = WEB.Common.GeturlParam("alias");
        vender = WEB.Common.GeturlParam("vender");
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
            loadprice(dt.Rows[0]["icid"].ToString());
        }
    }
    public void loadprice(string cid)
    {
        DataTable dt = WEB.Category.getlistcate(WEB.Common.mod_product_price, "vlan='" + WEB.Common.Lang + "' and vicon like '%|" + cid + "|%'", "iorders asc", "1");
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
    public string geturl(string from, string to)
    {
        string str = "";
        if (vender.Length > 0)
        {
            str = "/" + valias + "?vender=" + vender + "&from=" + from + "&to=" + to;
        }
        else
            str = "/" + valias + "?from=" + from + "&to=" + to;
        return str;
    }
}