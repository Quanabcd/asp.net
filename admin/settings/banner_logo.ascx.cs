using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_settings_banner_logo : System.Web.UI.UserControl
{
    public string vlan = WEB.Common.LangAdmin;
    public string weburl = WEB.Common.Weburl;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
            _FileBrowser.BasePath = "../ckfinder";
            _FileBrowser.SetupCKEditor(txtcontent);
            lttitle.Text = "Banner & Logo - Chân trang";
            updatelist();
        }
    }
  protected  void updatelist()
    {
        hdadvs_old.Value = WEB.Config.getvaluebykey(WEB.Config.k_webbanner, vlan);
       hdbackground.Value = WEB.Config.getvaluebykey(WEB.Config.k_webbannermobile, vlan);
       if (hdbackground.Value.Length > 0)
       {
           ltbackground.Text = "<img height='80' style='max-width:600px' src='" + weburl + "uploads/banners/" + hdbackground.Value + "'>";
       }
        if (hdadvs_old.Value.Length > 0)
        {
          
                ltbanner.Text = "<img height='100' style='max-width:600px' src='" + weburl + "uploads/banners/" + hdadvs_old.Value + "'>";
           
            hdfavicon.Value = WEB.Config.getvaluebykey(WEB.Config.k_webfavicon, vlan);
        }
        if (hdfavicon.Value.Length>0)
        {
            ltfavicon.Text = "<img height='30' style='max-width:600px' src='" + weburl + "uploads/banners/" + hdfavicon.Value + "'>";
        }
        txtcontent.Text = WEB.Config.getvaluebykey(WEB.Config.k_webfooter, vlan);
    }
    protected void update_Click(object sender, EventArgs e)
    {
        try
        {
            string image = "";
            if (this.flupload.FileName.Trim().Length > 0)
            {
                string tempname = System.IO.Path.GetFileName(flupload.PostedFile.FileName);
                string fileextention = "";
                fileextention = System.IO.Path.GetExtension(tempname).ToLower();
                tempname = WEB.Common.GetNewTitle(tempname.Replace(fileextention, "")) + fileextention;
                if (fileextention.Equals(".jpg") || fileextention.Equals(".gif") || fileextention.Equals(".jpeg") || fileextention.Equals(".png"))
                {
                    if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/banners/" + tempname) == false)
                        image = tempname;
                    else
                        image = DateTime.Now.Second + "-" + tempname;

                    System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(flupload.PostedFile.InputStream);

                    int thumbwidth = 0;
                    int thumbheight = 0;
                    if (WEB.Config.getvaluebykey(WEB.Config.k_imgbannerwidth, vlan).Length > 0)
                        thumbwidth = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgbannerwidth, vlan));
                    if (WEB.Config.getvaluebykey(WEB.Config.k_imgbannerheight, vlan).Length > 0)
                        thumbheight = Convert.ToInt32(WEB.Config.getvaluebykey(WEB.Config.k_imgbannerheight, vlan));

                    System.Drawing.Image objImage = WEB.Common.ScaleImage(bmpPostedImage, fileextention, thumbwidth, thumbheight);
                    if (fileextention == ".png")
                        objImage.Save(Server.MapPath("~/") + "/uploads/banners/" + image, System.Drawing.Imaging.ImageFormat.Png);
                    if (fileextention == ".jpg" || fileextention == ".jpeg")
                        objImage.Save(Server.MapPath("~/") + "/uploads/banners/" + image, System.Drawing.Imaging.ImageFormat.Jpeg);
                    if (fileextention == ".gif")
                        objImage.Save(Server.MapPath("~/") + "/uploads/banners/" + image, System.Drawing.Imaging.ImageFormat.Gif);
                    WEB.Config.updatekey(WEB.Config.k_webbanner, vlan, image);
                }
                else
                {
                    ltdetailmsg.Visible = true;
                    ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;font-style: italic;'>Không hỗ trợ định dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.jpeg,*.png</p>";
                    return;
                }

            }
            string favicon = "";
            if (this.flfavicon.FileName.Trim().Length > 0)
            {
                string tempname = System.IO.Path.GetFileName(flfavicon.PostedFile.FileName);
                string fileextention = "";
                fileextention = System.IO.Path.GetExtension(tempname).ToLower();
                tempname = WEB.Common.GetNewTitle(tempname.Replace(fileextention, "")) + fileextention;
                if (fileextention.Equals(".jpg") || fileextention.Equals(".gif") || fileextention.Equals(".jpeg") || fileextention.Equals(".png"))
                {
                    if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/banners/" + tempname) == false)
                        favicon = tempname;
                    else
                        favicon = DateTime.Now.Second + "-" + tempname;
                    System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(flfavicon.PostedFile.InputStream);
                    System.Drawing.Image objImage = WEB.Common.ScaleImage(bmpPostedImage, fileextention, 32, 32);
                    if (fileextention == ".png")
                        objImage.Save(Server.MapPath("~/") + "/uploads/banners/" + favicon, System.Drawing.Imaging.ImageFormat.Png);
                    if (fileextention == ".jpg" || fileextention == ".jpeg")
                        objImage.Save(Server.MapPath("~/") + "/uploads/banners/" + favicon, System.Drawing.Imaging.ImageFormat.Jpeg);
                    if (fileextention == ".gif")
                        objImage.Save(Server.MapPath("~/") + "/uploads/banners/" + favicon, System.Drawing.Imaging.ImageFormat.Gif);
                    WEB.Config.updatekey(WEB.Config.k_webfavicon, vlan, favicon);
                }
                else
                {
                    ltdetailmsg.Visible = true;
                    ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;font-style: italic;'>Không hỗ trợ định dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.jpeg,*.png</p>";
                    return;
                }

            }

            string bannermobile = "";
            if (this.flbackground.FileName.Trim().Length > 0)
            {
                string tempname = System.IO.Path.GetFileName(flbackground.PostedFile.FileName);
                string fileextention = "";
                fileextention = System.IO.Path.GetExtension(tempname).ToLower();
                tempname = WEB.Common.GetNewTitle(tempname.Replace(fileextention, "")) + fileextention;
                if (fileextention.Equals(".jpg") || fileextention.Equals(".gif") || fileextention.Equals(".jpeg") || fileextention.Equals(".png"))
                {
                    if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/banners/" + tempname) == false)
                        bannermobile = tempname;
                    else
                        bannermobile = DateTime.Now.Second + "-" + tempname;

                    System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(flbackground.PostedFile.InputStream);
                    System.Drawing.Image objImage = WEB.Common.ScaleImage(bmpPostedImage, fileextention, 0, 60);
                    if (fileextention == ".png")
                        objImage.Save(Server.MapPath("~/") + "/uploads/banners/" + bannermobile, System.Drawing.Imaging.ImageFormat.Png);
                    if (fileextention == ".jpg" || fileextention == ".jpeg")
                        objImage.Save(Server.MapPath("~/") + "/uploads/banners/" + bannermobile, System.Drawing.Imaging.ImageFormat.Jpeg);
                    if (fileextention == ".gif")
                        objImage.Save(Server.MapPath("~/") + "/uploads/banners/" + bannermobile, System.Drawing.Imaging.ImageFormat.Gif);
                    WEB.Config.updatekey(WEB.Config.k_webbannermobile, vlan, bannermobile);
                }
                else
                {
                    ltdetailmsg.Visible = true;
                    ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;font-style: italic;'>Không hỗ trợ định dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.jpeg,*.png</p>";
                    return;
                }

            }
            try
            {
                //xóa ảnh cũ
                if (image == "")
                    image = hdadvs_old.Value;
                else
                {
                    try
                    {
                        System.IO.File.Delete(Server.MapPath("~/") + "uploads/banners/" + hdadvs_old.Value);
                    }
                    catch
                    {
                    }
                }

            }
            catch
            {
                ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;font-style: italic;'>Cập nhật không thành công</p>";
                ltdetailmsg.Visible = true;
            }
            WEB.Config.updatekey(WEB.Config.k_webfooter, vlan, txtcontent.Text);
            ltdetailmsg.Text = "<p style='color: #06f;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật thành công</p>";
            updatelist();
        }
        catch { }
    }
    
}