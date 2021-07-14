<%@ Control Language="C#" AutoEventWireup="true" CodeFile="item_edit.ascx.cs" Inherits="admin_products_item_edit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<script src="<%=WEB.Common.Weburl %>templates/admin/js/lang.js"></script>
<script src="<%=WEB.Common.Weburl %>templates/admin/js/jquery.fineuploader.js"></script>
<script src="<%=WEB.Common.Weburl %>templates/admin/js/js.upload.js"></script>
<link rel="stylesheet" href="<%=WEB.Common.Weburl %>templates/admin/css/jquery.modal.min.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
    $(function () {
        $("#txthotdealdate").datepicker({
            dateFormat: 'dd/mm/yy'
        });

    });
</script>

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
                            <asp:Literal ID="ltcopy" runat="server"></asp:Literal>
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
            <div id="parentHorizontalTabcontent">
                <ul class="resp-tabs-list hor_1">
                    <li>Thông tin chi tiết</li>
                    <li>Hình ảnh liên quan</li>
                    <li<%=pbsp %>>
                    Phiên bản sản phẩm</li>
                        <li>Thông tin khác</li>
                    <li>Cấu hình SEO</li>
                    <li>Tab thông tin</li>
                </ul>
                <div class="resp-tabs-container hor_1">
                    <div style="background: #f0f0f0">
                        <div class="row">
                            <div class="col-sm-8">
                                <div class="block_sp">
                                    <div class="form-group">
                                        <label class="next-label">Tên sản phẩm</label>
                                        <a href="#" class="tooltip">
                                            <img src="../templates/admin/images/help-icon.png" />
                                            <span><b>Tên sản phẩm</b><br />
                                                Nhập tên của sản phẩm (VD:Samsung Galaxy S).  Tối đa 200 ký tự
                                            </span>
                                        </a>
                                        <asp:TextBox ID="txtproductname" runat="server" Width="100%" CssClass="inputbox" placeholder="ví dụ : Iphone 8 , Samsung S8"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="next-label">Mô tả</label>
                                        <CKEditor:CKEditorControl ID="txtdesc" runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                    </div>
                                    <div class="form-group">
                                        <label class="next-label">Chi tiết sản phẩm</label>
                                        <CKEditor:CKEditorControl Height="400" ID="txtcontent" runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="block_sp">
                                    <div class="form-group">
                                        <label class="text-no-bold" data-bind="text: Title">Hình ảnh đại diện</label>
                                        <asp:FileUpload CssClass="btn-change-link pull-right" ID="flupload" Width="180" runat="server" />
                                    </div>
                                    <div class="center">
                                        <asp:Literal ID="ltimage" runat="server"></asp:Literal>
                                        <asp:Literal ID="ltimagedefault" runat="server"></asp:Literal>
                                    </div>
                                    <p style="color: #c3cfd8" class="center">Sử dụng nút <strong>Chọn hình</strong> để thêm hình.</p>
                                </div>
                                <div class="block_sp">
                                    <div class="form-group">
                                        <label class="next-label">Mã sản phẩm</label>
                                        <a href="#" class="tooltip">
                                            <img src="../templates/admin/images/help-icon.png" />
                                            <span><b>Mã sản phẩm</b><br />
                                                Mã của sản phẩm hoặc đơn vị phân loại hàng tồn kho (SKU), có thể là các con số hoặc một đoạn mã để xác định tính duy nhất của sản phẩm. Tối đa 20 ký tự
                                            </span>
                                        </a>
                                        <asp:TextBox ID="txtproductkey" runat="server" Width="100%" CssClass="inputbox" placeholder="Mã sản phẩm: SKU001"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="block_sp">
                                    <div class="form-group">
                                        <p class="ttg">Giá sản phẩm</p>

                                        <div class="form-group">
                                            <label class="next-label">Giá </label>
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Giá</b><br />
                                                    Giá bán hiện tại của sản phẩm
                                                </span>
                                            </a>

                                            <asp:TextBox ID="txtpricenew" onkeypress=" return isNumberKey(event)" runat="server" Width="100%" CssClass="inputbox" Text="0"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label class="next-label">Giá so sánh</label>
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Giá so sánh</b><br />
                                                    Giá so sánh với giá thị trường (Không bắt buộc nhập)
                                                </span>
                                            </a>

                                            <asp:TextBox ID="txtpriceold" onkeypress=" return isNumberKey(event)" placeholder="Giá so sánh với giá thị trường (Không bắt buộc nhập)" runat="server" Width="100%" Text="0" CssClass="inputbox"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="block_sp">
                                    <p class="ttg">Phân loại</p>
                                    <div class="form-group">
                                        <label class="next-label">Loại sản phẩm</label>
                                        <a href="#" class="tooltip">
                                            <img src="../templates/admin/images/help-icon.png" />
                                            <span><b>Danh mục sản phẩm</b><br />
                                                Lưa chọn danh mục chứa sản phẩm
                                            </span>
                                        </a>
                                        <asp:DropDownList ID="ddlcate" Width="100%" runat="server" CssClass="inputbox"></asp:DropDownList>
                                    </div>
                                    <div class="form-group" id="pngr" runat="server">
                                        <label class="next-label">Nhóm sản phẩm</label>
                                        <div class="listgr">
                                            <ul>
                                                <asp:Repeater ID="rpgroup" runat="server">
                                                    <ItemTemplate>
                                                        <li>
                                                            <input type="checkbox" <%#checkgroup(Eval("icid").ToString()) %> name="chkgr" value="<%#Eval("icid") %>">
                                                            <%#Eval("vname") %></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="block_sp hidden" id="pntt" runat="server">
                                    <p class="ttg">Thuộc tính</p>
                                    <div class="form-group">
                                        <label class="next-label">Chọn thuộc tính sản phẩm</label>

                                        <div class="listtt">
                                            <asp:Literal ID="lttt" runat="server"></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                                <div class="block_sp hidden" id="Div1" runat="server">
                                    <p class="ttg">Tùy chọn tìm kiếm giá</p>
                                    <div class="form-group">
                                        <label class="next-label">Chọn tìm kiếm giá xe</label>
                                        <asp:DropDownList CssClass="inputbox " Style="width: 100%" ID="ddsprice" runat="server">

                                            <asp:ListItem Text="Dưới 600 tr" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Trên 600 tr" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="block_sp hidden" id="Div2" runat="server">
                                    <p class="ttg">Tùy chọn tìm trọng tải</p>
                                    <div class="form-group">
                                        <label class="next-label">Chọn tìm kiếm trọng tải</label>
                                        <asp:DropDownList CssClass="inputbox " Style="width: 100%" ID="ddspayload" runat="server">

                                            <asp:ListItem Text="Dưới 5 Tấn" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Trên 5 Tấn" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="block_sp hidden" id="Div3" runat="server">
                                    <p class="ttg">Tùy chọn tìm kiếm hộp số</p>
                                    <div class="form-group">
                                        <label class="next-label">Chọn tìm kiếm hộp số</label>
                                        <asp:DropDownList CssClass="inputbox " Style="width: 100%" ID="ddsgear" runat="server">
                                            <asp:ListItem Text="Số tự động AT" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Số sàn MT" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Số vô cấp VTV" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="block_sp">
                                    <p class="ttg">Tùy chọn</p>
                                    <div class="form-group">
                                        <label class="next-label">Thứ tự</label>
                                        <a href="#" class="tooltip">
                                            <img src="../templates/admin/images/help-icon.png" />
                                            <span><b>Thứ tự</b><br />
                                                Thứ tự hiện thị của sản phẩm trong 1 danh mục
                                            </span>
                                        </a>
                                        <asp:TextBox ID="txtorder" CssClass="inputbox" onkeypress=" return isNumberKey(event)" Width="100%" runat="server">1</asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <p class="ttg">Trạng thái</p>
                                        <asp:CheckBox ID="chkstatus" runat="server" Text="" />
                                        Hiển thị<br />
                                        <asp:CheckBox ID="chkupdatedate" runat="server" Text=" Cập nhật ngày đăng " Visible="false" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>

                        <input type="hidden" name="hdidtemp" value="<%=iidtemp %>" id="hdidtemp">
                        <input type="hidden" name="hdlistimgrel" value="" id="hdlistimgrel">
                        <input type="hidden" name="hdnumimgadd" value="0" id="hdnumimgadd">
                        <div id="uploadfiles" maxcount="16" input="ctl33_ctl00_FileServer2_ctl00" class="uploadfdfile upload-create-form">

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
                                        <span class="imt">
                                            <input type="text" placeholder='Alt ảnh' name="txtalt<%#Eval("ino") %>" id="txtalt<%#Eval("ino") %>" value="<%#Eval("vdesc") %>" />
                                        </span>
                                        <span data="<%#Eval("ino") %>" class="item-upload-del" title="Xóa"></span>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <div>
                        <div class="wrapper-content  ps-relative" id="divProductVariants">
                            <label class="title-product-main  block-display mb20">Sản phẩm có nhiều phiên bản. </label>
                            <span style="color: #aaa; font-size: 12px; padding-left: 10px">Thêm mới thuộc tính giúp sản phẩm có nhiều lựa chọn, như kích cỡ hay màu sắc.</span>
                            <div class="pull-right pos-add-edit-btn">

                                <a class="btn-add-prdt ml10 hidden" data-toggle="modal">Thêm mới</a>
                            </div>
                            <div class="listtt" style="margin-bottom: 20px">
                                <table class="next-table table--no-side-padding table--no-border expanded js-options-table">
                                    <thead>
                                        <tr>
                                            <td class="option-name" width="25%"><b>Tên thuộc tính</b></td>
                                            <td class="option-values"><b>Giá trị</b> <span style="font-size: 11px; color: #888; padding-left: 10px">Các giá trị thuộc tính cách nhau bằng dấu ","</span></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="options options-1">
                                            <td>
                                                <input type="text" name="txtcolor" class="txtcolor form-control" value="<%=color %>" />
                                            </td>
                                            <td>
                                                <div class="bootstrap-tagsinput">
                                                    <span class="listgt">
                                                        <asp:Literal ID="ltcolor" runat="server"></asp:Literal></span>
                                                    <input type="text" id="txtcolorinput" name="txtcolorinput" placeholder="Nhập giá trị thuộc tính" size="23">
                                                </div>
                                                <input type="text" name="txtcolortemp" id="txtcolortemp" value="<%=colorlist %>" placeholder="Nhập giá trị thuộc tính" class="next-input txttemp" style="display: none;">
                                            </td>
                                        </tr>
                                        <tr class="options options-2">
                                            <td>
                                                <input type="text" name="txtsize" class="txtcolor form-control" value="<%=size %>" />
                                            </td>
                                            <td>
                                                <div class="bootstrap-tagsinput">
                                                    <span class="listgt">
                                                        <asp:Literal ID="ltsize" runat="server"></asp:Literal></span>
                                                    <input type="text" id="txtsizeinput" name="txtsizeinput" placeholder="Nhập giá trị thuộc tính" size="23">
                                                </div>
                                                <input type="text" name="txtsizetemp" id="txtsizetemp" value="<%=sizelist %>" placeholder="Nhập giá trị thuộc tính" class="next-input txttemp" style="display: none;">
                                            </td>
                                        </tr>
                                        <tr class="options options-3">
                                            <td>
                                                <input type="text" name="txtmaterial" class="txtcolor form-control" value="<%=material %>" />
                                            </td>
                                            <td>
                                                <div class="bootstrap-tagsinput">
                                                    <span class="listgt">
                                                        <asp:Literal ID="ltmaterial" runat="server"></asp:Literal></span>
                                                    <input type="text" id="txtmaterialinput" name="txtmaterialinput" placeholder="Nhập giá trị thuộc tính" size="23">
                                                </div>
                                                <input type="text" name="txtmaterialetemp" id="txtmaterialtemp" value="<%=materiallist %>" placeholder="Nhập giá trị thuộc tính" class="next-input txttemp" style="display: none;">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="" style="clear: both">

                                <div class="table-wrap overflow-auto">
                                    <table class="table p-none tabprdm">
                                        <thead>
                                            <tr>

                                                <th class="col-sm-5"><b>Phiên bản</b></th>

                                                <th class="col-sm-5"><b>Giá</b></th>

                                                <th class="col-sm-1"></th>
                                            </tr>
                                        </thead>

                                        <asp:Repeater ID="rpsubprd" runat="server">
                                            <ItemTemplate>
                                                <tr id="trsub<%#getstt() %>" class="record">

                                                    <td>
                                                        <input type="text" readonly="readonly" class="form-control inline" name="prdname-<%#icurrent %>" value="<%#Eval("vtitle") %>" />
                                                    </td>

                                                    <td>
                                                        <div class="input-group box-choose-collection-border">
                                                            <span class="input-group-addon input-style-collection text-price-dollar">đ</span>
                                                            <input type="text" onkeypress=" return isNumberKey(event)" class="form-control inline prdprice" value="<%#Eval("vcontent") %>" name="prdprice-<%#icurrent %>">
                                                        </div>
                                                    </td>

                                                    <td valign="top" align="center">
                                                        <input type="hidden" class="rc-isub" name="rc-isub-<%#icurrent %>" value="<%#Eval("ino") %>" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <tbody>
                                            <tr id="trsub-1" class="recordtemp hidden">

                                                <td>
                                                    <input type="text" readonly="readonly" class="form-control inline prdname" placeholder="Mã: ví dụ (001)" name="prdname-1">
                                                </td>

                                                <td>
                                                    <div class="input-group box-choose-collection-border">
                                                        <span class="input-group-addon input-style-collection text-price-dollar">đ</span>
                                                        <input type="text" onkeypress=" return isNumberKey(event)" class="form-control inline prdprice" name="prdprice-1" value="0">
                                                    </div>
                                                </td>

                                                <td valign="top" align="center">
                                                    <input type="hidden" class="rc-isub" name="rc-isub-1" value="-1" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <input type="hidden" id="hdnumprd" name="hdnumprd" value="<%=subnum %>" />
                                    <input type="hidden" id="hdnumprdtmp" name="hdnumprdtmp" value="<%=subnum %>" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <table width="100%" class="admintable">
                            <tr id="pnvender" runat="server">
                                <td class="key" style="width: 170px" valign="top">
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
                            <tr style="display: none">
                                <td class="key" valign="top">
                                    <label for="txtphone">Xuất xứ</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtxuatxu" CssClass="inputbox" Width="350" runat="server"></asp:TextBox>
                                    <a href="#" class="tooltip">
                                        <img src="../templates/admin/images/help-icon.png" />
                                        <span><b>Xuất xứ</b><br />
                                            Xuất xứ
                                        </span>
                                    </a>
                                </td>
                            </tr>
                            <tr class="hidden">
                                <td class="key" valign="top">
                                    <label for="txtphone">Trọng lượng</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtweight" Text="0" onkeypress=" return isNumberKey(event)" CssClass="inputbox" runat="server"></asp:TextBox>
                                    gram
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Trọng lượng</b><br />
                                                        Trọng lượng của sản phẩm dùng trong trường hợp cần tính phí vận chuyển
                                                    </span>
                                                </a>
                                </td>
                            </tr>
                            <tr style="display: none">
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
                                                        Số lượng sản phẩm tồn tại trong kho
                                                    </span>
                                                </a>
                                            </td>
                                            <td width="100"></td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr style="display: none">
                                <td width="90">
                                    <label for="txtuser">Đơn vị</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtunit" runat="server" Width="100" CssClass="inputbox"></asp:TextBox>
                                    <a href="#" class="tooltip">
                                        <img src="../templates/admin/images/help-icon.png" />
                                        <span><b>Đơn vị</b><br />
                                            Đơn vị của sản phẩm (VD:thùng, kg, cái,...)
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
                            <tr style="display: none">
                                <td class="key" valign="top">
                                    <label for="txtphone">Bảo hành</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtbh" TextMode="MultiLine" Rows="5" Columns="50" runat="server"></asp:TextBox>
                                    <a href="#" class="tooltip">
                                        <img src="../templates/admin/images/help-icon.png" />
                                        <span><b>Bảo hành</b><br />
                                            Mô tả thông tin bảo hành sản phẩm
                                        </span>
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td class="key" valign="top">
                                    <label for="txtphone">Tình trạng</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddltt" Width="170" CssClass="inputbox" runat="server">
                                        <asp:ListItem Text="Còn hàng" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Hết hàng" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;&nbsp;&nbsp;&nbsp;

                                                 <asp:CheckBox Visible="false" ID="chkdisplaytt" runat="server" Text="hiển thị tình trạng" />
                                    <a href="#" class="tooltip hidden">
                                        <img src="../templates/admin/images/help-icon.png" />
                                        <span><b>Tình trạng</b><br />
                                            Tích chọn nếu bạn muốn hiển thị tình trạng trên website
                                        </span>
                                    </a>
                                </td>
                            </tr>
                            <tr style="display: none">
                                <td class="key" valign="top">
                                    <label for="txtphone">Cho phép đặt hàng</label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkacceptbuy" runat="server" />
                                    <a href="#" class="tooltip">
                                        <img src="../templates/admin/images/help-icon.png" />
                                        <span><b>Tình trạng</b><br />
                                            Tích chọn nếu bạn muốn cho phép đặt hàng sản phẩm trên website
                                        </span>
                                    </a>
                                </td>
                            </tr>
                            <tr class="hidden">
                                <td class="key" valign="top">
                                    <label for="txtphone">Hot Deal</label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkhotdeal" runat="server" />
                                    Sản phẩm chạy Hot Deal
                                </td>
                            </tr>
                            <tr class="hidden">
                                <td class="key" valign="top">
                                    <label for="txtphone">Kết thúc hotdeal </label>
                                </td>
                                <td>
                                    <asp:TextBox Width="170" placeholder="ngày/tháng/năm" ID="txthotdealdate" runat="server" CssClass="inputbox"></asp:TextBox>
                                    lúc &nbsp;<asp:DropDownList ID="ddlhour" runat="server" CssClass="inputbox"></asp:DropDownList>
                                    giờ&nbsp;&nbsp;
                                                <asp:DropDownList ID="ddlminute" runat="server" CssClass="inputbox"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="key">
                                    <label for="txtphone">Tùy chọn</label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chknew" runat="server" Text=" Sản phẩm mới" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
							        <asp:CheckBox ID="chkhot" runat="server" Text=" Sản phẩm bán chạy" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
							        <asp:CheckBox ID="chksale" runat="server" Text=" Sản phẩm khuyến mại" />
                                    <a href="#" class="tooltip">
                                        <img src="../templates/admin/images/help-icon.png" />
                                        <span><b>Tùy chọn</b><br />
                                            Tùy chọn để hiển thị sản phẩm trong danh sách sản phẩm bán mới, bán chạy hay khuyến mại
                                        </span>
                                    </a>
                                </td>
                            </tr>
                            <tr style="display: none">
                                <td class="key" valign="top">
                                    <label for="txtphone">Số lượng sản phẩm đã bán</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtnumprdsale" CssClass="inputbox" runat="server"></asp:TextBox>
                                    <a href="#" class="tooltip">
                                        <img src="../templates/admin/images/help-icon.png" />
                                        <span><b>Sản phẩm đã bán</b><br />
                                            Cập nhật số lượng sản phẩm đã bán khi có đơn hàng
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
                                                    Nội dung được hiển thị dưới dạng tiêu đề trong kết quả tìm kiếm và trên trình duyệt của người dùng.
                                                    <br>
                                                    <i>(Tiêu đề nên để dưới 70 ký tự)</i>
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
                                                    Đường dẫn tới sản phẩm
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
                                                    Cung cấp một mô tả ngắn của trang. Trong vài trường hợp, mô tả này được sử dụng như một phần của đoạn trích được hiển thị trong kết quả tìm kiếm.
                                                    <br>
                                                    <i>(Mô tả nên để dưới 160 ký tự)</i>
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
                                            <td class="key">Tiêu đề tab
                                                <input type="text" width="300" name="txttabname-<%#icurrent %>" value="<%#Eval("vtitle") %>" class="txttabname inputbox" />
                                                <a id="rc-deletetab-<%#icurrent %>" href="javascript:0" class="deltabprd" title="Xóa tab">Xóa tab</a><br />
                                                <br />
                                                <textarea name="txtcontentcn-<%#icurrent %>" class="txtcontentcn" id="txtcontentcn-<%#icurrent %>"><%#Eval("vcontent") %></textarea>
                                                <input type="hidden" class="rc-tab" name="rc-tab-<%#icurrent %>" value="<%#Eval("ino") %>" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <tr id="tr<%=n %>" class="record">
                                    <td class="key">Tiêu đề tab
                                        <input type="text" width="300" name="txttabname-<%=n %>" class="txttabname inputbox" />
                                        <a id="rc-deletetab-<%=n %>" href="javascript:0" class="deltabprd" title="Xóa tab">Xóa tab</a><br />
                                        <br />
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
                                        filebrowserImageUploadUrl: '/admin/upload/uploadimg.ashx',
                                        filebrowserImageBrowseUrl: '/ckfinder/ckfinder.html?type=Images',
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

            <asp:HiddenField ID="hdbrochure" runat="server" Visible="false" />
            <asp:HiddenField ID="hdgroup" runat="server" Visible="false" />
            <asp:HiddenField ID="hditemp" runat="server" Value="-1" Visible="false" />
        </div>
        <div class="clr"></div>
    </div>
