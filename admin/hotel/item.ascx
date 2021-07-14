<%@ Control Language="C#" AutoEventWireup="true" CodeFile="item.ascx.cs" Inherits="admin_products_item" %>
1
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<script src="<%=WEB.Common.Weburl %>templates/admin/js/lang.js"></script>
<script src="<%=WEB.Common.Weburl %>templates/admin/js/jquery.fineuploader.js"></script>
<script src="<%=WEB.Common.Weburl %>templates/admin/js/js.upload.js"></script>
<link rel="stylesheet" href="<%=WEB.Common.Weburl %>templates/admin/css/jquery.modal.min.css" />
<asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal>
<div class="widget-title">
    <h4><i class="icon-reorder-items">
        <asp:Literal ID="lttitle" runat="server"></asp:Literal></i></h4>
    <div class="ui-widget-content ui-corner-top ui-corner-bottom">
        <div id="toolbox">
            <div style="float: right; margin-right: 10px;" class="toolbox-content">
                <table class="toolbar">
                    <tr>
                         <td align="center">
                            <asp:LinkButton ID="lnkupdatepriceandorder" runat="server" CssClass="toolbar" OnClick="lnkupdatepriceandorder_Click">
							<span class="icon-ok-update"></span>
							Cập nhật giá, thứ tự
                            </asp:LinkButton>
                        </td>
                         <td align="center">
                            <asp:Literal ID="ltxuatexcel" runat="server"></asp:Literal>
                            
                        </td>
                         <td align="center">
                            <asp:Literal ID="ltnhapexcel" runat="server"></asp:Literal>
                            
                        </td>
                          <td align="center">
                            <asp:Literal ID="ltaddmulti" runat="server"></asp:Literal>
                            
                        </td>
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
                            <asp:LinkButton ID="lnkupdate" runat="server" CssClass="toolbar">
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
                    
                    </div>
                    <div class="span9">
                        <div class="pagination pagination-small pagination-right">
                            <asp:TextBox ID="txtkeysearch" CssClass="inputbox-top" runat="server" Width="150">

                            </asp:TextBox><asp:DropDownList ID="ddlcatesearch" CssClass="inputbox-top-select" Width="150"  runat="server"></asp:DropDownList>
                            <asp:DropDownList ID="ddlstatus" runat="server" CssClass="inputbox-top-select"  Width="130" >
                                <asp:ListItem Value="-1" Text="Tất cả trạng thái"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Hiển thị"></asp:ListItem>
                                <asp:ListItem Value="0" Text="Ẩn"></asp:ListItem>
                            </asp:DropDownList>
                             <asp:DropDownList ID="ddlorder" Width="110" CssClass="inputbox-top-select" runat="server">
                                <asp:ListItem Text="SX.Ngày tạo" Value="0"></asp:ListItem>
                                <asp:ListItem Text="SX.Ngày cập nhật" Value="1"></asp:ListItem>
                                <asp:ListItem Text="SX.Tiêu đề" Value="2"></asp:ListItem>
                                 <asp:ListItem Text="SX.Thứ tự" Value="3"></asp:ListItem>
                                 <asp:ListItem Text="SX.Lượt xem" Value="4"></asp:ListItem>
                                 <asp:ListItem Text="SX.Giá" Value="5"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlordertype" Width="110" CssClass="inputbox-top-select" runat="server">
                                <asp:ListItem Text="Giảm dần" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Tăng dần" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btnsearch" OnClick="btnsearch_Click" runat="server" CssClass="buton-css" Text="Tìm kiếm" />
                        </div>
                        <div style="clear: both;"></div>
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
                                    <th width="20" class="title">
                                        <input type="checkbox" id="chkToggle" value="" onclick="selectAll(this)" name="chkToggle">
                                    </th>
                                    <th width="80" class="title">Hình ảnh 
                                    </th>

                                    <th class="title">Hotel
                                    </th>
                                     <th style="width: 120px;" class="title">Đơn giá
                                    </th>
                                     <th style="width: 70px; text-align: center !important;" class="title">Thứ tự
                                    </th>
                                    <th style="width: 80px;" class="title">Lượt xem
                                    </th>
                                   
                                                        <th width="90" style="text-align:center"  class="title">Thao tác
                                                        </th>
                                      <th  width="140" style="text-align:center" class="title">Thời gian
                                                        </th>
                                    <th width="80" style="text-align:center" class="title">Trạng thái
                                <th style="width: 100px;" class="title"></th>
                                    </th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr class="row0">
                                <td align="center">
                                    <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("iid") %>" id='cb_' name='cb_'>
                                </td>
                                <td align="center">
                                   <%#getpic(Eval("vimg").ToString())%></td>
                                <td>
                                    <asp:LinkButton ID="LinkButton1" Enabled='<%#checkrole("2022") %>' CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                        runat="server" ToolTip="Sửa"><%#Eval("vtitle")%>
                                    </asp:LinkButton>
                                    <p>Mã SP: <%#Eval("vkey") %></p>
                                </td>
                                 <td>
                                     <input type="text" name="txtnewprice_<%#Eval("iid") %>" title="Giá mới" value="<%#Eval("fnewprice") %>" class="txtiporder txtipnewp" /><br />
                                     <input type="text" name="txtoldprice_<%#Eval("iid") %>" title="Giá cũ" value="<%#Eval("foldprice") %>" class="txtiporder txtipoldp" />
                                </td>
                              
                               
                                <td align="center">
                                    <input type="text" name="txtorder_<%#Eval("iid") %>" value="<%#Eval("iparam2") %>" class="txtiporder" />
                                </td>
                                <td align="center">
                                    <%#Eval("iviews") %>
                                </td>
                              
                                                        </td>
                                                       <td><%#getusercreateupdate(Eval("vusercreate").ToString(),Eval("vparam10").ToString()) %>
                                                        </td>
                                     <td><%#getdatecreateupdate(Eval("dcreatedate").ToString(),Eval("dupdate").ToString()) %>
                                                        </td>
                                <td align="center">
                                    <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")+"|"+Eval("istatus")%>'
                                        runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                </td>
                                <td align="center">
                                     <a href="<%#weburl %><%#Eval("valias") %>" target="_blank" title="Xem chi tiết"><img src="<%=weburl%>templates/admin/images/view.png" /></a>&nbsp; &nbsp;
                                     <a href="/admin/?mod=hotel&c=items&id=<%#Eval("iid") %>"  <%#checkrolecss("2022") %> title="Chỉnh sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></a>&nbsp; &nbsp;
                                            <asp:LinkButton ID="LinkButton5" CommandName="delete" Visible='<%#checkrole("2023") %>' OnClientClick="return confirm('Bạn có muốn xóa không?')"  CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                                runat="server" ToolTip="Xóa"><img src="<%=weburl%>templates/admin/images/icondelete_c.png" /></asp:LinkButton>
                                   
                                </td>
                            </tr>
                        </tbody>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                          <tbody>
                            <tr class="row1">
                                <td align="center">
                                    <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("iid") %>" id='cb_' name='cb_'>
                                </td>
                                <td align="center">
                                   <%#getpic(Eval("vimg").ToString())%></td>
                                <td>
                                    <asp:LinkButton ID="LinkButton1" Enabled='<%#checkrole("2022") %>' CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                        runat="server" ToolTip="Sửa"><%#Eval("vtitle")%></asp:LinkButton>
                                     <p>Mã SP: <%#Eval("vkey") %></p>
                                </td>
                                 <td>
                                    <input type="text" name="txtnewprice_<%#Eval("iid") %>" title="Giá mới" value="<%#Eval("fnewprice") %>" class="txtiporder txtipnewp" /><br />
                                     <input type="text" name="txtoldprice_<%#Eval("iid") %>" title="Giá cũ" value="<%#Eval("foldprice") %>" class="txtiporder txtipoldp" />
                                </td>
                                
                               
                                <td align="center">
                                   <input type="text" name="txtorder_<%#Eval("iid") %>" value="<%#Eval("iparam2") %>" class="txtiporder" />
                                </td>
                                 <td align="center">
                                    <%#Eval("iviews") %>
                                </td>
                                
                                                        </td>
                                                       <td><%#getusercreateupdate(Eval("vusercreate").ToString(),Eval("vparam10").ToString()) %>
                                                        </td>
                                   <td><%#getdatecreateupdate(Eval("dcreatedate").ToString(),Eval("dupdate").ToString()) %>
                                                        </td>
                                <td align="center">
                                    <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")+"|"+Eval("istatus")%>'
                                        runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                </td>
                                <td align="center">
                                   
                                      <a href="<%#weburl %><%#Eval("valias") %>" target="_blank" title="Xem chi tiết"><img src="<%=weburl%>templates/admin/images/view.png" /></a>&nbsp; &nbsp;
                                   <a href="/admin/?mod=hotel&c=items&id=<%#Eval("iid") %>"  <%#checkrolecss("2022") %> title="Chỉnh sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></a>&nbsp; &nbsp;
                                            <asp:LinkButton ID="LinkButton5" CommandName="delete" Visible='<%#checkrole("2023") %>' OnClientClick="return confirm('Bạn có muốn xóa không?')"  CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                                runat="server" ToolTip="Xóa"><img src="<%=weburl%>templates/admin/images/icondelete_c.png" /></asp:LinkButton>
                                   
                                </td>
                            </tr>
                        </tbody>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <div class="page-items">
                    <asp:Literal ID="lt_pagebotom" runat="server"></asp:Literal>
                </div>
            </asp:Panel>
            <asp:Panel ID="pndetail" runat="server" Visible="false">
                <div id="parentHorizontalTabcontent">
                    <ul class="resp-tabs-list hor_1">
                        <li>Thông tin chi tiết</li>
                        <li>Hình ảnh liên quan</li>
                            <li>Phiên bản Hotel</li>
                        <li>Thông tin khác</li>
                        <li>Cấu hình SEO</li>
                        <li>Tab thông tin</li>
                    </ul>
                    <div class="resp-tabs-container hor_1" >
                        <div style="background:#f0f0f0">
                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Tên Hotel</label> <a href="#" class="tooltip">
                                                                            <img src="../templates/admin/images/help-icon.png" />
                                                                            <span><b>Tên Hotel</b><br />
                                                                                Nhập tên của Hotel (VD:Samsung Galaxy S).  Tối đa 200 ký tự
                                                                            </span>
                                                                        </a>
                                             <asp:TextBox ID="txtproductname" runat="server" Width="100%" CssClass="inputbox"  placeholder="ví dụ : Iphone 8 , Samsung S8"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label class="next-label">Mô tả</label>
                                              <CKEditor:CKEditorControl ID="txtdesc" runat="server"  BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                        </div>
                                        <div class="form-group">
                                            <label class="next-label">Chi tiết Hotel</label>
                                               <CKEditor:CKEditorControl ID="txtcontent" runat="server"  BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                        </div>
                                    </div>

                                     <div class="block_sp">
                                         <div class="form-group">
                                             <label class="text-no-bold" data-bind="text:Title">Hình ảnh đại diện</label>
                                               <asp:FileUpload CssClass="btn-change-link pull-right" ID="flupload" runat="server" />
                                         </div>
                                         <div class="center">
                                              <asp:Literal ID="ltimage" runat="server"></asp:Literal>
                                             <asp:Literal ID="ltimagedefault" runat="server"></asp:Literal>
                                         </div>
                                         <p style="color:#c3cfd8" class="center">Sử dụng nút <strong>Chọn hình</strong> để thêm hình.</p>
                                         </div>

                                   
                                </div>
                                <div class="col-sm-4">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Mã Hotel</label> <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Mã Hotel</b><br />
                                                                    Mã của Hotel hoặc đơn vị phân loại hàng tồn kho (SKU), có thể là các con số hoặc một đoạn mã để xác định tính duy nhất của Hotel. Tối đa 20 ký tự
                                                                </span>
                                                            </a>
                                             <asp:TextBox ID="txtproductkey" runat="server" Width="100%" CssClass="inputbox"></asp:TextBox>
                                        </div>
                                        </div>
                                     <div class="block_sp">
                                        <div class="form-group">
                                              <p class="ttg">Giá Hotel</p>
                                      
                                              <div class="form-group">
                                                <label class="next-label">Giá </label><a href="#" class="tooltip">
                                                                            <img src="../templates/admin/images/help-icon.png" />
                                                                            <span><b>Giá</b><br />
                                                                                Giá bán hiện tại của Hotel
                                                                            </span>
                                                                        </a>
                                             
                                                    <asp:TextBox ID="txtpricenew" runat="server" Width="100%" CssClass="inputbox"></asp:TextBox>
                                               
                                            </div>
                                             <div class="form-group">
                                                <label class="next-label">Giá so sánh</label><a href="#" class="tooltip">
                                                                            <img src="../templates/admin/images/help-icon.png" />
                                                                            <span><b>Giá so sánh</b><br />
                                                                                Giá so sánh với giá thị trường (Không bắt buộc nhập)
                                                                            </span>
                                                                        </a>
                                               
                                                      <asp:TextBox ID="txtpriceold" placeholder="Giá so sánh với giá thị trường (Không bắt buộc nhập)" runat="server" Width="100%" CssClass="inputbox"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                  
                                    <div class="block_sp">
                                        <p class="ttg">Phân loại</p>
                                        <div class="form-group">
                                            <label class="next-label">Loại Hotel</label> <a href="#" class="tooltip">
                                                                    <img src="../templates/admin/images/help-icon.png" />
                                                                    <span><b>Danh mục Hotel</b><br />
                                                                        Lưa chọn danh mục chứa Hotel
                                                                    </span>
                                                                </a>
                                            <asp:DropDownList ID="ddlcate" Width="100%" runat="server" CssClass="inputbox"></asp:DropDownList>
                                        </div>
                                          <div class="form-group">
                                            <label class="next-label">Nhóm Hotel</label>
                                              <div class="listgr">
                                                  <ul>
                                          <asp:Repeater ID="rpgroup" runat="server">
                                              <ItemTemplate>
                                                 <li><input type="checkbox" <%#checkgroup(Eval("icid").ToString()) %> name="chkgr" value="<%#Eval("icid") %>"> <%#Eval("vname") %></li>
                                              </ItemTemplate>
                                          </asp:Repeater>
                                                      </ul>
                                                  </div>
                                        </div>
                                        </div>

                                      <div class="block_sp">
                                        <p class="ttg">Thuộc tính</p>
                                        <div class="form-group">
                                            <label class="next-label">Chọn thuộc tính Hotel</label>
                                          
                                              <div class="listtt">
                                                <asp:Literal ID="lttt" runat="server"></asp:Literal>
                                                  </div>
                                        </div>
                                        </div>
                                      <div class="block_sp">
                                        <p class="ttg">Tùy chọn</p>
                                        <div class="form-group">
                                            <label class="next-label">Thứ tự</label> <a href="#" class="tooltip">
                                                                        <img src="../templates/admin/images/help-icon.png" />
                                                                        <span><b>Thứ tự</b><br />
                                                                            Thứ tự hiện thị của Hotel trong 1 danh mục
                                                                        </span>
                                                                    </a>
                                            <asp:TextBox ID="txtorder" CssClass="inputbox" Width="100%" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                               <p class="ttg">Trạng thái</p>
                                              <asp:CheckBox ID="chkstatus" runat="server" Text="" />  Hiển thị<br />
                                                <asp:CheckBox ID="chkupdatedate" runat="server" Text=" " Visible="false" /> Cập nhật ngày đăng 
                                        </div>
                                        </div>

                                </div>
                            </div>

                          
                                       

                        </div>
                        <div>

                              <input type="hidden" name="hdidtemp" value="<%=iidtemp %>" id="hdidtemp">
                            <input type="hidden" name="hdlistimgrel" value="" id="hdlistimgrel">
                    <div id="uploadfiles" maxcount="16" input="ctl33_ctl00_FileServer2_ctl00" class="uploadfdfile upload-create-form" >
						
						<div class="spanButtonPlaceholder block-upload-item" id="upload-drop-zone">
						<input multiple="multiple" type="file" name="file">
						</div>
						<div class="divFileProgressContainer1" style="display: none;"></div>
						</div>
                             <div class="prdthumbnails">
                            <asp:Repeater ID="rpsubimg" runat="server">
                                <ItemTemplate>
                                    <div class="item-upload" id='<%#Eval("ino") %>'>
                                        <span class="item-upload-name">
                                            <img class="img-responsive" src="../uploads/products/relative/<%#Eval("vtitle") %>">
                                        </span>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span data="<%#Eval("ino") %>" class="item-upload-del" title="Xóa"></span></div>
                                </ItemTemplate>
                            </asp:Repeater>
						</div>
                        </div>
                        
                         <div>
                            <div class="wrapper-content  ps-relative" id="divProductVariants">
                                <label class="title-product-main  block-display mb20">Hotel có nhiều phiên bản. </label><span style="color:#aaa;font-size:12px;padding-left:10px">Ví dụ: Size: S,M,L,... | Màu sắc: Xanh, Đỏ,...</span>
                                <div class="pull-right pos-add-edit-btn">
                                    
                                    <a class="btn-add-prdt ml10" data-toggle="modal" >Thêm mới</a>
                                    
                                </div>
                                <div class="" style="clear:both">
                                   
                                    <div class="table-wrap overflow-auto">
                                        <table class="table p-none tabprdm">
                                            <thead>
                                                <tr>
                                                    <th class="col-sm-1"><b>Hình ảnh</b></th>
                                                    <th class="col-sm-2"><b>Mã Hotel</b></th>
                                                    <th class="col-sm-5 p-none"><b>Mẫu Hotel</b></th>
                                                    <th class="col-sm-3"><b>Giá</b></th>
                                                    <th class="col-sm-1"></th>
                                                </tr>
                                            </thead>


                                            <asp:Repeater ID="rpsubprd" runat="server">
                                            <ItemTemplate>
                                                 <tr id="trsub<%#getstt() %>" class="record">
                                                   

                                                     <td>
                                                        <i class="fa fa-camera" ></i>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control inline prdcode" value="<%#Eval("vdesc") %>" name="prdcode-<%#icurrent %>">
                                                    </td>
                                                   
                                                    <td>
                                                        <input type="text" class="form-control inline prdname"  value="<%#Eval("vtitle") %>"  name="prdname-<%#icurrent %>">
                                                    </td>
                                                     <td>
                                                        <div class="input-group box-choose-collection-border">
                                                            <span class="input-group-addon input-style-collection text-price-dollar">đ</span>
                                                            <input type="text" class="form-control inline prdprice"  value="<%#Eval("vcontent") %>" name="prdprice-<%#icurrent %>">
                                                        </div>                                                
                                                    </td>
                                                   
                                                    <td  valign="top"  align="center">
                                                        <a href="javascript:void(0)" title="Xóa"  class="lnkprddetaildelete"   id="rc-delete-<%#icurrent %>"></a>
                                                        <input type="hidden" class="rc-isub" name="rc-isub-<%#icurrent %>" value="<%#Eval("ino") %>" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                            <tbody>
                                                <tr id="trsub-<%=subnum %>" class="record">
                                                    <td>
                                                        <i class="fa fa-camera" ></i>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control inline prdcode" placeholder="Mã: ví dụ (001)" name="prdcode-<%=subnum %>">
                                                    </td>
                                                   
                                                    <td>
                                                        <input type="text" class="form-control inline prdname" placeholder="Tên mẫu: ví dụ (size: S)"  name="prdname-<%=subnum %>">
                                                    </td>
                                                     <td>
                                                        <div class="input-group box-choose-collection-border">
                                                            <span class="input-group-addon input-style-collection text-price-dollar">đ</span>
                                                            <input type="text" class="form-control inline prdprice" name="prdprice-<%=subnum %>" value="0">
                                                        </div>                                                
                                                    </td>
                                                   
                                                    <td  valign="top"  align="center">
                                                        <a href="javascript:void(0)" title="Xóa"  class="lnkprddetaildelete"   id="rc-delete-<%=subnum %>"></a>
                                                        <input type="hidden" class="rc-isub" name="rc-isub-<%=subnum %>" value="-1" />
                                                    </td>
                                                </tr>
												
                                            </tbody>
                                        </table>
                                        <input type="hidden" id="hdnumprd" name="hdnumprd" value="<%=subnum %>" />
										<input type="hidden"  id="hdnumprdtmp" name="hdnumprdtmp" value="<%=subnum %>" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <table width="100%"  class="admintable">
                                <tr>
                                            <td class="key" style="width:170px" valign="top">
                                                <label for="txtphone">Hãng sản xuất</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlvendor" CssClass="inputbox" runat="server"></asp:DropDownList>
                                                <a href="#" class="tooltip">
                                                                        <img src="../templates/admin/images/help-icon.png" />
                                                                        <span><b>Hãng sản xuất</b><br />
                                                                           Lựa chọn hãng sản xuất
                                                                        </span>
                                                                    </a>
                                            </td>
                                        </tr>
                                         <tr  style="display:none">
                                            <td class="key" valign="top">
                                                <label for="txtphone">Xuất xứ</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtxuatxu"  CssClass="inputbox" Width="350"  runat="server" ></asp:TextBox>
                                                <a href="#" class="tooltip">
                                                                        <img src="../templates/admin/images/help-icon.png" />
                                                                        <span><b>Xuất xứ</b><br />
                                                                           Xuất xứ
                                                                        </span>
                                                                    </a>
                                            </td>
                                        </tr>
                                <tr>
                                            <td class="key" valign="top">
                                                <label for="txtphone">Trọng lượng</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtweight"  CssClass="inputbox"  runat="server" ></asp:TextBox> gram
                                                <a href="#" class="tooltip">
                                                                        <img src="../templates/admin/images/help-icon.png" />
                                                                        <span><b>Trọng lượng</b><br />
                                                                           Trọng lượng của Hotel dùng trong trường hợp cần tính phí vận chuyển
                                                                        </span>
                                                                    </a>
                                            </td>
                                        </tr> 
                                 <tr style="display:none">
                                            <td class="key">
                                                <label for="txtphone">Số lượng</label>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td width="200">
                                                            <asp:TextBox ID="txtnumber" Width="100" runat="server" CssClass="inputbox">1</asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Số lượng</b><br />
                                                                    Số lượng Hotel tồn tại trong kho
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td width="100">
                                                            
                                                        </td>
                                                        <td>
                                                          
                                                        </td>
                                                    </tr>
                                                </table>
                                                
                                            </td>
                                        </tr>
                                   
                                   <tr style="display:none">
                                                                    <td width="90">
                                                                        <label for="txtuser">Đơn vị</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtunit" runat="server" Width="100" CssClass="inputbox"></asp:TextBox>
                                                                        <a href="#" class="tooltip">
                                                                            <img src="../templates/admin/images/help-icon.png" />
                                                                            <span><b>Đơn vị</b><br />
                                                                                Đơn vị của Hotel (VD:thùng, kg, cái,...)
                                                                            </span>
                                                                        </a>
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                       
                                                                        <label for="txtphone">Giá đã bao gồm VAT</label>
                                                                  
                                                                        <asp:CheckBox ID="chkvat" runat="server" />
                                                                        <a href="#" class="tooltip">
                                                                            <img src="../templates/admin/images/help-icon.png" />
                                                                            <span><b>VAT</b><br />
                                                                                Tích chọn nếu giá bán đã bao gồm VAT 
                                                                            </span>
                                                                        </a>
                                                                  
                                                                    </td>
                                                                </tr>
                                 <tr style="display:none">
                                            <td class="key" valign="top">
                                                <label for="txtphone">Bảo hành</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtbh" TextMode="MultiLine" Rows="5" Columns="50" runat="server" ></asp:TextBox>
                                                <a href="#" class="tooltip">
                                                                        <img src="../templates/admin/images/help-icon.png" />
                                                                        <span><b>Bảo hành</b><br />
                                                                            Mô tả thông tin bảo hành Hotel
                                                                        </span>
                                                                    </a>
                                            </td>
                                        </tr>
                                
                                <tr>
                                            <td class="key" valign="top">
                                                <label for="txtphone">Tình trạng</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddltt" CssClass="inputbox" runat="server">
                                                    <asp:ListItem Text="Còn hàng" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Hết hàng" Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:CheckBox ID="chkdisplaytt" runat="server" /> hiển thị tình trạng
                                                <a href="#" class="tooltip">
                                                                        <img src="../templates/admin/images/help-icon.png" />
                                                                        <span><b>Tình trạng</b><br />
                                                                            Tích chọn nếu bạn muốn hiển thị tình trạng trên website
                                                                        </span>
                                                                    </a>
                                            </td>
                                        </tr>
                                <tr  style="display:none">
                                            <td class="key" valign="top">
                                                <label for="txtphone">Cho phép đặt hàng</label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkacceptbuy" runat="server" /> 
                                                <a href="#" class="tooltip">
                                                                        <img src="../templates/admin/images/help-icon.png" />
                                                                        <span><b>Tình trạng</b><br />
                                                                            Tích chọn nếu bạn muốn cho phép đặt hàng Hotel trên website
                                                                        </span>
                                                                    </a>
                                            </td>
                                        </tr>
                                    <tr>
                                                <td class="key">
                                                    <label for="txtphone">Tùy chọn</label>
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="chknew" runat="server" Text=" Hotel mới" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
							        <asp:CheckBox ID="chkhot" runat="server" Text=" Hotel bán chạy" />
                                                   &nbsp;&nbsp;&nbsp;&nbsp;
							        <asp:CheckBox ID="chksale" runat="server" Text=" Hotel khuyến mại" />
                                                     <a href="#" class="tooltip">
                                                                        <img src="../templates/admin/images/help-icon.png" />
                                                                        <span><b>Tùy chọn</b><br />
                                                                            Tùy chọn để hiển thị Hotel trong danh sách Hotel bán mới, bán chạy hay khuyến mại
                                                                        </span>
                                                                    </a>
                                                </td>
                                            </tr>
                                <tr  style="display:none">
                                            <td class="key" valign="top">
                                                <label for="txtphone">Số lượng Hotel đã bán</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtnumprdsale"  CssClass="inputbox"  runat="server" ></asp:TextBox>
                                                <a href="#" class="tooltip">
                                                                        <img src="../templates/admin/images/help-icon.png" />
                                                                        <span><b>Hotel đã bán</b><br />
                                                                            Cập nhật số lượng Hotel đã bán khi có đơn hàng
                                                                        </span>
                                                                    </a>
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
                                                       Đường dẫn tới Hotel
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
                                                <asp:TextBox ID="txtmetadesc" runat="server" CssClass="inputbox" TextMode="MultiLine" Height="80" Rows="5" Columns="70"></asp:TextBox>
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
                            <table class="admintable tblisttab" width="100%">
                                <tbody>
                                    <asp:Repeater ID="rptabs" runat="server">
                                            <ItemTemplate>
                                                 <tr id="tr<%#getstt() %>" class="record">
                                                   <td  class="key">
                                                       Tiêu đề tab <input type="text" width="300" name="txttabname-<%#icurrent %>" value="<%#Eval("vtitle") %>"  class="txttabname inputbox" />
                                                       <a id="rc-deletetab-<%#icurrent %>" href="javascript:0" class="deltabprd" title="Xóa tab">Xóa tab</a><br /><br />
                                                        <textarea name="txtcontentcn-<%#icurrent %>" class="txtcontentcn"  id="txtcontentcn-<%#icurrent %>"><%#Eval("vcontent") %></textarea>
                                                       <input type="hidden" class="rc-tab" name="rc-tab-<%#icurrent %>" value="<%#Eval("ino") %>" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    <tr id="tr<%=n %>" class="record">
                                        <td  class="key">Tiêu đề tab <input type="text" width="300" name="txttabname-<%=n %>" class="txttabname inputbox" />  <a id="rc-deletetab-<%=n %>" href="javascript:0" class="deltabprd" title="Xóa tab">Xóa tab</a><br /><br />
                                            <textarea name="txtcontentcn-<%=n %>" id="txtcontentcn-<%=n %>" class="txtcontentcn"></textarea>
                                            <input type="hidden" class="rc-tab" name="rc-tab-<%=n %>" value="-1" />
                                        </td>
                                    </tr>
                                 </tbody>
                            </table>
                            <script type="text/javascript" src="<%=weburl%>ckeditor/ckeditor.js"></script>
                                                <script type="text/javascript" src="<%=weburl%>ckeditor/adapters/jquery.js"></script>
                                                <script type="text/javascript">
                                                    $(function () {
                                                        $("textarea.txtcontentcn").each(function () {
                                                            CKEDITOR.replace($(this).attr("id"), {
                                                                filebrowserImageUploadUrl: '/uploads/uploadimg.ashx'
                                                            });
                                                        });

                                                    });
                                                </script>
                            <a href="javascript:0" class="addtabprd" title="Thêm tab mới">Thêm tab mới</a>
                            <input type="hidden" value="<%=n %>" id="hdnum" name="hdnum" /> 
                            <input type="hidden" value="<%=n %>" id="hdnumtmp" name="hdnumtmp" />
                        </div>
                    </div>
                </div>
                <input type="hidden" value="" id="hndId" name="hndId">
            </asp:Panel>
            <asp:HiddenField ID="hdiid" runat="server" Visible="false" />
            <asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
            <asp:HiddenField ID="hdimg_old" runat="server" Visible="false" />
            <asp:HiddenField ID="hdiviews" runat="server" Visible="false" />
            <asp:HiddenField ID="hdcreatedate" runat="server" Visible="false" />
            <asp:HiddenField ID="hdupdatedate" runat="server" Visible="false" />
            <asp:HiddenField ID="hdfeature" runat="server" />
            <asp:HiddenField ID="hdtitle" runat="server" Visible="false" />
            <asp:HiddenField ID="hdalias" runat="server" Visible="false" />
             <asp:HiddenField ID="hdname" runat="server" Visible="false" />
             <asp:HiddenField ID="hddmql" runat="server" Visible="false" />
              <asp:HiddenField ID="hdbrochure" runat="server" Visible="false" />
             <asp:HiddenField ID="hdgroup" runat="server" Visible="false" />
             <asp:HiddenField ID="hditemp" runat="server" Value="-1" Visible="false" />
        </div>
        <div class="clr"></div>
    </div>
