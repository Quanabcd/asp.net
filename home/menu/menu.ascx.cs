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

public partial class home_menu_menu : System.Web.UI.UserControl
{
    public string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {


        ltmenu.Text = bindmenu();

    }
    protected string bindmenu()
    {
        string str = @"";
        DataTable dt = new DataTable();
        WEB.Category.getcategorylevel1(ref dt, "-1", WEB.Common.mod_menu, lang, "1");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (Submenu(dt.Rows[i]["icid"].ToString()).Length>0)
            {
                str += "<li  class='menuitem'><a  class='' href='" + dt.Rows[i]["vdesc"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a>";

                str += Submenu(dt.Rows[i]["icid"].ToString());

                str += "</li>";
            }
            else
            {
                str += "<li  class='has_child '><a class='' href='" + dt.Rows[i]["vdesc"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a>";
                str += "</li>";
            }
        }



        return str;
    }
    public string Submenu(string icid)
    {
        string str = "";
        DataTable dt = WEB.Category.getlisitem(WEB.Common.mod_menu, lang, "iparcid='" + icid + "'", "iorders desc");
        if (dt.Rows.Count > 0)
        {

            str += "<div class='mega-menu' aria-hidden='true' role='menu'>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str += "<div class='nav-column'><h3 class='highlight'>" + dt.Rows[i]["vname"].ToString() + "</h3>";
                str += Submenu2(dt.Rows[i]["icid"].ToString());
                str += "</div>";
            }
            str += "</div>";
        }
        return str;
    }
    public string Submenu2(string icid)
    {
        string str = "";
        DataTable dt = WEB.Category.getlisitem(WEB.Common.mod_menu, lang, "iparcid='" + icid + "'", "iorders desc");
        if (dt.Rows.Count > 0)
        {

            str += "<ul class='c3'>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str += "<li role='menuitem' ><a class='' href='" + dt.Rows[i]["vdesc"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a>";
                str += "</li>";
            }
            str += "</ul>";
        }
        return str;
    }
}