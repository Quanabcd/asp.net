using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_products_util_others_u_views_products : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadItemsList();
    }
    protected void LoadItemsList()
    {
        int top = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_prdnumnew, lang));
        string prdlist = WEB.Common.getCookie("prdlistviewed");
        string[] s = prdlist.Split('|');
        string listiid = "";
        if (s.Length > 0)
        {
            for (int i = 0; i < s.Length; i++)
            {
                if (WEB.Common.Check_number(s[i]))
                {
                    if (listiid.Length == 0)
                        listiid = s[i];
                    else
                        listiid += "," + s[i];
                }
            }
        }
        string condition = " vcode ='" + WEB.Common.mod_product + "' and istatus = 1 ";
        if (listiid.Length > 0)
            condition += " and iid in (" + listiid + ")";
       // Response.Write(condition);
        string[] fieldsearch = { "vparam4"};
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, "", condition, 0, 10, "iid asc");
        rpitems.DataSource = dt;
        rpitems.DataBind();
    }
    public string getsale(string fold, string fnew)
    {
        if (fold != fnew && fold != "0")
            return " <div class='sale-flash'> - " + (Math.Round(((Convert.ToSingle(fold) - Convert.ToSingle(fnew)) / Convert.ToSingle(fold)) * 100)).ToString() + " %</div>";
        else
            return "";
    }
    public string getprice(string fold, string fnew)
    {
        string str = "";
        if (fnew != "0")
        {
            str += "<ins>" + WEB.Common.FomatPrice(fnew) + "</ins>";
        }
        else
            str += "<ins>Liên hệ</ins>";
        if (fold != fnew && fold != "0")
            str += "<del>" + WEB.Common.FomatPrice(fold) + "</del>";
        return str;


    }
    public string getsale(string s)
    {
        if (s.Contains("3"))
            return "<span class=\"label-sale\">Sale</span>";
        else
            return "";
    }
}