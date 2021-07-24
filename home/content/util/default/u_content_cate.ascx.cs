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

public partial class home_news_default_u_news_cate : System.Web.UI.UserControl
{
    public string catename = TN.Common.GetLabel("lb_noidung", "Nội dung", TN.Common.Lang);
    public int p = 0;
    public string lang = WEB.Common.Lang;
    public string weburl = WEB.Common.Weburl;
    public int numitems = 0;
    public int icid = -1;
    public string alias = "";
    public string img = "";
    public string imglang = "";
    public ArrayList ar = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (lang == "VIE")
            imglang = "<a href='/lien-he' target='_blank' class='vc_single_image-wrapper vc_box_border_grey'><img width='250' height='56' src='/templates/home/images/lien-he-EMG.png' class='vc_single_image-img attachment-full' alt='lien-he-EMG.png' /></a>";
        else
            imglang = "<a href='/lien-he' target='_blank' class='vc_single_image-wrapper vc_box_border_grey'><img width='250' height='56' src='/templates/home/images/contact-EMG.png' class='vc_single_image-img attachment-full' alt='contact-EMG.png' /></a>";
        string desc_web = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, lang);
        string key_web = WEB.Config.getvaluebykey(WEB.Config.k_webkeyword, lang);
        string t_web = WEB.Config.getvaluebykey(WEB.Config.k_webtitle, lang);
        //cate detail
        alias = WEB.Common.GeturlParam("alias");
        DataTable dtcate = WEB.Category.getcatebyfield("valias", alias);
        if (dtcate.Rows.Count > 0)
        {
            ltname.Text = this.catename = dtcate.Rows[0]["vname"].ToString();
            img = "/uploads/contents/images" + dtcate.Rows[0]["vimg"].ToString();
            //ltcatename.Text = dtcate.Rows[0]["vname"].ToString();
            icid = Convert.ToInt32(dtcate.Rows[0]["icid"]);
            icid = Convert.ToInt32(dtcate.Rows[0]["icid"]);
            numitems = WEB.Items.getnumitems("", new string[0], WEB.Common.mod_content, icid.ToString(), lang, "", "1");
            t_web = this.catename;
            key_web = this.catename + "," + WEB.Common.GetNewTitle(this.catename);
            desc_web = this.catename + ", " + WEB.Config.getvaluebykey(WEB.Config.k_webdesc, lang);
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

        Page.Title = t_web;
        try
        {
            if (this.Page.Header != null)
            {
                foreach (Control c in this.Page.Header.Controls)
                {
                    HtmlMeta hm1 = c as HtmlMeta;
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
        loadcontent_top("top_about");
        loadcontent_bottom("bot_about");
        qc();
    }
    protected void LoadItemsList()
    {
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("p")))
        {
            p = Convert.ToInt32(WEB.Common.GeturlParam("p"));
        }
        DataTable dicid = WEB.Category.getcatebyfield("valias", alias);
        string[] fieldsearch = { };
        string condition = "";
        int itemperpage = 20;
        itemperpage = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_nwsperpage, lang));
        string key = "";
        DataTable dt = new DataTable();
        numitems = WEB.Items.getnumitems(key, fieldsearch, WEB.Common.mod_content, icid.ToString(), lang, condition, "1");
        dt = WEB.Items.getlistitembypage(icid.ToString(), fieldsearch, key, WEB.Common.mod_content, lang, condition, "1", p - 1, itemperpage, "iparam2 asc, dcreatedate DESC ");
        //dt = WEB.Items.getlistitembypage(fieldsearch, key, condition, p, itemperpage, "iparam1 asc, dcreatedate DESC ");
        if (dt.Rows.Count == 1)
            Response.Redirect(weburl + dt.Rows[0]["valias"].ToString());
        if (alias == "" && icid == -1)
            alias = "noi-dung";
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i % 2 == 0)
                {
                    ltitems.Text += "<div class='content_row row wpb_row  default-style fullwidth border-bottom' style='background-color: #f57d27;'>";
                    ltitems.Text += " <div class='content_row_wrapper  align-contents content-align-middle nopadding default'>";
                    ltitems.Text += " <div class='vc_col-sm-12 wpb_column vc_column_container'>";
                    ltitems.Text += "     <div class='wpb_wrapper'>";
                    ltitems.Text += "         <div class='content_row row vc_row wpb_row vc_inner  global-style'>";
                    ltitems.Text += "             <div class='content_row_wrapper  ' style='padding-left: 80px; padding-right: 80px;'>";
                    ltitems.Text += "               <div class='vc_col-sm-6 wpb_column vc_column_container vc_custom_1553915490983'>";
                    ltitems.Text += "                  <div class='wpb_wrapper'>";
                    ltitems.Text += "                      <div class='vc_empty_space' style='height: 50px'><span class='vc_empty_space_inner'></span></div>";
                    ltitems.Text += "                     <div class='wpb_text_column wpb_content_element wpb_animate_when_almost_visible wpb_fadeInUp fadeInUp wpb_start_animation animated'>";
                    ltitems.Text += "                        <div class='wpb_wrapper'>";
                    ltitems.Text += dt.Rows[i]["vcontent"].ToString();
                    ltitems.Text += "                      </div>";
                    ltitems.Text += "                 </div>";
                    ltitems.Text += "                 <div class='vc_empty_space' style='height: 50px'><span class='vc_empty_space_inner'></span></div>";
                    ltitems.Text += "            </div>";
                    ltitems.Text += "        </div>";
                    ltitems.Text += "   <div class='vc_col-sm-6 wpb_column vc_column_container'>";
                    ltitems.Text += "        <div class='wpb_wrapper'>";
                    ltitems.Text += "          <div class='wpb_single_image wpb_content_element vc_align_left'>";
                    ltitems.Text += "              <figure class='wpb_wrapper vc_figure'>";
                    ltitems.Text += "               <div class='vc_single_image-wrapper   vc_box_border_grey'>";
                    ltitems.Text += "                  <img width = '669' height = '480' src = '/uploads/contents/" + dt.Rows[i]["vimg"].ToString() + "' class='vc_single_image-img attachment-full' alt='" + dt.Rows[i]["vtitle"].ToString() + "' />";
                    ltitems.Text += "               </div>";
                    ltitems.Text += "            </figure>";
                    ltitems.Text += "         </div>";
                    ltitems.Text += "          </div>";
                    ltitems.Text += "          </div>";
                    ltitems.Text += "         </div>";
                    ltitems.Text += "      </div>";
                    ltitems.Text += "     </div>";
                    ltitems.Text += "  </div>";
                    ltitems.Text += "  </div>";
                    ltitems.Text += "</div>";
                }
                else
                {
                    ltitems.Text += "<div class='content_row row wpb_row  default-style fullwidth border-bottom'>";
                    ltitems.Text += " <div class='content_row_wrapper  align-contents content-align-middle nopadding default'>";
                    ltitems.Text += " <div class='vc_col-sm-12 wpb_column vc_column_container'>";
                    ltitems.Text += "     <div class='wpb_wrapper'>";
                    ltitems.Text += "         <div class='content_row row vc_row wpb_row vc_inner  global-style'>";
                    ltitems.Text += "             <div class='content_row_wrapper  ' style='padding-left: 80px; padding-right: 80px;'>";
                    ltitems.Text += "  <div class='vc_col-sm-6 wpb_column vc_column_container'>";
                    ltitems.Text += "        <div class='wpb_wrapper'>";
                    ltitems.Text += "          <div class='wpb_single_image wpb_content_element vc_align_left'>";
                    ltitems.Text += "                  <img width = '669' height = '480' src = '/uploads/contents/" + dt.Rows[i]["vimg"].ToString() + "' class='vc_single_image-img attachment-full' alt='" + dt.Rows[i]["vtitle"].ToString() + "' />";
                    ltitems.Text += "         </div>";
                    ltitems.Text += "          </div>";
                    ltitems.Text += "          </div>";
                    ltitems.Text += "               <div class='vc_col-sm-6 wpb_column vc_column_container vc_custom_1553915490983'>";
                    ltitems.Text += "                  <div class='wpb_wrapper'>";
                    ltitems.Text += "                      <div class='vc_empty_space' style='height: 50px'><span class='vc_empty_space_inner'></span></div>";
                    ltitems.Text += "                     <div class='wpb_text_column wpb_content_element wpb_animate_when_almost_visible wpb_fadeInUp fadeInUp wpb_start_animation animated'>";
                    ltitems.Text += "                        <div class='wpb_wrapper'>";
                    ltitems.Text += dt.Rows[i]["vcontent"].ToString();
                    ltitems.Text += "                      </div>";
                    ltitems.Text += "                 </div>";
                    ltitems.Text += "                 <div class='vc_empty_space' style='height: 50px'><span class='vc_empty_space_inner'></span></div>";
                    ltitems.Text += "            </div>";
                    ltitems.Text += "        </div>";

                    ltitems.Text += "         </div>";
                    ltitems.Text += "      </div>";
                    ltitems.Text += "     </div>";
                    ltitems.Text += "  </div>";
                    ltitems.Text += "  </div>";
                    ltitems.Text += "</div>";
                }
            }
        }
        ltpage.Text = WEB.Common.PhanTrangRewrite(weburl + alias, p, numitems, itemperpage);
    }
    protected void loadcontent_bottom(string key)
    {
        string condition = "vcode ='" + WEB.Common.mod_independent + "' and istatus=1 and vdesc='" + key + "' and vlan='" + WEB.Common.Lang + "' ";
        DataTable dt = WEB.Item_other.getlistitembypage(new string[0], "", condition, 0, 30, " iid DESC");
        rpitems.DataSource = dt;
        rpitems.DataBind();
    }
    protected void loadcontent_top(string key)
    {
        string condition = "vcode ='" + WEB.Common.mod_independent + "' and istatus=1 and vdesc='" + key + "' and vlan='" + WEB.Common.Lang + "' ";
        DataTable dt = WEB.Item_other.getlistitembypage(new string[0], "", condition, 0, 30, " iid DESC");
        rpcontent.DataSource = dt;
        rpcontent.DataBind();
    }
    public void qc()
    {
        DataTable dt = new DataTable();
        dt = TN.Advs.GetAdvByPosition("ADV-abous", WEB.Common.Lang);
        rpitemsqc.DataSource = dt;
        rpitemsqc.DataBind();
    }
}
