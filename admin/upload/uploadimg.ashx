<%@ WebHandler Language="C#" Class="uploadimg" %>
using System;

using System.Web;



public class uploadimg : IHttpHandler
{

   

    public void ProcessRequest (HttpContext context) {

        HttpPostedFile uploads = context.Request.Files["upload"];

        string CKEditorFuncNum = context.Request["CKEditorFuncNum"];

        string file = System.IO.Path.GetFileName(uploads.FileName);

        uploads.SaveAs(System.Web.HttpContext.Current.Server.MapPath("~/") + "uploads/images/images/" + file);

        string url = "/uploads/images/images/" + file;

        context.Response.Write("<script>window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ", \"" + url + "\");</script>");

        context.Response.End();            

    }

 

    public bool IsReusable {

        get {

            return false;

        }

    }

 

}