<%@ Control Language="C#" AutoEventWireup="true" CodeFile="item.ascx.cs" Inherits="admin_services_item" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
    $(function () {
        $("#txt_updatetime").datepicker({
            dateFormat: 'dd/mm/yy'
        });
       
    });
  </script>
<div class="widget-title">
   
    <h4><i class="icon-reorder-items">
        <asp:Literal ID="lttitle" runat="server"></asp:Literal></i></h4>
    <div class="ui-corner-top ui-corner-bottom">
        <div id="toolbox">

            <div style="float: right; margin-right: 10px;" class="toolbox-content">

                <table class="toolbar">
                    <tr>

                         <td align="center">
                            <asp:LinkButton ID="lnkupdatepriceandorder" runat="server" CssClass="toolbar" OnClick="lnkupdatepriceandorder_Click">
							<span class="icon-ok-update"></span>
							Cập nhật thứ tự
                            </asp:LinkButton>
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
                     
                    </div>
                    <div class="span9">
                        <div class="pagination pagination-small pagination-right">
                            <asp:TextBox ID="txtkeysearch" CssClass="inputbox-top" runat="server" Width="150"></asp:TextBox>
                            <asp:DropDownList ID="ddlcatesearch" CssClass="inputbox-top-select" Width="150" runat="server"></asp:DropDownList>
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
                                    <th width="20" class="title">
                                        <input type="checkbox" id="chkToggle" value="" onclick="selectAll(this)" name="chkToggle">
                                    </th>
                                    <th width="80" class="title">Hình ảnh
                                    </th>

                                    <th class="title">Tiêu đề
                                    </th>
                                    <th style="width: 80px; text-align: center !important;" class="title">Thứ tự
                                    </th>
                                     <th style="width: 80px;" class="title">Lượt xem
                                    </th>
                                    
                                    <th width="10%" style="text-align:center"  class="title">Người tạo
                                    </th>
                                    <th  width="140" style="text-align:center" class="title">Thời gian
                                    </th>
                                    <th width="80" class="title">Trạng thái
                                <th style="width: 120px;" class="title"></th>
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
                                    <asp:LinkButton ID="LinkButton3" CommandName="EditDetail" Enabled='<%#checkrole("2722") %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                        runat="server" ToolTip="Sửa"><%#getpic(Eval("vimg").ToString())%></asp:LinkButton></td>
                                <td>
                                    <asp:LinkButton ID="LinkButton1" CommandName="EditDetail" Enabled='<%#checkrole("2722") %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                        runat="server" ToolTip="Sửa"><%#Eval("vtitle")%></asp:LinkButton>
                                </td>
                                 <td align="center"><input type="text" name="txtorder_<%#Eval("iid") %>" value="<%#Eval("iparam1") %>" class="txtiporder" />
                                </td>
                                 <td align="center"><%#Eval("iviews") %>
                                </td>
                                  <td><%#getusercreateupdate(Eval("vusercreate").ToString(),Eval("vparam6").ToString()) %>
                                </td>
                               <td align="center"><%#getdatecreateupdate(Eval("dcreatedate").ToString(),Eval("dupdate").ToString()) %>
                                                        </td>
                               
                                <td align="center">
                                    <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")+"|"+Eval("istatus")%>'
                                        runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                </td>
                                <td align="center">
                                       <a href="<%#weburl %><%#Eval("valias") %>" target="_blank" title="Xem chi tiết"><img src="<%=weburl%>templates/admin/images/view.png" /></a>&nbsp; &nbsp;
                                    <asp:LinkButton ID="LinkButton4" CommandName="EditDetail" Visible='<%#checkrole("2722") %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                        runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                    &nbsp &nbsp
                                            <asp:LinkButton ID="LinkButton5" CommandName="delete" Visible='<%#checkrole("2723") %>' OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
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
                                    <asp:LinkButton ID="LinkButton3" CommandName="EditDetail" Enabled='<%#checkrole("2722") %>'  CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                        runat="server" ToolTip="Sửa"><%#getpic(Eval("vimg").ToString())%></asp:LinkButton></td>
                                <td>
                                     <asp:LinkButton ID="LinkButton6" CommandName="EditDetail" Enabled='<%#checkrole("2722") %>'  CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                        runat="server" ToolTip="Sửa"><%#Eval("vtitle")%></asp:LinkButton>
                                </td>
                                 <td align="center"><input type="text" name="txtorder_<%#Eval("iid") %>" value="<%#Eval("iparam1") %>" class="txtiporder" />
                                </td>
                                 <td align="center"><%#Eval("iviews") %>
                                </td>
                                <td><%#getusercreateupdate(Eval("vusercreate").ToString(),Eval("vparam6").ToString()) %>
                                </td>
                                <td align="center"><%#getdatecreateupdate(Eval("dcreatedate").ToString(),Eval("dupdate").ToString()) %>
                                                        </td>
                                
                                <td align="center">
                                    <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")+"|"+Eval("istatus")%>'
                                        runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                </td>
                                <td align="center">
                                       <a href="<%#weburl %><%#Eval("valias") %>" target="_blank" title="Xem chi tiết"><img src="<%=weburl%>templates/admin/images/view.png" /></a>&nbsp; &nbsp;
                                    <asp:LinkButton ID="LinkButton4" CommandName="EditDetail" Visible='<%#checkrole("2722") %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                        runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                    &nbsp &nbsp
                                            <asp:LinkButton ID="LinkButton5" CommandName="delete" Visible='<%#checkrole("2723") %>' OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
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
                 <span class='detail_error'><asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></span>
                <div id="parentHorizontalTabcontent">
                    <ul class="resp-tabs-list hor_1">
                        <li>Thông tin chung</li>
                        <li>Cấu hình SEO</li>
                    </ul>
                    <div class="resp-tabs-container hor_1">
                     <div>
                              <div class="row">
                                <div class="col-sm-8">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Tiêu đề</label> <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Tiêu đề</b><br />
                                                        Nhập tiêu đề, độ dài tiêu đề không quá 150 ký tự
                                                    </span>
                                                </a>
                                             <asp:TextBox ID="txtnewsname" runat="server" Width="100%" CssClass="inputbox" placeholder="Nhập tiêu đề tin"></asp:TextBox>
                                        </div>
                                         <div class="form-group">
                                            <label class="next-label">Mô tả</label>
                                             <asp:TextBox ID="txtdesc" TextMode="MultiLine" Height="80" runat="server" Width="100%" CssClass="inputbox "></asp:TextBox>

                                        </div>
                                         <div class="form-group">
                                            <label class="next-label">Chi tiết</label>
                                             <CKEditor:CKEditorControl Height="400" ID="txtcontent" runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                        </div>
                                        </div>

                                    
                                     <div class="block_sp hidden">
                                          <p class="ttg">Tag liên quan</p>
                                         <div class="form-group">
                                             <label class="next-label" data-bind="text:Title">Danh sách tag liên quan</label><a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Tag liên quan</b><br />
                                                        Các từ khóa liên quan đến tin cách nhau bởi dấu phảy (,)
                                                    </span>
                                                </a>
                                               <input type="hidden" id="idtem" value="<%=iid %>" />
                                             <input name="tagtemp" type="hidden" id="tagtemp" value="<%=tags %>" />
                                                <input class="form-control" id="taglist" name="taglist" value="<%=tags %>" placeholder="Nhập tag, Phân cách bằng dấu phẩy (,)" style="display: none;">
                                                <div class="bootstrap-tagsinput">
                                                    <p class="tagl" style="display: inline-block">
                                                        <asp:Literal ID="lttags" runat="server"></asp:Literal>
                                                    </p>
                                                    <asp:TextBox ID="txt_tag" runat="server" placeholder="Nhập tag, Phân cách bằng dấu phẩy (,)" CssClass="inputbox"></asp:TextBox>
                                                </div>
                                                <p style="padding: 10px 0px; color: #9fafba">Chọn thêm các tag đã có sẵn.</p>
                                                <div class="tags text-no-bold">
                                                    <div class="input-group">
                                                        <ul>
                                                            <asp:Repeater ID="rptags" runat="server">
                                                                <ItemTemplate>
                                                                    <li>
                                                                        <label class="item tag-color-<%#getssttag() %> <%#gettagselected(Eval("vtagfull").ToString()) %>"><%#Eval("vtagfull") %></label>
                                                                    </li>
                                                                </ItemTemplate>
                                                            </asp:Repeater>

                                                        </ul>

                                                    </div>

                                                </div>
                                         </div>
                                         
                                      
                                         </div>
                                    </div>

                                   <div class="col-sm-4">
                                         <div class="block_sp">
                                         <div class="form-group">
                                             <label class="text-no-bold" data-bind="text:Title" style="font-weight:bold">Hình ảnh đại diện</label>
                                               <asp:FileUpload Width="180" CssClass="btn-change-link pull-right" ID="flupload" runat="server" />
                                         </div>
                                         <div class="center">
                                              <asp:Literal ID="ltimage" runat="server"></asp:Literal>
                                             <asp:Literal ID="ltimagedefault" runat="server"></asp:Literal>
                                         </div>
                                         <p style="color:#c3cfd8" class="center">Sử dụng nút <strong>Chọn hình</strong> để thêm hình.</p>
                                         </div>
                                         <div class="block_sp">
                                        <p class="ttg">Danh mục <a href="#" class="tooltip">
                                                                    <img src="../templates/admin/images/help-icon.png" />
                                                                    <span><b>Danh mục dự án</b><br />
                                                                        Lưa chọn danh mục  dự án
                                                                    </span>
                                                                </a></p>
                                        <div class="form-group">
                                            
                                           <asp:DropDownList ID="ddlcate" Width="100%" runat="server" CssClass="inputbox"></asp:DropDownList>
                                        </div>
                                      
                                        </div>

                                       
                                         <div class="block_sp">
                                        <p class="ttg">Ngày đăng <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Cập nhật ngày đăng</b><br />
                                                        Thay đổi ngày đăng tin, ngày phải theo định dạng ngày/tháng/năm (20/10/2014)
                                                    </span>
                                                </a></p>
                                        <div class="form-group">
                                          
                                            <asp:TextBox ID="txt_updatetime" CssClass="inputbox" Width="92"  runat="server"></asp:TextBox>
                                                &nbsp;
                                                lúc &nbsp;<asp:DropDownList ID="ddlhour" runat="server" CssClass="inputbox"></asp:DropDownList>
                                                giờ&nbsp;&nbsp;
                                                <asp:DropDownList ID="ddlminute" runat="server" CssClass="inputbox"></asp:DropDownList>
                                                phút
                                               
                                            
                                        </div>
                                             </div>
                                         

                                         <div class="block_sp">
                                        <p class="ttg">Thứ tự <a href="#" class="tooltip">
                                                                        <img src="../templates/admin/images/help-icon.png" />
                                                                        <span><b>Thứ tự</b><br />
                                                                            Thứ tự hiện thị của tin trong 1 danh mục
                                                                        </span>
                                                                    </a></p>
                                                 <div class="form-group">
                                               <asp:TextBox ID="txtorder" onkeypress=" return isNumberKey(event)" CssClass="inputbox" Width="100%" runat="server"></asp:TextBox>
                                                     </div>
                                             </div>
                                         <div class="block_sp">
                                        <div class="form-group">
                                         
                                          
                                             <div class="form-group">
                                                <p class="ttg">Tùy chọn tin</p>
                                               <asp:CheckBox ID="chknew" runat="server" Text=" " /> dự án mới
                                                &nbsp  &nbsp
							    <asp:CheckBox ID="chkhot" runat="server" Text=" " /> dự án nổi bật
                                                 </div>
                                        </div>
                                             </div>
                                         <div class="block_sp">
                                        <div class="form-group">
                                               <p class="ttg">Trạng thái</p>
                                              <asp:CheckBox ID="chkstatus" runat="server" Text="" />  Hiển thị<br />
                                        </div>
                                        </div></div>
                                       </div>

                                 
                           
                               

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
                                                       Đường dẫn tới trang dự án
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
             <asp:HiddenField ID="hdiusercreate" Value="-1" runat="server" Visible="false" />
             <asp:HiddenField ID="hdvusercreate" runat="server" Visible="false" />
             <asp:HiddenField ID="hdtitle" runat="server" Visible="false" />
            <asp:HiddenField ID="hdalias" runat="server" Visible="false" />
             <asp:HiddenField ID="hdname" runat="server" Visible="false" />
              <asp:HiddenField ID="hddmql" runat="server" Visible="false" />
        </div>
        <div class="clr"></div>
    </div>
</div>
<%--        <script type="text/javascript" src="<%=weburl%>ckeditor/jquery-1.4.1.min.js"></script>--%>

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

        $("#txt_updatetime").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy'
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
</script>
