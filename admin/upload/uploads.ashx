<%@ WebHandler Language="C#" Class="uploads" %>

using System;
using System.Web;
using System.Data;
public class uploads : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {

        var request = context.Request;
        var formUpload = request.Files.Count > 0;
        var itype = "1";
        var idtemp = request["idtmp"];
        itype = request["type"];
        var module = request["mod"];
        for (int n = 0; n < request.Files.Count; n++)
        {
        
            string image = context.Request.Files[n].FileName;
            string tempname = System.IO.Path.GetFileName(context.Request.Files[n].FileName);
            string ext = System.IO.Path.GetExtension(tempname).ToLower();
            tempname = WEB.Common.GetNewTitle(tempname.Replace(ext, "")) + ext;
            System.IO.Stream stream = context.Request.Files[n].InputStream;
            if (ext.Equals(".jpg") || ext.Equals(".jpeg") || ext.Equals(".gif") || ext.Equals(".png"))
            {
                if (System.IO.File.Exists(System.Web.HttpContext.Current.Server.MapPath("~/") + "/uploads/products/" + tempname) == false)
                    image = tempname;
                else
                    image = DateTime.Now.Second + "-" + tempname;
                System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(context.Request.Files[n].InputStream);

                int thumbwidth = 0;
                int thumbheight = 0;
                if (WEB.Config.getvaluebykey(WEB.Config.k_imgprdthumbwidth, WEB.Common.LangAdmin).Length > 0)
                    thumbwidth = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgprdthumbwidth, WEB.Common.LangAdmin));
                if (WEB.Config.getvaluebykey(WEB.Config.k_imgprdthumbheight, WEB.Common.LangAdmin).Length > 0)
                    thumbheight = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgprdthumbheight, WEB.Common.LangAdmin));

                System.Drawing.Image objImage = WEB.Common.ScaleImage(bmpPostedImage, ext, thumbwidth, thumbheight);
                if (ext == ".png")
                    objImage.Save(System.Web.HttpContext.Current.Server.MapPath("~/") + "/uploads/products/thumbs/" + image, System.Drawing.Imaging.ImageFormat.Png);
                if (ext == ".jpg" || ext == ".jpeg")
                    objImage.Save(System.Web.HttpContext.Current.Server.MapPath("~/") + "/uploads/products/thumbs/" + image, System.Drawing.Imaging.ImageFormat.Jpeg);
                if (ext == ".gif")
                    objImage.Save(System.Web.HttpContext.Current.Server.MapPath("~/") + "/uploads/products/thumbs/" + image, System.Drawing.Imaging.ImageFormat.Gif);



                int width = 0;
                int height = 0;
                if (WEB.Config.getvaluebykey(WEB.Config.k_imgprdwidth, WEB.Common.LangAdmin).Length > 0)
                    width = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgprdwidth, WEB.Common.LangAdmin));
                if (WEB.Config.getvaluebykey(WEB.Config.k_imgprdheight, WEB.Common.LangAdmin).Length > 0)
                    height = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgprdheight, WEB.Common.LangAdmin));
                System.Drawing.Image oImage = WEB.Common.ScaleImage(bmpPostedImage, ext, width, height);
                if (ext == ".png")
                    oImage.Save(System.Web.HttpContext.Current.Server.MapPath("~/") + "/uploads/products/" + image, System.Drawing.Imaging.ImageFormat.Png);
                if (ext == ".jpg" || ext == ".jpeg")
                    oImage.Save(System.Web.HttpContext.Current.Server.MapPath("~/") + "/uploads/products/" + image, System.Drawing.Imaging.ImageFormat.Jpeg);
                if (ext == ".gif")
                    oImage.Save(System.Web.HttpContext.Current.Server.MapPath("~/") + "/uploads/products/" + image, System.Drawing.Imaging.ImageFormat.Gif);
                context.Response.ContentType = "text/plain";
                string jsonresult = image;
                context.Response.Write(jsonresult);
            }
            else
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("");
            }
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}