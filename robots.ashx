<%@ WebHandler Language="C#" Class="robots" %>

using System;
using System.Web;
using System.Data;
public class robots : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write( WEB.Config.getvaluebykey(WEB.Config.k_robotfile, WEB.Common.Lang));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}