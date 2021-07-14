using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class home_news_topnews_u_news : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadItemsList();
    }
    protected void LoadItemsList()
    {
        int top = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_nwsnumnew, lang));
        string condition = "vparam4 like '%1|%' and vcode='MNW'";
        string[] fieldsearch = { "vparam4" };
        DataTable dt = new DataTable();
        dt = WEB.Items.getlistitembypage(fieldsearch, "1", condition, 0, top, "dupdate DESC");
        rp_item.DataSource = dt;
        rp_item.DataBind();
    }
    public string getimg(string img, string alt)
    {
        return "<img alt='" + alt + "' src='" + weburl + "uploads/news/" + img + "'>";
    }
    public string Cutleft(string value, int count)
    {
        string _value = value;
        if (_value.Length >= count)
        {
            string ValueCut = _value.Substring(0, count - 3);
            string[] valuearray = ValueCut.Split(' ');
            string valuereturn = "";
            for (int i = 0; i < valuearray.Length - 1; i++)
            {
                valuereturn = valuereturn + " " + valuearray[i];
            }
            return valuereturn + "...";
        }
        else
        {
            return _value;
        }
    }
    protected void CKEditorControl1_TextChanged(object sender, EventArgs e)
    {

    }
}