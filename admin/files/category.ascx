<%@ Control Language="C#" AutoEventWireup="true" CodeFile="category.ascx.cs" Inherits="admin_products_category" %>

<div class="widget">
  
    <div class="widget-title">
        <%--Header--%>
          <asp:Literal ID="lt_mess" runat="server"></asp:Literal>
        <div class="widget-title">
            <h4><i class="icon-reorder"><asp:Literal ID="lttitle" runat="server"></asp:Literal></i></h4>
            <div class="ui-widget-content ui-corner-top ui-corner-bottom">
    <div id="toolbox">
        
        <div style="float:right;margin-right: 10px;" class="toolbox-content">
            
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
                                <asp:LinkButton ID="lnkupdate" runat="server" CssClass="toolbar" OnClientClick="return validation()"  OnClick="lnkupdate_Click" >
							<span class="icon-ok-update"></span>
							Cập nhật
							</asp:LinkButton>
                            </td>
                            <td align="center">
                                <asp:LinkButton ID="lnkclose" runat="server" CssClass="toolbar"  OnClick="lnkclose_Click" >
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
                            <th width="2%" class="title">#</th>
					        <th class="title">
						        Danh mục tài liệu
					        </th>
					         <th style="width:70px; text-align: center !important;" class="title">Thứ tự
                                    </th>
                                    <th  width="13%" style="text-align:center" class="title">Ngày tạo
                                    </th>
                                    <th width="10%" style="text-align:center"  class="title">Người tạo
                                    </th>
					        <th width="8%" class="title">
						       Trạng thái
					        </th>
                            <th width="8%" class="title">
						      
					        </th>
				        </tr>
			        </thead>
			    <tfoot>
				    <tr>
					    <td colspan="10">
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
						   <%#space(Eval("ilevel").ToString()) %><asp:LinkButton ID="LinkButton1"  Enabled='<%#checkrole("2612") %>' CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                        runat="server" ToolTip="Sửa"><%#Eval("vname")%></asp:LinkButton>
					    </td>
					    
    				<td align="center"><%#Eval("iorders")%></td>
                                   
                                <td align="center"><%#Convert.ToDateTime( Eval("dcreatedate")).ToString("dd/MM/yyyy HH:mm") %>
                                </td>
                                <td align="center"><%#Eval("vusercreate") %>
                                </td>
					    <td align="center">
					        <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")+"|"+Eval("istatus")%>'
                                        runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>				</td>
                                        <td align="center">
                                            <asp:LinkButton ID="LinkButton3" CommandName="EditDetail" Visible='<%#checkrole("2612") %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                        runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton> &nbsp &nbsp
                                            <asp:LinkButton ID="LinkButton4" CommandName="delete" Visible='<%#checkrole("2613") %>'  OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
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
                 <span class='detail_error'><asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></span>
                             <div style="  width: 98% !important;" id="parentHorizontalTab" class="divvalidate">
            <ul class="resp-tabs-list hor_1">
                <li>Thông tin chung</li>
                  <li style="display:none">Thông tin thêm</li>
                <li>Thiết lập SEO</li>
                   <li>Người quản lý</li>
            </ul>
            <div class="resp-tabs-container hor_1">
                <div>
                    <p>
                       
						<table cellspacing="1" class="admintable">
						<tbody>
						<tr>
							<td width="150" class="key">
								<label for="txtuser">Tiêu đề (<span class="requirecss">*</span>)</label>
							</td>
							<td>
								<asp:TextBox ID="txtname" runat="server" name="txtname" Width="350" CssClass="inputbox error"   minlength="2"  required="" aria-required="true" aria-invalid="true"></asp:TextBox>
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Tiêu đề danh mục</b><br />
                                                        Nhập tiêu đề của danh mục tài liệu, độ dài tiêu đề không quá 150 ký tự
                                                    </span>
                                                </a>
							</td>
						</tr>
						 <tr>
							<td width="150" class="key">
								<label for="txtuser">Thuộc danh mục (<span class="requirecss">*</span>)</label>
							</td>
							<td>
								<asp:DropDownList ID="ddlcate" runat="server" Width="350" CssClass="inputbox"></asp:DropDownList>
                                 <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Thuộc danh mục</b><br />
                                                        Lựa chọn danh mục cha
                                                    </span>
                                                </a>
							</td>
						</tr>
						 
						
						<tr style="display:none">
							<td class="key">
								<label for="txtphone">Hiển thị tại trang chủ</label>
							</td>
							<td>
							   <asp:CheckBox ID="chkdisplayhome" runat="server" Text=" Hiển thị" />
							</td>
						</tr>
						
						
						<tr>
							<td class="key">
								<label for="listnhom">Thứ tự (<span class="requirecss">*</span>)</label>
							</td>
							<td>
							    <asp:TextBox ID="txtorder" CssClass="inputbox" Width="120"  runat="server"></asp:TextBox>
							    <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Thứ tự</b><br />
                                                        Lựa chọn thứ tự hiện thị danh mục
                                                    </span>
                                                </a>
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
						
								<asp:Literal ID="ltlink" runat="server"></asp:Literal>
						
						</tbody></table>
                    </p>
                   
                </div>
                <div  style="display:none">
                    <table class="admintable">
                        <tr>
							<td width="150" class="key">
								<label for="txtuser">Mô tả</label>
							</td>
							<td>
								<asp:TextBox ID="txt_mota" TextMode="MultiLine" Columns="70" Rows="7" runat="server" CssClass="inputbox"></asp:TextBox>
                                 <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Mô tả</b><br />
                                                        Mô tả ngắn gọn cho danh mục album
                                                    </span>
                                                </a>
							</td>
						</tr>
                        
                        <tr style="display:none">
							<td valign="top" class="key">
								<label for="txtphone">Icon</label>
							</td>
							<td>
                                  <asp:HiddenField ID="hd_imgicon" runat="server" Visible="false" />
                                
								<asp:FileUpload ID="flupicon" ToolTip="Icon" runat="server" CssClass="upload-file" /><br />
								<asp:Literal ID="lt_icon" runat="server"></asp:Literal>
							</td>
                            
						</tr>
						<tr style="display:none">
							<td valign="top" class="key">
								<label for="txtphone">Ảnh đại diện</label>
							</td>
							<td>
                                <asp:HiddenField ID="hdimg_old" runat="server" Visible="false" />
                               
								<asp:FileUpload ID="flupload" ToolTip="Ảnh đại diện" runat="server" CssClass="upload-file" /><br />
								 <asp:Literal ID="ltimage" runat="server"></asp:Literal>
							</td>
                         
						</tr>
                    </table>
                </div>
                <div>
                   
                    <p>
                         <table class="admintable">
						        <tbody>
                                     <tr>
                                            <td valign="top">Tối ưu SEO</td>
                                            <td>
                                                <div>
                                                    <span class="page-title-seo"><%=itemtitle %></span>
                                                    <div class="page-description-seo ws-nm"><span><%=itemurl %></span></div>
                                                    <div class="page-url-seo ws-nm">
                                                        <%=itemdescription %>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
						            <tr>
							<td width="150" class="key">
								<label for="txttitle">Thẻ tiêu đề trang</label>
							</td>
							<td>
								<asp:TextBox ID="txttitleweb" runat="server" CssClass="inputbox" Width="460"></asp:TextBox>
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Tiêu đề trang</b><br />
                                                        Nội dung được hiển thị dưới dạng tiêu đề trong kết quả tìm kiếm và trên trình duyệt của người dùng.
                                                    </span>
                                                </a>
							</td>
						</tr>
                                      <tr>
                                            <td width="150" class="key">
                                                <label for="txttitle">Đường dẫn</label>   
                                              
                                            </td>
                                            <td>
                                                <div class="next-input--stylized">
                                        <span class="next-input-add-on next-input__add-on--before"><%=weburl %>thu-vien-tai-lieu/</span>
                                       
                                                     <asp:TextBox ID="txturl" Width="335" runat="server" CssClass="txtpa"></asp:TextBox>
                                    </div>
                                              <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Đường dẫn</b><br />
                                                       Đường dẫn tới danh mục tài liệu
                                                    </span>
                                                </a>   
                                              
                                            </td>
                                        </tr>
						<tr>
							<td width="150" class="key">
								<label for="txtkeyword">Thẻ từ khóa</label>
							</td>
							<td>
								<asp:TextBox ID="txtkeyword" runat="server"  CssClass="inputbox" TextMode="MultiLine" Rows="5"  Height="80" Columns="50"></asp:TextBox>
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Thẻ từ khóa</b><br />
                                                        Mô tả các từ khóa chính của website
                                                    </span>
                                                </a>
							</td>
						</tr>
						<tr>
							<td class="key">
								<label for="txtdesciption">Thẻ mô tả</label>
							</td>
							<td>
								<asp:TextBox ID="txtdesc" runat="server" CssClass="inputbox" TextMode="MultiLine" Height="80" Rows="5" Columns="50"></asp:TextBox>
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Thẻ mô tả</b><br />
                                                        Cung cấp một mô tả ngắn của trang. Trong vài trường hợp, mô tả này được sử dụng như một phần của đoạn trích được hiển thị trong kết quả tìm kiếm.
                                                    </span>
                                                </a>
							</td>
						</tr>
						        </tbody>
						    </table>
                    </p>
                  
                </div>
                  <div class="nql">
                                          <p style="font-weight:bold;line-height:30px;">Danh sách người có quyền quản lý sản phẩm trong danh mục này</p>
                                        <asp:Literal ID="ltnguoiquanly" runat="server"></asp:Literal>
                                    </div>
            </div>
        </div>
					<input type="hidden" value="" id="hndId" name="hndId">
			    
			    </asp:Panel>
			<asp:HiddenField ID="hdicid" runat="server" Visible="false" />
			<asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
                     <asp:HiddenField ID="hdalias" runat="server" Visible="false" />
                  <asp:HiddenField ID="hdname" runat="server" Visible="false" />
                  <asp:HiddenField ID="hdnguoiquanly" runat="server" Visible="false" />
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
    label.error,label.error{color:red;font-style:italic}div.error{display:none;}
</style>