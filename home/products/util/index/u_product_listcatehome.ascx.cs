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

public partial class home_products_index_u_product_listcatehome1 : System.Web.UI.UserControl
{
    public int n = 0;
    public string weburl = TN.Common.Weburl;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
       TN.Categories.GetListChildrenInCate(ref dt, "-1", " vparam4 = '1' and vlan='" + TN.Common.Lang + "' and ccode='" + TN.Common.mod_product + "'", "1"," iorders ASC");
        rpcate.DataSource = dt;
        rpcate.DataBind();
    }
    public DataTable getchild(string cid)
    {
        DataTable dt = new DataTable();
        WEB.Category.getcategorylevel1(ref dt,cid, TN.Common.mod_product,  TN.Common.Lang , "1");
        return dt;
    }
    public int stt()
    {
        n++;
        return n;
    }
    public string geticon(string s)
    {
        if (s.Length == 0)
            return "/uploads/products/cates/default.png";
        else
            return "/uploads/products/cates/" + s;
    }
    public string getimgcate(string s,string alt)
    {
        if (s.Length == 0)
            return "<img src='/uploads/products/cates/default.png' class=\"img-responsive\"  alt='" + alt + "' />";
        else
            return "<img src='/uploads/products/cates/" + s + "'  class=\"img-responsive\" alt='" + alt + "' />";
    }
    public string getprice(string fold, string fnew)
    {
        string str = "";
        if (fnew != "0")
        {
            str += "<ins>" + TN.Common.FomatPrice(fnew,TN.Common.Lang) + "</ins>";
        }
        else
            str += "<ins>Liên hệ</ins>";
        if (fold != fnew && fold != "0")
            str += "<del>" + TN.Common.FomatPrice(fold, TN.Common.Lang) + "</del>";
        return str;

    }
    public string getsale(string fold, string fnew)
    {
        if (fold != fnew && fold != "0")
            return " <div class='sale-flash'> - " + (Math.Round(((Convert.ToSingle(fold)  - Convert.ToSingle(fnew)) / Convert.ToSingle(fold))*100)).ToString()+" %</div>";
        else
            return "";
    }
    public DataTable getitemincate(string cid)
    {
        int n = 12;
        try
        {
            n = Convert.ToInt32(TN.Configs.GetValueByKey(TN.Configs.k_prdpercate, TN.Common.Lang));
        }
        catch { }
        DataTable dt = new DataTable();
        dt = TN.Items.GetListItemInCateByPage(cid, new string[0], "", TN.Common.mod_product, TN.Common.Lang, "", "1", 0, n, "iparam1 asc, dcreatedate desc");
        
        return dt;
    }
    public string getcss()
    {
        string[] s = { "box-pin", "box-bluedark", "box-blue", "box-aqua", "box-tundora", "box-brown", "box-violet", "box-bluesky", "box-pin", "box-bluedark", "box-blue", "box-aqua", "box-tundora", "box-brown", "box-violet" };
        return s[n - 1];
    }
}
