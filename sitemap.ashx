<%@ WebHandler Language="C#" Class="sitemap" %>
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Xml;
public class sitemap : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/xml";
        string sm = WEB.Config.getvaluebykey(WEB.Config.k_sitemapfile, WEB.Common.Lang);
        if (sm.Length > 0)
        {
            context.Response.Write(sm);
        }
        else
        {
            using (XmlTextWriter writer = new XmlTextWriter(context.Response.OutputStream, Encoding.UTF8))
            {
                writer.WriteStartDocument();
                writer.WriteStartElement("urlset");
                writer.WriteAttributeString("xmlns", "http://www.sitemaps.org/schemas/sitemap/0.9");
                writer.WriteAttributeString("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance");
                writer.WriteStartElement("url");
                writer.WriteElementString("loc", WEB.Common.Weburl);
                writer.WriteEndElement();
                if (checkmudle("20"))
                {
                    DataTable dt = WEB.Items.getlistitembypage("-1", new string[0], "", WEB.Common.mod_product, WEB.Common.Lang, "", "1", 0, 1000, "iid desc");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + dt.Rows[i]["valias"].ToString());
                        writer.WriteEndElement();
                    }

                    dt = WEB.Category.getlistcate(WEB.Common.mod_product, "", "icid asc", "1");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + dt.Rows[i]["valias"].ToString());
                        writer.WriteElementString("changefreq", "always");
                        writer.WriteElementString("priority", "1.0");
                        writer.WriteEndElement();
                    }
                }
                if (checkmudle("21"))
                {
                    DataTable dt = WEB.Items.getlistitembypage("-1", new string[0], "", WEB.Common.mod_news, WEB.Common.Lang, "", "1", 0, 1000, "iid desc");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + dt.Rows[i]["valias"].ToString());
                        writer.WriteEndElement();
                    }

                    dt = WEB.Category.getlistcate(WEB.Common.mod_news, "", "icid asc", "1");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + dt.Rows[i]["valias"].ToString());
                        writer.WriteElementString("changefreq", "always");
                        writer.WriteElementString("priority", "1.0");
                        writer.WriteEndElement();
                    }
                }
                if (checkmudle("22"))
                {
                    DataTable dt = WEB.Items.getlistitembypage("-1", new string[0], "", WEB.Common.mod_content, WEB.Common.Lang, "", "1", 0, 1000, "iid desc");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + dt.Rows[i]["valias"].ToString());
                        writer.WriteEndElement();
                    }

                    dt = WEB.Category.getlistcate(WEB.Common.mod_content, "", "icid asc", "1");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + dt.Rows[i]["valias"].ToString());
                        writer.WriteElementString("changefreq", "always");
                        writer.WriteElementString("priority", "1.0");
                        writer.WriteEndElement();
                    }
                }
                if (checkmudle("23"))
                {
                    DataTable dt = WEB.Items.getlistitembypage("-1", new string[0], "", WEB.Common.mod_service, WEB.Common.Lang, "", "1", 0, 1000, "iid desc");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + dt.Rows[i]["valias"].ToString());
                        writer.WriteEndElement();
                    }

                    dt = WEB.Category.getlistcate(WEB.Common.mod_service, "", "icid asc", "1");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + dt.Rows[i]["valias"].ToString());
                        writer.WriteElementString("changefreq", "always");
                        writer.WriteElementString("priority", "1.0");
                        writer.WriteEndElement();
                    }
                }
                if (checkmudle("24"))
                {
                    DataTable dt = WEB.Items.getlistitembypage("-1", new string[0], "", WEB.Common.mod_videos, WEB.Common.Lang, "", "1", 0, 1000, "iid desc");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + "videos/" + dt.Rows[i]["valias"].ToString());
                        writer.WriteEndElement();
                    }

                    dt = WEB.Category.getlistcate(WEB.Common.mod_videos, "", "icid asc", "1");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + "videos/" + dt.Rows[i]["valias"].ToString());
                        writer.WriteElementString("changefreq", "always");
                        writer.WriteElementString("priority", "1.0");
                        writer.WriteEndElement();
                    }
                }
                if (checkmudle("25"))
                {
                    DataTable dt = WEB.Category.getlistcate(WEB.Common.mod_albums, "", "icid asc", "1");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + "thu-vien-anh/" + dt.Rows[i]["valias"].ToString());
                        writer.WriteElementString("changefreq", "always");
                        writer.WriteElementString("priority", "1.0");
                        writer.WriteEndElement();
                    }
                }
                if (checkmudle("26"))
                {
                    DataTable dt = WEB.Items.getlistitembypage("-1", new string[0], "", WEB.Common.mod_files, WEB.Common.Lang, "", "1", 0, 1000, "iid desc");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + "thu-vien-tai-lieu/" + dt.Rows[i]["valias"].ToString());
                        writer.WriteEndElement();
                    }

                    dt = WEB.Category.getlistcate(WEB.Common.mod_files, "", "icid asc", "1");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + "thu-vien-tai-lieu/" + dt.Rows[i]["valias"].ToString());
                        writer.WriteElementString("changefreq", "always");
                        writer.WriteElementString("priority", "1.0");
                        writer.WriteEndElement();
                    }
                }
                if (checkmudle("55"))
                {
                    DataTable dt = WEB.Items.getlistitembypage("-1", new string[0], "", "FAQ", WEB.Common.Lang, "", "1", 0, 1000, "iid desc");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + "hoi-dap/" + dt.Rows[i]["valias"].ToString());
                        writer.WriteEndElement();
                    }

                    dt = WEB.Category.getlistcate("FAQ", "", "icid asc", "1");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        writer.WriteStartElement("url");
                        writer.WriteElementString("loc", WEB.Common.Weburl + "hoi-dap/" + dt.Rows[i]["valias"].ToString());
                        writer.WriteElementString("changefreq", "always");
                        writer.WriteElementString("priority", "1.0");
                        writer.WriteEndElement();
                    }
                }
                writer.WriteStartElement("url");
                writer.WriteElementString("loc", WEB.Common.Weburl + "lien-he");
                writer.WriteEndElement();
                writer.WriteEndElement();
                writer.WriteEndDocument();
                writer.Flush();
                context.Response.End();
            }
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
    public bool IsReusable {
        get {
            return false;
        }
    }

}