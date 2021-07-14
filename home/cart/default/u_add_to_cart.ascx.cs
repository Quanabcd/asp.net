using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_cart_default_add_to_cart : System.Web.UI.UserControl
{
    public string WebURL = WEB.Common.Weburl;
    protected void Page_Load(object sender, EventArgs e)
    {
        string alias = WEB.Common.GeturlParam("alias");
        DataTable dti = WEB.Items.getitembyfield("valias", alias);
        if (dti.Rows.Count > 0)
        {
            int iid = Convert.ToInt32(dti.Rows[0]["iid"]);
            float price = Convert.ToSingle(dti.Rows[0]["fnewprice"]);
            string caridtmp = "1000";
            if (null != WEB.Common.getCookie("tn-cart") && WEB.Common.getCookie("tn-cart").Length > 0)
            {
                caridtmp = WEB.Common.getCookie("tn-cart");
            }
            else
            {
                Random r = new Random();
                caridtmp = r.Next(1000, 99999).ToString();
                WEB.Common.SetCookie("tn-cart", caridtmp, 24 * 60);
            }
            DataTable dt = WEB.Cart.Cartdetail.getitembycartanditem(caridtmp, iid.ToString());
            if (dt.Rows.Count > 0)
            {
                int num = 1 + Convert.ToInt32(dt.Rows[0]["inumber"]);
                float mn = price * num;
                string[] s = { "inumber", "fvalue" };
                object[] o = { num, mn };
                WEB.Cart.Cartdetail.save(Convert.ToInt32(dt.Rows[0]["icartdetail"]), s, o);
            }
            else
            {
                float mn = price * 1;
                string[] s = { "icartid", "iitemid", "vkey", "valias", "vtitle", "vimg", "fprice", "inumber", "fvalue", "istatus", "ipr1" };
                object[] o = { caridtmp, iid.ToString(), dti.Rows[0]["vkey"].ToString(), alias, dti.Rows[0]["vtitle"].ToString(), dti.Rows[0]["vimg"].ToString(), price, 1, mn, "0", dti.Rows[0]["iparam3"].ToString() };
                WEB.Cart.Cartdetail.save(-1, s, o);
            }
            Response.Redirect(WebURL + "gio-hang");
        }
        else
            Response.Redirect(WebURL);
    }
}