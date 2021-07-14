using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_products_util_menu_u_menu_cates : System.Web.UI.UserControl
{
    public string lang =TN.Common.Lang;
    public string weburl =TN.Common.Weburl;
    public string valias = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        valias =TN.Common.GetUrlParam("alias");
        if (valias.Length > 0)
        {
            DataTable dt = new DataTable();
            DataTable dti =TN.Items.GetItemByField("valias", valias);
            if (dti.Rows.Count > 0)
            {
                dt =TN.Categories.GetCateDetailByField("icid", dti.Rows[0]["icid"].ToString());
            }
            else
                dt = TN.Categories.GetCateDetailByField("valias", valias);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["ccode"].ToString().Trim() ==TN.Common.mod_product)
                {
                    string s = Menu(dt.Rows[0]["icid"].ToString(),TN.Common.mod_product);
                    if (s.Length > 0)
                    {
                        ltmenu.Text = s;
                        ltcates.Text = dt.Rows[0]["vname"].ToString();
                    }
                    else
                    {
                        ltmenu.Text = Menu(dt.Rows[0]["iparcid"].ToString(),TN.Common.mod_product);
                        dt = TN.Categories.GetCateDetailByField("icid", dt.Rows[0]["iparcid"].ToString());
                        if (dt.Rows.Count > 0)
                        {
                            ltcates.Text = dt.Rows[0]["vname"].ToString();
                        }
                        else
                            ltcates.Text = "Danh mục sản phẩm";
                    }
                }
                else
                {
                    ltmenu.Text = Menu("-1",TN.Common.mod_product);
                    ltcates.Text = "Danh mục sản phẩm";
                }
            }
        }
        else
        {
            ltmenu.Text= Menu("-1",TN.Common.mod_product);
            ltcates.Text = "Danh mục sản phẩm";
        }
       
    }
    public string getselected(string s)
    {
        if (s == valias)
            return " selected";
        else
            return "";
    }
    string Menu(string cid, string capp)
    {
        string strresult = "";
        DataTable dt = new DataTable();
        TN.Categories.GetListChildrenInCate(ref dt, cid, TN.Common.mod_product,"", "1", "iorders asc");
        if (dt.Rows.Count > 0)
        {
            strresult += "<ul class='list-block  list-unstyled'>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                strresult += "<li><a class='mncateitem" + getselected(dt.Rows[i]["valias"].ToString()) +  "' title='" + dt.Rows[i]["vname"].ToString() + "' href='" + weburl + dt.Rows[i]["valias"].ToString() + "'><i class=\"fa fa-caret-right\" aria-hidden=\"true\"></i>" + dt.Rows[i]["vname"].ToString() + "</a>";
                strresult += Menu(dt.Rows[i]["icid"].ToString(),TN.Common.mod_product);
                strresult += "</li>";
            }
            strresult += "</ul>";
        }
        return strresult;
    }
    public string getimg(string img, string title)
    {
        if (img.Length > 0)
            return "<span class='icon_danhmuc'><img alt='" + title + "' src='" + weburl + "uploads/products/cates/" + img + "' /></span>";
        else
            return "<span class='icon_danhmuc'><img alt='" + title + "' src='" + weburl + "uploads/products/cates/default.png' /></span>";
    }
}