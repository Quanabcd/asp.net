<%@ Control Language="C#" AutoEventWireup="true" CodeFile="setting.ascx.cs"  Inherits="admin_products_setting" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<div class="widget">
    <div class="widget-title">
        <%--Header--%>
        <p style='color: #16757c; margin: 0; font-size: 11px; padding: 12px 15px 0px 15px; font-style: italic;'>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal></p>
        <div class="widget-title">
            <h4><i class="icon-reorder">
                <asp:Literal ID="lttitle" runat="server"></asp:Literal></i></h4>
            <div class="ui-widget-content ui-corner-top ui-corner-bottom">
                <div id="toolbox">

                    <div style="float: right; margin-right: 10px;" class="toolbox-content">

                        <table class="toolbar">
                            <tr>



                                <td align="center">
                                    <asp:LinkButton ID="lnkupdate" runat="server" CssClass="toolbar" OnClick="lnkupdate_Click">
							<span class="icon-ok-update"></span>
							Cập nhật
                                    </asp:LinkButton>
                                </td>

                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>
        <%----//----%>
        <div style="width: 98% !important;" id="parentHorizontalTab" class="divvalidate">
            <ul class="resp-tabs-list hor_1">
                <li>Cấu hình sản phẩm</li>
            </ul>
            <div class="resp-tabs-container hor_1">
                <div>
			
						<span class='detail_error'><asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></span>
						<table cellspacing="1" class="admintable">
						<tbody>
						<tr>
							<td width="150" class="key" style="width:250px">
								<label for="txttitle">Đơn vị tiền tệ</label>
							</td>
							<td>
								<asp:TextBox ID="txtunit" runat="server"  CssClass="inputbox" Width="100"></asp:TextBox>
							</td>
						</tr>
						
						<tr>
							<td width="150" class="key">
								<label for="txttitle">Số sản phẩm mới</label>
							</td>
							<td>
								<asp:TextBox ID="txtnumnew" runat="server"  CssClass="inputbox" Width="100" ></asp:TextBox>
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Số sản phẩm mới</b><br />
                                                        Số sản phẩm mới được hiển thị trong mục sản phẩm mới
                                                    </span>
                                                </a>
							</td>
						</tr>
						<tr>
							<td width="150" class="key">
								<label for="txttitle">Số sản phẩm bán chạy</label>
							</td>
							<td>
								<asp:TextBox ID="txtnumhot" runat="server"  CssClass="inputbox" Width="100" ></asp:TextBox>
                                 <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Số sản phẩm bán chạy</b><br />
                                                        Số sản phẩm bán chạy được hiển thị trong mục sản phẩm bán chạy
                                                    </span>
                                                </a>
							</td>
						</tr>
						<tr>
							<td width="150" class="key">
								<label for="txttitle">Số sản phẩm khuyến mại</label>
							</td>
							<td>
								<asp:TextBox ID="txtnumsale" runat="server"  CssClass="inputbox" Width="100" ></asp:TextBox>
                                 <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Số sản phẩm khuyến mại</b><br />
                                                        Số sản phẩm khuyến mại được hiển thị trong mục sản phẩm khuyến mại
                                                    </span>
                                                </a>
							</td>
						</tr>
						<tr>
							<td width="150" class="key">
								<label for="txttitle">Số sản phẩm trên mỗi danh mục</label>
							</td>
							<td>
								<asp:TextBox ID="txtpercate" runat="server"  CssClass="inputbox" Width="100" ></asp:TextBox>
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Số sản phẩm trên mỗi danh mục</b><br />
                                                        Số sản phẩm được hiển thị trong mục sản phẩm ở trang chủ(nếu có)
                                                    </span>
                                                </a>
							</td>
						</tr>
						<tr>
							<td width="150" class="key">
								<label for="txttitle">Số sản phẩm mỗi trang danh mục</label>
							</td>
							<td>
								<asp:TextBox ID="txtperpage" runat="server"  CssClass="inputbox" Width="100" ></asp:TextBox>
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Số sản phẩm trên mỗi trang danh mục</b><br />
                                                        Số sản phẩm được hiển thị trong trang danh mục sản phẩm
                                                    </span>
                                                </a>
							</td>
						</tr>
                            <tr>
							<td width="150" class="key">
								<label for="txttitle">Kích thước ảnh nhỏ</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh nhỏ</b><br />
                                                       Kích thước ảnh sản phẩm hiển thị trên trang danh sách sản phẩm
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtimgthumbwidth" runat="server" Text="200"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtimgthumbheight" runat="server" Text="160"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
                               <tr>
							<td width="150" class="key">
								<label for="txttitle">Kích thước ảnh lớn</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh lớn</b><br />
                                                       Kích thước ảnh sản phẩm hiển thị trên trang chi tiết sản phẩm
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtimgwidth" runat="server" Text="800"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtimgheight" runat="server" Text="600"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
						
                            <tr style="display:none">
							<td width="150" class="key">
								<label for="txttitle">Hiển thị đánh giá</label>
							</td>
							<td>
								<asp:CheckBox ID="chkdisplayvote" runat="server" />
                                 <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Hiển thị đánh giá</b><br />
                                                        Hiển thị đánh giá dưới mỗi sản phẩm
                                                    </span>
                                                </a>
							</td>
						</tr>
						<tr style="display:none">
							<td width="150" class="key">
								<label for="txttitle">Hiển thị giá cũ</label>
							</td>
							<td>
								<asp:CheckBox ID="chkdisplayoldp" runat="server" />
                                         <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Hiển thị giá cũ</b><br />
                                                        Tùy chọn này cho phép hiển thị thông tin giá cũ và % giảm giá đối với mỗi sản phẩm
                                                    </span>
                                                </a>
							</td>
						</tr>
                            <tr style="display:none">
                                    <td width="150" class="key">
                                        <label for="txttitle">Hiển thị bình luận Facebook</label>
                                    </td>
                                    <td>
                                       <asp:CheckBox ID="chkdisplayfacebookcomment" runat="server" />
                                         <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Hiển thị bình luận Facebook</b><br />
                                                        Tùy chọn kích hoạt hiển thị bình luận Facebook trong trang chi tiết mỗi sản phẩm
                                                    </span>
                                                </a>
                                    </td>
                                </tr>
						
						<tr >
							<td width="150" class="key" valign="top">
								<label for="txttitle">Tùy chọn đặt hàng</label>
							</td>
							<td>
								<asp:CheckBox Visible="false" ID="chkrequestmember" runat="server" Text=" Yêu cầu là thành viên mới được mua hàng"  />
                                <a href="#" class="tooltip hidden">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Yêu cầu đặt hàng</b><br />
                                                        Tùy chọn này yêu cầu khách hàng phải đăng ký thành viên mới được mua sản phẩm
                                                    </span>
                                                </a>
								<asp:CheckBox ID="chksendmail" Visible="false" runat="server" Text=" Gửi đơn hàng về mail" Checked="true" />
                                <a href="#" class="tooltip hidden">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Gửi đơn hàng về mail</b><br />
                                                        Tùy chọn này cho phép khi bất kỳ ai đặt hàng thì đơn hàng sẽ được gửi vào email của người quản trị
                                                    </span>
                                                </a>
                             
								&nbsp;&nbsp;&nbsp;<label for="txttitle">Nhập email nhận đơn hàng:</label><br />&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtemail"  CssClass="inputbox" Width="250" runat="server"></asp:TextBox>
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Email nhận đơn hàng</b><br />
                                                        Email này sẽ nhận được đơn hàng khi có khách hàng đặt hàng
                                                    </span>
                                                </a>
							</td>
						</tr>
						<tr>
							<td class="key" valign="top">
								<label for="txtphone">Thông báo đặt hàng thành công</label>  <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Thông báo đặt hàng thành công</b><br />
                                                        Sau khi khách hàng đặt hàng thành công sẽ hiển thị thông báo này
                                                    </span>
                                                </a>
							</td>
							<td>
                                  <CKEditor:CKEditorControl ID="txtsuccess" runat="server"  BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                
							</td>
						</tr>
						
						</tbody></table>
						</div>
            </div>
        </div>
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
