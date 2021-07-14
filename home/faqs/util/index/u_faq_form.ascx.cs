using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class home_contact_u_faq_form : System.Web.UI.UserControl
{
    string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        txtname.Attributes.Add("placeholder", TN.Common.GetLabel("lb_hoten", "Họ tên", lang));
        txtphone.Attributes.Add("placeholder", TN.Common.GetLabel("lb_sodienthoai", "Số điện thoại", lang));
        txtcontent.Attributes.Add("placeholder", TN.Common.GetLabel("lb_noidungcauhoi", "Nội dung câu hỏi", lang));
        btnsend.Text = TN.Common.GetLabel("lb_guicauhoi", "Gửi câu hỏi", lang);
    }
    protected void btnsend_Click(object sender, EventArgs e)
    {
        if ( txtname.Text.Length == 0 || txtcontent.Text.Length == 0)
        {
            ltmess.Text = WEB.Common.Getlabel("lb_xinmoidiendayduthongtin", "Xin mời điền đầy đủ thông tin", lang);
            ltmess.Visible = true;
            return;
        }

        else
        {
            WEB.Items.db_items_insert("-1", "FAQ", lang, "","",txtname.Text, "", txtcontent.Text,"", "",-1, "", "0", "0", DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.AddYears(10).ToString("MM/dd/yyyy hh:mm:ss tt"), "0", "0","", "", "", "", "", "", txtemail.Text,txtname.Text, txtphone.Text, "", "", "", "", "", "", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0");
            string email = WEB.Config.getvaluebykey(WEB.Config.k_comemail, lang);
            string content = "<b>Thông tin hỏi đáp</b><br>";
            content += "Bạn nhận được hỏi đáp từ website: <a href='" + WEB.Common.Weburl + "'>" + WEB.Common.Weburl + "</a><br>";
            content += "<b>Họ tên</b> : " + txtname.Text + "<br>";
            content += "<b>Điện thoại</b> : " + txtphone.Text + "<br>";
            content += "<b>Email</b> : " + txtemail.Text + "<br>";
          
            content += "<b>Nội dung câu hỏi</b> : " + txtcontent.Text + "<br>";
            string emailsend = WEB.Config.getvaluebykey(WEB.Config.k_sysemail, lang);
            
                WEB.Common.SendMail(email, emailsend, "", "Thông tin hỏi đáp từ website: " + WEB.Common.Weburl, content);
                ltmess.Text = "<br><span style='color:#06f'>" + WEB.Common.Getlabel("lb_thongtinhoidapdaduocguithanhcong", "Thông tin hỏi đáp đã được gửi thành công", lang) + "</span>";
                ltmess.Visible = true;
              
                txtcontent.Text = "";
                txtemail.Text = "";
                txtname.Text = "";
                txtphone.Text = "";

          
        }
    }
  
}