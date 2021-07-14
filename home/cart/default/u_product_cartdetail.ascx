<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_product_cartdetail.ascx.cs" Inherits="home_products_default_u_product_cartdetail" %>
    <script src="/templates/home/js/numeral.min.js" type='text/javascript'></script>
<div class='cart_detail'>

    <asp:Panel ID="pncartdetail" runat="server" Visible="false">
        <h3><%=WEB.Common.Getlabel("lb_thongtingiohang","1. THÔNG TIN GIỎ HÀNG",WEB.Common.Lang) %></h3>
        <asp:Repeater ID="rpcart" runat="server" OnItemCommand="rpcart_ItemCommand">
            <HeaderTemplate>
                <table style="width: 98%;" cellpadding="5" class="table cart" cellspacing="1">
                    <tr>
                        <td width='10%'><b><%=WEB.Common.Getlabel("lb_hinhanh","Hình ảnh",WEB.Common.Lang) %></b></td>
                        <%-- <td><b>Hình ảnh</b></td>--%>
                        <td class="hidden-xs"><b><%=WEB.Common.Getlabel("lb_tensanpham","Tên sản phẩm",WEB.Common.Lang) %></b></td>
                        <td width='12%'><b><%=WEB.Common.Getlabel("lb_soluong","Số lượng",WEB.Common.Lang) %></b></td>
                        <td width='12%'><b><%=WEB.Common.Getlabel("lb_dongia","Đơn giá",WEB.Common.Lang) %></b></td>
                        <td width='12%'><b><%=WEB.Common.Getlabel("lb_thanhtien","Thành tiền",WEB.Common.Lang) %></b></td>
                        <td width='8%'></td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td align="center"><a href="<%#WEB.Common.Weburl %><%#Eval("valias")%>" title="<%#Eval("vtitle")%>">
                        <img style="height: 80px" class="imgprd-cart" src="<%#WEB.Common.Weburl %>uploads/products/<%#Eval("vimg")%>" alt="<%#Eval("vtitle")%>" /></a></td>
                    <%-- <td>hinhanh</td>--%>
                    <td class="hidden-xs" valign="top"><a href="<%#WEB.Common.Weburl %><%#Eval("valias")%>" title="<%#Eval("vtitle")%>">
                        <%#Eval("vtitle")%>
                        <p><%=WEB.Common.Getlabel("lb_masanpham","Mã sản phẩm",WEB.Common.Lang) %>: <%#Eval("vkey")%></p>
                    </a>

                    </td>
                    <td align="center">
                        <input type="text" class="txtnumc" name='<%#Eval("iitemid")%>' id='sl<%#stt() %>'
                            value='<%#Eval("inumber")%>' size="1">
                         <input type="hidden" class="pr<%#m %>" value="<%#Eval("fprice") %>" />
                    </td>
                    <td><span class='pri'><%#WEB.Products.FomatPrice (Eval("fprice").ToString())%></span><span class="hidden prci"><%#Eval("fprice").ToString() %></span></td>
                    <td>
                            <span class="thanhtien<%#m %>"><%#WEB.Products.FomatPrice(Eval("fvalue").ToString())%></span>
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButton2" CommandName="delete" CssClass="lnkdel" OnLoad="Delete_Load" CommandArgument='<%#Eval("icartdetail")%>'
                            runat="server"><%=WEB.Common.Getlabel("lb_xoa","Xóa",WEB.Common.Lang) %></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <p style="text-align: right; padding-top: 10px; margin-right: 20px;">
            <%=WEB.Common.Getlabel("lb_tongtien","Tổng tiền",WEB.Common.Lang) %>: <b class="tto">
                <span class="totals_price"><asp:Literal ID="lttotalvnd" runat="server"></asp:Literal></span></b>
        </p>
        <p class='tool_cart'>
            <asp:Button ID="btncontinue" Text="Tiếp tục mua hàng" CssClass="btnbuycontinue btn" runat="server"
                OnClick="btncontinue_Click" />
            <asp:Button ID="btnbuys" Text="Đặt hàng" runat="server" CssClass="btn" OnClick="btnbuy_Click" />
            <asp:Button ID="btncancel" Text="Hủy đơn hàng" runat="server" CssClass="btncancelorder btn"
                OnClick="btncancel_Click" />
              <input type="hidden" value="<%=numitemincart %>" name="numitemincart" id="numitemincart" />
        </p>
    </asp:Panel>
    <asp:Panel ID="pnorder" runat="server" Visible="false">
        <div class='cart_detail'>
            <asp:Repeater ID="rpcartdetail" runat="server">
                <HeaderTemplate>
                    <table style="width: 98%;" class="table cart" cellpadding="1" cellspacing="1">
                        <tr>
                             <td width='10%'><b><%=WEB.Common.Getlabel("lb_hinhanh","Hình ảnh",WEB.Common.Lang) %></b></td>
                        <%-- <td><b>Hình ảnh</b></td>--%>
                        <td class="hidden-xs"><b><%=WEB.Common.Getlabel("lb_tensanpham","Tên sản phẩm",WEB.Common.Lang) %></b></td>
                        <td width='12%'><b><%=WEB.Common.Getlabel("lb_soluong","Số lượng",WEB.Common.Lang) %></b></td>
                        <td width='12%'><b><%=WEB.Common.Getlabel("lb_dongia","Đơn giá",WEB.Common.Lang) %></b></td>
                        <td width='12%'><b><%=WEB.Common.Getlabel("lb_thanhtien","Thành tiền",WEB.Common.Lang) %></b></td>
                      
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td align="center"><a href="<%#WEB.Common.Weburl %><%#Eval("valias")%>" title="<%#Eval("vtitle")%>">
                            <img style="height: 80px" class="imgprd-cart" src="<%#WEB.Common.Weburl %>uploads/products/<%#Eval("vimg")%>" alt="<%#Eval("vtitle")%>" /></a></td>
                        <td class="hidden-xs" valign="top"><a href="<%#WEB.Common.Weburl %><%#Eval("valias")%>" title="<%#Eval("vtitle")%>">
                            <%#Eval("vtitle")%>
                            <p><%=WEB.Common.Getlabel("lb_masanpham","Mã sản phẩm",WEB.Common.Lang) %>: <%#Eval("vkey")%></p>
                        </a>

                        </td>
                        <td align="center"><%#Eval("inumber")%></td>
                        <td><%#WEB.Products.FomatPrice (Eval("fprice").ToString())%>
                             
                        </td>
                        <td>
                           <%#WEB.Products.FomatPrice(Eval("fvalue").ToString())%>
                          

                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <p style="text-align: right; padding-top: 10px; margin-right: 20px; border-top: 1px solid #f0f0f0; border-bottom: 1px solid #f0f0f0; padding: 10px 0px; font-size: 16px; margin-bottom: 20px;">
                <b><%=WEB.Common.Getlabel("lb_tongtien","Tổng tiền",WEB.Common.Lang) %>:</b> <b>
                    <asp:Literal ID="lttotal1" runat="server"></asp:Literal></b>
            </p>
        </div>

        <div class="row">
            <div class="customer-frm col-md-6">
                <div class="buy-form">
                    <h3 class="legend"><%=WEB.Common.Getlabel("lb_thongtinkhachhang","2. Thông tin Khách Hàng",WEB.Common.Lang) %></h3>
                    <p>
                        <span class="msg_error">
                            <asp:Literal ID="ltmsgerror" runat="server"></asp:Literal></span>
                    </p>
                    <ul class="filter-list">
                        <li class="filter-username">
                            <div class="group-radio hidden">
                                <div class="radio-1">
                                    <asp:RadioButton ID="rdmale" runat="server" GroupName="gdsex" Checked="true" />
                                    <label for="gender-male"><%=WEB.Common.Getlabel("lb_gioitinhnam","Anh",WEB.Common.Lang) %></label>


                                </div>
                                <div class="radio-1">
                                    <asp:RadioButton ID="rdfemale" runat="server" GroupName="gdsex" />
                                    <label for="gender-male"><%=WEB.Common.Getlabel("lb_gioitinhnu","Chị",WEB.Common.Lang) %></label>

                                </div>
                            </div>
                            <label><%=WEB.Common.Getlabel("lb_hoten","Họ tên",WEB.Common.Lang) %></label>
                            <asp:TextBox ID="txtname" CssClass="fullname mipt" runat="server"></asp:TextBox>
                        </li>
                        <li  class="filter-username">
                             <label><%=WEB.Common.Getlabel("lb_sodienthoai","Số điện thoại",WEB.Common.Lang) %></label>
                            <asp:TextBox ID="txtphone"  CssClass="phone mipt" runat="server"></asp:TextBox>

                        </li>
                        <li  class="filter-username">
                             <label>Email</label>
                            <asp:TextBox ID="txtemail" CssClass="email mipt" runat="server" placeholder="Email (cần nhập email để nhận được thông tin đơn hàng)"></asp:TextBox>

                        </li>



                        <li >
                            <label class="toglAddress"><i class="fa fa-location-arrow"></i> <%=WEB.Common.Getlabel("lb_diachithoigiangiaohang","Địa chỉ, thời gian GIAO HÀNG NHANH",WEB.Common.Lang) %></label>
                            <li class="info-add  filter-username hidden">
                                <label><%=WEB.Common.Getlabel("lb_tinhthanh","Tỉnh thành",WEB.Common.Lang) %></label>
                                    <asp:DropDownList ID="ddlcity" Visible="false" runat="server" CssClass="mipt"></asp:DropDownList>
                               </li>
                           <li class="info-add  filter-username hidden">
                                 <label><%=WEB.Common.Getlabel("lb_quanhuyen","Quận / huyện",WEB.Common.Lang) %></label>

                                    <asp:DropDownList ID="ddlqh" Visible="false" runat="server" CssClass="mipt"></asp:DropDownList>
                               </li>
                               <li class="info-add hidden filter-username hidden">
                                      <label>Phường / Xã</label>
                                    <asp:DropDownList ID="ddlpx" Visible="false" runat="server" CssClass="mipt"></asp:DropDownList>
                                </li>
                          
                            <li class="filter-username">
                                  <label><%=WEB.Common.Getlabel("lb_diachi","Địa chỉ",WEB.Common.Lang) %></label>
                                <asp:TextBox ID="txtaddress" placeholder="Số nhà - Tên đường" CssClass="address mipt" runat="server"></asp:TextBox>

                            </li>
                            <li  class="filter-username">
                                  <label><%=WEB.Common.Getlabel("lb_ghichu","Ghi chú",WEB.Common.Lang) %></label>
                                <asp:TextBox ID="txtcontent" placeholder="Ghi chú khi giao hàng (vd: ngày, giờ giao hàng)" CssClass="mtxt comment" TextMode="MultiLine" Columns="46" Rows="6" runat="server"></asp:TextBox>

                            </li>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="popup-buyform ipayment col-md-6">
                <div class="info-payment">
                    <label class="toglAddress"><i class="fa fa-money"></i> <%=WEB.Common.Getlabel("lb_hinhthucthanhtoan","Hình thức thanh toán",WEB.Common.Lang) %></label>
                     <div class="p-row  <%=activetructiep %>" <%=dtructiep %>>
                        <asp:RadioButton ID="rdtructiep" GroupName="pm" runat="server" />

                        <label for="bank_transfer" class="lbl-rado"><asp:Literal ID="lttructiep" runat="server"></asp:Literal></label>
                        <div class="redirect_box boxContent">
                            <asp:Literal ID="lttructiepdesc" runat="server"></asp:Literal>
                        </div>
                    </div>
                    <div class="p-row <%=activeck %>" <%=dchuyenkhoan %>>
                        <asp:RadioButton ID="bank_transfer" GroupName="pm" runat="server" />

                        <label for="bank_transfer" class="lbl-rado"><asp:Literal ID="ltchuyenkhoan" runat="server"></asp:Literal></label>
                        <div class="bank_transfer_box boxContent" style="display: none;">
                            <asp:Literal ID="ltchuyenkhoandesc" runat="server"></asp:Literal>
                        </div>
                    </div>
                    <div class="p-row  <%=activecod %>" <%=dcod %>>
                        <asp:RadioButton ID="cod_payment" GroupName="pm" runat="server" />
                        <label for="cod_payment" class="lbl-rado"><asp:Literal ID="ltcod" runat="server"></asp:Literal></label>
                        <div class="cod_payment_box boxContent" style="display: none;">
                            <asp:Literal ID="ltcoddesc" runat="server"></asp:Literal>
                        </div>
                    </div>

                    <div class="p-row cod-row" style="display: none;">
                        <asp:RadioButton ID="ATM_ONLINE" GroupName="pm" runat="server" />
                        <label>Thanh toán online bằng thẻ ngân hàng nội địa</label>

                        <div class="boxContent">
                            <p>
                                <i>
                                    <span style="color: #ff5a00; font-weight: bold; text-decoration: underline;">Lưu ý</span>: Bạn cần đăng ký Internet-Banking hoặc dịch vụ thanh toán trực tuyến tại ngân hàng trước khi thực hiện.</i>
                            </p>

                            <ul class="cardList clearfix">

                                <li class="bank-online-methods ">
                                    <label for="vcb_ck_on">
                                        <i class="VCB" title="Ngân hàng TMCP Ngoại Thương Việt Nam"></i>
                                        <asp:RadioButton ID="VCB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="vnbc_ck_on">
                                        <i class="DAB" title="Ngân hàng Đông Á"></i>
                                        <asp:RadioButton ID="DAB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="tcb_ck_on">
                                        <i class="TCB" title="Ngân hàng Kỹ Thương"></i>
                                        <asp:RadioButton ID="TCB" runat="server" GroupName="bankcode" />
                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="sml_atm_mb_ck_on">
                                        <i class="MB" title="Ngân hàng Quân Đội"></i>
                                        <asp:RadioButton ID="MB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="shb_ck_on">
                                        <i class="SHB" title="Ngân hàng Sài Gòn - Hà Nội"></i>
                                        <asp:RadioButton ID="SHB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="sml_atm_vib_ck_on">
                                        <i class="VIB" title="Ngân hàng Quốc tế"></i>
                                        <asp:RadioButton ID="VIB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="sml_atm_vtb_ck_on">
                                        <i class="ICB" title="Ngân hàng Công Thương Việt Nam"></i>
                                        <asp:RadioButton ID="ICB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="sml_atm_exb_ck_on">
                                        <i class="EXB" title="Ngân hàng Xuất Nhập Khẩu"></i>
                                        <asp:RadioButton ID="EXB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="sml_atm_acb_ck_on">
                                        <i class="ACB" title="Ngân hàng Á Châu"></i>
                                        <asp:RadioButton ID="ACB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="sml_atm_hdb_ck_on">
                                        <i class="HDB" title="Ngân hàng Phát triển Nhà TPHCM"></i>
                                        <asp:RadioButton ID="HDB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="sml_atm_msb_ck_on">
                                        <i class="MSB" title="Ngân hàng Hàng Hải"></i>
                                        <asp:RadioButton ID="MSB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="sml_atm_nvb_ck_on">
                                        <i class="NVB" title="Ngân hàng Nam Việt"></i>
                                        <asp:RadioButton ID="NVB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="sml_atm_vab_ck_on">
                                        <i class="VAB" title="Ngân hàng Việt Á"></i>
                                        <asp:RadioButton ID="VAB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="sml_atm_vpb_ck_on">
                                        <i class="VPB" title="Ngân Hàng Việt Nam Thịnh Vượng"></i>
                                        <asp:RadioButton ID="VPB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="sml_atm_scb_ck_on">
                                        <i class="SCB" title="Ngân hàng Sài Gòn Thương tín"></i>
                                        <asp:RadioButton ID="SCB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="ojb_ck_on">
                                        <i class="OJB" title="Ngân hàng Đại Dương"></i>
                                        <asp:RadioButton ID="OJB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="bnt_atm_pgb_ck_on">
                                        <i class="PGB" title="Ngân hàng Xăng dầu Petrolimex"></i>
                                        <asp:RadioButton ID="PGB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="bnt_atm_gpb_ck_on">
                                        <i class="GPB" title="Ngân hàng TMCP Dầu khí Toàn Cầu"></i>
                                        <asp:RadioButton ID="GPB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="bnt_atm_agb_ck_on">
                                        <i class="AGB" title="Ngân hàng Nông nghiệp &amp; Phát triển nông thôn"></i>
                                        <asp:RadioButton ID="AGB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="bnt_atm_sgb_ck_on">
                                        <i class="SGB" title="Ngân hàng Sài Gòn Công Thương"></i>
                                        <asp:RadioButton ID="SGB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="bnt_atm_nab_ck_on">
                                        <i class="NAB" title="Ngân hàng Nam Á"></i>
                                        <asp:RadioButton ID="NAB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                                <li class="bank-online-methods ">
                                    <label for="sml_atm_bab_ck_on">
                                        <i class="BAB" title="Ngân hàng Bắc Á"></i>
                                        <asp:RadioButton ID="BAB" runat="server" GroupName="bankcode" />

                                    </label>
                                </li>

                            </ul>

                        </div>
                    </div>
                    <div class="p-row cod-row" style="display: none;">
                        <label>
                            <asp:RadioButton ID="VISA" runat="server" GroupName="pm" />
                            Thanh toán bằng thẻ Visa hoặc MasterCard</label>
                        <div class="boxContent">
                        </div>
                    </div>


                </div>

            </div>
        </div>
       
        <div class='d_buyinfo'>
        </div>
        <div class="clear"></div>
        <p class='tool_cart'>
            <asp:Button ID="btneditcart" Text="Sửa đơn hàng" CssClass="btneditorder btn" runat="server"
                OnClick="btneditcart_Click" />
            <asp:Button ID="btnorder" Text="Thanh toán" runat="server" CssClass="btnpayment btn" OnClick="btnorder_Click" />
            <asp:Button ID="btncancelorder" Text="Hủy đơn hàng" CssClass="btncancelorder btn" runat="server"
                OnClick="btncancelorder_Click" />
            
        </p>
    </asp:Panel>
    <asp:Panel ID="pnmessage" runat="server" Visible="false">
        <asp:Literal ID="ltmsg" runat="server"></asp:Literal>
    </asp:Panel>
    <asp:Panel ID="pnordersuccess" runat="server">
        <asp:Literal ID="ltordersuccess" runat="server"></asp:Literal>
        <div class="row">
            <div class="col-sm-6">
                <div class="ttdh">
                <table>
                    <tr>
                        <td colspan="2"><b><%=WEB.Common.Getlabel("lb_thongtindonhang","Thông tin đơn hàng",WEB.Common.Lang) %></b></td>
                    </tr>
                    <tr>
                        <td style="width:130px;"><%=WEB.Common.Getlabel("lb_hoten","Họ tên",WEB.Common.Lang) %></td>
                        <td><asp:Literal ID="ltname" runat="server"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td><%=WEB.Common.Getlabel("lb_sodienthoai","Số điện thoại",WEB.Common.Lang) %></td>
                        <td><asp:Literal ID="ltphone" runat="server"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><asp:Literal ID="ltemail" runat="server"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td><%=WEB.Common.Getlabel("lb_diachi","Địa chỉ",WEB.Common.Lang) %></td>
                        <td><asp:Literal ID="ltaddress" runat="server"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td><%=WEB.Common.Getlabel("lb_khuvuc","Khu vực",WEB.Common.Lang) %></td>
                        <td><asp:Literal ID="ltkv" runat="server"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td><%=WEB.Common.Getlabel("lb_ghichu","Ghi chú",WEB.Common.Lang) %></td>
                        <td><asp:Literal ID="ltghichu" runat="server"></asp:Literal></td>
                    </tr>
                </table>
                    </div>
            </div>
            <div class="col-sm-6">
                <div class="ttgh">
                    <b class="tttitle"><%=WEB.Common.Getlabel("lb_giohang","Giỏ hàng",WEB.Common.Lang) %></b>
               
                 <asp:Repeater ID="rpcartss" runat="server">
               
                <ItemTemplate>
                    <div class="ghit">
                    <div class="prdimg">
                        <a href="<%#WEB.Common.Weburl %><%#Eval("valias")%>" title="<%#Eval("vtitle")%>">
                            <img style="height: 80px" class="imgprd-cart" src="<%#WEB.Common.Weburl %>uploads/products/thumbs/<%#Eval("vimg")%>" alt="<%#Eval("vtitle")%>" /></a>
                    </div>
                    <div class="ghct">
                        <p><a href="<%#WEB.Common.Weburl %><%#Eval("valias")%>" title="<%#Eval("vtitle")%>">
                            <%#Eval("vtitle")%>
                            </a></p>
                        <span class="itghslg"><%#Eval("inumber")%> x <%#WEB.Products.FomatPrice (Eval("fprice").ToString())%></span>
                        <span class="itghtt"><%#WEB.Products.FomatPrice(Eval("fvalue").ToString())%></span>
                        <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                        </div>
                </ItemTemplate>
                <FooterTemplate>
                   
                </FooterTemplate>
            </asp:Repeater>
            <p class="tta">
                <b><%=WEB.Common.Getlabel("lb_tongtien","Tổng tiền",WEB.Common.Lang) %>:</b> <b>
                    <asp:Literal ID="lttottalss" runat="server"></asp:Literal></b>
            </p>
                     </div>
            </div>
        </div>
    </asp:Panel>

