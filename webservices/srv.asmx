<%@ WebService Language="C#" Class="srv" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class srv  : System.Web.Services.WebService {

    [WebMethod]
    public string GetDistrict(string city)
    {
        string str = "";
        DataTable dt = new DataTable();
        WEB.CategoryOther.getcategorylevel1(ref dt, city, "CI", WEB.Common.Lang, "1");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (i == 0)
                str += "<option selected='selected' value='" + dt.Rows[i]["icid"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</option>";
            else
                str += "<option value='" + dt.Rows[i]["icid"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</option>";
        }
        return str;
    }
    [WebMethod]
    public string GetPX(string qh)
    {
        string str = "";
        DataTable dt = new DataTable();
        WEB.CategoryOther.getcategorylevel1(ref dt, qh, "CI", WEB.Common.Lang, "1");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (i == 0)
                str += "<option selected='selected' value='" + dt.Rows[i]["icid"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</option>";
            else
                str += "<option value='" + dt.Rows[i]["icid"].ToString() + "'>" + dt.Rows[i]["vname"].ToString() + "</option>";
        }
        return str;
    }
    
}