</div>
<div class="modal-backdrop md1" style="display:none">
<div id="ex1" class="modal">
      <div class="modal-header ">
                    <a href="#"  rel="modal:close" class="close">X</a>
                    <h4 class="modal-title">Thêm nhanh Hotel</h4>
                </div>
   
    <div class="modal-body">
                    <div class="">
                        <label class="next-label">Chọn danh mục cần thêm Hotel</label>
                        <asp:DropDownList ID="ddlcateadditem" runat="server" Width="100%"  CssClass="inputbox"></asp:DropDownList>
                    </div>
                </div>
    <div class="modal-footer">
                    <a href="#" rel="modal:close" class="btn btn-default bnthuy">Hủy</a>
       <asp:LinkButton ID="lnk" runat="server" CssClass="btn btn-primary" Text="Nhân bản" OnClick="lnk_Click">Thêm Hotel</asp:LinkButton>
                </div>

</div>
    </div>
<div class="modal-backdrop md2" style="display:none">
<div id="ex2" class="modal">
      <div class="modal-header ">
                    <a href="#"  rel="modal:close" class="close">X</a>
                    <h4 class="modal-title">Xuất ra file excel</h4>
                </div>
   
    <div class="modal-body">
                    <div class="">
                        <label class="next-label">Chọn Hotel cần xuất ra file excel</label>
                        <asp:DropDownList ID="ddlexport" runat="server" Width="100%"  CssClass="inputbox">
                            <asp:ListItem Text="Hotel trên trang hiện tại" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Hotel trong danh mục" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Tất cả Hotel" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                        <br /><br />
                        <asp:DropDownList ID="ddlcateexport" runat="server"  Width="100%"  CssClass="inputbox"></asp:DropDownList>
                    </div>
                </div>
    <div class="modal-footer">
                    <a href="#" rel="modal:close" class="btn btn-default bnthuy">Hủy</a>
       <asp:LinkButton ID="lnkexport" runat="server" CssClass="btn btn-primary" Text="Xuất ra excel" OnClick="lnkexport_Click1">Xuất ra excel</asp:LinkButton>
                </div>

