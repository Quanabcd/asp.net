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
      
            LoadMenu();
           
        
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

                    str += "<li class=''><a class='' href='" + weburl + dt.Rows[i]["valias"].ToString() + "' title='" + dt.Rows[i]["vname"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a><span class='more' data-toggle='collapse' data-target='#" + dt.Rows[i]["icid"].ToString() + "'><i class='fa fa-plus'></i></span>";
                    str += "<ul class='submenu collapse' id='" + dt.Rows[i]["icid"].ToString() + "'>";
                    str += SubMenus(dt.Rows[i]["icid"].ToString());
                    str += "</ul>";
                    str += "</li>";
                }
                else
                {
                    str += "<li class=''><a class='' href='" + weburl + dt.Rows[i]["valias"].ToString() + "' title='" + dt.Rows[i]["vname"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a> ";

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


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (SubMenus2(dt.Rows[i]["icid"].ToString()).Length > 0)
                {

                    str += "<li class=''><a class='' href='" + weburl + dt.Rows[i]["valias"].ToString() + "' title='" + dt.Rows[i]["vname"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a><span class='more' data-toggle='collapse' data-target='#" + dt.Rows[i]["icid"].ToString() + "'><i class='fa fa-plus'></i></span>";
                    str += "<ul class='submenu collapse' id='" + dt.Rows[i]["icid"].ToString() + "'>";
                    str += SubMenus2(dt.Rows[i]["icid"].ToString());
                    str += "</ul>";
                    str += "</li>";
                }
                else
                {
                    str += "<li class=''><a class='' href='" + weburl + dt.Rows[i]["valias"].ToString() + "' title='" + dt.Rows[i]["vname"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a> ";

                    str += "</li>";
                }
            }


        }

        return str;
    }
    string SubMenus2(string icid)
    {
        DataTable dt = new DataTable();
        WEB.Category.getcategorylevel1(ref dt, icid, WEB.Common.mod_news, lang, "1");
        string str = "";
        if (dt.Rows.Count > 0)
        {


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i < dt.Rows.Count)
                {
                    str += "<li class=''><a class='' href='" + weburl + dt.Rows[i]["valias"].ToString() + "' title='" + dt.Rows[i]["vname"].ToString() + "'><span>" + dt.Rows[i]["vname"].ToString() + "</span></a></li>";
                }
            }


        }

        return str;
    }
    string MenuLink(string icid, string alias, string css, string name)
    {
        if (!icid.Equals("-1"))
            return "<a class='" + css + "'  href='" + weburl + alias + "'>" + name + "</a>";
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

    

