<%@ Control Language="C#" AutoEventWireup="true" CodeFile="info.ascx.cs" Inherits="home_member_register" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
    $(function () {
        $("#txtbirthday").datepicker({
            dateFormat: 'dd/mm/yy'
        });

    });
</script>
<div class="cartblock mbblock">
    <div class="container">
        <h1  class="ttm">Trang thành viên</h1>

        <div class="blockmb">
            <div class="col-sm-9">
                <h2>Thông tin tài khoản</h2>
                <span class="messerror"><asp:Literal ID="ltmess" runat="server"></asp:Literal></span>
                <div class="row">
                    <div class="col-sm-2">Tài khoản:</div>
                    <div class="col-sm-10" style="padding-bottom:15px"><asp:Literal ID="ltaccount"  runat="server"></asp:Literal></div>
                </div>
                   <div class="row">
                    <div class="col-sm-2">Giới tính:</div>
                    <div class="col-sm-10"><asp:DropDownList ID="ddlsex" Width="200" CssClass="form-control" runat="server">
                                <asp:ListItem Text="Nam" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Nữ" Value="0"></asp:ListItem>
                             </asp:DropDownList></div>
                </div>
                 <div class="row">
                    <div class="col-sm-2">Ngày sinh:</div>
                    <div class="col-sm-10"><asp:TextBox ID="txtbirthday" runat="server" CssClass="form-control" Width="200"></asp:TextBox></div>
                </div>
                 <div class="row">
                    <div class="col-sm-2">Họ và tên:</div>
                    <div class="col-sm-10"><asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox></div>
                </div>
              
                 <div class="row">
                    <div class="col-sm-2">Địa chỉ:</div>
                    <div class="col-sm-10"><asp:TextBox ID="txtaddress" runat="server" CssClass="form-control"></asp:TextBox></div>
                </div>
                 <div class="row">
                    <div class="col-sm-2">Số điện thoại:</div>
                    <div class="col-sm-10"><asp:TextBox ID="txtphone" runat="server" CssClass="form-control"></asp:TextBox></div>
                </div>
               <div class="row">
                    <div class="col-sm-2">Email:</div>
                    <div class="col-sm-10"><asp:TextBox ID="txtemail" Enabled="false" runat="server" CssClass="form-control"></asp:TextBox></div>
                </div>
                  <div class="row">
                    <div class="col-sm-2">Mật khẩu:</div>
                    <div class="col-sm-10"><asp:TextBox ID="txtpass" TextMode="Password" Width="200" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:CheckBox ID="chkupdatepass" Text="" runat="server" />  Cập nhật mật khẩu</div>
                </div>        
                     <asp:Button ID="btnupdate" runat="server" 
                                     Text=" Cập nhật " CssClass="btnregister" onclick="btnsend_Click" /> 
                            
                                     <asp:HiddenField ID="hdemail" runat="server" Visible="false" /> 
                     
            </div>
             <div class="col-sm-3">
                 <div class="cctv">
                 <p class="tttv">Công cụ thành viên</p>
                 <ul>
                     <li><a href="/account/info" title="Thông tin thành viên"><i class="fa fa-angle-right "></i> Thông tin thành viên</a></li>
                      <li><a href="/account/wishlist" title="Sản phẩm yêu thích"><i class="fa fa-angle-right "></i> Sản phẩm yêu thích</a></li>
                      <li><a href="/account/order" title="Danh sách đơn hàng"><i class="fa fa-angle-right "></i> Danh sách đơn hàng</a></li>
                 </ul>
                     </div>
             </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
