<%@ control language="C#" autoeventwireup="true" inherits="admin_member_member, App_Web_pol44yvs" %>
<div class="widget">

    <div class="widget-title">
        <%--Header--%>
       
        <div class="widget-title">
            <h4><i class="icon-reorder">
                <asp:Literal ID="lttitle" runat="server"></asp:Literal></i></h4>
            <div class="ui-widget-content ui-corner-top ui-corner-bottom">
                <div id="toolbox">

                    <div style="float: right; margin-right: 10px;" class="toolbox-content">

                        <table class="toolbar">
                            <tr>


                                <td align="center">
                                    <asp:LinkButton ID="lnkadd" Visible="false" runat="server" CssClass="toolbar" OnClick="lnkadd_Click">
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
			<asp:Panel ID="pnlist" runat="server">
			 <div class="row-fluid">
                    <div class="span3">
                        <div style="margin-top: 4px; font-size: 12px; font-style: italic;">
                            <asp:Literal ID="lt_count" runat="server"></asp:Literal>

                        </div>
                     
                    </div>
                    <div class="span9">
                        <div class="pagination pagination-small pagination-right">
                            <asp:TextBox ID="txtkeysearch" CssClass="inputbox-top" runat="server" Width="150"></asp:TextBox>
                            <asp:DropDownList ID="ddlstatus" runat="server" CssClass="inputbox-top-select"  Width="130" >
                                <asp:ListItem Value="-1" Text="Tất cả trạng thái"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Đã kích hoạt"></asp:ListItem>
                                <asp:ListItem Value="0" Text="Chưa kích hoạt"></asp:ListItem>
                            </asp:DropDownList>
                             <asp:DropDownList ID="ddlorder" Width="110" CssClass="inputbox-top-select" runat="server">
                               <asp:ListItem Text="SX.Ngày tạo" Value="0"></asp:ListItem>
                                <asp:ListItem Text="SX.Tên truy cập" Value="1"></asp:ListItem>
                                  <asp:ListItem Text="SX.Truy cập lần cuối" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlordertype" Width="110" CssClass="inputbox-top-select" runat="server">
                                <asp:ListItem Text="Giảm dần" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Tăng dần" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btnsearch" OnClick="btnsearch_Click" runat="server" CssClass="buton-css" Text="Tìm kiếm" />
                        </div>
                       
                    </div>
                </div>
                <div class="page-items">
                    <asp:Literal ID="ltpage" runat="server"></asp:Literal>
                </div>
                <asp:Repeater ID="rpitems" runat="server" OnItemCommand="rpitems_ItemCommand">
                <HeaderTemplate>
			    <table cellpadding="1" summary="" class="adminlist">
			        <thead>
				        <tr>
					        <th width="2%" class="title">#</th>
					        <th width="3%" class="title">
						        <input type="checkbox" id="chkToggle" value="" onclick="selectAll(this)" name="chkToggle">
					        </th>
					        <th class="title">
						        Tên đăng nhập / email
					        </th>
					        <th width="25%" class="title">
						        Họ tên
					        </th>
        					
					        <th width="110" class="title">
						        Điện thoại
					        </th>
					        
					        <th width="120" align="center" class="title">
						        Ngày tạo
					        </th>
                            <th width="125" nowrap="nowrap" class="title">
						        Truy cập lần cuối
					        </th>
                            <th width="90" class="title">
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
					    <td align="center"><%#Eval("rowindex")%></td>
					    <td align="center">
						    <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("iuserid") %>" id='cb_' name='cb_'>
					    </td>
					    <td>
						   <asp:LinkButton ID="LinkButton1" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iuserid")%>'
                                        runat="server" ToolTip="Sửa"><%#Eval("vusername")%></asp:LinkButton>
					    </td>
					    <td align="left"><%#Eval("vfname")%> <%#Eval("vlname")%></td>
    				   
    				    <td align="center"><%#Eval("vphone")%></td>
                                         <td align="center" style="font-size:12px"><%#formatdate(Convert.ToDateTime(Eval("dreatedate").ToString()))%></td>
                                         <td align="center" style="font-size:12px"><%#formatdate(Convert.ToDateTime(Eval("dlastvisited").ToString()))%></td>
					    <td align="center">
					        <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iuserid")+"|"+Eval("istatus")%>'
                                        runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>				</td>
					   
					      <td align="center">
                                                <asp:LinkButton ID="LinkButton3" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iuserid")%>'
                                                    runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                                &nbsp &nbsp
                                            <asp:LinkButton ID="LinkButton4"  OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandName="delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iuserid")%>'
                                                runat="server" ToolTip="Xóa"><img src="<%=weburl%>templates/admin/images/icondelete_c.png" /></asp:LinkButton>
                                            </td>
				    </tr>
				    </tbody>
		        </ItemTemplate>
		        <FooterTemplate>
			        </table>
			    </FooterTemplate>
			    </asp:Repeater>
                  <div class="page-items">
                    <asp:Literal ID="lt_pagebotom" runat="server"></asp:Literal>
                </div>
			 </asp:Panel>
			 <asp:Panel ID="pndetail" runat="server" Visible="false">
                 <span class='detail_error'><asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></span>
			    <div style="width: 98% !important;" id="parentHorizontalTab" class="divvalidate">

                                <ul class="resp-tabs-list hor_1">
                                    <li>Thông tin chi tiết</li>
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
						
						<table cellspacing="1" class="admintable">
						<tbody>
						 <tr>
                             <td width="150" class="key">
								<label for="txtuser">Email</label>
							</td>
                             <td><asp:TextBox ID="txtemail" runat="server" Width="250"  CssClass="inputbox"></asp:TextBox></td>
                         </tr>
						<tr>
							<td width="150"  class="key">
								<label for="txthoten">Họ</label>
							</td>
							<td>
								<asp:TextBox ID="txtfname" runat="server" Width="250" CssClass="inputbox"></asp:TextBox>
							</td>
						</tr>
						
						<tr>
							<td class="key">
								<label for="txthoten">Tên</label>
							</td>
							<td>
								<asp:TextBox ID="txtlname" runat="server" Width="250" CssClass="inputbox"></asp:TextBox>
							</td>
						</tr>
                         
                         
                         <tr>
                             <td width="150" class="key">
								<label for="txtuser">Giới tính</label>
							</td>
                             <td><asp:DropDownList ID="ddlsex" CssClass="inputbox" runat="server">
                                <asp:ListItem Text="Nam" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Nữ" Value="0"></asp:ListItem>
                             </asp:DropDownList></td>
                         </tr>
                         <tr>
                             <td width="150" class="key">
								<label for="txtuser">Ngày sinh</label>
							</td>
                             <td><asp:TextBox ID="txtbirthday" runat="server" CssClass="inputbox" Width="150"></asp:TextBox> (ngày/tháng/năm)</td>
                         </tr>
                         <tr>
                             <td width="150" class="key">
								<label for="txtuser">Địa chỉ</label>
							</td>
                             <td><asp:TextBox ID="txtaddress" runat="server" Width="450"  CssClass="inputbox"></asp:TextBox></td>
                         </tr>
                         <tr>
                             <td width="150" class="key">
								<label for="txtuser">Số điện thoại</label>
							</td>
                             <td><asp:TextBox ID="txtphone" runat="server" Width="150"  CssClass="inputbox"></asp:TextBox></td>
                         </tr>
                         
                        <tr>
                             <td width="150" class="key">
								<label for="txtuser">Mật khẩu</label>
							</td>
                             <td><asp:TextBox ID="txtpass" TextMode="Password" Width="150" runat="server" CssClass="inputbox"></asp:TextBox>
                             &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkupdatepass" Text=" Cập nhật mật khẩu" runat="server" />
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
								<label for="listnhom">Ngày đăng ký</label>
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
			<asp:HiddenField ID="hdid" runat="server" Visible="false" />
			<asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
			<asp:HiddenField ID="hdvusername_old" runat="server" Visible="false" />
			<asp:HiddenField ID="hdemail" runat="server" Visible="false" />
		 </div>
                    <div class="clr"></div>
                </div>
            </div>
        </div>
        <%--//--%>
    </div>
</div>
<script type="text/javascript">
    function validation() {
        //validation ở đây nha
        return true;
    }
    $.validator.setDefaults({
        submitHandler: function () {
            alert("submitted!");
        }
    });
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

        // Child Tab
        $('#ChildVerticalTab_1').easyResponsiveTabs({
            type: 'vertical',
            width: 'auto',
            fit: true,
            tabidentify: 'ver_1', // The tab groups identifier
            activetab_bg: '#fff', // background color for active tabs in this group
            inactive_bg: '#F5F5F5', // background color for inactive tabs in this group
            active_border_color: '#c1c1c1', // border color for active tabs heads in this group
            active_content_border_color: '#5AB1D0' // border color for active tabs contect in this group so that it matches the tab head border
        });

        //Vertical Tab
        $('#parentVerticalTab').easyResponsiveTabs({
            type: 'vertical', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function (event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo2');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });


        $(".divvalidate").validate({
            rules: {
                controls1$ctl00$ctl00$ctl00$txtname: "required"

            },
            messages: {
                controls1$ctl00$ctl00$ctl00$txtname: "Please enter your firstname"

            }
        });
    });
</script>


<style>
    label.error, label.error {
        color: red;
        font-style: italic;
    }

    div.error {
        display: none;
    }
</style>

