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

public partial class home_products_index_u_products_bycate : System.Web.UI.UserControl
{
    public string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
    protected void Page_Load(object sender, EventArgs e)
    {
        
            loadcate();
        
    }
    protected void loadcate()
    {
        DataTable dtcate = new DataTable();
        string conditions = "istatus=1 and vparam4='1'";
        dtcate = WEB.Category.getlisitem(WEB.Common.mod_product, lang, conditions, "iorders ASC");
        rpcate.DataSource = dtcate;
        rpcate.DataBind();
    }
    public string getsale(string s)
    {
        if (s.Contains("3"))
            return " <span class='sale'><i></i> SALE</span>";
        else if (s.Contains("2"))
        {
            return " <span class='hot'><i></i> HOT</span>";
        }
        else
            return "";
    }
    public string getprice(string fold, string fnew)
    {
        string str = "";
        if (fnew != "0")
        {
            str += "<span>" + WEB.Common.FomatPrice(fnew) + "</span>";
        }
        if (fold != fnew && fold != "0")
            str += "<del>" + WEB.Common.FomatPrice(fold) + "</del>";
        if (fold == "0" && fnew == "0")
            str += "<span>Liên hệ</span>";
        return str;
    }

    protected DataTable loaditem(string icid)
    {
        string listcid_child = WEB.Category.getlistcate_string(icid, WEB.Common.mod_product, lang, "1");
        string[] fieldsearch = {"vparam4"};
        string condition = " vcode ='" + WEB.Common.mod_product + "' and icid in (" + listcid_child + ") and istatus=1 ";
        int itemperpage = 8;
       
   
        string key = "2";
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, 0, itemperpage, "iparam2 asc , dupdate DESC ");
        return dt;
    }
    public string SubMenus(string icid)
    {
        string str = "";
        DataTable dt = WEB.Category.getlisitem(WEB.Common.mod_product, lang, "iparcid='" + icid + "'", "iorders desc");
        if (dt.Rows.Count > 0)
        {
            str += "<ul>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str += "<li >";
                str += "<a class='title' href='/" + dt.Rows[i]["valias"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a>";
                str += "</li>";
            }
            str += "</ul>";

        }
        return str;
    }
    public string loadkhuvuc(string iparam8)
    {
        string str = "";
        if (Convert.ToInt32(iparam8) > 1)
        {
            DataTable dthsx = TN.Categories.GetCateDetailByField("icid", iparam8);
            if (dthsx.Rows.Count > 0)
            {
                str +=  dthsx.Rows[0]["vname"].ToString();
            }
        }
        return str;
    }
    public string SubMenus2(string icid)
    {
        string str = "";
        DataTable dt = WEB.Category.getlisitem(WEB.Common.mod_product, lang, "iparcid='" + icid + "'", "iorders desc");
        if (dt.Rows.Count > 0)
        {
           
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                str += "<a class='desktop-lg' href='/" + dt.Rows[i]["valias"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a>";
            }
         

        }
        return str;
    }
    protected string getimgcate(string icid)
    {

        string str = "";
        DataTable dt = WEB.Category.getcatebyid(icid);
        if (dt.Rows[0]["vimg"].ToString().Length>0)
        {
            str += "<div class='mb5 ps-relative'>";
            str += "<a class='box-banner-index' href='/"+dt.Rows[0]["valias"].ToString()+"'>";
            str += "<img src='/uploads/products/cates/"+dt.Rows[0]["vimg"].ToString()+"' alt='"+dt.Rows[0]["vname"].ToString()+"'>";
            str += "<span class='effect-banner'></span>";
            str += "</a>";
            str += "</div>";
        }
        else
        {
            str += "";
        }

        return str;

    }
}
