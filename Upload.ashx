<%@ WebHandler Language="C#" Class="upload" %>

using System;
using System.Web;
using System.Data;
public class upload : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
       
        var request = context.Request;
        var formUpload = request.Files.Count > 0;
        var itype = "1";
        var idtemp = request["idtmp"];
        itype = request["type"];
        var module = request["mod"];
        for (int n = 0; n < request.Files.Count; n++)
        {
            HttpPostedFile uploadedfile = context.Request.Files[n];
            string FileName = uploadedfile.FileName;
            string FileType = uploadedfile.ContentType;
            double FileSize = Math.Round( uploadedfile.ContentLength / 1024000.0, 3); 
            string Fileurl = "#";
            string ext = System.IO.Path.GetExtension(context.Request.Files[n].FileName);
            string tick = DateTime.Now.Ticks.ToString();
            string image = context.Request.Files[n].FileName;
            string imgtemp = tick + ext;
            System.IO.Stream stream = context.Request.Files[n].InputStream;
            //uploadedfile.SaveAs(System.Web.HttpContext.Current.Server.MapPath("~/") + "/uploads/products/relative/" + imgtemp);

            System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(context.Request.Files[n].InputStream);
            int thumbwidth = 0;
            int thumbheight = 0;
            if (WEB.Config.getvaluebykey(WEB.Config.k_imgprdthumbwidth, WEB.Common.LangAdmin).Length > 0)
                thumbwidth = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgprdthumbwidth, WEB.Common.LangAdmin));
            if (WEB.Config.getvaluebykey(WEB.Config.k_imgprdthumbheight, WEB.Common.LangAdmin).Length > 0)
                thumbheight = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgprdthumbheight, WEB.Common.LangAdmin));

            System.Drawing.Image objImage = WEB.Common.ScaleImage(bmpPostedImage, ext, thumbwidth, thumbheight);
          

            if (ext == ".png")
                objImage.Save(System.Web.HttpContext.Current.Server.MapPath("~/") + "/uploads/products/relative/thumbs/" + imgtemp, System.Drawing.Imaging.ImageFormat.Png);
            if (ext == ".jpg" || ext == ".jpeg")
                objImage.Save(System.Web.HttpContext.Current.Server.MapPath("~/") + "/uploads/products/relative/thumbs/" + imgtemp, System.Drawing.Imaging.ImageFormat.Jpeg);
            if (ext == ".gif")
                objImage.Save(System.Web.HttpContext.Current.Server.MapPath("~/") + "/uploads/products/relative/thumbs/" + imgtemp, System.Drawing.Imaging.ImageFormat.Gif);

              
            //flupload.SaveAs(Server.MapPath("~/") + "/uploads/products/" + image);


            int width = 0;
            int height = 0;
            if (WEB.Config.getvaluebykey(WEB.Config.k_imgprdwidth, WEB.Common.LangAdmin).Length > 0)
                width = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgprdwidth, WEB.Common.LangAdmin));
            if (WEB.Config.getvaluebykey(WEB.Config.k_imgprdheight, WEB.Common.LangAdmin).Length > 0)
                height = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgprdheight, WEB.Common.LangAdmin));
            System.Drawing.Image oImage = WEB.Common.ScaleImage(bmpPostedImage, ext, width, height);
            if (ext == ".png")
                oImage.Save(System.Web.HttpContext.Current.Server.MapPath("~/") + "/uploads/products/relative/" + imgtemp, System.Drawing.Imaging.ImageFormat.Png);
            if (ext == ".jpg" || ext == ".jpeg")
                oImage.Save(System.Web.HttpContext.Current.Server.MapPath("~/") + "/uploads/products/relative/" + imgtemp, System.Drawing.Imaging.ImageFormat.Jpeg);
            if (ext == ".gif")
                oImage.Save(System.Web.HttpContext.Current.Server.MapPath("~/") + "/uploads/products/relative/" + imgtemp, System.Drawing.Imaging.ImageFormat.Gif);

            
            stream.Close();
            //string[] sf = { 
            //                 "iid"
            //                  ,"vcode"
            //                  ,"vlan"
            //                  ,"vtitle"
            //                  ,"istatus"
            //              };
            //object[] sva = { 
            //                 idtemp
            //                ,module
            //                ,WEB.Common.Lang
            //                  ,imgtemp
            //                 ,1
            //              };
            //int ino = WEB.Item_other.save(-1, sf, sva);
            context.Response.ContentType = "text/plain";
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            string jsonresult = serializer.Serialize(new { success = "true", fn = imgtemp, id = -1 });
            context.Response.Write(jsonresult);
           
        }

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}