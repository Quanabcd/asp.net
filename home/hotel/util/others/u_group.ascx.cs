using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_products_util_others_u_venders : System.Web.UI.UserControl
{
    public string valias = "";
    public string vender = "";
    public string from = "0";
    public string to = "0";
    public string lang = TN.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
     
     
            loadvender();
        
    }
    public void loadvender()
    {
        DataTable dt = WEB.Category.getcate("-1", "HEG", lang, "1", "1");
        rpvenders.DataSource = dt;
        rpvenders.DataBind();
    }
    public string getselected(string s)
    {
        if (s == vender)
            return " selected";
        else
            return "";
    }
    public string geturl(string s)
    {
        string str = "/" + valias + "?group=" + s;
        if (from != "0")
        {
            str +="&from=" + from ;
        }
        if(to!="0")
            str += "&to=" + to;
        return str;
    }
}