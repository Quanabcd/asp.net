<%@ Control Language="C#" AutoEventWireup="true" CodeFile="login.ascx.cs" Inherits="home_member_login" %>
<div class="cartblock">
<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="account-login">
                
               
                    <div class="row">
                        <div class="col-sm-6 new-users">
                            <div class="content">
                                <h2><%=getlabel("lt_titlecreateaccount","Khách hàng mới") %></h2>
                                <p><%=getlabel("lt_titlecreateaccountdescription","Bằng cách tạo một tài khoản với cửa hàng của chúng tôi, bạn sẽ có thể thông qua các quy trình kiểm tra nhanh hơn, xem và theo dõi đơn đặt hàng của bạn và còn nhiều hơn nữa") %></p>
                                <div class="buttons-set">
                                    <button type="button" title="Tạo tài khoản" class="btnregister" onclick="window.location='/account/register';"><span><span><%=getlabel("lt_titlecreateaccount1","Tạo tài khoản") %></span></span></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-5 registered-users">
                            <div id="login" class="content">
                                <h2><%=getlabel("lt_titleaccountlogin","Khách hàng đăng nhập") %></h2>
                                <p><%=getlabel("lt_titleaccountlogindecription","Nếu bạn có một tài khoản, hãy đăng nhập") %></p>
                                <p style="color:red" class="messerror messlg"><asp:Literal ID="ltmess" runat="server"></asp:Literal></p>
                                <ul class="form-list">
                                    <li>
                                        <div class="input-box">
                                            <asp:TextBox ID="txtaccount" placeholder="Email" CssClass="form-control txtemailmb" runat="server" ></asp:TextBox>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="input-box">
                                            <asp:TextBox ID="txtpass"  placeholder="Mật khẩu"  TextMode="Password"  CssClass="form-control txtpassmb" runat="server" ></asp:TextBox>
                                        </div>
                                    </li>

                                </ul>
                                <div class="buttons-set">
                                    <a href="/account/forgetpass" class="f-left lnkfg"><%=getlabel("lt_titleforgetpass","Quên mật khẩu?") %></a>
                                    <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" Text="Đăng nhập" CssClass="btnregister" />
                                </div>

                            </div>
                          


                        </div>
                    </div>
            
            </div>
        </div>
    </div>
</div>
    </div>