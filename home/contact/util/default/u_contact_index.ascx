<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_contact_index.ascx.cs" Inherits="home_contact_u_contact_index" %>
<main class="landingpage-layout">
    <div class="wrap-banner-ea">
        <img src="https://ila.edu.vn//langdingpage/ea/images/banner-register.png" alt="ILA Viet Nam">
    </div>

    <div class="block bgd-grey">

        <div class="container-fixed clearfix">

            <div class="col-md-8 col-md-offset-2">



                <h4 class="title-block">Register</h4>
                <div class="wrap-sub-register">
                    <p></p>

                </div>

                <div id="frmregister" class="ila-form clearfix">


                    <div class="row">

                        <div class="col-md-6">

                            <label for="student-name">Student Name (*)*</label>

                            <input name="fullname" id="fullname" placeholder="Student Name (*)" class="ila-ipt">
                        </div>

                        <div class="col-md-6">

                            <label for="mobile-number">Phone Number (*)*</label>

                            <input type="phone" name="phone" id="phone" placeholder="Phone Number (*)" class="ila-ipt">
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-md-6">

                            <label for="student-name">City (*)</label>

                            <div class="btn-group bootstrap-select ila-slt full">
                                <select name="city" id="city" class="ila-slt full" tabindex="-98">

                                    <option value="">City (*)</option>


                                    <option value="48">Ho Chi Minh City</option>


                                    <option value="20">Ha Noi</option>


                                    <option value="1">Da Nang</option>


                                    <option value="39">Hai Phong</option>


                                    <option value="70">Vung Tau</option>


                                    <option value="50">Binh Duong</option>


                                    <option value="49">Bien Hoa</option>


                                    <option value="53">Can Tho</option>


                                    <option value="62">Kien Giang</option>


                                    <option value="33">Quang Ninh</option>


                                    <option value="7">Khanh Hoa</option>


                                    <option value="72">Quang Nam</option>


                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">

                            <label for="email">Email Address*</label>

                            <input type="email" name="email_id" id="email_id" placeholder="Email Address" class="ila-ipt">
                        </div>

                        <div class="col-md-6">
                            <label for="centre">Are you an existing ILA student?</label>

                            <div class="wrap-ila-check">
                                <label class="ila-checkbox">

                                    <input type="radio" name="current_student" id="yes" value="Yes"><span></span>Yes                    
                                </label>

                                <label class="ila-checkbox">

                                    <input type="radio" name="current_student" id="no" value="No"><span></span>No
                                </label>
                            </div>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col-md-12 center">

                            <input type="button" class="btn large btn-submit" name="btnSubmit" id="btnSubmit" value="REGISTER NOW">
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
        var name = $('#name').val();
        var phone = $('#phone').val();
        var email = $('#email').val();
        if (name.length == 0) {
            jQuery("#widget-subscribe-form-result1").html('Vui lòng nhập họ tên');
            jQuery("#widget-subscribe-form-result1").css("color", "red");
            jQuery('#name').focus();
            return;
        }
        else if (!vnf_regex.test(phone)) {
            jQuery("#widget-subscribe-form-result1").html('Vui lòng nhập số điện thoại');
            jQuery("#widget-subscribe-form-result1").css("color", "red");
            jQuery('#phone').focus();
            return;
        }
        else if (validateEmail(email) == false) {
            jQuery("#widget-subscribe-form-result1").html("Vui lòng nhập đúng địa chỉ email");
            jQuery("#widget-subscribe-form-result1").css("color", "red");
            jQuery('#email').focus();
        }
        jQuery.ajax({
            type: "POST",
            url: "webservices/SearchAirport.asmx/sendemailservices",
            data: "{name1:'" + name + "',email1: '" + email + "',phone1:'" + phone + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d == "1") {
                    jQuery("#widget-subscribe-form-result1").html("Đăng ký email thành công");
                    jQuery("#widget-subscribe-form-result1").css("color", "blue");
                }
                else {
                    jQuery("#widget-subscribe-form-result1").html("Vui lòng nhập đầy đủ thông tin");
                }
            },
            error: function (data) {
            }
        })
    }
    function validateEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }
</script>