<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_checkout.ascx.cs" Inherits="home_cart_default_u_checkout" %>
<link href="/templates/home/css/check_out.css" rel="stylesheet" type="text/css" />
<div class="container clearfix checkout new_order ">


    <div class="col-4 step1">
        <h2>Thông tin giao hàng</h2>
       
            <asp:Literal ID="ltaccount" runat="server"></asp:Literal>
        <div class="line"></div>
        <div class="form-info">
            <asp:Literal ID="ltmessnoaccount" runat="server"></asp:Literal>
                <div class="form-group">
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtname" runat="server" Placeholder="Họ và tên" CssClass="formcontrol"></asp:TextBox>                  
                </div>



                <div class="form-group">
                    <asp:TextBox ID="txtphone" MaxLength="11" runat="server" required Placeholder="Điện thoại" CssClass="formcontrol"></asp:TextBox>                  

                </div>


                <div class="form-group">
                     <asp:TextBox ID="txtemail" runat="server" Placeholder="Email" CssClass="formcontrol"></asp:TextBox>                  

                </div>


                <div class="form-group">
                     <asp:TextBox ID="txtaddress" MaxLength="11" runat="server" Placeholder="Địa chỉ" CssClass="formcontrol"></asp:TextBox>                  
                </div>

                <div class="form-group ctrl-city">
                    <div class="custom-dropdown">
                        <asp:DropDownList ID="ddlcity" runat="server" required CssClass="formcontrol valid"></asp:DropDownList>
                    </div>
                </div>

                <div class="form-group ctrl-district" id="shipping_district_container">
                    <div class="custom-dropdown">
                        <asp:DropDownList ID="ddldistrict" runat="server" CssClass="formcontrol valid"></asp:DropDownList>
                    </div>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtnote" placeholder="Ghi chú" runat="server" Rows="5" Columns="30" CssClass="formcontrol ordernote"></asp:TextBox>
                </div>
                <div class="error summary">
                    (<span class="color-red ">*</span>)Vui lòng nhập đủ thông tin
                </div>
        
        </div>
        <div class="listerror">
        </div>
    </div>
    
     
        <div class="col-4">
            <asp:Panel ID="pnshipping" runat="server">
            <h2 class="h-shipping ">Vận chuyển</h2>
            <div class="form-group ">
                <div class="custom-dropdown">
                    <asp:DropDownList ID="ddlshipping" runat="server" CssClass="drop_shipping"></asp:DropDownList>
                    </div>
            </div>
                </asp:Panel>
            <h2>Thanh toán</h2>

            <div class="shiping-ajax">
                <asp:Panel ID="pnredirect" runat="server" Visible="false">
                    <label class="lb-method">
                        <asp:RadioButton ID="rdredirect" runat="server" Checked="true"  GroupName="rdpayment" />
                        <span>Thanh toán trực tiếp</span>
                    </label>
                    <span class="desc" style="display: block;"></span>
                </asp:Panel>
                <asp:Panel ID="pnbank" runat="server"  Visible="false">
                    <label class="lb-method">
                        <asp:RadioButton ID="rdbank" runat="server"  GroupName="rdpayment" />
                        <span>Chuyển khoản qua ngân hàng</span>
                    </label>
                    <span class="desc" style="display: block;"></span>
                </asp:Panel>
                <asp:Panel ID="pncod" runat="server"  Visible="false">
                    <label class="lb-method">
                        <asp:RadioButton ID="rdcod" runat="server"  GroupName="rdpayment" />
                        <span>Thanh toán khi giao hàng (COD)</span>
                    </label>
                    <span class="desc" style="display: block;"></span>
                </asp:Panel>
                <asp:Panel ID="pnbaokim" runat="server"  Visible="false">
                    <label class="lb-method">
                        <asp:RadioButton ID="rdbaokim" runat="server" GroupName="rdpayment" />
                        <span>Thanh toán qua Bảo Kim</span>
                    </label>
                    <span class="desc" style="display: block;"></span>
                </asp:Panel>
                <asp:Panel ID="pnnganluong" runat="server"  Visible="false">
                    <label class="lb-method">
                        <asp:RadioButton ID="rdnganluong" runat="server" GroupName="rdpayment" />
                        <span>Thanh toán qua Ngân Lượng</span>
                    </label>
                    <span class="desc" style="display: block;"></span>
                </asp:Panel>
                <asp:Panel ID="pnpaypal" runat="server"  Visible="false">
                    <label class="lb-method">
                        <asp:RadioButton ID="rdpaypal" runat="server" GroupName="rdpayment" />
                        <span>Thanh toán qua Paypal</span>
                    </label>
                    <span class="desc" style="display: block;"></span>
                </asp:Panel>
                <asp:Panel ID="pnonepay" runat="server"  Visible="false">
                    <label class="lb-method">
                        <asp:RadioButton ID="rdonepay" runat="server"  GroupName="rdpayment" />
                        <span>Thanh toán qua OnePay</span>
                    </label>
                    <span class="desc" style="display: block;"></span>
                </asp:Panel>
            </div>
        </div>
        <div class="box-btn-checkout-first">
            <button type="submit" class="btn-checkout btn-checkout-first">Đặt hàng</button>
        </div>
        <div class="col-4">
            <div class="box-cart">
                <h2>Đơn hàng</h2>
                (<span><asp:Literal ID="ltnum" runat="server"></asp:Literal></span> sản phẩm)
								<div class="cart-items">
                                    <asp:Repeater ID="rpitems" runat="server">
                                        <ItemTemplate>
                                            <div class="list_item cart-item">
                                                <span><%#Eval("inumber") %> x</span>
                                                <span><%#Eval("vtitle") %></span>
                                                <span class="price"><%#WEB.Products.FomatPrice( Eval("fprice").ToString(),vlan) %></span>
                                                <p class="variant-title"></p>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                <div class="total-price">
                    Tạm tính  
                    <label><asp:Literal ID ="ltmoney" runat="server"></asp:Literal> <%=unit %></label>
                </div>
                <div class="shiping-price">
                    Phí vận chuyển  
                    <label class="shippingprice"><asp:Literal ID="ltshipcount" runat="server"></asp:Literal> <%=unit %></label>
                </div>
                <a class="btn-coupon btn-arrow" href="javascript:void(0);" style="display: block;"><span></span>Sử dụng mã giảm giá </a>
                <div class="coupon"><a class="remove-coupon">Xóa</a> <span></span>
                    <label></label>
                </div>
                <div class="use-coupon" style="display: none;">
                    <div class="form-group">
                        <input type="hidden" id="hddiscount" value="0" name="hddiscount">
                        <input name="couponcode" id="couponcode"  placeholder="Nhập mã giảm giá"><span class="error coupon-error" style="display:none">Mã khuyến mãi áaa không khả dụng.</span>
                        <a class="btn-submit-coupon">Sử dụng</a>
                        <a class="continue-coupon " style="display: none;">Tiếp tục sử dụng</a>
                        <a class="cancel-coupon" style="display: block;">Hủy</a>
                    </div>
                </div>
                <div class="total-checkout">
                    Tổng cộng <span><asp:Literal ID ="lttotalvnd" runat="server"></asp:Literal> <%=unit %></span>
                </div>
            </div>
            <asp:Button ID="btncheckout" runat="server" Text="Đặt hàng" OnClientClick="return check();" CssClass="btn-checkout" OnClick="btncheckout_Click" />
            

        </div>
    <input id="hdtotal" type="hidden" value="<%=ftotal %>" />
    <input id="hdmoney" type="hidden" name="hdmoney" value="<%=fmoney %>" />
    <input id="hdshippingprice" name="hdshippingprice" type="hidden" value="<%=fshipping %>" />
    <input id="hdweight" type="hidden" value="<%=fweight %>" />
</div>
<script>
    function check() {
        if ($("#txtphone").val() == "") {
            alert("Số điện thoại không được để trống");
            $("#txtphone").focus();
            return false;
        }

        return true;
    }
</script>
