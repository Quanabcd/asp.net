<%@ Control Language="C#" AutoEventWireup="true" CodeFile="payment.ascx.cs" Inherits="admin_settings_payment" %>
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
                                 
                                </td>

                                <td align="center">
                                  
                                </td>
                                <td align="center">
                                    <asp:LinkButton ID="lnkupdate" runat="server" CssClass="toolbar" OnClientClick="return validation()" OnClick="lnkupdate_Click">
							<span class="icon-ok-update"></span>
							Cập nhật
                                    </asp:LinkButton>
                                </td>
                                <td align="center">
                                  
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
                        <span class='detail_error'>
                                                <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></span>
                            <div id="parentHorizontalTab" class="divvalidate">
                                <ul class="resp-tabs-list hor_1">
                                    <li>Thanh toán trực tiếp</li>
                                    <li>Chuyển khoản qua ngân hàng</li>
                                    <li>Thanh toán khi giao hàng (COD)</li>
                                    <li style="display:none">Bảo Kim</li>
                                    <li style="display:none">Ngân Lượng</li>
                                    <li style="display:none">PayPal</li>
                                    <li>OnePay</li>
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
                                        <p>
                                           
                                            <table width="100%" cellspacing="1" class="admintable">
                                                <tbody>
                                                    <tr>
                                                        <td width="160" class="key">
                                                            <label for="txtuser">Tên phương thức</label> (<span style='color:red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtnamedirect" runat="server" name="txtname" Width="350" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:160px" valign="top" class="key" >
                                                            <label for="txtuser">Hướng dẫn thanh toán</label>
                                                             <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Hướng dẫn thanh toán</b><br />
                                                                    Hiển thị ở trang thông báo mua hàng thành công và trang thanh toán
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <CKEditor:CKEditorControl  ID="txtdescdirect"  runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                                           
                                                        </td>
                                                    </tr>
                                                   
                                                    <tr>
                                                        <td class="key">
                                                            <label for="listnhom">Trạng thái</label>
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="chkstatusdirect" runat="server" Text="" />  kích hoạt
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </p>

                                    </div>
                                        <div>
                                        <p>
                                            <span class='detail_error'>
                                             
                                            <table width="100%" cellspacing="1" class="admintable">
                                                <tbody>
                                                    <tr>
                                                        <td  width="160" class="key">
                                                            <label for="txtuser">Tên phương thức</label> (<span style='color:red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtnamebank" runat="server" name="txtname" Width="250" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td  style="width:160px" valign="top" class="key">
                                                            <label for="txtuser">Hướng dẫn thanh toán</label>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Hướng dẫn thanh toán</b><br />
                                                                    Hiển thị ở trang thông báo mua hàng thành công và trang thanh toán
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td><CKEditor:CKEditorControl  ID="txtdescbank"  runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                                            
                                                        </td>
                                                    </tr>
                                                   
                                                    <tr>
                                                        <td class="key">
                                                            <label for="listnhom">Trạng thái</label>
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="chkstatusbank" runat="server" Text=" kích hoạt" />

                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </p>

                                    </div>
                                       <div>
                                        <p>
                                            <span class='detail_error'>
                                                <asp:Literal ID="Literal2" runat="server"></asp:Literal></span>
                                            <table width="100%" cellspacing="1" class="admintable">
                                                <tbody>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="txtuser">Tên phương thức</label> (<span style='color:red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtnamecod" runat="server" name="txtname" Width="250" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td  style="width:160px" valign="top"  class="key">
                                                            <label for="txtuser">Hướng dẫn thanh toán</label> 
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Hướng dẫn thanh toán</b><br />
                                                                    Hiển thị ở trang thông báo mua hàng thành công và trang thanh toán
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <CKEditor:CKEditorControl  ID="txtdesccod"  runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                                            
                                                        </td>
                                                    </tr>
                                                   
                                                    <tr>
                                                        <td class="key">
                                                            <label for="listnhom">Trạng thái</label>
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="chkstatuscod" runat="server" Text=" kích hoạt" />

                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </p>

                                    </div>
                                     <div style="display:none">
                                        <table>
                                            <tr>
                                       <td colspan="3">
                                            <div class="col-sm-6">
                                                <ul>
                                                    <li class="mt10">
                                                        <label><h4>Hướng dẫn cấu hình Bảo Kim</h4></label>
                                                    </li>
                                                    <li class="note">
                                                        <p>Để sử dụng Bảo Kim bạn cần:</p>

                                                        <ul class="m-md-l" style="list-style-type:decimal;margin-left:20px;">
                                                            <li style="list-style-type:decimal">
                                                                <a href="https://www.baokim.vn/tai-khoan/ca-nhan" target="_blank">
                                                                    Đăng ký dịch vụ với Bảo Kim
                                                                </a>
                                                            </li>
                                                            <li style="list-style-type:decimal">
                                                                <p>Sau khi hoàn tất các bước đăng ký tại Bảo Kim, bạn sẽ có các thông số Mã website tích hợp (Mã website), Mã bảo mật (Mật khẩu giao tiếp), Receiver (Email tài khoản), Mã xác nhận tích hợp (Mã xác minh tên miền)</p>
                                                            </li>
                                                            <li style="list-style-type:decimal">
                                                                <p>Nhập các thông số Mã website tích hợp, Mã bảo mật, Receiver, Mã xác nhận tích hợp vào ô bên phải</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="well bg-white">
                                                    <div class="form-group">
                                                        <label>Tên phương thức</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtnamebk" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <p class="note">
                                                        Xin vui lòng cung cấp thông tin <a target="_blank" href="//www.baokim.vn">Bảo Kim</a>:
                                                    </p>
                                                    <div class="form-group">
                                                        <label>Mã website tích hợp</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtmerchantidbk" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Mã bảo mật</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtsecurepassbk" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Email nhận thanh toán</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtreceiverbk" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Mã xác nhận tích hợp</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtverifycodebk" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Hướng dẫn thanh toán</label> <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Hướng dẫn thanh toán</b><br />
                                                                    Hiển thị ở trang thông báo mua hàng thành công và trang thanh toán
                                                                </span>
                                                            </a>
                                                           
                                                        <asp:TextBox ID="txtdescbk" TextMode="MultiLine" Rows="5" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label></label>
                                                        <asp:CheckBox ID="chkstatusbk" runat="server" Text=" kích hoạt" />

                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                                </tr>
                                        </table>
                                    </div>
                                    <div style="display:none">
                                        <table>
                                            <tr>
                                       <td colspan="3">
                                            <div class="col-sm-6">
                                                <ul>
                                                    <li class="mt10">
                                                        <label><h4>Hướng dẫn cấu hình Ngân Lượng</h4></label>
                                                    </li>
                                                    <li class="note">
                                                        <p>Để sử dụng Ngân Lượng bạn cần:</p>

                                                        <ul class="m-md-l" style="list-style-type:decimal;margin-left:20px;">
                                                            <li style="list-style-type:decimal">
                                                                <a href="//www.nganluong.vn/?portal=nganluong&amp;page=user_register" target="_blank">
                                                                    Đăng ký dịch vụ với Ngân Lượng
                                                                </a>
                                                            </li>
                                                            <li style="list-style-type:decimal">
                                                                <p>Sau khi hoàn tất các bước đăng ký tại Ngân Lượng, bạn sẽ có các thông số Mã website tích hợp (Mã website), Mã bảo mật (Mật khẩu giao tiếp), Receiver (Email tài khoản), Mã xác nhận tích hợp (Mã xác minh tên miền)</p>
                                                            </li>
                                                            <li style="list-style-type:decimal">
                                                                <p>Nhập các thông số Mã website tích hợp, Mã bảo mật, Email nhận thanh toán, Mã xác nhận tích hợp vào ô bên phải</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="well bg-white">
                                                    <div class="form-group">
                                                        <label>Tên phương thức</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtnamenl" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <p class="note">
                                                        Xin vui lòng cung cấp thông tin <a target="_blank" href="//www.nganluong.vn">Ngân Lượng</a>:
                                                    </p>
                                                    <div class="form-group">
                                                        <label>Mã website tích hợp</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtmerchantidnl" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Mã bảo mật</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtsecurepassnl" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Email nhận thanh toán</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtreceivernl" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Mã xác nhận tích hợp</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtverifycodenl" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                     <div class="form-group">
                                                        <label>Hướng dẫn thanh toán</label> <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Hướng dẫn thanh toán</b><br />
                                                                    Hiển thị ở trang thông báo mua hàng thành công và trang thanh toán
                                                                </span>
                                                            </a>
                                                        <asp:TextBox ID="txtdescnl" TextMode="MultiLine" Rows="5" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label></label>
                                                        <asp:CheckBox ID="chkstatusnl" runat="server" Text=" kích hoạt" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                                </tr>
                                        </table>
                                    </div>


                                    <div style="display:none">
                                        <table>
                                            <tr>
                                                      <td colspan="3">
                                                <div class="col-sm-6">
                                                    <ul>
                                                        <li class="mt10">
                                                            <label><h4>Hướng dẫn cấu hình PayPal</h4></label>
                                                        </li>
                                                        <li class="note">
                                                            <p>Để sử dụng PayPal bạn cần:</p>
                                                            <ul class="m-md-l" style="list-style-type:decimal;margin-left:20px;">
                                                                <li style="list-style-type:decimal">
                                                                    <a href="//www.paypal.com/vn/merchantsignup/applicationChecklist?signupType=CREATE_NEW_ACCOUNT&amp;productIntentId=email_payments" target="_blank">
                                                                        Đăng ký dịch vụ với PayPal
                                                                    </a>
                                                                </li>
                                                                <li style="list-style-type:decimal">
                                                                    <p>Sau khi hoàn tất các bước đăng ký tại PayPal, bạn sẽ có các thông số API Username, API Password, API Signature, Seller Email</p>
                                                                </li>
                                                                <li style="list-style-type:decimal">
                                                                    <p>Nhập các thông số API Username, API Password, API Signature, Seller Email vào ô bên phải</p>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="well bg-white">
                                                        <div class="form-group">
                                                            <label>Tên phương thức</label>  (<span style='color:red'>*</span>)
                                                             <asp:TextBox ID="txtnamepaypal" CssClass="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                        <p class="note">
                                                            Xin vui lòng cung cấp thông tin <a target="_blank" href="//www.paypal.com">PayPal</a>:
                                                        </p>
                                                        <div class="form-group">
                                                            <label>API Username</label>  (<span style='color:red'>*</span>)
                                                            <asp:TextBox ID="txtmerchantidpaypal" CssClass="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>API Password</label>  (<span style='color:red'>*</span>)
                                                            <asp:TextBox ID="txtpasspaypal" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>API Signature</label>  (<span style='color:red'>*</span>)
                                                            <asp:TextBox ID="txtsignturepasspaypal" CssClass="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Seller Email</label>  (<span style='color:red'>*</span>)
                                                            <asp:TextBox ID="txtsenderpaypal" CssClass="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Tỉ giá USD/VND</label>  (<span style='color:red'>*</span>)
                                                            <asp:TextBox ID="txtexchangeratevndtousd" Text="22000" CssClass="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="form-group">
                                                        <label>Hướng dẫn thanh toán</label> <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Hướng dẫn thanh toán</b><br />
                                                                    Hiển thị ở trang thông báo mua hàng thành công và trang thanh toán
                                                                </span>
                                                            </a>
                                                        <asp:TextBox ID="txtdescpaypal" TextMode="MultiLine" Rows="5" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                       <div class="form-group">
                                                        <label></label>
                                                        <asp:CheckBox ID="chkstatuspaypal" runat="server" Text=" kích hoạt" />
                                                    </div>
                                                    </div>
                                                </div>
                                            </td>
                                                </tr>
                                        </table>
                                    </div>


                                    
                                    <div>
                                        <table>
                                            <tr>
                                                      <td colspan="3">
                                                <div class="col-sm-6">
                                                    <ul>
                                                        <li class="mt10">
                                                            <label><h4>Hướng dẫn cấu hình Onepay -  Thanh toán online bằng thẻ nội địa (ATM)</h4></label>
                                                        </li>
                                                        <li class="note">
                                                            <p>Để sử dụng Onepay bạn cần:</p>
                                                            <ul class="m-md-l" style="list-style-type:decimal;margin-left:20px;">
                                                                <li style="list-style-type:decimal">
                                                                    <a href="https://migs.mastercard.com.au/ma/login.s?mappedUrl=/vcb" target="_blank">
                                                                        Đăng ký dịch vụ với Onepay
                                                                    </a>
                                                                </li>
                                                                <li style="list-style-type:decimal">
                                                                    <p>Sau khi hoàn tất các bước đăng ký tại Onepay, bạn sẽ có các thông số API Merchant, API Hashcode, API AccessCode</p>
                                                                </li>
                                                                <li style="list-style-type:decimal">
                                                                    <p>Nhập các thông số Merchant, API Hashcode, API AccessCode vào ô bên phải</p>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="well bg-white">
                                                    <div class="form-group">
                                                        <label>Tên phương thức</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtnameonepay" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <p class="note">
                                                        Xin vui lòng cung cấp thông tin <a target="_blank" href="//www.Onepay.com.vn">Onepay</a>:
                                                    </p>
                                                    <div class="form-group">
                                                        <label>Merchant</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtmerchantop" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Hashcode</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txthashcodeop" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>AccessCode</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtaccesscodeop" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                        <div class="form-group">
                                                        <label>Hướng dẫn thanh toán</label> <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Hướng dẫn thanh toán</b><br />
                                                                    Hiển thị ở trang thông báo mua hàng thành công và trang thanh toán
                                                                </span>
                                                            </a>
                                                            <CKEditor:CKEditorControl  ID="txtdesconepay"  runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                                         
                                                    
                                                    </div>
                                                        <div class="form-group">
                                                        <label></label>
                                                        <asp:CheckBox ID="chkstatusonepay" runat="server" Text=" kích hoạt" />
                                                    </div>
                                                </div>
                                                </div>
                                            </td>
                                                </tr>
                                        </table>


                                         <table>
                                            <tr>
                                                      <td colspan="3">
                                                <div class="col-sm-6">
                                                    <ul>
                                                        <li class="mt10">
                                                            <label><h4>Hướng dẫn cấu hình Onepay -  Thanh toán online bằng thẻ quốc tế</h4></label>
                                                        </li>
                                                        <li class="note">
                                                            <p>Để sử dụng Onepay bạn cần:</p>
                                                            <ul class="m-md-l" style="list-style-type:decimal;margin-left:20px;">
                                                                <li style="list-style-type:decimal">
                                                                    <a href="https://migs.mastercard.com.au/ma/login.s?mappedUrl=/vcb" target="_blank">
                                                                        Đăng ký dịch vụ với Onepay
                                                                    </a>
                                                                </li>
                                                                <li style="list-style-type:decimal">
                                                                    <p>Sau khi hoàn tất các bước đăng ký tại Onepay, bạn sẽ có các thông số API Merchant, API Hashcode, API AccessCode</p>
                                                                </li>
                                                                <li style="list-style-type:decimal">
                                                                    <p>Nhập các thông số Merchant, API Hashcode, API AccessCode vào ô bên phải</p>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="well bg-white">
                                                    <div class="form-group">
                                                        <label>Tên phương thức</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtnameonepayqt" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <p class="note">
                                                        Xin vui lòng cung cấp thông tin <a target="_blank" href="//www.Onepay.com.vn">Onepay</a>:
                                                    </p>
                                                    <div class="form-group">
                                                        <label>Merchant</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtmerchantopqt" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Hashcode</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txthashcodeopqt" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>AccessCode</label>  (<span style='color:red'>*</span>)
                                                        <asp:TextBox ID="txtaccesscodeopqt" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                        <div class="form-group">
                                                        <label>Hướng dẫn thanh toán</label> <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Hướng dẫn thanh toán</b><br />
                                                                    Hiển thị ở trang thông báo mua hàng thành công và trang thanh toán
                                                                </span>
                                                            </a>
                                                             <CKEditor:CKEditorControl  ID="txtdesconepayqt"  runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                                         
                                                    </div>
                                                        <div class="form-group">
                                                        <label></label>
                                                        <asp:CheckBox ID="chkstatusonepayqt" runat="server" Text=" kích hoạt" />
                                                    </div>
                                                </div>
                                                </div>
                                            </td>
                                                </tr>
                                        </table>
                                    </div>

                                </div>
                            </div>
                            <input type="hidden" value="" id="hndId" name="hndId">
                       
                        <asp:HiddenField ID="hdiciddirect" Value="-1" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdicidbank" Value="-1" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdicidcod" Value="-1" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdicidbk" Value="-1" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdicidnl" Value="-1" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdicidpp" Value="-1" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdicidop" Value="-1" runat="server" Visible="false" />
                         <asp:HiddenField ID="hdicidopqt" Value="-1" runat="server" Visible="false" />
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
