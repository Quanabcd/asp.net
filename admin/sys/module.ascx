<%@ control language="C#" autoeventwireup="true" inherits="admin_sys_module, App_Web_ohhcisur" %>
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
					       
					        <th class="title">
						        Tiêu đề 
					        </th>
					        
        					<th align="center" width="8%" class="title">
						       Thứ tự
					        </th>
					        <th width="8%" class="title">
						        Trạng thái
					        </th>
					        <th width="10%" nowrap="nowrap" class="title">
						        Ngày cập nhật
					        </th>
					        <th  width="80" ></th>
				        </tr>
			        </thead>
			    <tfoot>
				    <tr>
					    <td colspan="7">
						    <del class="container"><div class="pagination"><div class="limit"></div><div class="limit"></div></div></del>
					    </td>
				    </tr>
			    </tfoot>
			    </HeaderTemplate>
			    <ItemTemplate>
			        <tbody>
								    <tr class="row0">
					 
					    <td align="center">
						    <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("icid") %>" id='cb_' name='cb_'>
					    </td>
                         <td align="center"><%#getstt()%></td>
					    <td>
						   <%#space(Eval("ilevel").ToString()) %><asp:LinkButton ID="LinkButton1" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                        runat="server" ToolTip="Sửa"><%#Eval("vname")%></asp:LinkButton>
					    </td>
					    
    				<td align="center"><%#Eval("iorders")%></td>
					    <td align="center">
					        <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")+"|"+Eval("istatus")%>'
                                        runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>				</td>
					    <td align="center"><%#formatdate(Convert.ToDateTime(Eval("dcreatedate").ToString()))%></td>
					    
                                                                <td align="center">
                                                                    <asp:LinkButton ID="LinkButton4" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                                runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton> &nbsp &nbsp
                                                                    <asp:LinkButton ID="LinkButton5" CommandName="delete"  OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
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
                  <asp:Literal ID="lt_mess" runat="server"></asp:Literal>
			      <div id="parentHorizontalTab" class="divvalidate">
                                <ul class="resp-tabs-list hor_1">
                                    <li>Thông tin chung</li>
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
						<table cellspacing="1" width="100%"  class="admintable">
						<tbody>
						
						 
						 <tr>
							<td width="150" class="key">
								<label for="txtuser">Tiêu đề module</label>
							</td>
							<td>
								<asp:TextBox ID="txtname" runat="server" Width="305" CssClass="inputbox"></asp:TextBox> 
							</td>
						</tr>
						<tr>
							<td width="150" class="key">
								<label for="txtuser">Mã số</label>
							</td>
							<td>
								<asp:TextBox ID="txtnum" runat="server" Width="100" CssClass="inputbox"></asp:TextBox> 
                                 <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Mã số</b><br />
                                                                   Mã số của module phải là số (VD: 1,2,3...)
                                                                </span>
                                                            </a>
							</td>
						</tr>
                            <tr>
							<td width="150" class="key">
								<label for="txtuser">Mã module</label>
							</td>
							<td>
								<asp:TextBox ID="txtcode" runat="server" Width="100" CssClass="inputbox"></asp:TextBox> 
                                 <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Mã module</b><br />
                                                                   Mã số của module phải là chữ (VD: MPR,MNW,...)
                                                                </span>
                                                            </a>
							</td>
						</tr>
                               <tr>
							<td width="150" class="key">
								<label for="txtuser">Liên kết</label>
							</td>
							<td>
								<asp:TextBox ID="txtlink" runat="server" Width="200" CssClass="inputbox"></asp:TextBox> 
                                 <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Liên kết</b><br />
                                                                   Liên kết của module (VD: san-pham,tin-tuc,...)
                                                                </span>
                                                            </a>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="listnhom">Thứ tự</label>
							</td>
							<td>
							    <asp:TextBox ID="txtorder" CssClass="inputbox" Width="50"  runat="server"></asp:TextBox>
                                 <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Thứ tự</b><br />
                                                                   Thứ tự hiển thị của menu (VD: 1,2,3...)
                                                                </span>
                                                            </a>
							    
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="listnhom">Tùy chọn</label>
							</td>
							<td>
							    <asp:CheckBox ID="chkhascategory" runat="server" Text=" Có danh mục" /><br />
                                 <asp:CheckBox ID="chkaisearch" runat="server" Text=" Được AI tìm kiếm" />
							    
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
								<asp:Literal ID="ltdatetime" runat="server"></asp:Literal>							</td>
						</tr>
						</tbody></table>
						</div>
                        
                                    </div>
                      </div>
					<input type="hidden" value="" id="hndId" name="hndId">
			    
			 </asp:Panel>
			<asp:HiddenField ID="hdicid" runat="server" Visible="false" />
			<asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
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