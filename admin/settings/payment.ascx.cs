using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class admin_settings_payment : System.Web.UI.UserControl
{
    public string lang = WEB.Common.LangAdmin;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
            _FileBrowser.BasePath = "../ckfinder";
            _FileBrowser.SetupCKEditor(txtdescbank);

            CKFinder.FileBrowser _FileBrowser1 = new CKFinder.FileBrowser();
            _FileBrowser1.BasePath = "../ckfinder";
            _FileBrowser1.SetupCKEditor(txtdescdirect);

            CKFinder.FileBrowser _FileBrowser2 = new CKFinder.FileBrowser();
            _FileBrowser2.BasePath = "../ckfinder";
            _FileBrowser2.SetupCKEditor(txtdesccod);


            CKFinder.FileBrowser _FileBrowser3 = new CKFinder.FileBrowser();
            _FileBrowser3.BasePath = "../ckfinder";
            _FileBrowser3.SetupCKEditor(txtdesconepay);

            CKFinder.FileBrowser _FileBrowser4 = new CKFinder.FileBrowser();
            _FileBrowser4.BasePath = "../ckfinder";
            _FileBrowser4.SetupCKEditor(txtdesconepayqt);

            Page.Title = "Cấu hình thanh toán";
            lttitle.Text = "Cấu hình thanh toán";
            load();
        }
    }
    public void load()
    {
        DataTable dt = WEB.CategoryOther.getcate("-1", "PM", lang, "1", "-1");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["valias"].ToString() == "PAYMENTDIRECT")
                {
                    hdiciddirect.Value = dt.Rows[i]["icid"].ToString();
                    txtnamedirect.Text = dt.Rows[i]["vname"].ToString();
                    txtdescdirect.Text = dt.Rows[i]["vdesc"].ToString();
                    if (dt.Rows[i]["istatus"].ToString() == "1")
                        chkstatusdirect.Checked = true;
                    else
                        chkstatusdirect.Checked = false;
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTBANK")
                {
                    hdicidbank.Value = dt.Rows[i]["icid"].ToString();
                    txtnamebank.Text = dt.Rows[i]["vname"].ToString();
                    txtdescbank.Text = dt.Rows[i]["vdesc"].ToString();
                    if (dt.Rows[i]["istatus"].ToString() == "1")
                        chkstatusbank.Checked = true;
                    else
                        chkstatusbank.Checked = false;
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTCOD")
                {
                    hdicidcod.Value = dt.Rows[i]["icid"].ToString();
                    txtnamecod.Text = dt.Rows[i]["vname"].ToString();
                    txtdesccod.Text = dt.Rows[i]["vdesc"].ToString();
                    if (dt.Rows[i]["istatus"].ToString() == "1")
                        chkstatuscod.Checked = true;
                    else
                        chkstatuscod.Checked = false;
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTBK")
                {
                    hdicidbk.Value = dt.Rows[i]["icid"].ToString();
                    txtnamebk.Text = dt.Rows[i]["vname"].ToString();
                    txtdescbk.Text = dt.Rows[i]["vdesc"].ToString();
                    txtmerchantidbk.Text = dt.Rows[i]["vimg"].ToString();
                    txtreceiverbk.Text = dt.Rows[i]["vicon"].ToString();
                    txtsecurepassbk.Text = dt.Rows[i]["vparam1"].ToString();
                    txtverifycodebk.Text = dt.Rows[i]["vparam2"].ToString();
                    if (dt.Rows[i]["istatus"].ToString() == "1")
                        chkstatusbk.Checked = true;
                    else
                        chkstatusbk.Checked = false;
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTNL")
                {
                    hdicidnl.Value = dt.Rows[i]["icid"].ToString();
                    txtnamenl.Text = dt.Rows[i]["vname"].ToString();
                    txtdescnl.Text = dt.Rows[i]["vdesc"].ToString();
                    txtmerchantidnl.Text = dt.Rows[i]["vimg"].ToString();
                    txtreceivernl.Text = dt.Rows[i]["vicon"].ToString();
                    txtsecurepassnl.Text = dt.Rows[i]["vparam1"].ToString();
                    txtverifycodenl.Text = dt.Rows[i]["vparam2"].ToString();
                    if (dt.Rows[i]["istatus"].ToString() == "1")
                        chkstatusnl.Checked = true;
                    else
                        chkstatusnl.Checked = false;
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTPAYPAL")
                {
                    hdicidpp.Value = dt.Rows[i]["icid"].ToString();
                    txtnamepaypal.Text = dt.Rows[i]["vname"].ToString();
                    txtdescpaypal.Text = dt.Rows[i]["vdesc"].ToString();
                     txtmerchantidpaypal.Text= dt.Rows[i]["vimg"].ToString();
                   txtsenderpaypal.Text = dt.Rows[i]["vicon"].ToString();
                    txtpasspaypal.Text = dt.Rows[i]["vparam1"].ToString();
                   txtsignturepasspaypal.Text = dt.Rows[i]["vparam2"].ToString();
                   txtexchangeratevndtousd.Text = dt.Rows[i]["vparam3"].ToString();
                   if (dt.Rows[i]["istatus"].ToString() == "1")
                        chkstatuspaypal.Checked = true;
                    else
                        chkstatuspaypal.Checked = false;
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTONEPAY")
                {
                    hdicidop.Value = dt.Rows[i]["icid"].ToString();
                    txtnameonepay.Text = dt.Rows[i]["vname"].ToString();
                    txtdesconepay.Text = dt.Rows[i]["vdesc"].ToString();
                    txtmerchantop.Text = dt.Rows[i]["vimg"].ToString();
                    txthashcodeop.Text = dt.Rows[i]["vicon"].ToString();
                    txtaccesscodeop.Text = dt.Rows[i]["vparam1"].ToString();
                    if (dt.Rows[i]["istatus"].ToString() == "1")
                        chkstatusonepay.Checked = true;
                    else
                        chkstatusonepay.Checked = false;
                }
                else if (dt.Rows[i]["valias"].ToString() == "PAYMENTONEPAYQT")
                {
                    hdicidopqt.Value = dt.Rows[i]["icid"].ToString();
                    txtnameonepayqt.Text = dt.Rows[i]["vname"].ToString();
                    txtdesconepayqt.Text = dt.Rows[i]["vdesc"].ToString();
                    txtmerchantopqt.Text = dt.Rows[i]["vimg"].ToString();
                    txthashcodeopqt.Text = dt.Rows[i]["vicon"].ToString();
                    txtaccesscodeopqt.Text = dt.Rows[i]["vparam1"].ToString();
                    if (dt.Rows[i]["istatus"].ToString() == "1")
                        chkstatusonepayqt.Checked = true;
                    else
                        chkstatusonepayqt.Checked = false;
                }
            }
        }
    }
    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        string statusdirect = "0";
        if (chkstatusdirect.Checked == true)
        {
            statusdirect = "1";
            if (txtnamedirect.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tên phương thức</p>";
                ltdetailmsg.Visible = true;
                txtnamedirect.Focus();
                return;
            }
        }
        string statusbank = "0";
        if (chkstatusbank.Checked == true)
        {
            statusbank = "1";
            if (txtnamebank.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tên phương thức</p>";
                ltdetailmsg.Visible = true;
                txtnamebank.Focus();
                return;
            }
        }
       string  statuscod = "0";
        if (chkstatuscod.Checked == true)
        {
            statuscod = "1";
            if (txtnamecod.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tên phương thức</p>";
                ltdetailmsg.Visible = true;
                txtnamecod.Focus();
                return;
            }
        }
        string statusbk= "0";
        if (chkstatusbk.Checked == true)
        {
            statusbk = "1";
            if (txtnamebk.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tên phương thức</p>";
                ltdetailmsg.Visible = true;
                txtnamebk.Focus();
                return;
            }
        }
        string statusnl = "0";
        if (chkstatusnl.Checked == true)
        {
            statusnl = "1";
            if (txtnamenl.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tên phương thức</p>";
                ltdetailmsg.Visible = true;
                txtnamenl.Focus();
                return;
            }
        }
        string statuspp = "0";
        if (chkstatuspaypal.Checked == true)
        {
            statuspp = "1";
            if (txtnamepaypal.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tên phương thức</p>";
                ltdetailmsg.Visible = true;
                txtnamepaypal.Focus();
                return;
            }
            if(WEB.Common.Check_number(txtexchangeratevndtousd.Text)==false)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Tỉ giá phải là số</p>";
                ltdetailmsg.Visible = true;
                txtexchangeratevndtousd.Focus();
                return;
            }
        }
        string statusop = "0";
        if (chkstatusonepay.Checked == true)
        {
            statusop = "1";
            if (txtnameonepay.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tên phương thức</p>";
                ltdetailmsg.Visible = true;
                txtnameonepay.Focus();
                return;
            }
        }
        string statusopqt = "0";
        if (chkstatusonepayqt.Checked == true)
        {
            statusopqt = "1";
            if (txtnameonepayqt.Text.Length == 0)
            {
                ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Xin mời nhập tên phương thức</p>";
                ltdetailmsg.Visible = true;
                txtnameonepayqt.Focus();
                return;
            }
        }
        //save
        try
        {
            string[] s1 = { "vname", "ccode", "vlan", "vdesc", "valias", "istatus" };
            object[] v1 = { txtnamedirect.Text, "PM", lang, txtdescdirect.Text, "PAYMENTDIRECT", statusdirect };
            WEB.CategoryOther.save(Convert.ToInt32(hdiciddirect.Value), s1, v1);

            string[] s2 = { "vname", "ccode", "vlan", "vdesc", "valias", "istatus" };
            object[] v2 = { txtnamebank.Text, "PM", lang, txtdescbank.Text, "PAYMENTBANK", statusbank };
            WEB.CategoryOther.save(Convert.ToInt32(hdicidbank.Value), s2, v2);

            string[] s3 = { "vname", "ccode", "vlan", "vdesc", "valias", "istatus" };
            object[] v3 = { txtnamecod.Text, "PM", lang, txtdesccod.Text, "PAYMENTCOD", statuscod };
            WEB.CategoryOther.save(Convert.ToInt32(hdicidcod.Value), s3, v3);

            string[] s4 = { "vname", "ccode", "vlan", "vdesc", "valias", "istatus", "vimg", "vicon", "vparam1", "vparam2" };
            object[] v4 = { txtnamebk.Text, "PM", lang, txtdescbk.Text, "PAYMENTBK", statusbk, txtmerchantidbk.Text, txtreceiverbk.Text, txtsecurepassbk.Text, txtverifycodebk.Text };
            WEB.CategoryOther.save(Convert.ToInt32(hdicidbk.Value), s4, v4);

            string[] s5 = { "vname", "ccode", "vlan", "vdesc", "valias", "istatus", "vimg", "vicon", "vparam1", "vparam2" };
            object[] v5 = { txtnamenl.Text, "PM", lang, txtdescnl.Text, "PAYMENTNL", statusnl, txtmerchantidnl.Text, txtreceivernl.Text, txtsecurepassnl.Text, txtverifycodenl.Text };
            WEB.CategoryOther.save(Convert.ToInt32(hdicidnl.Value), s5, v5);

            string[] s6 = { "vname", "ccode", "vlan", "vdesc", "valias", "istatus", "vimg", "vicon", "vparam1", "vparam2", "vparam3" };
            object[] v6 = { txtnamepaypal.Text, "PM", lang, txtdescpaypal.Text, "PAYMENTPAYPAL", statuspp, txtmerchantidpaypal.Text, txtsenderpaypal.Text, txtpasspaypal.Text, txtsignturepasspaypal.Text, txtexchangeratevndtousd.Text };
            WEB.CategoryOther.save(Convert.ToInt32(hdicidpp.Value), s6, v6);

            string[] s7 = { "vname", "ccode", "vlan", "vdesc", "valias", "istatus", "vimg", "vicon", "vparam1" };
            object[] v7 = { txtnameonepay.Text, "PM", lang, txtdesconepay.Text, "PAYMENTONEPAY", statusop, txtmerchantop.Text, txthashcodeop.Text, txtaccesscodeop.Text };
            WEB.CategoryOther.save(Convert.ToInt32(hdicidop.Value), s7, v7);

            string[] s8 = { "vname", "ccode", "vlan", "vdesc", "valias", "istatus", "vimg", "vicon", "vparam1" };
            object[] v8 = { txtnameonepayqt.Text, "PM", lang, txtdesconepayqt.Text, "PAYMENTONEPAYQT", statusopqt, txtmerchantopqt.Text, txthashcodeopqt.Text, txtaccesscodeopqt.Text };
            WEB.CategoryOther.save(Convert.ToInt32(hdicidopqt.Value), s8, v8);

            ltdetailmsg.Text = "<p style='color: #06f;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật thành công</p>";
            ltdetailmsg.Visible = true;
        }
        catch
        {
            ltdetailmsg.Text = "<p class='merror' style='color: #f00;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật không thành công</p>";
            ltdetailmsg.Visible = true;
        }
    }
}