using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_products_util_index_u_productsHOT : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
       LoadItemsList();
    }
    protected void LoadItemsList()
    {
        string str = "";
        //int top = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_prdnumnew, lang));
        string condition = " vcode ='" + WEB.Common.mod_product + "' and vlan='"+lang+"' and istatus = 1";
        string[] fieldsearch = { "vparam4" };
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, "2", condition, 0, 8, "dupdate DESC");
        rp_items.DataSource = dt;
        rp_items.DataBind();
    }
    public string getsale(string fold, string fnew)
    {
        if (fold != fnew && fold != "0")
            return " <div class='sale-label sale-top-right'> - " + (Math.Round(((Convert.ToSingle(fold) - Convert.ToSingle(fnew)) / Convert.ToSingle(fold)) * 100)).ToString() + " %</div>";
        else
            return "";
    }
    public string loadkhuvuc(string iparam8)
    {
        string str = "";
        if (Convert.ToInt32(iparam8) > 1)
        {
            DataTable dthsx = TN.Categories.GetCateDetailByField("icid", iparam8);
            if (dthsx.Rows.Count > 0)
            {
                str += dthsx.Rows[0]["vname"].ToString();
            }
        }
        return str;
    }
    public string getprice(string fold, string fnew)
    {
        string str = "";
        if (fnew != "0")
        {
            str += "<span class='pro-price'>" + WEB.Common.FomatPrice(fnew) + "</span>";
        }
        if (fold != fnew && fold != "0")
            str += "<del class='pro-compare-price'>" + WEB.Common.FomatPrice(fold) + "</del>";
        if (fold == "0" && fnew == "0")
            str += "<span class='pro-price'>Liên hệ</span>";
        return str;
    }

}