</div>
<div class="modal-backdrop " style="display: none">
    <div id="ex1" class="modal">
        <div class="modal-header ">
            <a href="#" rel="modal:close" class="close">X</a>
            <h4 class="modal-title">Nhân bản sản phẩm</h4>
        </div>
        <div class="modal-body">
            <div class="">
                <label class="next-label">Tên sản phẩm mới</label>
                <asp:TextBox ID="txtnamecopy" runat="server" CssClass="inputbox fullwidth" placeholder="Ví dụ: Lumia 930, Samsung galaxy s4"></asp:TextBox>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" rel="modal:close" class="btn btn-default bnthuy">Hủy</a>
            <asp:LinkButton ID="lnk" runat="server" OnClientClick="return checknb();" CssClass="btn btn-primary" Text="Nhân bản" OnClick="btnnhanban_Click">Nhân bản</asp:LinkButton>
        </div>
    </div>
</div>
<script type="text/javascript">

    function checknb() {
        var name = $("#txtnamecopy").val();
        if (name.length == 0) {
            alert("Xin mời nhập tên sản phẩm");
            return false;
        }
        else
            return true;
    }
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
    $(document).on("keypress keyup keydown", '#txtcolorinput', function (e) {
        var value = $(this).val();
        var keycode = e.keyCode;
        var str = "";
        if (keycode == 13) {
            e.preventDefault();
            if (value.length > 0) {
                var idl = $(this).parents('.bootstrap-tagsinput');
                var temp = $("#txtcolortemp").val();
                if (temp.length == 0) {
                    temp = value;
                    $("#txtcolortemp").val(temp);
                    idl.find(".listgt").append("<span class='tag label label-info'>" + value + "<span data-role='remove' class='gtremove'></span></span>");
                    loadtt();
                }
                else {
                    var temp1 = temp + ",";
                    var temp2 = "," + temp1;
                    var value1 = "," + value + ",";
                    if (temp2.indexOf(value1) == -1) {
                        temp = temp + "," + value;
                        $("#txtcolortemp").val(temp);
                        idl.find(".listgt").append("<span class='tag label label-info'>" + value + "<span data-role='remove' class='gtremove'></span></span>");
                        loadtt();
                    }
                }

                $(this).val("");
            }
        }
    });
    $(document).on("keypress keyup keydown", '#txtsizeinput', function (e) {
        var value = $(this).val();
        var keycode = e.keyCode;
        var str = "";
        if (keycode == 13) {
            e.preventDefault();
            if (value.length > 0) {
                var idl = $(this).parents('.bootstrap-tagsinput');
                var temp = $("#txtsizetemp").val();
                if (temp.length == 0) {
                    temp = value;
                    $("#txtsizetemp").val(temp);
                    idl.find(".listgt").append("<span class='tag label label-info'>" + value + "<span data-role='remove' class='gtremove'></span></span>");
                    loadtt();
                }
                else {
                    var temp1 = temp + ",";
                    var temp2 = "," + temp1;
                    var value1 = "," + value + ",";
                    if (temp2.indexOf(value1) == -1) {
                        temp = temp + "," + value;
                        $("#txtsizetemp").val(temp);
                        idl.find(".listgt").append("<span class='tag label label-info'>" + value + "<span data-role='remove' class='gtremove'></span></span>");
                        loadtt();
                    }
                }

                $(this).val("");
            }
        }
    });
    $(document).on("keypress keyup keydown", '#txtmaterialinput', function (e) {
        var value = $(this).val();
        var keycode = e.keyCode;
        var str = "";
        if (keycode == 13) {
            e.preventDefault();
            if (value.length > 0) {
                var idl = $(this).parents('.bootstrap-tagsinput');
                var temp = $("#txtmaterialtemp").val();
                if (temp.length == 0) {
                    temp = value;
                    $("#txtmaterialtemp").val(temp);
                    idl.find(".listgt").append("<span class='tag label label-info'>" + value + "<span data-role='remove' class='gtremove'></span></span>");
                    loadtt();
                }
                else {
                    var temp1 = temp + ",";
                    var temp2 = "," + temp1;
                    var value1 = "," + value + ",";
                    if (temp2.indexOf(value1) == -1) {
                        temp = temp + "," + value;
                        $("#txtmaterialtemp").val(temp);
                        idl.find(".listgt").append("<span class='tag label label-info'>" + value + "<span data-role='remove' class='gtremove'></span></span>");
                        loadtt();
                    }
                }

                $(this).val("");
            }
        }
    });
    function loadtt() {
        var color = $("#txtcolortemp").val();
        var size = $("#txtsizetemp").val();
        var material = $("#txtmaterialtemp").val();
        var arrcolor = color.split(',');
        var arrsize = size.split(',');
        var arrme = material.split(',');
        var n = arrcolor.length;
        var m = arrsize.length;
        var k = arrme.length;
        $(".record").each(function () {
            $(this).remove();
        });
        var stt = 1;
        for (i = 0; i < n; i++) {
            for (j = 0; j < m; j++) {
                for (h = 0; h < k; h++) {
                    idpr = $('.tabprdm');
                    tr = idpr.children('tbody').children('tr:last');
                    step = tr.clone().removeClass("hidden");
                    step.removeClass("record1");
                    step.addClass("record");
                    stt = stt + 1;
                    step.attr("id", "trsub-" + stt);
                    step.children('td').children('input.prdcode').attr('name', 'prdcode-' + stt);
                    step.children('td').children('input.prdname').attr('name', 'prdname-' + stt);
                    var name = "";
                    if (arrcolor[i].length > 0)
                        name = arrcolor[i];
                    if (arrsize[j].length > 0) {
                        if (name.length == 0)
                            name = arrsize[j];
                        else
                            name = name + "/" + arrsize[j];
                    }
                    if (arrme[h].length > 0) {
                        if (name.length == 0)
                            name = arrme[h];
                        else
                            name = name + "/" + arrme[h];
                    }
                    step.children('td').children('input.prdname').attr('value', name);
                    step.children('td').children('div').children('input.prdprice').attr('name', 'prdprice-' + stt);
                    step.children('td').children('div').children('input.prdprice').attr('value', $("#txtpricenew").val());
                    step.children('td').children('.rc-isub').attr('name', 'rc-isub-' + stt);
                    step.children('td').children('.rc-isub').attr('value', -1);

                    step.appendTo(idpr);
                }
            }
        }
        $("#hdnumprd").val(stt);
        $("#hdnumprdtmp").val(stt);
    }
    $(document).on("click", '.gtremove', function () {
        var value = $(this).parents(".tag").text() + ",";
        var tm = $(this).parents("td").children(".txttemp");
        var a = tm.val() + ",";
        a = a.replace(value, "");
        a = a.substring(0, a.length - 1);
        tm.val(a);
        $(this).parents(".tag").remove();
        loadtt();
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
    $(document).on("click", '.nhanban', function () {
        $(".modal-backdrop").show();
        $("#ex1").show();
    })
    $(document).on("click", '.close', function () {
        $(".modal-backdrop").hide();
        $("#ex1").hide();
    })
    $(document).on("click", '.bnthuy', function () {
        $(".modal-backdrop").hide();
        $("#ex1").hide();
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

    table.expanded td {
        padding: 6px 10px;
    }

    .bootstrap-tagsinput {
        background-color: #fff;
        border: 1px solid #ccc;
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        display: inline-block;
        padding: 4px 6px;
        color: #555;
        vertical-align: middle;
        border-radius: 4px;
        max-width: 100%;
        line-height: 22px;
        cursor: text;
    }

    .options-1 .bootstrap-tagsinput .tag {
        background-color: #29bc94;
    }

    .options-2 .bootstrap-tagsinput .tag {
        background-color: #763eaf;
    }

    .options-3 .bootstrap-tagsinput .tag {
        background-color: #ff9517;
    }

    .options .bootstrap-tagsinput .tag {
        color: #fff;
    }

    .bootstrap-tagsinput .tag {
        margin-bottom: 2px;
        margin-top: 2px;
        padding: 8px 8px;
        background-color: #dfe4e8;
        color: #454f5b;
        margin-right: 2px;
        margin-bottom: 5px;
        display: -webkit-inline-box;
        margin-right: 0;
        font-weight: 400;
        font-size: 14px;
        word-break: break-all;
        word-wrap: break-word;
        white-space: normal;
        text-align: left;
    }

    .bootstrap-tagsinput input {
        border: none;
        box-shadow: none;
        outline: none;
        background-color: transparent;
        padding: 0 6px;
        margin: 0;
        width: auto;
        max-width: inherit;
    }

    .bootstrap-tagsinput .tag [data-role="remove"] {
        margin-left: 8px;
        cursor: pointer;
    }
</style>