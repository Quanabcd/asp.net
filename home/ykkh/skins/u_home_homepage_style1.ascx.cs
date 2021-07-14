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

public partial class home_homepage_u_home_homepage_style1 : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {


        phmain.Controls.Add(LoadControl("../util/default/u_ykkh.ascx"));
          
            
           
        }
    }

