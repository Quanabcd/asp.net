<%@ Control Language="C#" AutoEventWireup="true" CodeFile="order.ascx.cs" Inherits="home_member_until_order" %>
<div class="cartblock mbblock">
    <div class="container">
        <h1  class="ttm">Trang thành viên</h1>

        <div class="blockmb ">
          
            <div class="col-sm-9">
                <asp:Panel ID="pnlist" runat="server">
                  <h2>Danh sách đơn hàng</h2>
                  <div class="blockmbm">
              
                 <asp:Repeater ID="rpitems" runat="server">
                     <HeaderTemplate>
                         <div class="row hdc">
                             <div class="col-xs-3">Mã ĐH</div>
                              <div class="col-xs-3">Tổng tiền</div>
                              <div class="col-xs-3">Thời gian đặt</div>
                              <div class="col-xs-2">Trạng thái</div>
                             <div class="col-xs-1"></div>
                             </div>
                     </HeaderTemplate>
                     <ItemTemplate>
                           <div class="row ">
                               <div class="itdh">
                             <div class="col-xs-3"><%#Eval("vcode")%></div>
                              <div class="col-xs-3"><%#gettotal(Eval("fmoney").ToString(),Eval("vpr1").ToString(),Eval("fdiscount").ToString())%></div>
                              <div class="col-xs-3"><%#Convert.ToDateTime(Eval("dcreate")).ToString("dd/MM/yyyy HH:mm") %></div>
                              <div class="col-xs-2"><%#endablestatus(Eval("istatus").ToString()) %>	</div>
                                  <div class="col-xs-1"><a href="?id=<%#Eval("icartid")%>" title="Xem chi tiết"><i class="fa fa-eye"></i></a></div>
                                   <div class="clear"></div>
                             </div>
                      </div>

                     </ItemTemplate>
                 </asp:Repeater>
                       <p class="messnorecord"><asp:Literal ID="ltnorecord" runat="server"></asp:Literal></p>
            </div>
                    </asp:Panel>
                <asp:Panel ID="pndetail" runat="server" Visible="false">
                      <h2>Thông tin đơn hàng</h2>
                    <table class="adminlist" style="width:100%">
                                <tr>
							        <td style="width:170px" class="key">
								        <label for="listnhom">Mã đơn hàng</label>
							        </td>
							        <td>
								        <b><asp:Literal ID="ltcode" runat="server"></asp:Literal></b></td>
						        </tr>
                               
                                 <tr>
							        <td class="key">
								        <label for="listnhom">Ngày đặt hàng</label>
							        </td>
							        <td>
								        <asp:Literal ID="ltdatetime" runat="server"></asp:Literal>							</td>
						        </tr>
                                 <tr style="display:none">
							        <td class="key">
								        <label for="listnhom">Ngày cập nhật</label>
							        </td>
							        <td>
								        <asp:Literal ID="ltupdate" runat="server"></asp:Literal>							</td>
						        </tr>
                                 <tr>
							        <td class="key">
								        <label for="listnhom">Ngày giao hàng</label>
							        </td>
							        <td>
								      		 <asp:Literal ID="ltgh" runat="server"></asp:Literal>	

							        </td>
						        </tr>
						        <tr>
							        <td class="key">
								        <label for="listnhom">Trạng thái</label>
							        </td>
							        <td>
							            <asp:Literal ID="ltstatus" runat="server"></asp:Literal>
							        </td>
						        </tr>
                                 <tr>
							        <td class="key">
								        <label for="listnhom">Hình thức thanh toán</label>
							        </td>
							        <td>
                                          <asp:Literal ID="ltpayment" runat="server"></asp:Literal>
							        </td>
						        </tr>
						       <tr>
							        <td class="key">
								        <label for="txtphone">Thông tin khác</label>
							        </td>
							        <td>
                                        <asp:Literal ID="ltttk" runat="server"></asp:Literal>
							        </td>
						        </tr>
                            </table>
                     <h2>Chi tiết đơn hàng</h2>
						<asp:Repeater ID="rpcartdetail" runat="server">
                            <HeaderTemplate>
                                <table class="tbcartdetail" style="width:100%;" cellpadding="5" cellspacing="1" >
                                    <tr class="hdtb" style="background:#f0f0f0">
                                    
                                    <td align="center"  width='12%'><b>Hình ảnh</b></td>
                                    <td><b>Tên sản phẩm</b></td>
                                    <td width='15%'  align="center"><b>Số lượng</b></td>
                                    <td width='10%'><b>Đơn giá</b></td>
                                    <td width='15%' align="right"><b>Thành tiền</b></td>
                                   
                                    </tr>
                               
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td  align="center"><a target="_blank" href="<%#WEB.Common.Weburl %><%#Eval("valias")%>" title="<%#Eval("vtitle")%>"><img style="height:80px" class="imgprd-cart" src="<%#WEB.Common.Weburl %>uploads/products/<%#Eval("vimg")%>" alt="<%#Eval("vtitle")%>" /></a></td>
                                    <td valign="top"><a target="_blank" href="<%#WEB.Common.Weburl %><%#Eval("valias")%>" title="<%#Eval("vtitle")%>">
                                        <%#Eval("vtitle")%>
                                        <p style="margin-top:5px;font-size:12px;">Mã sản phẩm: <%#Eval("vkey")%></p
                                         <p style="margin-top:5px;font-size:12px;">Size: <%#Eval("vpr1")%></p>
                                        </a>
                                    </td>
                                    <td align="center"><%#Eval("inumber")%></td>
                                    <td><%#WEB.Products.FomatPrice(Eval("fprice").ToString())%></td>
                                    <td  align="right"><%#WEB.Products.FomatPrice(Eval("fvalue").ToString())%></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                 </table>
                            </FooterTemplate>
                        </asp:Repeater>
                      <p style="text-align:right;padding-top:10px">
                        
                        <span style="font-weight:bold;width:220px;text-align:left;display:inline-block">Tổng tiền:</span><span style="font-weight:bold;width:100px;text-align:right;display:inline-block"><asp:Literal ID="lttotal" runat="server"></asp:Literal></span>
                        </p>
                            <p style="text-align:right;padding-top:10px">
                        
                        <span style="font-weight:bold;width:220px;text-align:left;display:inline-block">Phí vận chuyển:</span><span style="font-weight:bold;width:100px;text-align:right;display:inline-block"><asp:Literal ID="ltvanchuyen" runat="server"></asp:Literal></span>
                        </p>
                             
						<p style="text-align:right;padding-top:10px">
                        
                        <span style="font-weight:bold;width:220px;text-align:left;display:inline-block">Tổng đơn hàng:</span><span style="font-weight:bold;width:100px;text-align:right;display:inline-block"><asp:Literal ID="lttotalvnd" runat="server"></asp:Literal></span>
                        </p>
                </asp:Panel>
                </div>
             <div class="col-sm-3">
                 <div class="cctv">
                 <p class="tttv">Công cụ thành viên</p>
                 <ul>
                     <li><a href="/account/info" title="Thông tin thành viên"><i class="fa fa-angle-right "></i> Thông tin thành viên</a></li>
                      <li><a href="/account/wishlist" title="Sản phẩm yêu thích"><i class="fa fa-angle-right "></i> Sản phẩm yêu thích</a></li>
                      <li><a href="/account/order" title="Danh sách đơn hàng"><i class="fa fa-angle-right "></i> Danh sách đơn hàng</a></li>
                 </ul>
                     </div>
             </div>
            <div class="clear"></div>
        </div>
    </div>
</div>