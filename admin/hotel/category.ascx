<%@ Control Language="C#" AutoEventWireup="true" CodeFile="category.ascx.cs" Inherits="admin_products_category" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<div class="widget">

    <div class="widget-title">
        <%--Header--%>
        <asp:Literal ID="lt_mess" runat="server"></asp:Literal>
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
						                            Danh mục hotel
					                            </th>
					                             <th style="width: 80px; text-align: center !important;" class="title">Thứ tự
                                                        </th>
                                                   <th width="10%" style="text-align:center"  class="title">Thao tác
                                                        </th>
                                                        <th  width="140" style="text-align:center" class="title">Thời gian
                                                        </th>
                                                      
					                            <th width="8%" class="title">
						                           Trạng thái
					                            </th>
                                                <th width="100" class="title">
						      
					                            </th>
				                            </tr>
                                        </thead>
                                       
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tbody>
                                      	    <tr class="row0">
                                                 <td align="center">
						                            <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("icid") %>" id='cb_' name='cb_'>
					                            </td>
					                            <td align="center"><%#getstt()%></td>
					    
					                            <td>
						                           <%#space(Eval("ilevel").ToString()) %><asp:LinkButton ID="LinkButton1" Enabled='<%#checkrole("2012") %>' CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                                runat="server" ToolTip="Sửa"><%#Eval("vname")%></asp:LinkButton>
					                            </td>
					    
    				                        <td align="center"><%#Eval("iorders")%></td>
                                     <td><%#getusercreateupdate(Eval("vusercreate").ToString(),Eval("vparam5").ToString()) %>
                                                        </td>
                                                        <td><%#getdatecreateupdate(Eval("dcreatedate").ToString(),Eval("dupdatedate").ToString()) %>
                                                        </td>
                                                      
					                            <td align="center">
					                                <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")+"|"+Eval("istatus")%>'
                                                                runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>				</td>
                                                                <td align="center">
                                                                    <a href="<%#weburl %><%#Eval("valias") %>" target="_blank" title="Xem chi tiết"><img src="<%=weburl%>templates/admin/images/view.png" /></a>&nbsp; &nbsp;
                                                                    <asp:LinkButton ID="LinkButton3" visible='<%#checkrole("2012") %>' CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                                runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton> &nbsp; &nbsp;
                                                                    <asp:LinkButton ID="LinkButton4" CommandName="delete"  visible='<%#checkrole("2013") %>'  OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                                runat="server" ToolTip="Xóa"><img src="<%=weburl%>templates/admin/images/icondelete_c.png" /></asp:LinkButton>
                                                                     
                                                                    
                                                                </td>
					    
					  
				                            </tr>
                                    </tbody>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                     <tbody>
                                      	    <tr class="row1">
                                                 <td align="center">
						                            <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("icid") %>" id='cb_' name='cb_'>
					                            </td>
					                            <td align="center"><%#getstt()%></td>
					    
					                            <td>
						                           <%#space(Eval("ilevel").ToString()) %><asp:LinkButton ID="LinkButton1"  Enabled= '<%#checkrole("2012") %>' CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                                runat="server" ToolTip="Sửa"><%#Eval("vname")%></asp:LinkButton>
					                            </td>
					    
    				                        <td align="center"><%#Eval("iorders")%></td>
                                   
                                                      
                                                       <td><%#getusercreateupdate(Eval("vusercreate").ToString(),Eval("vparam5").ToString()) %>
                                                        </td>
                                                    <td><%#getdatecreateupdate(Eval("dcreatedate").ToString(),Eval("dupdatedate").ToString()) %>
                                                        </td>
					                            <td align="center">
					                                <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")+"|"+Eval("istatus")%>'
                                                                runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>				</td>
                                                                <td align="center">
                                                                    <a href="<%#weburl %><%#Eval("valias") %>" target="_blank" title="Xem chi tiết"><img src="<%=weburl%>templates/admin/images/view.png" /></a>&nbsp; &nbsp;
                                                                     <asp:LinkButton ID="LinkButton3" visible='<%#checkrole("2012") %>' CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                                runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton> &nbsp; &nbsp;
                                                                    <asp:LinkButton ID="LinkButton4" CommandName="delete"  visible='<%#checkrole("2013") %>'  OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
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
                        <asp:Panel ID="pndetail" runat="server" Visible="false">
                            <div id="parentHorizontalTab" class="divvalidate">
                                <ul class="resp-tabs-list hor_1">
                                    <li>Thông tin chung</li>
                                    
                                    <li>Tùy chỉnh</li>
                                    <li>Thuộc menu</li>
                                    <li>Thiết lập SEO</li>
                                    <li>Thuộc tính</li>
                                     <li>Người quản lý</li>
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
                                        <p>
                                            <span class='detail_error'>
                                                <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></span>
                                            <table width="100%" cellspacing="1" class="admintable">
                                                <tbody>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Tiêu đề</label> (<span style='color:red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtname" runat="server" name="txtname" Width="350" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Tiêu đề</b><br />
                                                                    Nhập tên danh mục hotel, độ dài tiêu đề không quá 150 ký tự (VD:Điện thoại, máy tính)
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Thuộc danh mục</label>  (<span style='color:red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlcate" runat="server" CssClass="inputbox" Width="350"></asp:DropDownList>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Thuộc danh mục</b><br />
                                                                    Chọn danh mục cha của danh mục hiện tại
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                   

                                                    <tr>
                                                        <td class="key">
                                                            <label for="listnhom">Thứ tự</label>  (<span style='color:red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox onkeypress=" return isNumberKey(event)" ID="txtorder" CssClass="inputbox" Width="80" runat="server"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Thứ tự</b><br />
                                                                    Nhập thứ tự hiển thị của danh mục(VD:1,2,3...)
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
                                                     
                                                </tbody>
                                            </table>
                                        </p>

                                    </div>
                                    <div>
                                        <table>
                                            <tr>
                                                        <td class="key" valign="top">
                                                            <label for="txtphone">Ảnh đại diện</label>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Ảnh đại diện</b><br />
                                                                    Ảnh có định dạng .png,.jpg,.gif.
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <asp:FileUpload ID="flupload" ToolTip="Ảnh đại diện" runat="server" CssClass="upload-file" />  <br />
                                                            <asp:HiddenField ID="hdimg_old" runat="server" Visible="false" />
                                                            <asp:Literal ID="ltimage" runat="server"></asp:Literal>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkdeleteimg" runat="server" Text=" Xóa ảnh" Visible="false" />
                                                            <br />
                                                            
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td class="key" valign="top">
                                                            <label for="txtphone">Ảnh nhỏ</label>
                                                             <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Ảnh nhỏ</b><br />
                                                                    Ảnh có định dạng .png,.jpg,.gif
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td>
                                                             <asp:FileUpload ID="flupicon" ToolTip="Icon" runat="server" CssClass="upload-file" />  <br />
                                                            <asp:HiddenField ID="hd_imgicon" runat="server" Visible="false" />
                                                            <asp:Literal ID="lt_icon" runat="server"></asp:Literal>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkdeleteicon" runat="server" Text=" Xóa ảnh" Visible="false" />
                                                         
                                                           

                                                        </td>
                                                    </tr>
                                                <tr>
                                                        <td class="key">
                                                            <label for="txtphone">Hiển thị tại trang chủ</label>
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="chkdisplayhome" runat="server" Text=" Hiển thị" />
                                                        </td>
                                                    </tr>
                                         <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Mô tả</label>
                                                        </td>
                                                        <td>
                                                               <CKEditor:CKEditorControl  ID="txt_mota"  runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                                        </td>
                                                    </tr>
                                                    
                                                
                                           
                                        </table>
                                        
                                    </div>
                                    <div>
                                        <asp:Panel ID="pnmainmenu" runat="server">
                                        <table class="admintable">
                                            <tbody>
                                                <tr>
                                                    <td colspan="2">
                                                            <label for="txttitle"><b>1. Hiển thị trên menu chính</b></label>
                                                       
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td width="150" class="key">
                                                            <label for="txttitle">Thuộc menu</label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlcatemainmenu" runat="server" CssClass="inputbox"></asp:DropDownList> 
                                                            <a href="#" class="tooltip">
                                                            <img src="../templates/admin/images/help-icon.png" />
                                                            <span><b>Chọn menu</b><br />
                                                                Chọn menu này là menu chính hay là menu con của 1 mục nào đó
                                                            </span>
                                                        </a>
                                                        </td>
                                                </tr>
                                                 <tr>
                                                    <td width="150" class="key">
                                                            <label for="txttitle">Thứ tự hiển thị</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtordermenumain"  Text="1" runat="server" CssClass="inputbox" Width="60"></asp:TextBox>
                                                             <a href="#" class="tooltip">
                                                            <img src="../templates/admin/images/help-icon.png" />
                                                            <span><b>Thứ tự</b><br />
                                                                Thứ tự hiển thị trên menu chính(VD: 1,2,3...)
                                                            </span>
                                                        </a>
                                                        </td>
                                                </tr>
                                                 <tr>
                                                    <td width="150" class="key">
                                                            <label for="txttitle">Trạng thái</label>
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="chkmainmenustatus" runat="server" /> Hiển thị
                                                            <asp:HiddenField ID="hdicidmainmenu" Value="-1" runat="server" Visible="false" />
                                                        </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        </asp:Panel>
                                        <asp:Panel ID="pntopmenu" runat="server">
                                          <table class="admintable">
                                            <tbody>
                                                <tr>
                                                    <td colspan="2">
                                                            <label for="txttitle"><b>2. Hiển thị trên menu trên cùng</b></label>
                                                       
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td width="150" class="key">
                                                            <label for="txttitle">Thuộc menu</label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlmenutop" runat="server" CssClass="inputbox"></asp:DropDownList> 
                                                            <a href="#" class="tooltip">
                                                            <img src="../templates/admin/images/help-icon.png" />
                                                            <span><b>Chọn menu</b><br />
                                                                Chọn menu này là menu chính hay là menu con của 1 mục nào đó
                                                            </span>
                                                        </a>
                                                        </td>
                                                </tr>
                                                 <tr>
                                                    <td width="150" class="key">
                                                            <label for="txttitle">Thứ tự hiển thị</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtordermenutop"  Text="1" runat="server" CssClass="inputbox" Width="60"></asp:TextBox>
                                                             <a href="#" class="tooltip">
                                                            <img src="../templates/admin/images/help-icon.png" />
                                                            <span><b>Thứ tự</b><br />
                                                                Thứ tự hiển thị trên menu trên cùng (VD: 1,2,3...)
                                                            </span>
                                                        </a>
                                                        </td>
                                                </tr>
                                                 <tr>
                                                    <td width="150" class="key">
                                                            <label for="txttitle">Trạng thái</label>
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="chkmenutopstatus" runat="server" /> Hiển thị
                                                            <asp:HiddenField ID="hdicidtopmenu"  Value="-1" runat="server" Visible="false" />
                                                        </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        </asp:Panel>
                                        <asp:Panel ID="pnbottommenu" runat="server">
                                        <table class="admintable">
                                            <tbody>
                                                <tr>
                                                    <td colspan="2">
                                                            <label for="txttitle"><b>3. Hiển thị trên menu dưới cùng</b></label>
                                                       
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td width="150" class="key">
                                                            <label for="txttitle">Thuộc menu</label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlmenubottom" runat="server" CssClass="inputbox"></asp:DropDownList> 
                                                            <a href="#" class="tooltip">
                                                            <img src="../templates/admin/images/help-icon.png" />
                                                            <span><b>Chọn menu</b><br />
                                                                Chọn menu này là menu chính hay là menu con của 1 mục nào đó
                                                            </span>
                                                        </a>
                                                        </td>
                                                </tr>
                                                 <tr>
                                                    <td width="150" class="key">
                                                            <label for="txttitle">Thứ tự hiển thị</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtorderbottom"  Text="1" runat="server" CssClass="inputbox" Width="60"></asp:TextBox>
                                                             <a href="#" class="tooltip">
                                                            <img src="../templates/admin/images/help-icon.png" />
                                                            <span><b>Thứ tự</b><br />
                                                                Thứ tự hiển thị trên menu dưới cùng (VD: 1,2,3...)
                                                            </span>
                                                        </a>
                                                        </td>
                                                </tr>
                                                 <tr>
                                                    <td width="150" class="key">
                                                            <label for="txttitle">Trạng thái</label>
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="chkmenubottomstatus" runat="server" /> Hiển thị
                                                            <asp:HiddenField ID="hdicidbottommenu" Value="-1" runat="server" Visible="false" />
                                                        </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        </asp:Panel>
                                        <asp:Panel ID="pncontentmenu" runat="server">
                                         <table class="admintable">
                                            <tbody>
                                                <tr>
                                                    <td colspan="2">
                                                            <label for="txttitle"><b>4. Hiển thị trên menu nội dung</b></label>
                                                       
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td width="150" class="key">
                                                            <label for="txttitle">Thuộc menu</label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlmenucontent" runat="server" CssClass="inputbox"></asp:DropDownList> 
                                                            <a href="#" class="tooltip">
                                                            <img src="../templates/admin/images/help-icon.png" />
                                                            <span><b>Chọn menu</b><br />
                                                                Chọn menu này là menu chính hay là menu con của 1 mục nào đó
                                                            </span>
                                                        </a>
                                                        </td>
                                                </tr>
                                                 <tr>
                                                    <td width="150" class="key">
                                                            <label for="txttitle">Thứ tự hiển thị</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtordermenucontent" Text="1" runat="server" CssClass="inputbox" Width="60"></asp:TextBox>
                                                             <a href="#" class="tooltip">
                                                            <img src="../templates/admin/images/help-icon.png" />
                                                            <span><b>Thứ tự</b><br />
                                                                Thứ tự hiển thị trên menu nội dung (VD: 1,2,3...)
                                                            </span>
                                                        </a>
                                                        </td>
                                                </tr>
                                                 <tr>
                                                    <td width="150" class="key">
                                                            <label for="txttitle">Trạng thái</label>
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="chkmenucontentstatus" runat="server" /> Hiển thị
                                                            <asp:HiddenField ID="hdicidcontentmenu" Value="-1" runat="server" Visible="false" />
                                                        </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                            </asp:Panel>
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
                                                        Nội dung được hiển thị dưới dạng tiêu đề trong kết quả tìm kiếm và trên trình duyệt của người dùng.  <br><i>(Tiêu đề nên để dưới 70 ký tự)</i>
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
                                        <span class="next-input-add-on next-input__add-on--before"><%=weburl %></span>
                                       
                                                     <asp:TextBox ID="txturl" Width="335" runat="server" CssClass="txtpa"></asp:TextBox>
                                    </div>
                                              <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Đường dẫn</b><br />
                                                       Đường dẫn tới danh mục hotel
                                                    </span>
                                                </a>   
                                              
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="150" class="key">
                                                <label for="txtkeyword">Thẻ từ khóa</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtkeyword" runat="server" CssClass="inputbox" TextMode="MultiLine" Rows="5" Height="80" Columns="70"></asp:TextBox>
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
                                                <asp:TextBox ID="txtdesc" runat="server" CssClass="inputbox" TextMode="MultiLine" Height="80" Rows="5" Columns="70"></asp:TextBox>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Thẻ mô tả</b><br />
                                                        Cung cấp một mô tả ngắn của trang. Trong vài trường hợp, mô tả này được sử dụng như một phần của đoạn trích được hiển thị trong kết quả tìm kiếm. <br><i>(Mô tả nên để dưới 160 ký tự)</i>
                                                    </span>
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                            </table>
                                        </p>

                                    </div>
                                    <div>
                                          <div class="ad-cates-list-ck">
                                        <p style="font-weight:bold;line-height:30px;">Danh sách thuộc tính của danh mục</p>
                                        <asp:Literal ID="ltfeature" runat="server"></asp:Literal>
                                              </div>
                                    </div>
                                    <div class="nql">
                                          <p style="font-weight:bold;line-height:30px;">Danh sách người có quyền quản lý hotel trong danh mục này</p>
                                        <asp:Literal ID="ltnguoiquanly" runat="server"></asp:Literal>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" value="" id="hndId" name="hndId">
                        </asp:Panel>
                        <asp:HiddenField ID="hdicid" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdcreate" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdtitle" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdalias" runat="server" Visible="false" />
                         <asp:HiddenField ID="hdname" runat="server" Visible="false" />
                          <asp:HiddenField ID="hdprdicidlist" runat="server" Value="" Visible="false" />
                        <asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
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
    $(function () {
        $("input[type='checkbox']").change(function () {
            $(this).siblings('ul')
                .find("input[type='checkbox']")
                .prop('checked', this.checked);
        });
    });
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
