using System;
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

public partial class _Default : System.Web.UI.Page 
{
    protected string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
    public string bg = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string lan = WEB.Common.GeturlParam("lang");
        if (lan.Length > 0)
        {
            WEB.Common.SetCookie("language", lan, 60 * 24);
            Response.Redirect(weburl);
        }
        try
        {
            if (WEB.Common.getCookie("counter-views") == null || WEB.Common.getCookie("counter-views") == "" )
            {
                WEB.Counter.db_counter_insert(GetUserIP(), HttpContext.Current.Request.Url.AbsoluteUri, "1", "0", "0", "", "");
                WEB.Common.SetCookie("counter-views","1", 60);
            }
        }
        catch
        {
        }
        string s = WEB.Config.getvaluebykey(WEB.Config.k_webbgimg, lang);
        if (s.Length > 0)
        {
           // bg = " style='background:url(" + weburl + "uploads/banners/" + s + ") top center fixed repeat;'";
        }
        phtop.Controls.Add(LoadControl( "home/skinpart/u_header.ascx"));
        phfooter.Controls.Add(LoadControl("home/skinpart/u_footer.ascx"));
        ph_control.Controls.Add(LoadControl("home/controls.ascx"));
        //ph_control.Controls.Add(LoadControl("home/advs/u_doitac.ascx"));
        string title = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, lang);
        Page.Title = title;
        string desc = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, lang);
        string key = WEB.Config.getvaluebykey(WEB.Config.k_webkeyword, lang);
        HtmlMeta meta = new HtmlMeta();
        meta.Name = "description";
        meta.Content = desc;
        Header.Controls.Add(meta);
        Header.Controls.Add(meta);

        HtmlMeta meta1 = new HtmlMeta();
        meta1.Name = "keywords";
        meta1.Content = key;
        Header.Controls.Add(meta1);
        this.Title = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, lang);

        HtmlMeta geoplacename = new HtmlMeta();
        geoplacename.Name = "geo.placename";
        geoplacename.Content = WEB.Config.getvaluebykey(WEB.Config.k_comaddress, lang);
        Header.Controls.Add(geoplacename);

        HtmlMeta DCtitle = new HtmlMeta();
        DCtitle.Name = "DC.title";
        DCtitle.Content = WEB.Config.getvaluebykey(WEB.Config.k_companyname, lang);
        Header.Controls.Add(DCtitle);
        HtmlMeta ogtype = new HtmlMeta();
        ogtype.Attributes.Add("property", "og:type");
        ogtype.Name = "ogtype";
        ogtype.Content = "Website";
        Header.Controls.Add(ogtype);

        HtmlMeta ogtitle = new HtmlMeta();
        ogtitle.Attributes.Add("property", "og:title");
        ogtitle.Name = "ogtitle";
        ogtitle.Content = title;
        Header.Controls.Add(ogtitle);

        HtmlMeta ogdescription = new HtmlMeta();
        ogdescription.Attributes.Add("property", "og:description");
        ogdescription.Name = "ogdescription";
        ogdescription.Content = desc;
        Header.Controls.Add(ogdescription);

        HtmlMeta ogurl = new HtmlMeta();
        ogurl.Attributes.Add("property", "og:url");
        ogurl.Name = "ogurl";
        ogurl.Content = weburl;
        Header.Controls.Add(ogurl);



        HtmlMeta ogimg = new HtmlMeta();
        ogimg.Attributes.Add("property", "og:image");
        ogimg.Name = "ogimage";
        string bn = WEB.Config.getvaluebykey(WEB.Config.k_webbanner, lang);
        if(bn.Length>0)
            ogimg.Content = weburl + "uploads/banners/" + bn;
        else
            ogimg.Content = weburl + "uploads/banners/logoct.jpg";
        Header.Controls.Add(ogimg);

        HtmlMeta ogsitename = new HtmlMeta();
        ogsitename.Attributes.Add("property", "og:sitename");
        ogsitename.Content = weburl;
        Header.Controls.Add(ogsitename);
        HtmlLink linkcanonical = new HtmlLink();
        linkcanonical.Attributes.Add("rel", "canonical");
        linkcanonical.Attributes.Add("href", weburl);
        Header.Controls.Add(linkcanonical);

        HtmlLink link = new HtmlLink();
        link.Attributes.Add("rel", "shortcut icon");
        string favicon = WEB.Config.getvaluebykey(WEB.Config.k_webfavicon, lang);
        if (favicon.Length > 1)
        {
            string[] sf = favicon.Split('.');
            string fv = System.IO.Path.GetExtension(favicon).Replace(".","");
            link.Attributes.Add("type", "image/" + fv + "");
            link.Attributes.Add("href", weburl + "uploads/banners/" + favicon);
        }
        else
        {
            link.Attributes.Add("type", "image/x-icon");
            link.Attributes.Add("href", weburl + "favicon.ico");
        }
        Header.Controls.Add(link);

        if (WEB.Config.getvaluebykey(WEB.Config.k_istatuslivechat, lan).Equals("1"))
            ltlivechat.Text = WEB.Config.getvaluebykey(WEB.Config.k_livechat, lan);
      
        //google analytic
        string analyticcode = WEB.Config.getvaluebykey(WEB.Config.k_anylatic, lan);
        if (analyticcode.Length > 0)
        {
            Page.Header.Controls.Add(new LiteralControl(analyticcode));
        }
        //googlemaster tool
        string googlemastertool = WEB.Config.getvaluebykey(WEB.Config.k_webmastertool, lang);
        if (googlemastertool.Length > 0)
        {
            HtmlMeta googlevertificate = new HtmlMeta();
            ogurl.Name = "google-site-verification";
            ogurl.Content = googlemastertool;
            Header.Controls.Add(ogurl);
        }
        if (WEB.Config.getvaluebykey(WEB.Config.k_remarketing, lan).Length > 0)
            ltremarketing.Text = WEB.Config.getvaluebykey(WEB.Config.k_remarketing, lan);
      //  loadhotline();
    }
    public string GetUserIP()
    {
        string ipList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipList))
        {
            return ipList.Split(',')[0];
        }

        return Request.ServerVariables["REMOTE_ADDR"];
    }
   
}
