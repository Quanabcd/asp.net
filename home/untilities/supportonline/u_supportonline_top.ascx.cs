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

public partial class home_untilities_supportonline_u_supportonline_top : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt = TN.ItemsOther.GetListItemByPage(new string[0],"",WEB.Common.mod_suportonline, lang, "","1",0,10, "iorders ASC");
            rp_items.DataSource = dt;
            rp_items.DataBind();
        }
    }
    protected string Nick(string type, string title, string nick, string size)
    {
        if (type.Equals("0"))//yahoo
        {
            return "<a href='ymsgr:sendim?" + nick + "'><img alt=\"" + title + "\" src=\"http://opi.yahoo.com/online?u=" + nick + "&m=g&t=" + size + "\" border=\"0\"></a>";
        }
        else // skype
        {
            return "<script type=\"text/javascript\" src=\"http://download.skype.com/share/skypebuttons/js/skypeCheck.js\"></script><a href=\"skype:" + nick + "?chat\"><img src=\"" + weburl + "/uploads/supports/skype-icon.png\" border=\"0\" alt=\"" + title + "\" /></a>";
        }
        return "";
    }
    public string getimg(string s)
    {
        if (s.Length > 0)
            return "<img src='" + weburl + "uploads/supports/" + s + "' alt='Hỗ trợ trực tuyến' />";
        return "<img src='" + weburl + "uploads/supports/default.png' alt='Hỗ trợ trực tuyến' />";
    }
    public string getinfo(string name, string dep, string skype, string yahoo, string phone,string size)
    {
        string s = "";
        if(name.Length>0)
            s+= "<p class='sup_name'>" + name+ "</p>";
        if(dep.Length>0)
            s+= "<p class='sup_dep'>" + dep+ "</p>";
        if(skype.Length>0 || yahoo.Length>0)
        {
            s+= "<p class='sup_nick'>";
            if(yahoo.Length>0)
                s+= Nick("0",name,skype,size);
            if(skype.Length>0)
                s+= Nick("1",name,skype,size);
            s += "</p>";
        }
        if(phone.Length>0)
            s+= "<p class='sup_phone'>" + phone+ "</p>";
        return s;
    }
}