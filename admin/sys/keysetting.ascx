<%@ control language="C#" autoeventwireup="true" inherits="admin_sys_keysetting, App_Web_ohhcisur" %>
<div class="widget">

    <div class="widget-title">
   
        <div class="widget-title">
            <h4><i class="icon-reorder">
                <asp:Literal ID="lttitle" runat="server"></asp:Literal></i></h4>
            <div class="ui-widget-content ui-corner-top ui-corner-bottom">
                <div id="toolbox">

                    <div style="float: right; margin-right: 10px;display:none" class="toolbox-content">

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
                                    <asp:LinkButton ID="lnkupdate" runat="server" CssClass="toolbar" OnClientClick="return validation()" >
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
		
			 <asp:Panel ID="pndetail" runat="server">
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
								<label for="txtuser">Keysetting</label>
							</td>
							<td>
								<asp:TextBox ID="key" runat="server" Width="305" CssClass="inputbox"></asp:TextBox> 
                                 <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Keysetting</b><br />
                                                                  Nhập vào mã Keysetting để xóa trong trường hợp không cập nhật được giá trị cho Keysetting
                                                                </span>
                                                            </a>
							</td>
						</tr>
                            <tr>
							<td width="150" class="key">
								<label for="txtuser"></label>
							</td>
							<td>
                                <asp:Button ID="btnupdate" OnClick="btnupdate_Click" runat="server" Text=" Xóa dữ liệu " />
								
							</td>
						</tr>
						<tr>
			
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