</div>
<style>
       ul.bankList {
                clear: both;
                height: 202px;
                width: 636px;
            }

            .boxContent {
               display: none;
    margin-left: 20px;
    padding: 20px;
    border: 1px solid #e4e4e4;
            }

            .active .boxContent {
                display: block !important;
            }

            ul.bankList li {
                list-style-position: outside;
                list-style-type: none;
                cursor: pointer;
                float: left;
                margin-right: 0;
                padding: 5px 2px;
                text-align: center;
                width: 90px;
            }

            .list-content li {
                list-style: none outside none;
                margin: 0 0 10px;
            }

                .list-content li .boxContent {
                    display: none;
                    width: 636px;
                    border: 1px solid #cccccc;
                    padding: 10px;
                }

                .list-content li.active .boxContent {
                    display: block;
                }

                .list-content li .boxContent ul {
                    height: 280px;
                }

            
            ul.cardList li {
                cursor: pointer;
                float: left;
                margin-right: 0;
                padding: 5px 4px;
                text-align: center;
                width: 90px;
            }
    .prdimg {
        float: left;
        width: 100px;
    }
    .ttgh {
        border: 1px solid #f0f0f0;
        padding: 10px;
    }
    .tta {
        margin-top: 10px;
        padding: 10px 0px 10px 0px;
        text-align: right;
        border-top: 1px solid #f0f0f0;
    }
    .itghslg {
        float: left;
    }
    .itghtt {
        float: right;color:red;
    }
    .ghit {
        padding: 5px 0px;
    }
    .ttdh table {
        width: 100%;border-left:1px solid #f0f0f0;border-top:1px solid #f0f0f0;
    }
        .ttdh table td {
            padding: 5px;
        }
    .ttdh table tr {
        border-bottom: 1px solid #f0f0f0;
        border-right:1px solid #f0f0f0;
    }
    .cart_detail h3 {
        font-size: 14px;
        font-weight: bold;
    }

    .title_c {
        width: 94px;
        display: inline-block;
    }

    .d_buyinfo {
        float: left;
    }

    .d_payment {
    }
    #pnordersuccess {
        margin-bottom: 30px;
    }
    #pnmessage {
        text-align: center;
        font-weight: bold;
        margin: 50px 0px;
    }

    .cardList {
        list-style: none;
    }
