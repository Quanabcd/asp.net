using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class admin_settings_websetting : System.Web.UI.UserControl
{
    public string vlan = WEB.Common.LangAdmin;
    protected void Page_Load(object sender, EventArgs e)
    {

        lttitle.Text = "Cấu hình chung";
        DataTable dt = new DataTable();
        WEB.CategoryOther.getcategorylevel1(ref dt, "-1", "CI", "-1", "-1");
        ddlcity.Items.Clear();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            this.ddlcity.Items.Add(new ListItem( dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
        }

        dt = WEB.Category.getcate("-1", "LAN", "-1", "1", "1");
        dd_lang.Items.Clear();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            this.dd_lang.Items.Add(new ListItem(dt.Rows[i]["vname"].ToString(), dt.Rows[i]["vimg"].ToString()));
        }

        txt_emailqt.Text = WEB.Config.getvaluebykey(WEB.Config.k_comemail, vlan);
        txtcompanyname.Text = WEB.Config.getvaluebykey(WEB.Config.k_companyname, vlan);
        txtphone.Text = WEB.Config.getvaluebykey(WEB.Config.k_comphone, vlan);
        txtaddress.Text = WEB.Config.getvaluebykey(WEB.Config.k_comaddress, vlan);
        txtslogan.Text = WEB.Config.getvaluebykey(WEB.Config.k_slogan, vlan);
        WEB.Common.SetSelectedIndexInDropDownList(ref dd_lang, WEB.Config.getvaluebykey("LANG", vlan));
        WEB.Common.SetSelectedIndexInDropDownList(ref ddlcity, WEB.Config.getvaluebykey(WEB.Config.k_comcity, vlan));
        loadqh(ddlcity.SelectedValue);
        WEB.Common.SetSelectedIndexInDropDownList(ref ddldistrict, WEB.Config.getvaluebykey(WEB.Config.k_comdistrict, vlan));
        WEB.Common.SetSelectedIndexInDropDownList(ref ddlnational, WEB.Config.getvaluebykey(WEB.Config.k_comnational, vlan));
    }
    protected void update_Click(object sender, EventArgs e)
    {
        try
        {
            WEB.Config.updatekey("LANG", "-1", dd_lang.SelectedValue);
            WEB.Config.updatekey(WEB.Config.k_comemail, vlan, txt_emailqt.Text);
            WEB.Config.updatekey(WEB.Config.k_companyname, vlan, txtcompanyname.Text);
            WEB.Config.updatekey(WEB.Config.k_comphone, vlan, txtphone.Text);
            WEB.Config.updatekey(WEB.Config.k_slogan, vlan, txtslogan.Text);
            WEB.Config.updatekey(WEB.Config.k_comaddress, vlan, txtaddress.Text);
            WEB.Config.updatekey(WEB.Config.k_comdistrict, vlan, ddldistrict.SelectedValue);
            WEB.Config.updatekey(WEB.Config.k_comcity, vlan, ddlcity.SelectedValue);
            WEB.Config.updatekey(WEB.Config.k_comnational, vlan, ddlnational.SelectedValue);
            ltdetailmsg.Visible = true;
            ltdetailmsg.Text = "<p style='color: #06f;margin: 0;padding: 12px 15px 0px 15px;font-size: 12px;'>Cập nhật thành công</p>";
        }
        catch {
            ltdetailmsg.Text = "<p style='color: #f00;margin: 0;font-size: 12px;padding: 12px 15px 0px 15px;font-style: italic;'>Cập nhật không thành công</p>";
            ltdetailmsg.Visible = true;
        }
    }
    protected void loadqh(string id)
    {
        try
        {
            ddldistrict.Items.Clear();
            DataTable dt = WEB.CategoryOther.getcate(id, "CI", "-1", "1", "-1");
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    this.ddldistrict.Items.Add(new ListItem(dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
                }
            }
        }
        catch { }
    }
    protected void ddlcity_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadqh(ddlcity.SelectedValue);
    }
}