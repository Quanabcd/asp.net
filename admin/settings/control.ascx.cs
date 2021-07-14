using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_settings_control : System.Web.UI.UserControl
{
    public string role ="";
    protected void Page_Load(object sender, EventArgs e)
    {
        role = Session["role"].ToString();
        string c = "";
        c = WEB.Common.GeturlParam("c");
        switch (c)
        {
            case "websetting":
                if(checkrole("11")==true)
                    Controls.Add(LoadControl("websetting.ascx"));
                break;
            case "banner_logo":
                if (checkrole("12") == true)
                    Controls.Add(LoadControl("banner_logo.ascx"));
                break;
            case "support":

                Controls.Add(LoadControl("support.ascx"));
                break;
            case "supportedit":
                Controls.Add(LoadControl("supportedit.ascx"));
                break;
            //case "footercontent":
            //    Controls.Add(LoadControl("footercontent.ascx"));
            //    break;
            //case "background":
            //    Controls.Add(LoadControl("background.ascx"));
            //    break;
            case "systememail":
                if (checkrole("13") == true)
                Controls.Add(LoadControl("systememail.ascx"));
                break;
            case "payment":
                if (checkrole("16") == true)
                Controls.Add(LoadControl("payment.ascx"));
                break;
           
            case "emailcontent":
                if (checkrole("14") == true)
                Controls.Add(LoadControl("mail_content.ascx"));
                break;
            case "region":
                if (checkrole("18") == true)
                Controls.Add(LoadControl("regions.ascx"));
                break;
            case "transport":
                if (checkrole("15") == true)
                Controls.Add(LoadControl("transport.ascx"));
                break;
            case "district":
                if (checkrole("18") == true)
                Controls.Add(LoadControl("district.ascx"));
                break;
            case "phuongxa":
                Controls.Add(LoadControl("phuongxa.ascx"));
                break;
            case "syssetting":
                Controls.Add(LoadControl("syssetting.ascx"));
                break;
            case "language":
                if (checkrole("17") == true)
                {
                    string lan = WEB.Common.GeturlParam("langid");
                    if(lan.Length>0)
                        Controls.Add(LoadControl("languageedit.ascx"));
                    else
                    Controls.Add(LoadControl("language.ascx"));
                }
                break;
            default:
                if (checkrole("11") == true)
                    Controls.Add(LoadControl("websetting.ascx"));
                break;
        }
    }
    public bool checkrole(string s)
    {
        if (role.Contains("|" + s + "|"))
            return true;
        else
            return false;
    }
}