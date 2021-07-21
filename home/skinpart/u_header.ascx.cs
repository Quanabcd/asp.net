using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_skinpart_u_header : System.Web.UI.UserControl
{
    public string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
    protected void Page_Load(object sender, EventArgs e)
    {
        ltmenu.Text = bindmenu();
        ltmenumb.Text = bindmenumb();
    }

    protected string bindmenu()
    {
        string str = @"";
        DataTable dt = new DataTable();
        WEB.Category.getcategorylevel1(ref dt, "-1", WEB.Common.mod_menu, lang, "1");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (Submenu(dt.Rows[i]["icid"].ToString()).Length > 0)
            {
                str += "<li class='menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children'><a  class='' href='" + dt.Rows[i]["vdesc"].ToString() + "'><span>" + dt.Rows[i]["vname"].ToString() + "</span></a>";

                str += Submenu(dt.Rows[i]["icid"].ToString());

                str += "</li>";
            }
            else
            {
                str += "<li  class='menu-item menu-item-type-post_type menu-item-object-page '><a class='' href='" + dt.Rows[i]["vdesc"].ToString() + "'><span>" + dt.Rows[i]["vname"].ToString() + "</span></a>";
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

            str += "<ul class='sub-menu'>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str += "<li  class='menu-item menu-item-type-post_type menu-item-object-page '><a class='' href='" + dt.Rows[i]["vdesc"].ToString() + "'><span>" + dt.Rows[i]["vname"].ToString() + "</span></a>";
                str += "</li>";
            }
            str += "</ul>";
        }
        return str;
    }
    protected string bindmenumb()
    {
        string str = @"";
        DataTable dt = new DataTable();
        WEB.Category.getcategorylevel1(ref dt, "-1", WEB.Common.mod_menu, lang, "1");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (Submenumb(dt.Rows[i]["icid"].ToString()).Length > 0)
            {
                str += "<li class='menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children'><a  class='' href='" + dt.Rows[i]["vdesc"].ToString() + "'><span>" + dt.Rows[i]["vname"].ToString() + "</span></a>";

                str += Submenumb(dt.Rows[i]["icid"].ToString());

                str += "</li>";
            }
            else
            {
                str += "<li  class='menu-item menu-item-type-post_type menu-item-object-page '><a class='' href='" + dt.Rows[i]["vdesc"].ToString() + "'><span>" + dt.Rows[i]["vname"].ToString() + "</span></a>";
                str += "</li>";
            }
        }



        return str;
    }
    public string Submenumb(string icid)
    {
        string str = "";
        DataTable dt = WEB.Category.getlisitem(WEB.Common.mod_menu, lang, "iparcid='" + icid + "'", "iorders desc");
        if (dt.Rows.Count > 0)
        {

            str += "<ul class='sub-menu'>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str += "<li  class='menu-item menu-item-type-post_type menu-item-object-page '><a class='' href='" + dt.Rows[i]["vdesc"].ToString() + "'><span>" + dt.Rows[i]["vname"].ToString() + "</span></a>";
                str += "</li>";
            }
            str += "</ul>";
        }
        return str;
    }
}