</style>
<script>
    $('input[name="ctl17$ctl00$ctl00$ctl00$pm"]').bind('click', function () {
        $('.p-row').removeClass('active');
        $(this).parent('div.p-row').addClass('active');
    });
    $(document).on("change", '.txtnumc', function () {
        var numitemincart = parseInt($("#numitemincart").val());
        var total = 0;
        var i;
        for (i = 1; i <= numitemincart; i++) {
            total += numeral($(".pr" + i).val()).value() * numeral($("#sl" + i).val()).value();
            
            $(".thanhtien" + i).html(numeral(numeral($(".pr" + i).val()).value() * numeral($("#sl" + i).val()).value()).format('0,0').replace(",", ".").replace(",", ".").replace(",", ".") + " ") ;
        }
        $(".totals_price .prnum").html(numeral(total).format('0,0').replace(",", ".").replace(",", ".").replace(",", ".") + " ") ;
       // $(".total2 .prnum").html(numeral(total).format('0,0').replace(",", ".").replace(",", ".").replace(",", ".") + " ");
    });
    $(document).on("change", '#ddlcity', function () {
        var id = $(this).val();
        $.ajax({
            type: "POST",
            url: "/webservices/srv.asmx/GetDistrict",
            data: "{ city: '" + id + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $("#ddlqh").html("");
                $("#ddlqh").html(data.d);
                px();
            },
            error: function (data) {
            }
        })
    });
    $(document).on("change", '#ddlqh', function () {
        px();
    });
    function px() {
        var id = $("#ddlqh").val();
        $.ajax({
            type: "POST",
            url: "/webservices/srv.asmx/GetPX",
            data: "{ qh: '" + id + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $("#ddlpx").html("");
                $("#ddlpx").html(data.d);
            },
            error: function (data) {
            }
        })
    }
</script>
