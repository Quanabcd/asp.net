using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RestartWebApplication();
        Response.Redirect(WEB.Common.Weburl);
    }
public static bool RestartWebApplication()

        {
       
            //bool Error = false;

            //try

            //{

            //    // *** This requires full trust so this will fail

            //    // *** in many scenarios

            //    HttpRuntime.UnloadAppDomain();

            //}

            //catch

            //{

            //    Error = true;

            //}



            //if (!Error)

            //    return true;



            // *** Couldn't unload with Runtime - let's try modifying web.config

            string ConfigPath = HttpContext.Current.Request.PhysicalApplicationPath + "\\web.config";

            try

            {

                File.SetLastWriteTimeUtc(ConfigPath, DateTime.UtcNow);

            }

            catch

            {

                return false;

            }



            return true;

        }
}