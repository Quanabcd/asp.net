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

public partial class home_controls : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {

        string mod = "";
        mod = WEB.Common.GeturlParam("mod");
        if (mod.Length > 0)
        //module có url cố định
        {
            switch (mod)
            {
                case "ykbl":
                    phcontrol.Controls.Add(LoadControl("ykkh/controls.ascx"));
                    break;
                case "hotel":
                    phcontrol.Controls.Add(LoadControl("hotel/controls.ascx"));
                    break;
                case "contact":
                    phcontrol.Controls.Add(LoadControl("contact/controls.ascx"));
                    break;
                case "member":
                    phcontrol.Controls.Add(LoadControl("member/controls.ascx"));
                    break;
                case "nws":
                    phcontrol.Controls.Add(LoadControl("news/controls.ascx"));
                    break;

                case "faq":
                    phcontrol.Controls.Add(LoadControl("faqs/controls.ascx"));
                    break;
                case "album":
                    phcontrol.Controls.Add(LoadControl("albums/controls.ascx"));
                    break;
                case "video":
                    phcontrol.Controls.Add(LoadControl("videos/controls.ascx"));
                    break;
                case "cart":
                    phcontrol.Controls.Add(LoadControl("cart/controls.ascx"));
                    break;
                case "search":
                    phcontrol.Controls.Add(LoadControl("search/controls.ascx"));
                    break;
                case "prd":
                    phcontrol.Controls.Add(LoadControl("products/controls.ascx"));
                    break;
                case "projects":
                    phcontrol.Controls.Add(LoadControl("projects/controls.ascx"));
                    break;
                default:
                    bool havemd = false;
                    DataTable dtm = WEB.Category.getcate("-1", WEB.Common.mod_module, "-1", "1", "1");
                    for (int i = 0; i < dtm.Rows.Count; i++)
                    {
                        if (dtm.Rows[i]["vdesc"].ToString() == mod)
                        {
                            havemd = true;
                            phcontrol.Controls.Add(LoadControl(dtm.Rows[i]["vdesc"].ToString() + "/controls.ascx"));
                            break;
                        }
                    }
                    if (havemd == false)
                        phcontrol.Controls.Add(LoadControl("homepage/controls.ascx"));
                    break;
            }
        }
        else
        {
            //check theo url
            string alias = WEB.Common.GeturlParam("alias");
            if (alias.Length > 0)
            {
                DataTable dt = WEB.Category.getcatebyfield("valias", alias);
                if (dt.Rows.Count > 0)
                {

                    string app = dt.Rows[0]["ccode"].ToString().Trim();
                    switch (app)
                    {
                        case "HEL":
                            phcontrol.Controls.Add(LoadControl("hotel/controls.ascx"));
                            break;
                        case "MPR":
                            phcontrol.Controls.Add(LoadControl("products/controls.ascx"));
                            break;
                        case "VPR"://vender
                            phcontrol.Controls.Add(LoadControl("products/controls.ascx"));
                            break;
                        case "GPR"://vender
                            phcontrol.Controls.Add(LoadControl("products/controls.ascx"));
                            break;
                        case "GNW"://vender
                            phcontrol.Controls.Add(LoadControl("news/controls.ascx"));
                            break;
                        case "MNW":
                            phcontrol.Controls.Add(LoadControl("news/controls.ascx"));
                            break;
                        case "CNT":
                            phcontrol.Controls.Add(LoadControl("content/controls.ascx"));
                            break;
                        case "FAQ":
                            phcontrol.Controls.Add(LoadControl("faqs/controls.ascx"));
                            break;
                        case "MFL":
                            phcontrol.Controls.Add(LoadControl("filelibrarys/controls.ascx"));
                            break;
                        case "MAL":
                            phcontrol.Controls.Add(LoadControl("photos/controls.ascx"));
                            break;
                        case "MVD":
                            phcontrol.Controls.Add(LoadControl("videos/controls.ascx"));
                            break;
                        case "HPS":
                            phcontrol.Controls.Add(LoadControl("services/controls.ascx"));
                            break;
                        case "PRJ":
                            phcontrol.Controls.Add(LoadControl("project/controls.ascx"));
                            break;
                        default:
                            DataTable dtm = WEB.Category.getcate("-1", WEB.Common.mod_module, "-1", "1", "1");
                            for (int i = 0; i < dtm.Rows.Count; i++)
                            {
                                if (dtm.Rows[i]["vdesc"].ToString() == mod)
                                {
                                    phcontrol.Controls.Add(LoadControl(dtm.Rows[i]["vdesc"].ToString() + "/controls.ascx"));
                                    break;
                                }
                            }
                            break;
                    }
                }
                else
                {
                    dt = WEB.Items.getitembyfield("valias", alias);
                    if (dt.Rows.Count > 0)
                    {
                        string app = dt.Rows[0]["vcode"].ToString().Trim();
                        switch (app)
                        {
                            case "HEL":
                                phcontrol.Controls.Add(LoadControl("hotel/controls.ascx"));
                                break;
                            case "MPR":
                                phcontrol.Controls.Add(LoadControl("products/controls.ascx"));
                                break;
                            case "MNW":
                                phcontrol.Controls.Add(LoadControl("news/controls.ascx"));
                                break;
                            case "CNT":
                                phcontrol.Controls.Add(LoadControl("content/controls.ascx"));
                                break;
                            case "MFL":
                                phcontrol.Controls.Add(LoadControl("filelibrarys/controls.ascx"));
                                break;
                            case "MAL":
                                phcontrol.Controls.Add(LoadControl("photos/controls.ascx"));
                                break;
                            case "MVD":
                                phcontrol.Controls.Add(LoadControl("videos/controls.ascx"));
                                break;
                            case "HPS":
                                phcontrol.Controls.Add(LoadControl("services/controls.ascx"));
                                break;
                            case "FAQ":
                                phcontrol.Controls.Add(LoadControl("faqs/controls.ascx"));
                                break;

                            case "PRJ":
                                phcontrol.Controls.Add(LoadControl("project/controls.ascx"));
                                break;
                            default:
                                DataTable dtm = WEB.Category.getcate("-1", WEB.Common.mod_module, "-1", "1", "1");
                                for (int i = 0; i < dtm.Rows.Count; i++)
                                {
                                    if (dtm.Rows[i]["vdesc"].ToString() == mod)
                                    {
                                        phcontrol.Controls.Add(LoadControl(dtm.Rows[i]["vdesc"].ToString() + "/controls.ascx"));
                                        break;
                                    }
                                }
                                break;
                        }
                    }
                    else
                    {
                        phcontrol.Controls.Add(LoadControl("untilities/error/u_404.ascx"));
                    }
                }
            }
            else
            {
                phcontrol.Controls.Add(LoadControl("homepage/controls.ascx"));
            }
        }

    }
}
