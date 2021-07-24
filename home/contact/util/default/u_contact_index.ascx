<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_contact_index.ascx.cs" Inherits="home_contact_u_contact_index" %>
<main class="landingpage-layout">
    <div class="wrap-banner-ea">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <img src="/uploads/independent/<%#Eval("vparam2").ToString()%>" alt="<%#Eval("vtitle").ToString()%>">
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="block bgd-grey">
        <div class="container clearfix">
            <div class="col-md-8 col-md-offset-2">
                <asp:Repeater ID="rpcontent_contact" runat="server">
                    <ItemTemplate>
                        <h4 class="title-block"><%#Eval("vtitle").ToString()%></h4>
                        <div class="wrap-sub-register">
                            <%#Eval("vcontent").ToString()%>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div id="frmregister" class="ila-form clearfix">

                    <div class="row">
                        <div class="col-sm-12 text-center" id="widget-subscribe-form-result1"></div>
                    </div>
                    <div class="row">

                        <div class="col-md-6">

                            <label for="student-name"><%=TN.Common.GetLabel("lb_namhs","Student Name",lang) %> (*)*</label>

                            <input name="fullname" id="fullname" placeholder="<%=TN.Common.GetLabel("lb_namhs","Student Name",lang) %> (*)" class="ila-ipt">
                        </div>

                        <div class="col-md-6">

                            <label for="mobile-number"><%=TN.Common.GetLabel("lb_phonehs","Phone Number",lang) %> (*)*</label>

                            <input type="phone" name="phone" id="phone" placeholder="<%=TN.Common.GetLabel("lb_phonehs","Phone Number",lang) %> (*)" class="ila-ipt">
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-md-6">

                            <label for="student-name"><%=TN.Common.GetLabel("lb_city","City",lang) %> (*)</label>

                            <input type="text" name="city_id" id="city_id" placeholder="<%=TN.Common.GetLabel("lb_city","City",lang) %>" class="ila-ipt">
                        </div>
                        <div class="col-md-6">

                            <label for="email"><%=TN.Common.GetLabel("lb_emailhs","Email Address",lang) %>*</label>

                            <input type="email" name="email_id" id="email_id" placeholder="<%=TN.Common.GetLabel("lb_emailhs","Email Address",lang) %>" class="ila-ipt">
                        </div>



                    </div>


                    <div class="row">
                        <div class="col-md-12">
                            <label for="centre"><%=TN.Common.GetLabel("lb_areyou...","Are you an existing ILA student?",lang) %></label>

                            <div class="wrap-ila-check">
                                <label class="ila-checkbox">

                                    <input type="radio" name="current_student" id="yes" value="<%=TN.Common.GetLabel("lb_Yes","Yes",lang) %>     "><span></span><%=TN.Common.GetLabel("lb_Yes","Yes",lang) %>
                                </label>

                                <label class="ila-checkbox">

                                    <input type="radio" name="current_student" id="no" value="<%=TN.Common.GetLabel("lb_No","No",lang) %>"><span></span><%=TN.Common.GetLabel("lb_No","No",lang) %>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-12 text-center">

                            <input type="button" onclick="checkemailcontact();" class="btn large btn-submit" name="btnSubmit" id="btnSubmit" value="<%=TN.Common.GetLabel("lb_REGISTER","REGISTER NOW",lang) %>  ">
                        </div>

                    </div>

                </div>

            </div>

        </div>
    </div>
</main>

