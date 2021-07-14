<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_orders.ascx.cs" Inherits="home_cart_default_success" %>
<link href="/templates/home/css/check_out.css" rel="stylesheet" type="text/css" />
<div class="checkout-complete col-12 ">
    <div class="box-complete">
        <h3>Mã đơn hàng của bạn: <strong><asp:Literal ID="ltordercode" runat="server"></asp:Literal></strong></h3>
        <label>Bạn vừa mua:</label>
        <div class="cart-items">
            <asp:Repeater ID="rpitems" runat="server">
                <ItemTemplate>
                    <div class="cart-item">
                        <img alt="<%#Eval("vtitle") %>" class="image_thumb" src="<%#weburl %>/uploads/products/<%#Eval("vimg") %>">
                        <b><%#Eval("inumber") %> x</b>
                        <span><%#Eval("vtitle") %></span>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            

            <div class="payment_methol">
                <p>
                    <b>Giá trị đơn hàng:</b>
                    <span><asp:Literal ID="ltmoney" runat="server"></asp:Literal></span>
                </p>

               

                <p>
                    <b>Phí vận chuyển:</b>
                    <span><asp:Literal ID="ltshipping" runat="server"></asp:Literal></span>
                </p>
                 <p runat="server" id="pcoupon">
                    <b>Khuyến mại (giảm):</b>
                    <span><asp:Literal ID="ltcoupon" runat="server"></asp:Literal></span>
                </p>
                <p>
                    <b>Tổng cộng:</b>
                    <span class="totalpayment"><asp:Literal ID="lttotal" runat="server"></asp:Literal></span>
                </p>
                <p>
                    <b>Phương thức thanh toán:</b>
                    <span><asp:Literal ID="ltpayment" runat="server"></asp:Literal></span>
                </p>
                <p>
                </p>
            </div>
        </div>
        <p>Cảm ơn bạn đã mua hàng tại: <asp:Literal ID="ltweb" runat="server"></asp:Literal></p>

    </div>
</div>
