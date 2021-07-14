using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_products_util_newhotsale_u_new_product : System.Web.UI.UserControl
{
    public string weburl = TN.Common.Weburl;
    public string lang = TN.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadItemsList();
    }
    protected void LoadItemsList()
    {
        //int top = Convert.ToInt32(TN.Configs.GetValueByKey(TN.Configs.k_prdnumnew, lang));
        string condition = "";
        string[] fieldsearch = { "vparam4" };
        DataTable dt = new DataTable();
        dt = TN.Items.GetListItemInCateByPage("-1",fieldsearch, "","HEL",lang, condition,"1", 0, 5, "dupdate DESC");
        rpitems.DataSource = dt;
        rpitems.DataBind();
    }
    public string getprice(string fold, string fnew)
    {
        string str = "";
        if (fnew != "0")
        {
            str += "<span class=\"price product-price sale-price\">" + TN.Common.FomatPrice(fnew,lang) + "</span>";
        }
        else
            str += "<span class=\"price product-price sale-price\">Liên hệ</span>";
        if (fold != fnew && fold != "0")
            str += "<span class=\"old-price product-price\">" + TN.Common.FomatPrice(fold, lang) + "</span>";
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