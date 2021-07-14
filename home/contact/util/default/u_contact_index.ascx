<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_contact_index.ascx.cs" Inherits="home_contact_u_contact_index" %>
<asp:TextBox Visible="false" ID="txtaddress" runat="server" CssClass="form-control input-lg"></asp:TextBox>
<asp:Button Visible="false" ID="btncancel" runat="server" Text=" Làm lại " CssClass="btn_send" OnClick="btncancel_Click" />

<asp:Literal Visible="false" ID="ltcontent" runat="server"></asp:Literal>
<asp:TextBox Visible="false" ID="txttitle" runat="server" CssClass="form-control  form-control-lg"></asp:TextBox>



<div class="container">
    <div class="row">
        <div class="col-md-12 col-xs-12  p-l-0 p-l-xs-7-5">
            <div class="content clearfix">
                <h1 title="liên hệ">Liên hệ
                </h1>

                <div class="col-md-7" id="col-left contactFormWrapper">
                    <h3>Liên hệ với chúng tôi</h3>
                    <hr class="line-left">
                    <p>
                        Hãy liên hệ ngay với chúng tôi để được hỗ trợ một cách tốt nhất
                    </p>
                    <div class="contact-form">
                        <asp:Literal ID="ltmess" runat="server"></asp:Literal>
                        <div class="form-group">
                            <label for="contactFormName" class="sr-only">Tên</label>
                            <asp:TextBox ID="txtname" placeholder="Họ tên" runat="server" CssClass="form-control input-lg"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="contactFormName" class="sr-only">Số điện thoại</label>
                            <asp:TextBox ID="txtphone" placeholder="Số điện thoại của bạn" runat="server" CssClass="form-control input-lg"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="contactFormEmail" class="sr-only">Email</label>
                            <asp:TextBox ID="txtemail" placeholder="Email của bạn" runat="server" CssClass="form-control form-control-lg"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="contactFormMessage" class="sr-only">Nội dung</label>
                            <asp:TextBox ID="txtcontent" placeholder="Viết bình luận" TextMode="MultiLine" Rows="5" Columns="40" runat="server" CssClass="form-control form-control-lg"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnsend" type="submit" runat="server" CssClass="btn btn-primary btn-lg" Text="Gửi liên hệ" OnClick="btnsend_Click" />
                    </div>
                </div>
                <div class="col-md-5" id="col-right">
                    <h3>Địa chỉ liên lạc</h3>
                    <hr class="line-right">
                    <h3 class="name-company"></h3>
                    <h3>NỘI THẤT IZIFUR</h3>
                    <p>Chuyên cung cấp đồ Nội thất cao cấp	</p>
                    <ul class="info-address">
                        <li class="m-b-5">
                            <i class="glyphicon glyphicon-map-marker m-r-5"></i>
                            <span><%=WEB.Config.getvaluebykey(WEB.Config.k_comaddress,lang) %></span>
                        </li>
                        <li class="m-b-5">
                            <i class="glyphicon glyphicon-envelope m-r-5"></i>
                            <span><%=WEB.Config.getvaluebykey(WEB.Config.k_comemail,lang) %></span>
                        </li>
                        <li class="m-b-5">
                            <i class="glyphicon glyphicon-phone-alt m-r-5"></i>
                            <span><%=WEB.Config.getvaluebykey(WEB.Config.k_comphone,lang) %></span>
                        </li>
                    </ul>
                </div>
                <div class="col-md-12 col-xs-12 col-sm-12">
                    <p class="text-center">
                        <asp:Literal ID="lt_maps" runat="server"></asp:Literal>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
