using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class home_member_until_order : System.Web.UI.UserControl
{
    public int id = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["user"] != null)
            {
                if (WEB.Common.Check_number(WEB.Common.GeturlParam("id")))
                {
                    id = Convert.ToInt32(WEB.Common.GeturlParam("id"));
                }
                if (id != -1)
                    loadcartdetail(id.ToString());
                else
                    loadlist();
            }
            else
                Response.Redirect(WEB.Common.Weburl);
        }
        catch
        {
           // Session["user"] = null;
           // Response.Redirect(WEB.Common.Weburl);
        }

        this.Page.Title = "Danh sách đơn hàng";
    }
    public void loadcartdetail(string id)
    {
        DataTable dt = WEB.Cart.Carts.getitembyid(id);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["vusername"].ToString() == Session["user"].ToString())
            {
                pndetail.Visible = true;
                pnlist.Visible = false;
                ltcode.Text = dt.Rows[0]["vcode"].ToString();
                ltstatus.Text=endablestatus(dt.Rows[0]["istatus"].ToString());
                ltpayment.Text = dt.Rows[0]["vpay"].ToString();
                ltttk.Text = dt.Rows[0]["vcontent"].ToString();
                ltdatetime.Text = Convert.ToDateTime(dt.Rows[0]["dcreate"]).ToString("dd/MM/yyyy HH:mm");
                if (dt.Rows[0]["dcreate"].ToString() != dt.Rows[0]["dupdate"].ToString())
                {
                    ltupdate.Text = WEB.Common.Formatdate(Convert.ToDateTime(dt.Rows[0]["dupdate"].ToString()));
                }
                else
                    ltupdate.Text = "...";
                if (dt.Rows[0]["dcreate"].ToString() != dt.Rows[0]["dtime"].ToString())
                {
                    ltgh.Text = Convert.ToDateTime(dt.Rows[0]["dtime"]).ToString("dd/MM/yyyy");
                   
                }
                else
                    ltgh.Text = "...";
                double pvc = 0;
                try
                {
                    pvc = Convert.ToSingle(dt.Rows[0]["vpr1"]);
                }
                catch { }
                lttotal.Text = WEB.Products.FomatPrice(dt.Rows[0]["fmoney"].ToString(), WEB.Common.Lang);
                double fdiscount = Convert.ToSingle(dt.Rows[0]["fdiscount"]);
                double total = pvc + Convert.ToSingle(dt.Rows[0]["fmoney"]) - fdiscount;
                lttotalvnd.Text = WEB.Products.FomatPrice(total.ToString(), WEB.Common.Lang);
                if (pvc == 0)
                    ltvanchuyen.Text = "Miễn phí";
                else
                    ltvanchuyen.Text = WEB.Products.FomatPrice(pvc.ToString(), WEB.Common.Lang);
                DataTable dtdetail = WEB.Cart.Cartdetail.getlisitem(dt.Rows[0]["icartid"].ToString(), "", "icartdetail asc");
                rpcartdetail.DataSource = dtdetail;
                rpcartdetail.DataBind();
            }
        }
    }
    public void loadlist()
    {
        DataTable dt = WEB.Cart.Carts.getlistitembypage(new string[0], "", "vusername='" + Session["user"].ToString() + "'", 0, 20, "icartid desc");
        if (dt.Rows.Count > 0)
        {
            ltnorecord.Text = "Tổng số đơn hàng: <span style='color: #A52A2A;'>" + dt.Rows.Count.ToString() + "</span>";
            rpitems.DataSource = dt;
            rpitems.DataBind();
        }
        else
            ltnorecord.Text = "Bạn chưa có đơn hàng nào";
    }
    protected void Delete_Load(object sender, System.EventArgs e)
    {
        ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn có muốn xóa không?')";
    }
    public string gettotal(string s, string vc, string dc)
    {
        double pvc = 0;
        try
        {
            pvc = Convert.ToSingle(vc);
        }
        catch { }

        double total = pvc + Convert.ToSingle(s) - Convert.ToSingle(dc);
        return WEB.Products.FomatPrice(total.ToString(),WEB.Common.Lang);
        //ltvanchuyen.Text = WEB.Products.FomatPrice(pvc.ToString());
    }
    public string endablestatus(string str)
    {
        if (str == "0")
        {
            return "Mới đặt";
        }
        else if (str == "1")
        {
            return "Đã giao hàng và thanh toán";
        }
        else if (str == "2")
        {
            return "Đã thanh toán và đang chờ giao hàng";
        }
        else if (str == "3")
        {
            return "Đã thanh toán";
        }
        else if (str == "-3")
        {
            return "Đã hủy";
        }
        return "...";
    }
}