using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_contact_util_default_u_ykkh : System.Web.UI.UserControl
{
    string lang = TN.Common.Lang;
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

        ltcontent.Text = TN.Configs.GetValueByKey(TN.Configs.k_contact_desc, lang);
        lt_maps.Text = TN.Configs.GetValueByKey("KEYBANDO", lang);
        //txtname.Attributes.Add("placeholder", TN.Common.GetLabel("lb_hovatenlienhe", "Họ và tên", lang));
        btnsend.Text = TN.Common.GetLabel("lb_guithontinykien", "Gửi thông tin", lang);
        ltmess.Visible = false;
        //btncancel.Text = TN.Common.GetLabel("lb_huylienhe", "Hủy bỏ", lang);
        Page.Title = TN.Common.GetLabel("lb_lienhe", "Contáctanos", lang);
    }
    protected void btnsend_Click(object sender, EventArgs e)
    {
        try
        {
            string image = "";
            if (this.flupload.FileName.Trim().Length > 0)
            {
                string tempname = System.IO.Path.GetFileName(flupload.PostedFile.FileName);
                string fileextention = "";
                fileextention = System.IO.Path.GetExtension(tempname).ToLower();

                if (fileextention.Equals(".jpg") || fileextention.Equals(".gif") || fileextention.Equals(".bmp") || fileextention.Equals(".png"))
                {
                    if (System.IO.File.Exists(Server.MapPath("~/") + "/uploads/ykienkh/" + tempname) == false)
                        image = tempname;
                    else
                        image = DateTime.Now.Second + "-" + tempname;
                    flupload.SaveAs(Server.MapPath("~/") + "/uploads/ykienkh/" + image);
                }
                else
                {
                    ltmess.Visible = true;
                    ltmess.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Không hỗ trợ ảnh dạng *" + fileextention + ". Chỉ hỗ trợ định dạng *.jpg,*.gif,*.bmp,*.png</p>";
                    return;
                }

            }

            if (txtname.Text.Length == 0)
            {
                ltmess.Text = TN.Common.GetLabel("lb_xinmoinhapdayduthongtin", "Xin mời điền đầy đủ thông tin", lang);
                ltmess.Visible = true;
                return;
            }

            else
            {
                WEB.Items.db_items_insert("-1", "YKH", lang, "", "", txtname.Text, "", "", "", image, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                string email = TN.Configs.GetValueByKey(TN.Configs.k_comemail, lang);
                string content = "<b>Thông tin liên hệ</b><br>";
                content += "Bạn nhận được liên hệ từ website: <a href='" + TN.Common.Weburl + "'>" + TN.Common.Weburl + "</a><br>";
                content += "<b>Họ tên</b> : " + txtname.Text + "<br>";
                content += "<b>Điện thoại</b> : " + txtphone.Text + "<br>";
                //content += "<b>Email</b> : " + txtemail.Text + "<br>";
                content += "<b>Địa chỉ</b> : " + txtaddress.Text + "<br>";
                content += "<b>Tiêu đề liên hệ</b> : " + txttitle.Text + "<br>";
                content += "<b>Nội dung liên hệ</b> : " + txtcontent.Text + "<br>";
                string emailsend = TN.Configs.GetValueByKey(TN.Configs.k_sysemail, lang);
                string a = TN.Common.SendMail(email, emailsend, "", "Thông tin liên hệ từ website: " + TN.Common.Weburl, content);
                ltmess.Text = "<br><span style='color:#06f'>" + TN.Common.GetLabel("lb_thongtinlienhedaduocguithanhcong", "Thông tin liên hệ đã được gửi thành công", lang) + "</span>";
                ltmess.Visible = true;
                txtaddress.Text = "";
                txtcontent.Text = "";
                //txtemail.Text = "";
                txtname.Text = "";
                txtphone.Text = "";
            }
        }
        catch
        {
            ltmess.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật YKKH không thành công</p>";
            ltmess.Visible = true;
        }
    }

}