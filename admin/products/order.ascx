<%@ Control Language="C#" AutoEventWireup="true" CodeFile="order.ascx.cs" Inherits="admin_weblinks_weblink" %>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
 <script src="../templates/home/js/numeral.min.js" type='text/javascript'></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script>
    $(function () {
        $("#txtgh").datepicker({
            dateFormat: 'dd/mm/yy'
        });

    });
    $(document).on("change", '.txtnumc', function () {
        var numitemincart = parseInt($("#numitemincart").val());
        var total = 0;
        var i;
        for (i = 1; i <= numitemincart; i++) {
            total += numeral($(".pr" + i).val()).value() * numeral($("#sl" + i).val()).value();
            $(".thanhtien" + i).html(numeral(numeral($(".pr" + i).val()).value() * numeral($("#sl" + i).val()).value()).format('0,0').replace(",", ".").replace(",", ".").replace(",", ".") + " ");
        }
        
        $(".totals_price .prnum").html(numeral(total).format('0,0').replace(",", ".").replace(",", ".").replace(",", ".") + " ");
        var vc = parseInt($("#txtship").val());
        $(".tt_price .prnum").html(numeral(total + vc).format('0,0').replace(",", ".").replace(",", ".").replace(",", ".") + " ");
    });
    $(document).on("change", '#txtship', function () {
        var numitemincart = parseInt($("#numitemincart").val());
        var total = 0;
        var i;
        for (i = 1; i <= numitemincart; i++) {
            total += numeral($(".pr" + i).val()).value() * numeral($("#sl" + i).val()).value();
            $(".thanhtien" + i).html(numeral(numeral($(".pr" + i).val()).value() * numeral($("#sl" + i).val()).value()).format('0,0').replace(",", ".").replace(",", ".").replace(",", ".") + " ");
        }

        $(".totals_price .prnum").html(numeral(total).format('0,0').replace(",", ".").replace(",", ".").replace(",", ".") + " ");
        var vc = parseInt($("#txtship").val());
        $(".tt_price .prnum").html(numeral(total + vc).format('0,0').replace(",", ".").replace(",", ".").replace(",", ".") + " ");
    });
