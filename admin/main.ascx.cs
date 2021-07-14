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

public partial class admin_main : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string mod = "";
    DataTable dtm = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        dtm = WEB.Category.getcate("-1", WEB.Common.mod_module, "-1", "1", "1");
        loadlang();
        string c = WEB.Common.GeturlParam("c");
        if (!IsPostBack)
        {
            ltwelcome.Text = Session["admin"].ToString();
            ltcompanyname.Text = WEB.Config.getvaluebykey(WEB.Config.k_companyname, WEB.Common.LangAdmin);
        }
        mod = WEB.Common.GeturlParam("mod");
        switch (mod)
        {
            case "hotel":
                if (checkmudle("72"))
                    phcontrol.Controls.Add(LoadControl("hotel/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "settings":
                if(checkmudle("1"))
                    phcontrol.Controls.Add(LoadControl("settings/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "accounts":
                if(c=="logout" || c=="info")
                    phcontrol.Controls.Add(LoadControl("accounts/control.ascx"));
                else if (checkmudle("102"))
                    phcontrol.Controls.Add(LoadControl("accounts/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "customer_reviews":
                if (checkmudle("28"))
                    phcontrol.Controls.Add(LoadControl("customer_reviews/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "integrated":
                if (checkmudle("100"))
                    phcontrol.Controls.Add(LoadControl("integrated/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "marketing":
                if (checkmudle("100"))
                    phcontrol.Controls.Add(LoadControl("marketing/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "utilities":
                if (checkmudle("101"))
                    phcontrol.Controls.Add(LoadControl("utilities/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "faq":
                if (checkmudle("55"))
                    phcontrol.Controls.Add(LoadControl("faq/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "comment":
                if (checkmudle("77"))
                    phcontrol.Controls.Add(LoadControl("comment/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "prod":
                if (checkmudle("20"))
                    phcontrol.Controls.Add(LoadControl("products/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
           
            case "news":
                if (checkmudle("21"))
                    phcontrol.Controls.Add(LoadControl("news/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "services":
                if (checkmudle("23"))
                    phcontrol.Controls.Add(LoadControl("services/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "videos":
                if (checkmudle("24"))
                    phcontrol.Controls.Add(LoadControl("videos/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "albums":
                if (checkmudle("25"))
                    phcontrol.Controls.Add(LoadControl("albums/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "contacts":
                if (checkmudle("29"))
                    phcontrol.Controls.Add(LoadControl("contacts/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "projects":
                if (checkmudle("27"))
                    phcontrol.Controls.Add(LoadControl("project/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "members":
                if (checkmudle("104"))
                    phcontrol.Controls.Add(LoadControl("member/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "report":
                if (checkmudle("105"))
                    phcontrol.Controls.Add(LoadControl("report/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "content":
                if (checkmudle("22"))
                    phcontrol.Controls.Add(LoadControl("content/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
             case "menus":
                if (checkmudle("2"))
                    phcontrol.Controls.Add(LoadControl("menus/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
            case "files":
                if (checkmudle("26"))
                    phcontrol.Controls.Add(LoadControl("files/control.ascx"));
                else
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
           
            case "sys":
                phcontrol.Controls.Add(LoadControl("sys/control.ascx"));
                break;
            default:
                bool havemd = false;
                for (int i = 0; i < dtm.Rows.Count; i++)
                {
                    if (dtm.Rows[i]["vdesc"].ToString() == mod)
                    {
                        havemd = true;
                        phcontrol.Controls.Add(LoadControl(dtm.Rows[i]["vdesc"].ToString() + "/control.ascx"));
                        break;
                    }

                }
                if(havemd==false)
                    phcontrol.Controls.Add(LoadControl("home/control.ascx"));
                break;
        }
    }
    protected void loadlang()
    {
        DataTable dt = WEB.Category.getcate("-1", "LAN", "-1", "1", "1");
        rplang.DataSource = dt;
        rplang.DataBind();
    }
    protected string getcss(string s)
    {
        if (s == WEB.Common.LangAdmin)
            return " selected";
        else
            return "";
    }
    protected bool checkmudle(string s)
    {
        string role = Session["role"].ToString();
        if (s == "1" || s == "2" || s == "100" || s == "101" || s == "102" || s == "103" || s == "104" || s == "105")
            return role.Contains("|" + s + "|");
        DataTable dt = WEB.Category.getcate("-1", WEB.Common.mod_module, "-1", "1", "1");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["vimg"].ToString().Trim() == s)
                {
                    if (role.Contains("|" + s + "|"))
                        return true;
                }
            }
        }
        return false;
    }
    public string checkrole(string s)
    {
        string role = Session["role"].ToString();
        if (s == "1" || s == "11" || s == "12" || s == "13" || s == "14" || s == "15" || s == "16" || s == "17" || s == "18" || s == "2" || s == "100" || s == "101" || s == "102" || s == "104")
        {
            if( role.Contains("|" + s + "|"))
                return "";
        }
        if (role.Contains("|" + s + "|"))
        {
            if (s.Length == 2)
            {
                if (dtm.Rows.Count > 0)
                {
                    string str = " style='display:none' ";
                    for (int i = 0; i < dtm.Rows.Count ; i++)
                    {
                        if (dtm.Rows[i]["vimg"].ToString().Trim() == s)
                        {
                            if (role.Contains("|" + s + "|"))
                            {
                                str = "";
                                break;
                            }
                        }
                    }
                    return str;
                }
            }
            else
                return "";
        }
        return " style='display:none' ";

    }
    public string cssselect(string s)
    {
        if (mod == "")
            return "";
        if (s.Contains(mod))
            return "in";
        else
            return "";
    }
 
}