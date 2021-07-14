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
    public string valias = "";
    public string vender = "";
    public string from = "0";
    public string to = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
       ltitems.Text=  LoadItemsList();
    }
    protected string LoadItemsList()
    {
        string str = "";
        //int top = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_prdnumnew, lang));
        string condition = " vcode ='HEL' and vlan='" + lang + "' and istatus = 1";
        string[] fieldsearch = { "vparam4" };
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, "2", condition, 0, 20, "dupdate DESC");
        for (int i=0;i<dt.Rows.Count;i++)
        {
            if (i%2==0)
            {
                str += "<div class='item'>";
            }
            
            str += "<div class='tourmaster-tour-category-item-wrap'>";
            str += "<div class='tourmaster-tour-category-thumbnail tourmaster-media-image'>";
            str += "<img src='/uploads/products/thumbs/"+dt.Rows[i]["vimg"].ToString()+"' alt='"+dt.Rows[i]["vtitle"].ToString()+"' />";
            str += "</div>";
            str += "<div class='tourmaster-tour-category-overlay'></div>";
            str += "<div class='tourmaster-tour-category-overlay-front'></div>";
            str += "<div class='tourmaster-tour-category-head'>";
            str += "<div class='tourmaster-tour-category-head-display clearfix'>";
            str += "<a href='"+ geturl(dt.Rows[i]["iparam8"].ToString()) + "'><h3 class='tourmaster-tour-category-title'><i class='fa fa-map-marker color-x'></i>" + loadkhuvuc(dt.Rows[i]["iparam8"].ToString()) + "</h3></a>";
            str += "</div>";
            str += "<div class='tourmaster-tour-category-head-animate'>";
            str += "<a class='tourmaster-tour-category-head-link' href='/" + dt.Rows[i]["valias"].ToString() + "'>"+ WEB.Common.Getlabel("lb_title_hotel_readmore", "Read more", WEB.Common.Lang) + "</a>";
            str += "<div class='tourmaster-tour-category-head-divider'></div>";
            str += "</div>";
            str += "</div>";
            str += "</div>";
            

            if (i%2==1 || (i>dt.Rows.Count-1))
            {
               str += "</div>";
            }
        }
        return str;
        
    }
    public string geturl(string iparam8)
    {
        string s = "";
        if (Convert.ToInt32(iparam8) > 1)
        {
            DataTable dthsx = TN.Categories.GetCateDetailByField("icid", iparam8);
            if (dthsx.Rows.Count > 0)
            {
                s += dthsx.Rows[0]["valias"].ToString();
            }
        }

        string str = "hotel--resort?vender=" + s;
        if (from != "0")
        {
            str += "&from=" + from;
        }
        if (to != "0")
            str += "&to=" + to;
        return str;
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
            str += "<span>" + WEB.Common.FomatPrice(fnew) + "</span>";
        }
        if (fold != fnew && fold != "0")
            str += "<del>" + WEB.Common.FomatPrice(fold) + "</del>";
        if (fold == "0" && fnew == "0")
            str += "<span>Liên hệ</span>";
        return str;
    }

}