</div>
    </div>
<div class="modal-backdrop md3" style="display:none">
<div id="ex3" class="modal">
      <div class="modal-header ">
                    <a href="#"  rel="modal:close" class="close">X</a>
                    <h4 class="modal-title">Nhập Hotel từ file excel</h4>
                </div>
   
    <div class="modal-body">
                    <div class="">
                        <asp:Literal ID="ltdetailmsg1" runat="server"></asp:Literal>
                        <label class="next-label">Chọn danh mục chứa Hotel</label>
                        <asp:DropDownList ID="ddlcateimport" runat="server" Width="100%"  CssClass="inputbox"></asp:DropDownList>
                        <br /><br />
                         <label class="next-label">Chọn file excel</label>
                        <asp:FileUpload ID="flexcel" runat="server" />
                        <span style="display:block;color:#333;font-size:11px;margin-top:10px;background:#f0f0f0;padding:10px">Các Hotel phân biệt nhau bằng ID Hotel. Nếu cùng ID Hotel thì hệ thống sẽ tự cập nhật thông tin từ file excel, nếu ID Hotel trong file excel chưa có hoặc để trống thì hệ thống sẽ tự thêm Hotel vào danh mục đã được chọn bên trên.<br /> File excel up lên phải theo cấu trúc của mẫu excel <a target="_blank" href='/uploads/files/temp/temp.xls'>tại đây</a></span>
                    </div>
                </div>
    <div class="modal-footer">
                    <a href="#" rel="modal:close" class="btn btn-default bnthuy">Hủy</a>
       <asp:LinkButton ID="lnkimport" runat="server" CssClass="btn btn-primary" Text="Cập nhật" OnClick="lnkimport_Click">Cập nhật</asp:LinkButton>
                </div>

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

