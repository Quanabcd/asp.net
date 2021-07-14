using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_products_util_menu_u_menu_cates : System.Web.UI.UserControl
{
    public string lang = TN.Common.Lang;
    public string weburl = TN.Common.Weburl;
    public string valias = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadMenu();


    }
    public string getselected(string s)
    {
        if (s == valias)
            return " selected";
        else
            return "";
    }

    void LoadMenu()
    {
        DataTable dt = new DataTable();
        ltmenu.Text += Menu("-1", WEB.Common.mod_product);
    }
    string Menu(string cid, string capp)
    {
        string str = "";
        DataTable dt = new DataTable();
        WEB.Category.getcategorylevel1(ref dt, cid, capp, lang, "1");
        if (dt.Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (SubMenus(dt.Rows[i]["icid"].ToString()).Length > 0)
                {
                    str += "<li class='has-child'>";
                    str += "<a class='dropdown-toggle parent' href='" + weburl + dt.Rows[i]["valias"].ToString() + "' title='" + dt.Rows[i]["vname"].ToString() + "'>" + getimg(dt.Rows[i]["vicon"].ToString(), dt.Rows[i]["vname"].ToString()) + dt.Rows[i]["vname"].ToString() + "</a>";

                    str += SubMenus(dt.Rows[i]["icid"].ToString());
                    str += "</li>";
                }
                else
                {
                    str += "<li class='nav-item'>";
                    str += "<a  href='" + weburl + dt.Rows[i]["valias"].ToString() + "' title='" + dt.Rows[i]["vname"].ToString() + "'>" + getimg(dt.Rows[i]["vicon"].ToString(), dt.Rows[i]["vname"].ToString()) + dt.Rows[i]["vname"].ToString() + "</a>";
                    str += "</li>";
                }
            }

        }
        return str;
    }

    string SubMenus(string icid)
    {
        DataTable dt = new DataTable();
        WEB.Category.getcategorylevel1(ref dt, icid, WEB.Common.mod_product, lang, "1");
        string str = "";
        if (dt.Rows.Count > 0)
        {

            str += "<ul >";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i < dt.Rows.Count)
                {
                    str += "<li >";
                    str += "<a  href='" + weburl + dt.Rows[i]["valias"].ToString() + "' title='" + dt.Rows[i]["vname"].ToString() + "'>" +  dt.Rows[i]["vname"].ToString() + "</a>";
                    str += "</li>";

                }
            }
            str += "</ul>";

        }

        return str;
    }
    string MenuLink(string icid, string vname, string css)
    {
        if (!icid.Equals("-1"))
            return "<a class='" + css + "'  href='" + weburl + WEB.Common.GetNewTitle(vname.ToString().Trim()) + "-c-" + icid + "'>" + vname + "</a>";
        else
            return null;

    }
    //protected string cssSelected(string cid)
    //{
    //    if (this.icid.ToString().Equals(cid))
    //    {
    //        return "current";
    //    }
    //    return "";
    //}
    public string getimg(string img, string title)
    {
        if (img.Length > 0)
            return "<img class='icon-menu' alt='" + title + "' src='" + weburl + "uploads/products/cates/" + img + "' />";
        else
            return "<img class='icon-menu' alt='" + title + "' src='" + weburl + "uploads/products/cates/default.png' />";
    }
}