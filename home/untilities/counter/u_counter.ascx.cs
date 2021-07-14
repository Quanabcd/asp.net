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

public partial class home_untilities_counter_u_counter : System.Web.UI.UserControl
{
    public string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Application["UserOnline"] != null)
        {
            ltonline.Text = Application["UserOnline"].ToString();
        }
        else
            ltonline.Text = "0";
        lttoday.Text = WEB.Counter.countertoday().ToString();
        ltyesterday.Text = WEB.Counter.counteryesterday().ToString();
        ltcountinmonth.Text = WEB.Counter.counterinmonth(DateTime.Now.Year, DateTime.Now.Month).ToString();
        lttotal.Text = WEB.Counter.countertotal().ToString();
    }
}
