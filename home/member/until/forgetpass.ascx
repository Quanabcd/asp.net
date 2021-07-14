<%@ Control Language="C#" AutoEventWireup="true" CodeFile="forgetpass.ascx.cs" Inherits="home_member_forgetpassword" %>
<div class="cartblock">
<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="account-login">
                <div class="page-title">
                    <h1  class="ttm"><%=getlabel("lt_titlegetpass","Lấy lại mật khẩu") %></h1>
                </div>
               
                    <div class="row">
                        	<div class="frm-register">
										<div class="fieldset">
                                            <p> <%=getlabel("lt_titlepleaseenteremailforgetpass","Xin mời nhập địa chỉ email để lấy lại mật khẩu") %></p>
                   <asp:Panel ID="pnforget" runat="server">
                   
                    <p style="color:red" class="messerror"><asp:Literal ID="ltmess" runat="server"></asp:Literal></p>
                       <ul class="form-list">
												<li class="fields">
													<div class="input-box">
														<asp:TextBox ID="txtemail" placeholder="Nhập vào địa chỉ email" runat="server"  CssClass="form-control"></asp:TextBox>
													</div>
                                                 </li>
                           <li>
                               	<div class="buttons-set"> <asp:Button CssClass="btnregister" ID="btnsend" runat="server" 
                                     Text=" Gửi đi " onclick="btnsend_Click" /> </div>
                           </li>
                    </ul>
                    </asp:Panel>
                    <asp:Panel ID="pnsussecc" runat="server" Visible="false">
                        <div class='login_s'>
                            <%=getlabel("lt_titlenoticesendpasstoemail","Mật khẩu mới đã được gửi vào hòm mail của bạn. Xin mời kiểm tra mail để lấy mật khẩu mới.") %>
                        </div>
                    </asp:Panel>
                   </div>
                </div>
                        </div>
            </div>
        </div>
    </div>
</div>
    </div>