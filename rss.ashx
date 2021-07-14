<%@ WebHandler Language="C#" Class="sitemap" %>
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Xml;
public class sitemap : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/xml";
        using (XmlTextWriter writer = new XmlTextWriter(context.Response.OutputStream, Encoding.UTF8))
        {
            writer.WriteStartDocument();
            writer.WriteStartElement("rss");
            writer.WriteAttributeString("version", "2.0");
           // writer.WriteAttributeString("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance");
            writer.WriteStartElement("channel");
            writer.WriteElementString("title",WEB.Config.getvaluebykey(WEB.Config.k_webtitle, WEB.Common.Lang));
            writer.WriteElementString("link",WEB.Common.Weburl);
               writer.WriteElementString("description",WEB.Config.getvaluebykey(WEB.Config.k_webdesc, WEB.Common.Lang));
             writer.WriteElementString("language","vi");
             writer.WriteElementString("generator", WEB.Common.Weburl);
           
            if (checkmudle("20"))
            {
                DataTable dt = WEB.Items.getlistitembypage("-1", new string[0], "", WEB.Common.mod_product, WEB.Common.Lang, "", "1", 0, 1000, "iid desc");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    writer.WriteStartElement("item");
                    writer.WriteElementString("title", dt.Rows[i]["vtitle"].ToString());
                    writer.WriteElementString("link", WEB.Common.Weburl + dt.Rows[i]["valias"].ToString());
                    writer.WriteElementString("description", "" + dt.Rows[i]["vdesc"].ToString() + "");
                    writer.WriteElementString("content", "" + dt.Rows[i]["vcontent"].ToString() + "");
                    writer.WriteEndElement();
                }

               
            }
            if (checkmudle("21"))
            {
                DataTable dt = WEB.Items.getlistitembypage("-1", new string[0], "", WEB.Common.mod_news, WEB.Common.Lang, "", "1", 0, 1000, "iid desc");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    writer.WriteStartElement("item");
                    writer.WriteElementString("title", dt.Rows[i]["vtitle"].ToString());
                    writer.WriteElementString("link", WEB.Common.Weburl + dt.Rows[i]["valias"].ToString());
                    writer.WriteElementString("description", "" + dt.Rows[i]["vdesc"].ToString() + "");
                    writer.WriteElementString("content", "" + dt.Rows[i]["vcontent"].ToString() + "");
                    writer.WriteEndElement();
                }

                
            }
            if (checkmudle("22"))
            {
                DataTable dt = WEB.Items.getlistitembypage("-1", new string[0], "", WEB.Common.mod_content, WEB.Common.Lang, "", "1", 0, 1000, "iid desc");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    writer.WriteStartElement("item");
                    writer.WriteElementString("title", dt.Rows[i]["vtitle"].ToString());
                    writer.WriteElementString("link", WEB.Common.Weburl + dt.Rows[i]["valias"].ToString());
                    writer.WriteElementString("description", "" + dt.Rows[i]["vdesc"].ToString() + "");
                    writer.WriteElementString("content", "" + dt.Rows[i]["vcontent"].ToString() + "");
                    writer.WriteEndElement();
                }

              
            }
            if (checkmudle("23"))
            {
                DataTable dt = WEB.Items.getlistitembypage("-1", new string[0], "", WEB.Common.mod_service, WEB.Common.Lang, "", "1", 0, 1000, "iid desc");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    writer.WriteStartElement("item");
                    writer.WriteElementString("title", dt.Rows[i]["vtitle"].ToString());
                    writer.WriteElementString("link", WEB.Common.Weburl + dt.Rows[i]["valias"].ToString());
                    writer.WriteElementString("description", "" + dt.Rows[i]["vdesc"].ToString() + "");
                    writer.WriteElementString("content", "" + dt.Rows[i]["vcontent"].ToString() + "");
                    writer.WriteEndElement();
                }

            }
            if (checkmudle("24"))
            {
                DataTable dt = WEB.Items.getlistitembypage("-1", new string[0], "", WEB.Common.mod_videos, WEB.Common.Lang, "", "1", 0, 1000, "iid desc");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    writer.WriteStartElement("item");
                    writer.WriteElementString("title", dt.Rows[i]["vtitle"].ToString());
                    writer.WriteElementString("link", WEB.Common.Weburl + "videos/" + dt.Rows[i]["valias"].ToString());
                    writer.WriteElementString("description", "" + dt.Rows[i]["vdesc"].ToString() + "");
                    writer.WriteElementString("content", "" + dt.Rows[i]["vcontent"].ToString() + "");
                    writer.WriteEndElement();
                }

               
            }
            
            if (checkmudle("26"))
            {
                DataTable dt = WEB.Items.getlistitembypage("-1", new string[0], "", WEB.Common.mod_files, WEB.Common.Lang, "", "1", 0, 1000, "iid desc");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    writer.WriteStartElement("item");
                    writer.WriteElementString("title", dt.Rows[i]["vtitle"].ToString());
                    writer.WriteElementString("link", WEB.Common.Weburl + "thu-vien-tai-lieu/" + dt.Rows[i]["valias"].ToString());
                    writer.WriteElementString("description", "" + dt.Rows[i]["vdesc"].ToString() + "");
                    writer.WriteElementString("content", "" + dt.Rows[i]["vcontent"].ToString() + "");
                    writer.WriteEndElement();
                }

               
            }
            if (checkmudle("55"))
            {
                DataTable dt = WEB.Items.getlistitembypage("-1", new string[0], "", "FAQ", WEB.Common.Lang, "", "1", 0, 1000, "iid desc");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    writer.WriteStartElement("item");
                    writer.WriteElementString("title", dt.Rows[i]["vtitle"].ToString());
                    writer.WriteElementString("link", WEB.Common.Weburl + "hoi-dap/" + dt.Rows[i]["valias"].ToString());
                    writer.WriteElementString("description", "" + dt.Rows[i]["vdesc"].ToString() + "");
                    writer.WriteElementString("content", "" + dt.Rows[i]["vcontent"].ToString() + "");
                    writer.WriteEndElement();
                }

               
            }
            writer.WriteEndElement();
            writer.WriteEndElement();
            writer.WriteEndDocument();
            writer.Flush();
            context.Response.End();
           
        }
    }
    public bool checkmudle(string s)
    {
        DataTable dt = WEB.Category.getcate("-1", WEB.Common.mod_module, "-1", "1", "1");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["vimg"].ToString().Trim() == s)
                {
                    return true;
                }
            }
        }
        return false;
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}