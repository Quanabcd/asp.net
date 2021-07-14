using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_rooms_untils_u_search_box : System.Web.UI.UserControl
{
    public string dstart = "";
    public string dend = "";
    public int icid = -1;
    public string vlan = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (WEB.Common.Check_number(WEB.Common.GeturlParam("lc")))
        {
            icid = Convert.ToInt32(WEB.Common.GeturlParam("lc"));
        }
        if (WEB.Common.GeturlParam("from").Length > 0)
        {
            dstart = WEB.Common.GeturlParam("from");
        }
        if (WEB.Common.GeturlParam("to").Length > 0)
        {
            dend = WEB.Common.GeturlParam("to");
        }
        if (!IsPostBack)
        {
            loadlocation();
            txtto.Text = dend;
            txtfrom.Text = dstart;
            WEB.Common.SetSelectedIndexInDropDownList(ref ddllocation, icid.ToString());
        }
    }
    protected void btncheck_Click(object sender, EventArgs e)
    {
        Response.Redirect(WEB.Common.Weburl + "booking/check?lc=" + ddllocation.SelectedValue + "&from=" + txtfrom.Text + "&to=" + txtto.Text);
    }
    public void loadlocation()
    {
        DataTable dt = WEB.Category.getcate("-1", "ROM", vlan, "1", "-1");
        ddllocation.Items.Clear();
        ddllocation.Items.Add(new ListItem("Tất cả", "-1"));
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string space = "";
            for (int j = 1; j < Convert.ToInt32(dt.Rows[i]["ilevel"].ToString()); j++)
            {
                space += "..";
            }
            this.ddllocation.Items.Add(new ListItem(space + dt.Rows[i]["vname"].ToString(), dt.Rows[i]["icid"].ToString()));
            space = "";
        }
    }
}