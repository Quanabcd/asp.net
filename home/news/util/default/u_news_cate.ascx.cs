using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;

public partial class home_news_default_u_news_cate : System.Web.UI.UserControl
{
    public string catename = TN.Common.GetLabel("lb_tintuc", "Tin tức", TN.Common.Lang);
    public int p = 1;
    public string lang = TN.Common.Lang;
    public string weburl = TN.Common.Weburl;
    public int numitems = 0;
    public int icid = -1;
    public string alias = "";
    private DataTable dtuser = new DataTable();
    public ArrayList ar = new ArrayList();

    protected void Page_Load(object sender, EventArgs e)
    {
        // dtuser = WEB.Webusers.getlistuseractive();

        if (TN.Common.CheckNumber(TN.Common.GetUrlParam("p")))
        {
            p = Convert.ToInt32(TN.Common.GetUrlParam("p"));
            if (p < 1)
                p = 1;
        }
        string desc_web = TN.Configs.GetValueByKey(WEB.Config.k_webdesc, lang);
        string key_web = TN.Configs.GetValueByKey(WEB.Config.k_webkeyword, lang);
        string t_web = TN.Configs.GetValueByKey(WEB.Config.k_webtitle, lang);
        //cate detail
        alias = TN.Common.GetUrlParam("alias");
        DataTable dtcate = TN.Categories.GetCateDetailByField("valias", alias);
        if (alias.Length > 0)
        {
            this.catename = dtcate.Rows[0]["vname"].ToString();
            icid = Convert.ToInt32(dtcate.Rows[0]["icid"]);
            roadlink(dtcate.Rows[0]["icid"].ToString());
            numitems = TN.Items.GetNumItemsInCate(icid.ToString(), new string[0], "", TN.Common.mod_news, lang, "", "1");
            t_web = this.catename;
            key_web = this.catename;
            desc_web = this.catename + ", " + TN.Configs.GetValueByKey(WEB.Config.k_webdesc, lang);
            if (dtcate.Rows[0]["vparam3"].ToString().Length > 1)
            {
                desc_web = dtcate.Rows[0]["vparam3"].ToString();
            }
            if (dtcate.Rows[0]["vparam2"].ToString().Length > 1)
            {
                key_web = dtcate.Rows[0]["vparam2"].ToString();
            }
            if (dtcate.Rows[0]["vparam1"].ToString().Length > 1)
            {
                t_web = dtcate.Rows[0]["vparam1"].ToString();
            }
        }
        if (icid == -1)
        {
            ltname.Text = "Tất cả tin tức";
            ltrl.Text = "<li><a href='/tin-tuc' class='' title='Tin tức'>Tin tức</a></li>";
        }
        if (p > 1)
        {
            t_web += " | trang " + p.ToString();
            desc_web += " | trang " + p.ToString();
        }
        Page.Title = t_web;
        try
        {
            if (this.Page.Header != null)
            {
                string urlparam = "";
                if (p != 0)
                    urlparam = "/trang-" + p.ToString();
                foreach (Control c in this.Page.Header.Controls)
                {
                    HtmlMeta hm1 = c as HtmlMeta;

                    if (hm1 != null && hm1.Name.ToString().Trim() == "ogtitle")
                    {
                        hm1.Content = t_web;
                    }
                    if (hm1 != null && hm1.Name.ToString().Trim().Contains("ogdescription"))
                    {
                        hm1.Content = desc_web;
                    }
                    if (hm1 != null && hm1.Name.Equals("ogurl", StringComparison.InvariantCultureIgnoreCase))
                    {
                        hm1.Content = weburl + alias + urlparam;
                    }
                    HtmlLink linkcanonical = c as HtmlLink;
                    if (linkcanonical != null && linkcanonical.Attributes["rel"].Equals("canonical", StringComparison.InvariantCultureIgnoreCase))
                    {
                        linkcanonical.Attributes.Add("href", weburl + alias + urlparam);
                    }
                    if (hm1 != null && hm1.Name.Equals("description", StringComparison.InvariantCultureIgnoreCase))
                    {
                        hm1.Content = desc_web;
                    }
                    if (hm1 != null && hm1.Name.Equals("keywords", StringComparison.InvariantCultureIgnoreCase))
                    {
                        hm1.Content = key_web;
                    }
                }
            }

            this.Page.Title = t_web;
        }
        catch { }
        LoadItemsList();
    }

