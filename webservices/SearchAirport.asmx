<%@ WebService Language="C#" Class="SearchAirport" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class SearchAirport : System.Web.Services.WebService
{

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }
    [WebMethod]
    public string Search(string key)
    {
        string str = "";
        string condition = " vcode ='SBY'"; ;
        string[] fieldsearch = { "vtitle", "vdesc", "vcontent" };
        DataTable dt = WEB.Item_other.getlistitembypage(fieldsearch, key, condition, 0, 10, " iid DESC");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str += "<li><a  airportcode='" + dt.Rows[i]["vdesc"].ToString() + "'><b>" + dt.Rows[i]["vtitle"].ToString() + "</b><span> (" + dt.Rows[i]["vdesc"].ToString() + ") </span> - " + dt.Rows[i]["vparam2"].ToString() + "</a> </li>";
            }
        }
        return str;
    }
    [WebMethod]
    public string SearchMb(string key)
    {
        string str = "";
        string condition = " vcode ='SBY'"; ;
        string[] fieldsearch = { "vtitle", "vdesc", "vcontent" };
        DataTable dt = WEB.Item_other.getlistitembypage(fieldsearch, key, condition, 0, 10, " iid DESC");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str += "<tr><td><p><span class='city'>" + dt.Rows[i]["vtitle"].ToString() + "</span> - " + dt.Rows[i]["vcontent"].ToString() + "</p><span class='airport-code'>" + dt.Rows[i]["vdesc"].ToString() + "</span></td></tr>";
            }
        }
        return str;
    }
    [WebMethod]
    public string Searchap(string key)
    {
        string str = "";
        string condition = " vcode ='SBY'"; ;
        string[] fieldsearch = { "vtitle", "vdesc", "vcontent" };
        DataTable dt = WEB.Item_other.getlistitembypage(fieldsearch, key, condition, 0, 10, " iid DESC");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str += "<a data-name='" + dt.Rows[i]["vcontent"].ToString() + "' data-code='" + dt.Rows[i]["vdesc"].ToString() + "' data-country='" + dt.Rows[i]["vparam2"].ToString() + "'>" + dt.Rows[i]["vcontent"].ToString() + "( " + dt.Rows[i]["vdesc"].ToString() + " )" + "<b>" + dt.Rows[i]["vparam2"].ToString() + "</b></a>";
            }
        }
        return str;
    }
    [WebMethod]
    public string Searchcl(string key)
    {
        string str = "";
       // string condition = " vcode ='SBY' and vparam1='" + key + "'";
        //string[] fieldsearch = { "vtitle", "vdesc", "vcontent" };
       // DataTable dt = WEB.Item_other.getlistitembypage(fieldsearch, "", condition, 0, 100, " vtitle ASC");
        string sql = "select vparam2 from db_items_other where vcode ='SBY' and vparam1='" + key + "'  group by vparam2,vcode,vparam1 order by vparam2 asc   ";
        DataTable dt = WEB.Dataprovider.getdata(sql);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str += "<a data-filter='" + dt.Rows[i]["vparam2"].ToString() + "' data-name='" + dt.Rows[i]["vparam2"].ToString() + "'>" + dt.Rows[i]["vparam2"].ToString() + "</a>";
            }
        }
        return str;
    }

    [WebMethod]
    public string Searchbycountry(string key)
    {
        string str = "";
        string condition = " vcode ='SBY' and vparam2 like N'%" + key.Trim() + "%'"; 
        string[] fieldsearch = {  };
        DataTable dt = WEB.Item_other.getlistitembypage(fieldsearch, "", condition, 0,40, " vtitle ASC");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str += "<a data-name='" + dt.Rows[i]["vcontent"].ToString() + "' data-code='" + dt.Rows[i]["vdesc"].ToString() + "' data-country='" + dt.Rows[i]["vparam2"].ToString() + "'>" + dt.Rows[i]["vcontent"].ToString() + "( " + dt.Rows[i]["vdesc"].ToString() + " )" + "<b>" + dt.Rows[i]["vparam2"].ToString() + "</b></a>";
            }
        }
        return str;
    }
    [WebMethod]
    public string datxe1(string diemdi, string diemden, string ngaydon, string loaixe, string sodienthoai)
    {

        string content = "<b>Thông tin đặt xe đón tiễn</b><br>";
        content += "Bạn nhận được thông tin đặt xe đón tiễn từ website: <a href='" + WEB.Common.Weburl + "'>" + WEB.Common.Weburl + "</a><br>";
        content += "<b>Điểm đi</b> : " + diemdi + "<br>";
        content += "<b>Điểm đến</b> : " + diemden + "<br>";
        content += "<b>Ngày đón</b> : " + ngaydon + "<br>";
        content += "<b>Loại xe</b> : " + loaixe + "<br>";
        content += "<b>Số điện thoại</b> : " + sodienthoai + "<br>";

        WEB.Item_other.db_items_other_insert("-1", WEB.Common.mod_contacts, WEB.Common.Lang, "Xe đón tiễn", "Đăng ký dịch vụ xe đón tiễn", content, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", "0", "0", "", "", "", "", "", "0", "0");
        string email = WEB.Config.getvaluebykey(WEB.Config.k_comemail, WEB.Common.Lang);

        string emailsend = WEB.Config.getvaluebykey(WEB.Config.k_sysemail, WEB.Common.Lang);

        string a = WEB.Common.SendMail(email, emailsend, "", "Thông tin đặt xe đón tiễn từ website: " + WEB.Common.Weburl, content);

        return "1";
    }
    [WebMethod]
    public string datxe1(string diemdi, string diemden, string ngaydon, string loaixe, string sodienthoai, string thongtinthem)
    {

        string content = "<b>Thông tin đặt xe đón tiễn</b><br>";
        content += "Bạn nhận được thông tin đặt xe đón tiễn từ website: <a href='" + WEB.Common.Weburl + "'>" + WEB.Common.Weburl + "</a><br>";
        content += "<b>Điểm đi</b> : " + diemdi + "<br>";
        content += "<b>Điểm đến</b> : " + diemden + "<br>";
        content += "<b>Ngày đón</b> : " + ngaydon + "<br>";
        content += "<b>Loại xe</b> : " + loaixe + "<br>";
        content += "<b>Số điện thoại</b> : " + sodienthoai + "<br>";
        content += "<b>Thông tin chi tiết</b> : " + thongtinthem + "<br>";
        WEB.Item_other.db_items_other_insert("-1", WEB.Common.mod_contacts, WEB.Common.Lang, "Xe đón tiễn", "Đăng ký dịch vụ xe đón tiễn", content, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", "0", "0", "", "", "", "", "", "0", "0");
        string email = WEB.Config.getvaluebykey(WEB.Config.k_comemail, WEB.Common.Lang);

        string emailsend = WEB.Config.getvaluebykey(WEB.Config.k_sysemail, WEB.Common.Lang);

        string a = WEB.Common.SendMail(email, emailsend, "", "Thông tin đặt xe đón tiễn từ website: " + WEB.Common.Weburl, content);

        return "1";
    }

    [WebMethod]
    public string sendemailservices(string email1)
    {

        string content = "";

        content += email1;


        WEB.Item_other.db_items_other_insert("-1", WEB.Common.mod_contacts, WEB.Common.Lang, "Đăng ký nhận email", "Đăng ký nhận email", "", DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", "0", "0", email1, "", "", "", "", "0", "0");
        string email = WEB.Config.getvaluebykey(WEB.Config.k_comemail, WEB.Common.Lang);

        string emailsend = WEB.Config.getvaluebykey(WEB.Config.k_sysemail, WEB.Common.Lang);

        string a = WEB.Common.SendMail(email, emailsend, "", "Thông tin đăng ký nhận email website: " + WEB.Common.Weburl, content);

        return "1";
    }
    [WebMethod]
    public string sendemailservices1(string email1)
    {

        string content = "";

        content += email1;


        WEB.Item_other.db_items_other_insert("-1", WEB.Common.mod_contacts, WEB.Common.Lang, "Đăng ký nhận email", "Đăng ký nhận email", content, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", "0", "0", content, "", "", "", "", "0", "0");
        string email = WEB.Config.getvaluebykey(WEB.Config.k_comemail, WEB.Common.Lang);

        string emailsend = WEB.Config.getvaluebykey(WEB.Config.k_sysemail, WEB.Common.Lang);

        string a = WEB.Common.SendMail(email, emailsend, "", "Thông tin đăng ký nhận email website: " + WEB.Common.Weburl, content);

        return "1";
    }
}
public class Airport
{
    public string ma { get; set; }
    public string ten { get; set; }
}