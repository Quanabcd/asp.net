using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class admin_products_item_edit : System.Web.UI.UserControl
{
    public string weburl = WEB.Common.Weburl;
    public string vlan = WEB.Common.LangAdmin;
    public int iorder = 0;
    public int iordertype = 0;
    public int id = -1;
    public int curpage = 1;
    public string key = "";
    public int icid = -1;
    public int istatus = -1;
    public int numitems = 0;
    public int icurrent = 0;
    public int n = 0;
    public int iidtemp = -1;
    public int subnum = 1;
    public string itemtitle = "";
    public string itemurl = "";
    public string itemdescription = "";
    public int subcurrent = 0;
    public string role = "";
    public DataTable dtgroupite = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        role = Session["role"].ToString();
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("id")))
        {
            id = Convert.ToInt32(WEB.Common.GeturlParam("id"));
        }
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("cid")))
        {
            icid = Convert.ToInt32(WEB.Common.GeturlParam("cid"));
            DataTable dtc = WEB.Category.getcatebyid(icid.ToString());
            if (dtc.Rows.Count > 0)
            {
                if (dtc.Rows[0]["vparam6"].ToString().Contains(',' + Session["userid"].ToString() + ",") || dtc.Rows[0]["vparam6"].ToString().Contains(",-1,"))
                {
                }
                else
                    Response.Redirect(weburl + "admin/?mod=hotel&c=items");
            }
            else
                Response.Redirect(weburl + "admin/?mod=hotel&c=items");
        }
        if(!IsPostBack)
        {
            numitems = WEB.Products.getnumitem();
            //lttitle.Text = numitems.ToString();

            lttitle.Text = "Thêm nhanh sản phẩm";
            lnkupdate.Visible = true;
            lnkclose.Visible = true;
            ltdetailmsg.Visible = false;
        }
    }
    public bool checkrole(string s)
    {
        if (role.Contains("|" + s + "|"))
            return true;
        else
            return false;
    }
   
    public int getstt()
    {
        icurrent++;
        return icurrent;
    }
    public string getusercreateupdate(string ucreate, string uupdate)
    {
        string str = "";
        if (uupdate == "")
        {
            str = "<p class='sptime'><i class='ico-ucreate'  title='Người tạo'></i>" + ucreate + "</p>";
            str += "<p class='sptime'><i class='ico-uupdate'  title='Người cập nhật'></i>...</p>";
        }
        else
        {
            str = "<p class='sptime'><i class='ico-ucreate'  title='Người tạo'></i>" + ucreate + "</p>";
            str += "<p class='sptime'><i class='ico-uupdate'  title='Người cập nhật'></i>" + uupdate + "</p>";
        }
        return str;
    }
   
    public string getdatecreateupdate(string dcreate, string dupdate)
    {
        string str = "";
        if (dcreate == dupdate)
        {
            str = "<p class='sptime'><i class='ico-dcreate'  title='Ngày tạo'></i>" + Convert.ToDateTime(dcreate).ToString("dd/MM/yyyy HH:mm") + "</p>";
            str += "<p class='sptime'><i class='ico-dupdate'  title='Ngày cập nhật'></i>...</p>";
        }
        else
        {
            str = "<p class='sptime'><i class='ico-dcreate'  title='Ngày tạo'></i>" + Convert.ToDateTime(dcreate).ToString("dd/MM/yyyy HH:mm") + "</p>";
            str += "<p class='sptime'><i class='ico-dupdate'  title='Ngày cập nhật'></i>" + Convert.ToDateTime(dupdate).ToString("dd/MM/yyyy HH:mm") + "</p>";
        }
        return str;
    }
    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        try
        {
            string alias = "";
            string name = "";
            string image = "default.png";
            string price = "0";
            string priceold = "0";
            string metadesc = WEB.Config.getvaluebykey(WEB.Config.k_webdesc, WEB.Common.LangAdmin);
            int numpb = Convert.ToInt32(Request.Form["hdnumprd"]);
            string prdkey = "";
            //them phien ban khac
            for (int i = 1; i <= numpb; i++)
            {
                if (WEB.Common.GetFormValue("tempimg-" + i.ToString()).ToString().Length > 0)
                    image=WEB.Common.GetFormValue("tempimg-" + i.ToString()).ToString();
                name = WEB.Common.GetFormValue("prdname-" + i.ToString()).ToString();
                if (WEB.Common.GetFormValue("prdcode-" + i.ToString()).ToString().Length > 0)
                    prdkey = WEB.Common.GetFormValue("prdcode-" + i.ToString()).ToString();
                else
                {
                    prdkey = WEB.Cart.Carts.PrdCode;
                    string prc = WEB.Config.getvaluebykey("prdcode", WEB.Common.LangAdmin);
                    if (WEB.Common.Check_number(prc))
                    {
                        WEB.Config.updatekey("prdcode", WEB.Common.LangAdmin, (Convert.ToInt32(prc) + 1).ToString());
                    }
                    else
                        WEB.Config.updatekey("prdcode", WEB.Common.LangAdmin, "2");
                }
                if (name.Length > 0)
                {
                    if (vlan != "ENG" && vlan != "VIE")
                        alias = WEB.Common.getalias("product");
                    else
                        alias = WEB.Common.getalias(name);
                    if (WEB.Common.Check_float( WEB.Common.GetFormValue("prdprice-" + i.ToString()).ToString()))
                        price = WEB.Common.GetFormValue("prdprice-" + i.ToString()).ToString();
                    if (WEB.Common.Check_float(WEB.Common.GetFormValue("prdpriceold-" + i.ToString()).ToString()))
                        priceold = WEB.Common.GetFormValue("prdpriceold-" + i.ToString()).ToString();
                    metadesc = name + " - " + metadesc;
                    WEB.Items.db_items_insert(icid.ToString(), "HEL", vlan, alias, prdkey, name, WEB.Common.GetNosign(name), "", "", image, Convert.ToInt32(Session["userid"]), Session["admin"].ToString(), price, priceold, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", "1", name, "", metadesc, "", "", "", "", "", "", "", "", "", "", "", "", "0", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0");
                }
                else
                {
                    if (image != "default.png")
                    {
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/products/" + image);
                        System.IO.File.Delete(Server.MapPath("~/") + "/uploads/products/thumbs/" + image);
                    }
                }

            }
            Response.Redirect(weburl + "admin/?mod=hotel&c=items&cid=" + icid.ToString() );
        }
        catch (Exception ex) {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Lưu thông tin không thành công</p>" + ex.ToString();
            ltdetailmsg.Visible = true;
        }
       

    }
       
      



    protected void lnkclose_Click(object sender, EventArgs e)
    {
        Response.Redirect(weburl + Session["url"].ToString());
    }
    public string formatdate(DateTime date)
    {

        return WEB.Common.Formatdate(date);
    }
    public string getpic(string str)
    {
        if (str.Length > 0)
        {
            return "<img height='40' style='max-width:300px' src='" + weburl + "uploads/products/" + str + "'>";
        }
        else
            return "";
    }
 
    
}