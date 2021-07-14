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

public partial class home_news_menu_u_vertical_slide_menu : System.Web.UI.UserControl
{
    public string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
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
                strresult += "<li><a href='" + weburl + WEB.Common.GetNewTitle(dt.Rows[i]["vname"].ToString()) + "_nw" + dt.Rows[i]["icid"].ToString() + WEB.Common.getwebextension() + "'>" + dt.Rows[i]["vname"].ToString() + "</a>";
                strresult += Menu(dt.Rows[i]["icid"].ToString(), WEB.Common.mod_news);
                strresult += "</li>";
            }
            strresult += "</ul>";
        }
        return strresult;
    }
}

    

