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

public partial class home_products_menu_u_vertical_slide_menu : System.Web.UI.UserControl
{
    public string lang = TN.Common.Lang;
    public string weburl = TN.Common.Weburl;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMenu();
        }
    }
    void LoadMenu()
    {
        DataTable dt = new DataTable();
        ltmenu.Text += Menu("-1", TN.Common.mod_product);
    }
    string Menu(string cid,  string capp)
    {
        string strresult = "";
        DataTable dt = new DataTable();
        TN.Categories.GetListChildrenInCate(ref dt, cid,"",  "1");
        if (dt.Rows.Count > 0)
        {
            strresult += "<ul>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                strresult += "<li><a title='" + dt.Rows[i]["vname"].ToString() + "' href='" + weburl + dt.Rows[i]["valias"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a>";
                strresult += Menu(dt.Rows[i]["icid"].ToString(), TN.Common.mod_product);
                strresult += "</li>";
            }
            strresult += "</ul>";
        }
        return strresult;
    }
    public string getimg(string img,string title)
    {
        if(img.Length>0)
        return "<span class='icon_danhmuc'><img alt='" + title + "' src='" + weburl + "uploads/products/cates/" + img + "' /></span>";
        else
            return "<span class='icon_danhmuc'><img alt='" + title + "' src='" + weburl + "uploads/products/cates/paper.png' /></span>";
    }
}

    