<script type="text/javascript">
    $(document).ready(function () {
        //We are binding onchange event using jQuery built-in change event
        $('#ddlSubject').change(function () {
            //get selected value and check if subject is selected else show alert box
            var SelectedValue = $("#ddlSubject").val();
            if (SelectedValue > 0) {
                //get selected text and set to label
                var SelectedText = $("#ddlSubject option:selected").text();
                lblSelectedText.innerHTML = SelectedText;
                //set selected value to label
                lblSelectedValue.innerHTML = SelectedValue;
            } else {
                //reset label values and show alert
                lblSelectedText.innerHTML = "";
                lblSelectedValue.innerHTML = "";
                alert("Please select valid subject.");
            }
        });
    });
    $('#ddlexport').change(function () {
        var t = $(this).val();
        if (t == 1)
            $("#ddlcateexport").show();
        else
            $("#ddlcateexport").hide();
    })
    $(document).on("click", '.xuat', function () {
        $(".md2").show();
        $("#ex2").show();
    })
    $(document).on("click", '.nhap', function () {
        $(".md3").show();
        $("#ex3").show();
    })
    $(document).on("click", '.nhanban', function () {
        $(".md1").show();
        $("#ex1").show();
    })
    $(document).on("click", '.close', function () {
        $(".modal-backdrop").hide();
        $("#ex1").hide(); $("#ex2").hide(); $("#ex3").hide();
    })
    $(document).on("click", '.bnthuy', function () {
        $(".modal-backdrop").hide();
        $("#ex1").hide(); $("#ex2").hide(); $("#ex3").hide();
    })
    $(document).on("click", '.addtabprd', function () {
        idpr = $('.tblisttab');
        tr = idpr.children('tbody').children('tr:last');
        step = tr.clone();
        stt = parseInt($("#hdnum").val()) + 1;
        step.attr("id", "tr" + stt);
        step.children('td').children('input.txttabname').attr('name', 'txttabname-' + stt);
        step.children('td').children('textarea.txtcontentcn').attr('name', 'txtcontentcn-' + stt);
        step.children('td').children('textarea.txtcontentcn').attr('id', 'txtcontentcn-' + stt);
       // step.children('td').children('textarea.txtcontentcn').attr('id', 'txtcontentcn-' + stt);
        step.children('td').children('.cke_skin_kama').attr('id', 'cke_txtcontentcn-' + stt);
        
        step.children('td').children('.rc-tab').attr('name', 'rc-tab-' + stt);
        step.children('td').children('.rc-tab').attr('value', -1);
        $("#hdnum").val(stt);
        $("#hdnumtmp").val(parseInt($("#hdnumtmp").val()) + 1);
        step.children('td').children('.deltabprd').attr('id', 'rc-deletetab-' + stt);
        step.children('td').children('.cke_skin_kama ').remove();
        step.appendTo(idpr);

        step.children('td').children('textarea.txtcontentcn').each(function () {
            CKEDITOR.replace($(this).attr("id"), {
                filebrowserImageUploadUrl: '/uploads/uploadimg.ashx'
            });
        });
        
        //gettotal();
    })
    $(document).on("click", '.deltabprd', function () {
        var num = $("#hdnumtmp").val();
        if (num <= 1) {
            alert("Bạn không được xóa");
            return;
        }
        if (confirm("Bạn có muốn xóa không?")) {
            var id = $(this).parents('.record').attr('id');
            var stt = parseInt(num) - 1;
            $("#hdnumtmp").val(stt);
            $("#" + id).remove();
        }
    })
    $(document).on("click", '.btn-add-prdt', function () {
        idpr = $('.tabprdm');
        tr = idpr.children('tbody').children('tr:last');
        step = tr.clone();
        stt = parseInt($("#hdnumprd").val()) + 1;
        step.attr("id", "trsub-" + stt);
        step.children('td').children('input.prdcode').attr('name', 'prdcode-' + stt);
        step.children('td').children('input.prdname').attr('name', 'prdname-' + stt);
        step.children('td').children('div').children('input.prdprice').attr('name', 'prdprice-' + stt);
        // step.children('td').children('textarea.txtcontentcn').attr('id', 'txtcontentcn-' + stt);
        //step.children('td').children('input.prdnumber').attr('name', 'prdnumber-' + stt);
        step.children('td').children('.rc-isub').attr('name', 'rc-isub-' + stt);
        step.children('td').children('.rc-isub').attr('value', -1);
        $("#hdnumprd").val(stt);
        $("#hdnumprdtmp").val(parseInt($("#hdnumprdtmp").val()) + 1);
        step.children('td').children('.lnkprddetaildelete').attr('id', 'rc-delete-' + stt);
        step.appendTo(idpr);
    })
    $(document).on("click", '.lnkprddetaildelete', function () {
        var num = $("#hdnumprdtmp").val();
        if (num <= 1) {
            alert("Bạn không được xóa");
            return;
        }
        if (confirm("Bạn có muốn xóa không?")) {
            var id = $(this).parents('.record').attr('id');
            var stt = parseInt(num) - 1;
            $("#hdnumprdtmp").val(stt);
            $("#" + id).remove();
        }
    })
    
    $(function () {
        var idtemp = $("#hdidtemp").val();
        var url = "<%=weburl%>";
          $('.uploadfdfile').each(function () { this.uploadhandler = new GuestUploadNonFlash($(this).attr('id'), url, idtemp, "PRD"); });
    });
</script>
<style>
    table.admintable td table td {
        padding: 0px;
    }
    .modal-backdrop {
        background: rgba(0,0,0,0.5);
    }
    #ddlcateexport {
        display: none;
    }
</style>