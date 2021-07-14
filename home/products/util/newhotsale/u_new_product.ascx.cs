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
        
        string condition = "";
        string[] fieldsearch = { "vparam4" };
        DataTable dt = new DataTable();
        dt = TN.Items.GetListItemInCateByPage("-1",fieldsearch, "2",TN.Common.mod_product,lang, condition,"1", 0, 5, "dupdate DESC");
        rpitems.DataSource = dt;
        rpitems.DataBind();
    }
    public string getprice(string fold, string fnew)
    {
        string str = "";
        if (fnew != "0")
        {
            str += "<span class='pro-price'>" + TN.Common.FomatPrice(fnew, lang) + "</span>";
        }
        else
            str += "<span class='pro-price'>Liên hệ</span>";
        if (fold != fnew && fold != "0")
            str += "<del class='pro-compare-price'>" + TN.Common.FomatPrice(fold, lang) + "</del>";
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