<script>
    function checkemailcontact() {
        var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
        var name = jQuery('#fullname').val();
        var phone = jQuery('#phone').val();
        var email = jQuery('#email_id').val();
        var city = jQuery('#city_id').val();
        var check = jQuery('input[name="current_student"]:checked').val();
        if (name.length == 0) {
            jQuery("#widget-subscribe-form-result1").html('<%=TN.Common.GetLabel("lb_nameinput","Vui lòng nhập họ tên",lang) %>');
            jQuery("#widget-subscribe-form-result1").css("color", "red");
            jQuery('#fullname').focus();
            return;
        }
        else if (!vnf_regex.test(phone)) {
            jQuery("#widget-subscribe-form-result1").html('<%=TN.Common.GetLabel("lb_phoneinput","Vui lòng nhập số điện thoại",lang) %>');
            jQuery("#widget-subscribe-form-result1").css("color", "red");
            jQuery('#phone').focus();
            return;
        }
        else if (validateEmail(email) == false) {
            jQuery("#widget-subscribe-form-result1").html("<%=TN.Common.GetLabel("lb_emailinput","Vui lòng nhập đúng địa chỉ email",lang) %>");
            jQuery("#widget-subscribe-form-result1").css("color", "red");
            jQuery('#email_id').focus();
            return
        }
        else if (city.length == 0) {
            jQuery("#widget-subscribe-form-result1").html("<%=TN.Common.GetLabel("lb_cityinput","Vui lòng nhập địa chỉ của bạn",lang) %>");
            jQuery("#widget-subscribe-form-result1").css("color", "red");
            jQuery('#city_id').focus();
            return
        }

        jQuery.ajax({
            type: "POST",
            url: "webservices/SearchAirport.asmx/sendemailservices",
            data: "{name1:'" + name + "',email1: '" + email + "',phone1:'" + phone + "',city1:'" + city + "',check:'" + check + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d == "1") {
                    jQuery("#widget-subscribe-form-result1").html("<%=TN.Common.GetLabel("lb_suc","Đăng ký thành công chúng tôi sẽ liên hệ lại với bạn!",lang) %>");
                    jQuery("#widget-subscribe-form-result1").css("color", "blue");
                }
                else {
                    jQuery("#widget-subscribe-form-result1").html("<%=TN.Common.GetLabel("lb_fullinput","Vui lòng nhập đầy đủ thông tin",lang) %>");
                }
            },
            error: function (data) {
            }
        })
    }
    function validateEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))jQuery/;
        return re.test(email);
    }
</script>
<style>
    .row {
        margin-left: -20px;
        margin-right: -20px;
    }

    .landingpage-layout .block {
        padding: 40px 0;
    }

    .title-block {
        font-size: 26px;
        line-height: 1.31;
        color: #30313B;
        text-align: center;
        margin-bottom: 20px;
    }

    .wrap-sub-register {
        margin-bottom: 15px;
    }

    .ila-form label {
        color: #30313b;
        margin-bottom: 6px;
        display: block;
    }

    .ila-checkbox, .ila-form label {
        line-height: 1.5;
        font-size: 14px;
        text-align: left;
    }

    .ila-ipt, .ila-slt.full, .ila-ipt {
        width: 100%;
        background-color: unset !important;
        border: 1px solid #d0d0d0;
    }

    .ila-ipt {
        display: block;
        border-radius: 3px !important;
        font-size: 14px;
        color: #30313b;
        padding: 10px 15px !important;
    }

    .ila-form [class*=col-md-] {
        margin-bottom: 15px;
    }

    .ila-checkbox {
        position: relative;
        display: inline-block !important;
        color: #767676 !important;
        vertical-align: top;
        margin-right: 25px;
        cursor: pointer;
    }

        .ila-checkbox > span {
            display: inline-block;
            width: 20px;
            height: 20px;
            background: #fff;
            border-radius: 50%;
            border: 1px solid #d0d0d0;
            margin-right: 8px;
            position: relative;
            float: left;
        }

        .ila-checkbox input:checked + span:before {
            content: '';
            position: absolute;
            top: 4px;
            left: 4px;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: #fff;
        }

        .ila-checkbox input {
            opacity: 0;
            filter: alpha(opacity=0);
            width: 0;
            height: 0;
            position: absolute;
        }

            .ila-checkbox input:checked + span {
                background-color: #45c0f8;
                border-color: #45c0f8;
            }

    .btn {
        border-radius: 100px !important;
        background-color: #45C0F8;
        display: inline-block !important;
        padding: 0 30px !important;
        color: #f9f9f9;
        font-size: 12px;
        height: 44px !important;
        line-height: 42px !important;
        min-width: 130px;
        -webkit-transition: all .5s !important;
        transition: all .5s !important;
    }
</style>
