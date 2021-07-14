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

public partial class home_products_menu_u_vertical_bycate : System.Web.UI.UserControl
{
    public string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
    public int icid = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("icid")))
        {
            icid = Convert.ToInt32(WEB.Common.GeturlParam("icid"));
        }
        if (!IsPostBack)
        {
            LoadMenu();
            Load_HomepageMenu();
        }
    }
    void LoadMenu()
    {
        DataTable dt = new DataTable();
        ltmenu.Text += Menu("-1", WEB.Common.mod_news);
    }
    string Menu(string cid,  string capp)
    {
        string strresult = "";
        DataTable dt = new DataTable();
        WEB.Category.getcategorylevel1(ref dt,cid,capp,lang,"1");
        if (dt.Rows.Count > 0)
        {
            strresult += "<ul>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                strresult += "<li><a href='" +dt.Rows[i]["valias"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a>";
                strresult += Menu(dt.Rows[i]["icid"].ToString(), WEB.Common.mod_news);
                strresult += "</li>";
            }
            strresult += "</ul>";
        }
        return strresult;
    }
    protected void Load_HomepageMenu()
    {
        string str = "";
        DataTable dt = new DataTable();
        WEB.Category.getcategorylevel1(ref dt, " -1", WEB.Common.mod_news, lang, "1");
        str += "<div class='menu-l'>";
        str += "<div class='glossymenu' >";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            str += SubMenus(dt.Rows[i]["icid"].ToString(), dt.Rows[i]["valias"].ToString(),dt.Rows[i]["vname"].ToString());
        }
        str += "</div>";
        str += "</div>";

        ltmenu.Text= str;
    }
    string SubMenus(string icid, string vname,string name)
    {
        DataTable dt = new DataTable();
        WEB.Category.getcategorylevel1(ref dt, icid, WEB.Common.mod_news, lang, "1");
        string str = "";
        if (dt.Rows.Count > 0)
        {
            str += "<a class='menuitem submenuheader' href='" + weburl + WEB.Common.GetNewTitle(vname.ToString().Trim()) +"'>" + name + "</a>";
            str += "<div class='submenu'>";
            str += "<ul>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i < dt.Rows.Count)
                {
                    str += "<li class='" + cssSelected(dt.Rows[i]["icid"].ToString()) + "'>" + MenuLink(dt.Rows[i]["icid"].ToString(), dt.Rows[i]["valias"].ToString(),"",dt.Rows[i]["vname"].ToString());
                    //str += SubMenus(dt.Rows[i]["icid"].ToString());
                    str += "</li>";
                }
            }
            str += "</ul>";
            str += "</div>";
        }
        else
        {
            str += "<a class='submenuheader'  href='" + weburl + WEB.Common.GetNewTitle(vname.ToString().Trim())+ "'>" + name + "</a>";
        }
        return str;
    }
    string MenuLink(string icid, string vname, string css,string name)
    {
        if (!icid.Equals("-1"))
            return "<a class='" + css + "'  href='" + weburl + WEB.Common.GetNewTitle(vname.ToString().Trim()) + "'>" + name + "</a>";
        else
            return null;

    }
    protected string cssSelected(string cid)
    {
        if (this.icid.ToString().Equals(cid))
        {
            return "current";
        }
        return "";
    }
}

    

