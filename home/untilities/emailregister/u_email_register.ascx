<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_email_register.ascx.cs" Inherits="home_untilities_emailregister_u_email_register" %>
<div class="emailregis">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <h3><%=WEB.Common.Getlabel("lb_dangkynhanbantin","ĐĂNG KÝ NHẬN BẢN TIN",WEB.Common.Lang) %></h3>
                <h4><%=WEB.Common.Getlabel("lb_chungtoicamket","Chúng tôi cam kết bảo vệ quyền riêng tư của bạn chứ không phải để spam",WEB.Common.Lang) %></h4>
            </div>
            <div class="col-lg-6">
                <div class="formemail">
                    <div style="position: relative; top: 9px;" id="widget-subscribe-form-result"></div>
                    <input style="" type="email" id="newsletter-email-3" name="contact[email]" class="form-control required email" placeholder="Nhập email ...">
                    <button style="" onclick="sendemailservices();" class="btn btnSignup-3" type="submit">GỬI</button>
                    <ul class="follow_option">
                        <li>
                            <a href="<%=WEB.Config.getvaluebykey(WEB.Config.k_socialfaceurl, WEB.Common.Lang) %>" title="Theo dõi Facebook Delta Shoes"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="<%=WEB.Config.getvaluebykey(WEB.Config.k_socialtwitterurl, WEB.Common.Lang) %>" title="Theo dõi Instagam Delta Shoes"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="<%=WEB.Config.getvaluebykey(WEB.Config.k_socialgoogleurl, WEB.Common.Lang) %>" title="Theo dõi Google Plus Delta Shoes"><i class="fa fa-google-plus"></i></a>
                        </li>
                        <li>
                            <a href="<%=WEB.Config.getvaluebykey(WEB.Config.k_socialyoutubeurl, WEB.Common.Lang) %>" title="Theo dõi Youtube Delta Shoes"><i class="fa fa-youtube-play"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function sendemailservices() {
        var email = $('#newsletter-email-3').val();
        var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        //var address = document.getElementById[email].value;
        if (!reg.test(email) ) {
            alert("Xin  mời nhập Email");
            return (false);
        }
        $.ajax({
            type: "POST",
            url: "webservices/SearchAirport.asmx/sendemailservices",
            data: "{ email1: '" + email + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d == "1") {
                    $("#widget-subscribe-form-result").html("<p class='sucess-email'>Đăng ký Email thành công</p>");
                }
                else {
                    $("#widget-subscribe-form-result").html("<p style='no-sucess-email'>Đăng ký email không thành công</p>");
                }
            },
            error: function (data) {
            }
        });
    }
</script>

