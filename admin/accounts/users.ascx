<%@ control language="C#" autoeventwireup="true" inherits="admin_users_users, App_Web_u0cwcr4d" %>
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
                                    <asp:LinkButton ID="lnkdelete" runat="server" CssClass="toolbar" OnClientClick="return confirm('Bạn có muốn xóa dữ liệu không?')" OnClick="lnkdelete_Click">
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
        <%----//----%>
        <%--Content-products--%>
        <div class="widget-body">
		<div id="element-box">
			
			<div class="m">
			<div id="adminForm1">
			<asp:Panel ID="pnlist" runat="server">
			
                <asp:Repeater ID="rpitems" runat="server" OnItemCommand="rpitems_ItemCommand">
                <HeaderTemplate>
			    <table cellpadding="1" summary="" class="adminlist">
			        <thead>
				        <tr>
					        
					        <th width="3%" class="title">
						        <input type="checkbox" id="chkToggle" value="" onclick="selectAll(this)" name="chkToggle">
					        </th>
                            <th width="3%" class="title">#</th>
					        <th class="title" width="15%">
						        Tài khoản
					        </th>
					        <th  class="title">
						        Họ tên
					        </th>
        					<th width="15%" class="title">
						       Số điện thoại / Email
					        </th>
                           
					      
					        <th width="10%" nowrap="nowrap" class="title">
						        Ngày tạo
					        </th>
                            <th width="10%" nowrap="nowrap" class="title">
						        Truy cập lần cuối
					        </th>
                              <th align="center" width="10%" class="title">
						        Trạng thái
					        </th>
					        <th width="80" nowrap="nowrap" class="title">
						       
					        </th>
				        </tr>
			        </thead>
			   
			    </HeaderTemplate>
			    <ItemTemplate>
			        <tbody>
								    <tr class="row0">
					  
					    <td align="center">
						    <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("iuser_web") %>" id='cb_' name='cb_'>
					    </td>
                        <td align="center"><%#getstt()%></td>
					    <td>
						   <asp:LinkButton ID="LinkButton1" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iuser_web")%>'
                                        runat="server" ToolTip="Sửa"><%#Eval("vusername")%></asp:LinkButton>
					    </td>
					    <td align="left"><%#Eval("vname")%></td>
    				<td align="center"><%#Eval("vphone")%> / <%#Eval("vemail")%></td>
                                        
					  
					    <td align="center"><%#formatdate(Convert.ToDateTime( Eval("dcreate").ToString()))%></td>
                                        <td align="center"><%#formatdate(Convert.ToDateTime( Eval("ddatetime").ToString()))%></td>
                                          <td align="center">
					        <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iuser_web")+"|"+Eval("istatus")%>'
                                        runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>				</td>
					    <td align="center">
                                   <asp:LinkButton ID="LinkButton4" CommandName="EditDetail" Visible="<%#edit %>" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iuser_web")%>'
                                                                runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton> &nbsp &nbsp
                                                                    <asp:LinkButton ID="LinkButton5" Visible="<%#delete %>" CommandName="delete"  OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iuser_web")%>'
                                                                runat="server" ToolTip="Xóa"><img src="<%=weburl%>templates/admin/images/icondelete_c.png" /></asp:LinkButton>
					    </td>
				    </tr>
				    </tbody>
		        </ItemTemplate>
		        <FooterTemplate>
			        </table>
			    </FooterTemplate>
			    </asp:Repeater>
			 </asp:Panel>
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
