<%@ control language="C#" autoeventwireup="true" inherits="admin_accounts_info, App_Web_u0cwcr4d" %>
<div class="widget">

    <div class="widget-title">
   
        <div class="widget-title">
            <h4><i class="icon-reorder">
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
                                    <asp:LinkButton ID="lnkdelete" runat="server" CssClass="toolbar" OnClientClick="return confirm('Bạn có muốn xóa dữ liệu không?')" >
							<span class="icon-ok-delete"></span>
							Xóa
                                    </asp:LinkButton>
                                </td>
                                <td align="center">
                                    <asp:LinkButton ID="lnkupdate" runat="server" CssClass="toolbar" OnClientClick="return validation()" OnClick="lnkupdate_Click">
							<span class="icon-ok-update"></span>
							Cập nhật
                                    </asp:LinkButton>
                                </td>
                                <td align="center">
                                    <asp:LinkButton Visible="false" ID="lnkclose" runat="server" CssClass="toolbar">
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
        <%----//----%>
        <%--Content-products--%>
        <div class="widget-body">
		<div id="element-box">
			
			<div class="m">
			<div id="adminForm1">
			
			 <asp:Panel ID="pndetail" runat="server" Visible="false">
                   <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal>
			   <div id="parentHorizontalTab" class="divvalidate">
                                <ul class="resp-tabs-list hor_1">
                                    <li>Thông tin chung</li>
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
						
						<table cellspacing="1" class="admintable">
						<tbody><tr>
							<td width="150" class="key">
								<label for="txtuser">Tài khoản</label>
							</td>
							<td>
								<asp:TextBox ID="txtusername" runat="server" Width="250" CssClass="inputbox"></asp:TextBox>
                                <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Tài khoản</b><br />
                                                                   Tài khoản viết liền và không dấu (VD: admin,quantri,...)
                                                                </span>
                                                            </a>
							</td>
						</tr>
                            <tr>
							<td class="key">
								<label for="txtpass">Vai trò</label>
							</td>
							<td>
                                <asp:DropDownList ID="ddlroles" runat="server"  CssClass="inputbox"></asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="txtpass">Mật khẩu</label>
							</td>
							<td>
								<asp:TextBox ID="txtpass" TextMode="Password" runat="server" Width="250" CssClass="inputbox"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="txtrepass">Nhắc lại mật khẩu</label>
							</td>
							<td>
								<asp:TextBox ID="txtrepass" TextMode="Password" runat="server" Width="250" CssClass="inputbox"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="txthoten">Họ và tên</label>
							</td>
							<td>
								<asp:TextBox ID="txtname" runat="server" Width="250" CssClass="inputbox"></asp:TextBox>
                                <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Họ và tên</b><br />
                                                                   Họ tên của người quản trị
                                                                </span>
                                                            </a>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="txthoten">Điện thoại</label>
							</td>
							<td>
								<asp:TextBox ID="txtphone" runat="server" Width="250" CssClass="inputbox"></asp:TextBox>
                              
							</td>
						</tr>
                            <tr>
							<td class="key">
								<label for="txthoten">Email</label> 
							</td>
							<td>
								<asp:TextBox ID="txtmail" runat="server" Width="250" CssClass="inputbox"></asp:TextBox>
                                <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Email</b><br />
                                                                  Email dùng để reset lại mật khẩu trong trường hợp quên mật khẩu
                                                                </span>
                                                            </a>
							</td>
						</tr>
                              <tr>
							<td class="key">
								<label for="txthoten">Địa chỉ</label>
							</td>
							<td>
								<asp:TextBox ID="txtaddress" runat="server" Width="450" CssClass="inputbox"></asp:TextBox>
                              
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="listnhom">Trạng thái</label>
							</td>
							<td>
							    <asp:CheckBox ID="chkstatus" runat="server" Text=" Hiển thị" />
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="listnhom">Ngày tạo</label>
							</td>
							<td>
								<asp:Literal ID="ltdatetime" runat="server"></asp:Literal></td>
						</tr>
						</tbody></table>
						</div>
                        
                                    </div>
                      </div>
					<input type="hidden" value="" id="hndId" name="hndId">
			    
			 </asp:Panel>
			<asp:HiddenField ID="hdid" runat="server" Visible="false" />
			<asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
			<asp:HiddenField ID="hdvusername_old" runat="server" Visible="false" />
			</div>
			<div class="clr"></div>
			</div>
			
   		</div>
   	 </div>
        <%--//--%>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        //Horizontal Tab
        $('#parentHorizontalTab').easyResponsiveTabs({
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
