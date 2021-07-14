using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_menu_u_menucontent : System.Web.UI.UserControl
{
    public string lang = WEB.Common.Lang;
    
    protected void Page_Load(object sender, EventArgs e)
    {
      
            lt_items.Text = bindmenu();
        
    }
    protected string bindmenu()
    {
        string strresult = @"<ul class=''>";
        DataTable dt = new DataTable();
        WEB.Category.getcategorylevel1(ref dt, "-1", WEB.Common.mod_menucont, lang, "1");
        try
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
             
                    strresult += "<li><a href='" + dt.Rows[i]["valias"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</a></li>";
               
              
            }
        }
        catch { }
        strresult += "</ul>";

        return strresult;
    }
}