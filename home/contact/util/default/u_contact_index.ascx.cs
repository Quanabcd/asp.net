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

public partial class home_contact_u_contact_index : System.Web.UI.UserControl
{
    public string lang = WEB.Common.Lang;
    DataTable dt = new DataTable(); //get ra tat ca danh mục
    protected void Page_Load(object sender, EventArgs e)
    {

        ltcontent.Text = TN.Configs.GetValueByKey(TN.Configs.k_contact_desc, lang);
        lt_maps.Text = TN.Configs.GetValueByKey("KEYBANDO", lang);
        //txtname.Attributes.Add("placeholder", TN.Common.GetLabel("lb_hovatenlienhe", "Họ và tên", lang));
        btnsend.Text = TN.Common.GetLabel("lb_guilienhe", "Enviar contacto", lang);
        ltmess.Visible = false;
        btncancel.Text = TN.Common.GetLabel("lb_huylienhe", "Hủy bỏ", lang);
        Page.Title = TN.Common.GetLabel("lb_lienhe", "Contáctanos", lang);
    }
    
    protected void btnsend_Click(object sender, EventArgs e)
    {
        if (txtemail.Text.Length == 0 || txtname.Text.Length == 0 || txtphone.Text.Length == 0 || txtcontent.Text.Length == 0)
        {
            ltmess.Text = TN.Common.GetLabel("lb_xinmoinhapdayduthongtin", "Xin mời điền đầy đủ thông tin", lang);
            ltmess.Visible = true;
            return;
        }

        else
        {
            WEB.Item_other.db_items_other_insert("-1", TN.Common.mod_contacts, lang, txtname.Text, txttitle.Text, txtcontent.Text, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), "0", "0", "0", txtemail.Text, txtphone.Text, txtaddress.Text, "", "", "0", "0");
            string email = TN.Configs.GetValueByKey(TN.Configs.k_comemail, lang);
            string content = "<b>Thông tin liên hệ</b><br>";
            content += "Bạn nhận được liên hệ từ website: <a href='" + TN.Common.Weburl + "'>" + TN.Common.Weburl + "</a><br>";
            content += "<b>Họ tên</b> : " + txtname.Text + "<br>";
            content += "<b>Điện thoại</b> : " + txtphone.Text + "<br>";
            content += "<b>Email</b> : " + txtemail.Text + "<br>";
            content += "<b>Địa chỉ</b> : " + txtaddress.Text + "<br>";
            content += "<b>Tiêu đề liên hệ</b> : " + txttitle.Text + "<br>";
            content += "<b>Nội dung liên hệ</b> : " + txtcontent.Text + "<br>";
            string emailsend = TN.Configs.GetValueByKey(TN.Configs.k_sysemail, lang);
            string a = TN.Common.SendMail(email, emailsend, "", "Thông tin liên hệ từ website: " + TN.Common.Weburl, content);
            ltmess.Text = "<br><span style='color:#06f'>" + TN.Common.GetLabel("lb_thongtinlienhedaduocguithanhcong", "Thông tin liên hệ đã được gửi thành công", lang) + "</span>";
            ltmess.Visible = true;
            txtaddress.Text = "";
            txtcontent.Text = "";
            txtemail.Text = "";
            txtname.Text = "";
            txtphone.Text = "";
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        txtaddress.Text = "";
        txtcontent.Text = "";
        txtemail.Text = "";
        txtname.Text = "";
        txtphone.Text = "";
    }
}