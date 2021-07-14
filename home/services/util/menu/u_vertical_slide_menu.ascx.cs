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
    public string lang =TN.Common.Lang;
    public string weburl =TN.Common.Weburl;
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
        ltmenu.Text += Menu("-1",TN.Common.mod_news);
    }
    string Menu(string cid,  string capp)
    {
        string strresult = "";
        DataTable dt = new DataTable();
        TN.Categories.GetListChildrenInCate(ref dt, cid,"", "1");
        if (dt.Rows.Count > 0)
        {
            strresult += "<ul  class='list-block list-group list-unstyled'>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                strresult += "<li><a href='" + weburl + dt.Rows[i]["valias"].ToString() + "' title='" + dt.Rows[i]["vname"].ToString() + "'><i class=\"fa fa-caret-right\" aria-hidden=\"true\"></i>" + dt.Rows[i]["vname"].ToString() + "</a>";
                strresult += Menu(dt.Rows[i]["icid"].ToString(),TN.Common.mod_news);
                strresult += "</li>";
            }
            strresult += "</ul>";
        }
        return strresult;
    }
}

    

