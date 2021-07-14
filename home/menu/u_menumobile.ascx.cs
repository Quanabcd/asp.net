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

public partial class home_menu_u_menumobile : System.Web.UI.UserControl
{
    public string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
    protected void Page_Load(object sender, EventArgs e)
    {
        
            ltmenu.Text = bindmenu();
        
    }
    protected string bindmenu()
    {
        string str = "";
        DataTable dt = new DataTable();
        WEB.Category.getcategorylevel1(ref dt, "-1", WEB.Common.mod_menu, lang, "1");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (Submenu(dt.Rows[i]["icid"].ToString()).Length > 0)
            {
                str += "<li  class=''><a  class='' href='" + dt.Rows[i]["vdesc"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a><span class='more' data-toggle='collapse' data-target='#menu_child_2'><i class='fa fa-plus'></i></span>";

                str += Submenu(dt.Rows[i]["icid"].ToString());

                str += "</li>";
            }
            else
            {
                str += "<li  class=''><a class='' href='" + dt.Rows[i]["vdesc"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a>";
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

            str += "<ul class='collapse' id='menu_child_2'>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str += "<li class='' ><a class='' href='" + dt.Rows[i]["vdesc"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a><span class='more' data-toggle='collapse' data-target='#menu_child_2_1'><i class='fa fa-plus'></i></span>";
                str += Submenu2(dt.Rows[i]["icid"].ToString());

                str += "</li>";
            }
            str += "</ul>";
        }
        return str;
    }
    public string Submenu2(string icid)
    {
        string str = "";
        DataTable dt = WEB.Category.getlisitem(WEB.Common.mod_menu, lang, "iparcid='" + icid + "'", "iorders desc");
        if (dt.Rows.Count > 0)
        {

            str += " <ul class='collapse' id='menu_child_2_1'>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str += "<li class='' ><a class='' href='" + dt.Rows[i]["vdesc"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a>";
                str += "</li>";
            }
            str += "</ul>";
        }
        return str;
    }
}