</script>
<div class="widget-title">
    <h4><i class="icon-reorder-items">
        <asp:Literal ID="lttitle" runat="server"></asp:Literal></i></h4>
    <div class="ui-widget-content ui-corner-top ui-corner-bottom">
        <div id="toolbox">
            <div style="float: right; margin-right: 10px;" class="toolbox-content">
                <table class="toolbar">
                    <tr>
                        <td align="center">
                            <asp:LinkButton ID="lnkadd" runat="server" CssClass="toolbar" OnClick="lnkadd_Click">
						<span class="icon-ok-new"></span>
							Thêm
                            </asp:LinkButton>
                        </td>
                        <td align="center">
                            <asp:LinkButton ID="lnkdelete" Enabled="false" runat="server" CssClass="toolbar" OnClientClick="return confirm('Bạn có muốn xóa dữ liệu không?')" OnClick="lnkdelete_Click">
							<span class="icon-ok-delete"></span>
							Xóa
                            </asp:LinkButton>
                        </td>
                        <td align="center">
                            <asp:LinkButton ID="lnkupdate" runat="server" CssClass="toolbar" OnClick="lnkupdate_Click">
							<span class="icon-ok-update"></span>
							Cập nhật
                            </asp:LinkButton>
                        </td>
                        <td align="center">
                            <asp:LinkButton ID="lnkclose" runat="server" CssClass="toolbar" OnClick="lnkclose_Click">
						<span class="icon-ok-close"></span>
							Đóng
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
</div>
<div id="element-box">
    <div class="m">
        <div id="adminForm1">
            <asp:Panel ID="pnlist" runat="server">
                <div class="row-fluid">
                    <div class="span3">
                        <div style="margin-top: 4px; font-size: 12px; font-style: italic;">
                            <asp:Literal ID="lt_count" runat="server"></asp:Literal>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                    <div class="span9">
                        <div class="pagination pagination-small pagination-right">
                            <asp:TextBox ID="txtkeysearch" CssClass="inputbox-top" runat="server" Width="150">

                            </asp:TextBox>
                            <asp:DropDownList ID="ddlstatus" runat="server"  CssClass="inputbox-top-select" >
                                 <asp:ListItem Value="-1" Text=" Tất cả trạng thái"></asp:ListItem>
                                 <asp:ListItem Value="0" Text=" Mới đặt hàng"></asp:ListItem>
                                            <asp:ListItem Value="1" Text=" Đã giao hàng và thanh toán"></asp:ListItem>
                                            <asp:ListItem Value="2" Text=" Đã thanh toán và đang chờ giao hàng"></asp:ListItem>
                                 <asp:ListItem Value="3" Text=" Đã thanh toán"></asp:ListItem>
                                            <asp:ListItem Value="-3" Text=" Đã hủy"></asp:ListItem>
                                            
                            </asp:DropDownList>
                             <asp:DropDownList ID="ddlorder"  Width="145"  CssClass="inputbox-top-select" runat="server">
                                <asp:ListItem Text="SX.Ngày đặt hàng" Value="0"></asp:ListItem>
                                 <asp:ListItem Text="SX.Ngày giao hàng" Value="3"></asp:ListItem>
                                <asp:ListItem Text="SX.Ngày cập nhật" Value="1"></asp:ListItem>
                                <asp:ListItem Text="SX.Tên khách hàng" Value="2"></asp:ListItem>
                                 <asp:ListItem Text="SX.Giá trị đơn hàng" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlordertype" Width="90" CssClass="inputbox-top-select" runat="server">
                                <asp:ListItem Text="Giảm dần" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Tăng dần" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btnsearch" OnClick="btnsearch_Click" runat="server" CssClass="buton-css" Text="Tìm kiếm" />
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </div>
                <div class="page-items">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </div>
                <asp:Repeater ID="rpitems" runat="server" OnItemCommand="rpitems_ItemCommand">
                <HeaderTemplate>
			    <table cellpadding="1" summary="" class="adminlist">
			        <thead>
				        <tr>
					       
					        <th width="3%" class="title">
						        <input type="checkbox" id="chkToggle" value="" onclick="selectAll(this)" name="chkToggle">
					        </th>
                            
                             <th align="center" width="70" class="title">
						        Mã ĐH
					        </th>
					        <th class="title">
						        Họ Tên 
					        </th>
					        <th width="20%" class="title">
						        Email
					        </th>
        					<th width="10%" class="title">
						       Số điện thoại
					        </th>
					       
					        <th width="140" nowrap="nowrap" class="title">
						        Thời gian
					        </th>
					        <th width="10%" nowrap="nowrap" class="title">
						        Tổng tiền
					        </th>
                             <th width="10%" class="title">
						        Trạng thái
					        </th>
                             <th width="70" class="title">
					        </th>
				        </tr>
			        </thead>
			   
			    </HeaderTemplate>
			    <ItemTemplate>
			        <tbody>
								    <tr class="row0">
					   
					    <td align="center">
						    <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("icartid") %>" id='cb_' name='cb_'>
					    </td>
                                         <td align="center"><asp:LinkButton ID="LinkButton1" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icartid")%>'
                                        runat="server" ToolTip="Xem thông tin chi tiết"><%#Eval("vcode")%></asp:LinkButton></td>
					    <td>
						   <%#Eval("vcname")%>
					    </td>
					    <td align="left"><%#Eval("vcemail")%></td>
    				<td align="center"><%#Eval("vcphone")%></td>
					  
					    <td><%#getdatecreateupdate(Eval("dcreate").ToString(),Eval("dtime").ToString()) %></td>
					    <td align="center"><%#gettotal(Eval("fmoney").ToString(),Eval("vpr1").ToString(),Eval("fdiscount").ToString())%></td>
                        <td align="center">
	<%#endablestatus(Eval("istatus").ToString()) %>				</td>
                                        <td>
                                            <asp:LinkButton ID="LinkButton4" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icartid")%>'
                                        runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                    &nbsp &nbsp
                                            <asp:LinkButton ID="LinkButton5" Visible='<%#checkdelete(Eval("istatus").ToString()) %>' CommandName="delete" OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icartid")%>'
                                                runat="server" ToolTip="Xóa"><img src="<%=weburl%>templates/admin/images/icondelete_c.png" /></asp:LinkButton>
                                        </td>
				    </tr>
				    </tbody>
		        </ItemTemplate>
                    <AlternatingItemTemplate>
                         <tbody>
								    <tr class="row1">
					   
					    <td align="center">
						    <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("icartid") %>" id='cb_' name='cb_'>
					    </td>
                                        
                                         <td align="center"><asp:LinkButton ID="LinkButton1" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icartid")%>'
                                        runat="server" ToolTip="Xem thông tin chi tiết"><%#Eval("vcode")%></asp:LinkButton></td>
					    <td>
						   <%#Eval("vcname")%>
					    </td>
					    <td align="left"><%#Eval("vcemail")%></td>
    				<td align="center"><%#Eval("vcphone")%></td>
					  
					    <td ><%#getdatecreateupdate(Eval("dcreate").ToString(),Eval("dtime").ToString()) %></td>
					    <td align="center"><%#gettotal(Eval("fmoney").ToString(),Eval("vpr1").ToString(),Eval("fdiscount").ToString())%></td>
                        <td align="center">
	<%#endablestatus(Eval("istatus").ToString()) %>				</td>
                                        <td>
                                            <asp:LinkButton ID="LinkButton4" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icartid")%>'
                                        runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                    &nbsp &nbsp
                                            <asp:LinkButton ID="LinkButton5" Visible='<%#checkdelete(Eval("istatus").ToString()) %>' CommandName="delete" OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icartid")%>'
                                                runat="server" ToolTip="Xóa"><img src="<%=weburl%>templates/admin/images/icondelete_c.png" /></asp:LinkButton>
                                        </td>
				    </tr>
				    </tbody>
                    </AlternatingItemTemplate>
		        <FooterTemplate>
			        </table>
			    </FooterTemplate>
			    </asp:Repeater>
			 </asp:Panel>
                 <div class="page-items">
                    <asp:Literal ID="lt_pagebotom" runat="server"></asp:Literal>
                </div>
            </asp:Panel>
			 <asp:Panel ID="pndetail" runat="server" Visible="false">
                  <div id="parentHorizontalTabcontent">
			       <ul class="resp-tabs-list hor_1">
                        <li>Thông tin đơn hàng</li>
                          <li>Thông tin khách hàng</li>
                          <li>Thông tin thành viên</li>
                    </ul>
                    <div class="resp-tabs-container hor_1">
                        <div>
                            <div class="row">
                                 <div class="col-sm-6">
                                     <div class="block_sp">
                                    <span class='detail_error'><asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></span>
                            <h3>1. Thông tin đơn hàng</h3>
                            <table class="adminlist">
                                <tr>
							        <td style="width:140px" class="key">
								        <label for="listnhom">Mã đặt hàng</label>
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
                                 
                                 <tr>
							        <td class="key">
								        <label for="listnhom">Ngày giao hàng</label>
							        </td>
							        <td>
								      		
                                          <asp:TextBox ID="txtgh" CssClass="inputbox" runat="server" Width="84"></asp:TextBox> &nbsp;
                                                lúc &nbsp;<asp:DropDownList ID="ddlhour" Width="52" runat="server" CssClass="inputbox"></asp:DropDownList> giờ&nbsp;&nbsp;
                                                <asp:DropDownList ID="ddlminute"  Width="52" runat="server" CssClass="inputbox"></asp:DropDownList> phút
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Ngày giao hàng</b><br />
                                                        Ngày giao hàng phải theo định dạng ngày/tháng/năm (20/10/2014)
                                                    </span>
                                                </a>

							        </td>
						        </tr>
						       
                                 <tr>
							        <td class="key">
								        <label for="listnhom">Hình thức thanh toán</label>
							        </td>
							        <td>
                                        <asp:TextBox ID="txtpayment" CssClass="inputbox" Width="300" runat="server"></asp:TextBox>
							        </td>
						        </tr>
						       <tr>
							        <td class="key">
								        <label for="txtphone">Thông tin khác</label>
							        </td>
							        <td>
                                        <asp:TextBox ID="txtcontent" CssClass="inputbox" Width="300" runat="server"></asp:TextBox>
							        </td>
						        </tr>
                                 <tr>
							        <td class="key">
								        <label for="listnhom">Trạng thái</label>
							        </td>
							        <td>
							            <asp:DropDownList ID="ddlstatusdt" runat="server" Width="300" CssClass="inputbox">
                                            <asp:ListItem Value="0" Text=" Mới đặt hàng"></asp:ListItem>
                                            <asp:ListItem Value="1" Text=" Đã giao hàng và thanh toán"></asp:ListItem>
                                             <asp:ListItem Value="3" Text=" Đã thanh toán"></asp:ListItem>
                                            <asp:ListItem Value="2" Text=" Đang chờ giao hàng"></asp:ListItem>
                                            <asp:ListItem Value="-3" Text=" Đã hủy"></asp:ListItem>
                                            
							            </asp:DropDownList>
							        </td>
						        </tr>
                                <tr>
							        <td class="key">
								        <label for="listnhom">Ngày cập nhật</label>
							        </td>
							        <td>
								        <asp:Literal ID="ltupdate" runat="server"></asp:Literal>							</td>
						        </tr>
                            </table>
                                         </div>
                                </div>
                                <div class="col-sm-6">
                                     <div class="block_sp">
                                    <h3>2. Chi tiết đơn hàng</h3>
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
                                         <p style="margin-top:5px;font-size:12px;"><%#Eval("vpr1")%></p>
                                        </a>
                                    </td>
                                    <td align="center">
                                          <input type="text" class="txtnumc" name='<%#Eval("iitemid")%>' id='sl<%#stt() %>'
                            value='<%#Eval("inumber")%>' size="1">
                         <input type="hidden" class="pr<%#m %>" value="<%#Eval("fprice") %>" />
                                    </td>
                                    <td><%#WEB.Products.FomatPrice(Eval("fprice").ToString())%></td>
                                    <td  align="right"><span class="thanhtien<%#m %>"><%#WEB.Products.FomatPrice(Eval("fvalue").ToString())%></span></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                 </table>
                            </FooterTemplate>
                        </asp:Repeater>
                            <p style="text-align:right;padding-top:10px">
                        
                        <span style="font-weight:bold;width:220px;text-align:left;display:inline-block">Tổng tiền:</span><span style="font-weight:bold;width:100px;text-align:right;display:inline-block"><span class="totals_price"><asp:Literal ID="lttotal" runat="server"></asp:Literal></span></span>
                        </p>
                            <p style="text-align:right;padding-top:10px">
                        
                        <span style="font-weight:bold;width:220px;text-align:left;display:inline-block">Phí vận chuyển:</span><span style="font-weight:bold;width:100px;text-align:right;display:inline-block"><asp:TextBox Width="70" onkeypress=" return isNumberKey(event)" ID="txtship" Text="0" runat="server" CssClass="inputbox"></asp:TextBox><asp:Literal ID="ltvanchuyen" runat="server"></asp:Literal></span>
                        </p>
                              <p style="text-align:right;padding-top:10px;display:none">
                        
                        <span style="font-weight:bold;width:220px;text-align:left;display:inline-block">Mã khuyến mại - <asp:Literal ID="ltcodecoupon" runat="server"></asp:Literal> (giảm):</span><span style="font-weight:bold;width:100px;text-align:right;display:inline-block"><asp:Literal ID="ltcoupon" runat="server"></asp:Literal></span>
                        </p>
						<p style="text-align:right;padding-top:10px">
                        
                        <span style="font-weight:bold;width:220px;text-align:left;display:inline-block">Tổng đơn hàng:</span><span style="font-weight:bold;width:100px;text-align:right;display:inline-block"><span class="tt_price"><asp:Literal ID="lttotalvnd" runat="server"></asp:Literal></span></span>
                        </p>
                          <input type="hidden" value="<%=numitemincart %>" name="numitemincart" id="numitemincart" />
						
                                </div>
                            </div>
                               
						</div>
                            
					</div>
                        <div>
                           
                            <div class="col-sm-6">
                                  <h3>1. Thông tin khách hàng</h3>
                            <table cellspacing="1" class="admintable">
						<tbody><tr>
							<td width="150" class="key">
								<label for="txtuser">Họ tên:</label>
							</td>
							<td>
                                 <asp:TextBox ID="txtname" runat="server"  CssClass="inputbox" Width="300"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="txtphone">Email:</label>
							</td>
							<td>
                                 <asp:TextBox ID="txtemail" runat="server"  CssClass="inputbox" Width="300"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="txtphone">Số điện thoại:</label>
							</td>
							<td>
                                 <asp:TextBox ID="txtphone" runat="server"  CssClass="inputbox" Width="300"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="txtphone">Địa chỉ:</label>
							</td>
							<td>
                                 <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="inputbox" Rows="3" Columns="43" runat="server"></asp:TextBox>
							</td>
						</tr>
                            </tbody>
						</table>
                                </div>
                            <div class="col-sm-6">
                                  <h3>2. Thông tin nhận hàng</h3>
                                <table cellspacing="1" class="admintable">
						<tbody><tr>
							<td width="150" class="key">
								<label for="txtuser">Họ tên:</label>
							</td>
							<td>
                                 <asp:TextBox ID="txtdname" runat="server"  CssClass="inputbox" Width="300"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="txtphone">Email:</label>
							</td>
							<td>
                                 <asp:TextBox ID="txtdemail" runat="server"  CssClass="inputbox" Width="300"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="txtphone">Số điện thoại:</label>
							</td>
							<td>
                                 <asp:TextBox ID="txtdphone" runat="server"  CssClass="inputbox" Width="300"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="txtphone">Địa chỉ:</label>
							</td>
							<td>
                                 <asp:TextBox ID="txtdaddress" TextMode="MultiLine" CssClass="inputbox" Rows="3" Columns="43" runat="server"></asp:TextBox>
							</td>
						</tr>
                            </tbody>
						</table>
                            </div>
                            <div class="clear"></div>
                        </div>

                         <div>
                        
                                  <h3>Thông tin thành viên</h3>
                            <table cellspacing="1" class="admintable">
						<tbody><tr>
							<td width="150" class="key">
								<label for="txtuser">Họ tên:</label>
							</td>
							<td>
                                 <asp:Literal ID="ltname" runat="server"></asp:Literal>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="txtphone">Email:</label>
							</td>
							<td>
                                  <asp:Literal ID="ltemail" runat="server"></asp:Literal>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="txtphone">Số điện thoại:</label>
							</td>
							<td>
                                  <asp:Literal ID="ltphone" runat="server"></asp:Literal>
							</td>
						</tr>
                            <tr>
							<td class="key">
								<label for="txtphone">Giới tính:</label>
							</td>
							<td>
                                  <asp:Literal ID="ltgender" runat="server"></asp:Literal>
							</td>
						</tr>
                            <tr>
							<td class="key">
								<label for="txtphone">Ngày sinh:</label>
							</td>
							<td>
                                  <asp:Literal ID="ltngaysinh" runat="server"></asp:Literal>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="txtphone">Địa chỉ:</label>
							</td>
							<td>
                                 <asp:Literal ID="ltaddress" runat="server"></asp:Literal>
							</td>
						</tr>
                            </tbody>
						</table>
                         
                        </div>


					</div>
                      </div>
					<input type="hidden" value="" id="hndId" name="hndId">
			    
			 </asp:Panel>
			<asp:HiddenField ID="hdid" runat="server" Visible="false" />
			<asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
			<p class="c_page"><asp:Literal ID="ltpage" runat="server"></asp:Literal></p>
			</div>
			
   		</div>
   		
<script type="text/javascript">
    $(document).ready(function () {
        //Horizontal Tab
        $('#parentHorizontalTabcontent').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function (event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });

    });
</script>
<style>
    .tbcartdetail  tr td {
    background: #fff;
    padding: 5px;
}
    .txtnumc {
        padding: 3px;
        border: 1px solid #c0c0c0;
    }
    table.adminlist tbody tr td.key {
        background: #f0f0f0;
    }
    .tbcartdetail  {
    border-spacing: 1px;
    background: #E7E7E7;
}
    .tbcartdetail .hdtb td {
        background:#f0f0f0;
        line-height:30px;
    }
</style>