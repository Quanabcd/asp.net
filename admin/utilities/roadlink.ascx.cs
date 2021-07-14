using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_utilities_roadlink : System.Web.UI.UserControl
{
    
      
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lt_roadlink.Text = Roadlink("lnkroad", "<span class='road_sepe'>»</span>");
        }
    }
    public string Roadlink(string css, string space)
    {
        string str = "";
        //str = "Trang chủ";
        if (WEB.Common.GeturlParam("mod").Contains("news"))
        {

            str += "Tin tức";
            str += space;
            if (WEB.Common.GeturlParam("c").Contains("settings"))
                str += "Cấu hình";
            //if (WEB.Common.GeturlParam("c").Contains("cates"))
            //    str += "Danh mục";
            //if (WEB.Common.GeturlParam("c").Contains("items"))
            //    str += "Danh sách";

        }
        return str;
    }
}