    //public string getname(string user)
    //{
    //    DataRow[] dr = dtuser.Select("vusername='" + user + "'");
    //    if (dr.Length > 0)
    //        return dr[0]["vlname"].ToString();
    //    return "";
    //}
    protected void LoadItemsList()
    {
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("p")))
        {
            p = Convert.ToInt32(WEB.Common.GeturlParam("p"));
            if (p < 1)
                p = 1;
        }
        DataTable dicid = WEB.Category.getcatebyfield("valias", alias);
        string[] fieldsearch = { };
        string condition = "";
        string listcid_child = "";
        if (icid != -1)
        {
            listcid_child = WEB.Category.getlistcate_string(icid.ToString(), WEB.Common.mod_news, lang, "1");
            condition = " vcode ='" + WEB.Common.mod_news + "' and icid in (" + listcid_child + ") and istatus=1 ";
        }
        else
        {
            condition = " vcode ='" + WEB.Common.mod_news + "'  and istatus=1 ";
        }
        int itemperpage = 8;

        DataTable dt = new DataTable();
        dt = TN.Items.GetListItemInCateByPage(icid.ToString(), fieldsearch, "", TN.Common.mod_news, TN.Common.Lang, "1=1", "1", p - 1, itemperpage, "iparam1 asc, dcreatedate DESC ");
        rpitems.DataSource = dt;
        rpitems.DataBind();
        if (alias == "" && icid == -1)
            alias = "tin-tuc";
        ltpage.Text = PhanTrangRewrite(weburl + alias, p, numitems, itemperpage);
    }

    public static string PhanTrangRewrite(string link, int curpage, int numitems, int itemperpage)
    {
        string strPage = "";
        int numpages = 0;
        numpages = numitems / itemperpage;
        if (numitems % itemperpage > 0)
            numpages += 1;
        //if (curpage > itemperpage - 1)
        //    curpage = itemperpage - 1;
        if (curpage < 1)
            curpage = 1;
        string prvpage = "", nxtpage = "";
        if (curpage > 1)
            prvpage = " <a href='" + link + "/trang-" + (curpage - 1).ToString() + "'>&lt;&lt;  " + WEB.Common.Getlabel("lb_title_prev", "Sau", WEB.Common.Lang) + "</a>";
        if (numpages > 1 && curpage < numpages)
            nxtpage = "<a href='" + link + "/trang-" + (curpage + 1).ToString() + "'>" + WEB.Common.Getlabel("lb_title_next", "Trước", WEB.Common.Lang) + " &gt;&gt;</a>";

        if (numpages > 1)
        {
            if (numpages < 10)
            {
                for (int i = 1; i <= numpages; i++)
                {
                    if (curpage == i)
                    {
                        strPage += "<b>" + i.ToString() + " </b>";
                    }
                    else
                    {
                        strPage += "<a href='" + link + "/trang-" + i.ToString() + "'>" + i.ToString() + "</a> ";
                    }
                }
            }
            else
            {
                if (curpage < 5)
                {
                    for (int i = 1; i <= 10; i++)
                    {
                        if (curpage == i)
                        {
                            strPage += "<b>" + i.ToString() + " </b>";
                        }
                        else
                        {
                            strPage += "<a href='" + link + "/trang-" + i.ToString() + "'>" + i.ToString() + "</a> ";
                        }
                    }
                }
                else if (curpage > numpages - 5)
                {
                    for (int i = numpages - 10; i <= numpages; i++)
                    {
                        if (curpage == i)
                        {
                            strPage += "<b>" + i.ToString() + " </b>";
                        }
                        else
                        {
                            strPage += "<a href='" + link + "/trang-" + i.ToString() + "'>" + i.ToString() + "</a> ";
                        }
                    }
                }
                else
                {
                    for (int i = curpage - 5; i <= curpage + 5; i++)
                    {
                        if (curpage == i)
                        {
                            strPage += "<b>" + i.ToString() + " </b> ";
                        }
                        else
                        {
                            strPage += "<a href='" + link + "/trang-" + i.ToString() + "'>" + i.ToString() + "</a> ";
                        }
                    }
                }
            }
            strPage = prvpage + " " + strPage + " " + nxtpage;

        }
        return strPage;
    }



    public static string PhanTrang(string link, int curpage, int numitems, int itemperpage)
    {
        string strPage = "";
        int numpages = 0;
        numpages = numitems / itemperpage;
        if (numitems % itemperpage > 0)
            numpages += 1;
        //if (curpage > itemperpage - 1)
        //    curpage = itemperpage - 1;
        if (curpage < 1)
            curpage = 1;
        string prvpage = "", nxtpage = "";
        if (curpage > 1)
            prvpage = " <a href='" + link + "&p=" + (curpage - 1).ToString() + "'>&lt;&lt;  " + WEB.Common.Getlabel("lb_title_prev", "Después de", WEB.Common.Lang) + "</a>";
        if (numpages > 1 && curpage < numpages)
            nxtpage = "<a href='" + link + "&p=" + (curpage + 1).ToString() + "'>" + WEB.Common.Getlabel("lb_title_next", "Anterior", WEB.Common.Lang) + " &gt;&gt;</a>";

        if (numpages > 1)
        {
            if (numpages < 10)
            {
                for (int i = 1; i <= numpages; i++)
                {
                    if (curpage == i)
                    {
                        strPage += "<b>" + i.ToString() + " </b>";
                    }
                    else
                    {
                        strPage += "<a href='" + link + "&p=" + i.ToString() + "'>" + i.ToString() + "</a> ";
                    }
                }
            }
            else
            {
                if (curpage < 5)
                {
                    for (int i = 1; i <= 10; i++)
                    {
                        if (curpage == i)
                        {
                            strPage += "<b>" + i.ToString() + " </b>";
                        }
                        else
                        {
                            strPage += "<a href='" + link + "&p=" + i.ToString() + "'>" + i.ToString() + "</a> ";
                        }
                    }
                }
                else if (curpage > numpages - 5)
                {
                    for (int i = numpages - 10; i <= numpages; i++)
                    {
                        if (curpage == i)
                        {
                            strPage += "<b>" + i.ToString() + " </b>";
                        }
                        else
                        {
                            strPage += "<a href='" + link + "&p=" + i.ToString() + "'>" + i.ToString() + "</a> ";
                        }
                    }
                }
                else
                {
                    for (int i = curpage - 5; i <= curpage + 5; i++)
                    {
                        if (curpage == i)
                        {
                            strPage += "<b>" + i.ToString() + " </b> ";
                        }
                        else
                        {
                            strPage += "<a href='" + link + "&p=" + i.ToString() + "'>" + i.ToString() + "</a> ";
                        }
                    }
                }
            }
            strPage = prvpage + " " + strPage + " " + nxtpage;

        }
        return strPage;
    }

    protected void roadlink(string cid)
    {
        string str = "";
        ar.Add(cid);
        DataTable dt = WEB.Category.getcatebyfield("icid", cid);
        if (dt.Rows.Count > 0)
        {
            getpar(dt.Rows[0]["iparcid"].ToString());
        }
        if (ar.Count > 0)
        {
            for (int i = ar.Count - 1; i >= 0; i--)
            {
                DataTable dtc = WEB.Category.getcatebyfield("icid", ar[i].ToString());
                if (dtc.Rows.Count > 0)
                {
                    DataTable dtcc = new DataTable();
                    WEB.Category.getcategory(ref dtcc, dtc.Rows[0]["icid"].ToString(), WEB.Common.mod_news, lang, "", "1");
                    if (dtcc.Rows.Count > 0)
                    {
                        str += "<li><a href='/" + dtc.Rows[0]["valias"].ToString() + "' class='' title='" + dtc.Rows[0]["vname"].ToString() + "'>" + dtc.Rows[0]["vname"].ToString() + "</a></li>";

                        str += "<ul>";
                        for (int j = 0; j < dtcc.Rows.Count; j++)
                        {
                            //str += "<li><a href='/" + dtcc.Rows[j]["valias"].ToString() + "'  title='" + dtcc.Rows[j]["vname"].ToString() + "'>" + dtcc.Rows[j]["vname"].ToString() + "</a>";
                        }
                        str += "</ul>";
                    }
                    else
                        str += "<li><a href='/" + dtc.Rows[0]["valias"].ToString() + "' class='' title='" + dtc.Rows[0]["vname"].ToString() + "'>" + dtc.Rows[0]["vname"].ToString() + "</a></li>";
                }
            }
        }
        ltrl.Text = str;
    }

    protected void getpar(string cid)
    {
        if (cid != "-1")
            ar.Add(cid);
        DataTable dt = WEB.Category.getcatebyfield("icid", cid);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["iparcid"].ToString() != "-1")
            {
                //   ar.Add(dt.Rows[0]["iparcid"].ToString());
                getpar(dt.Rows[0]["iparcid"].ToString());
            }
        }
    }
}