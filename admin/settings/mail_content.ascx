<%@ Control Language="C#" AutoEventWireup="true" CodeFile="mail_content.ascx.cs" Inherits="admin_settings_mail_content" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<div class="widget">
    <div class="widget-title">
        <%--Header--%>
       
        <div class="widget-title">
            <h4><i class="icon-reorder">
                <asp:Literal ID="lttitle" runat="server"></asp:Literal></i></h4>
            <div class="ui-widget-content ui-corner-top ui-corner-bottom">
                <div id="toolbox">

                    <div style="float: right; margin-right: 10px;" class="toolbox-content">

                        <table class="toolbar">
                            <tr>

                                <td align="center">
                                    <asp:LinkButton ID="update" runat="server" CssClass="toolbar" OnClientClick="return validation()" OnClick="update_Click">
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
        <%--Content-products--%>
        <div class="widget-body">
             <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal>
            <div style="width: 98% !important;" id="parentHorizontalTab" class="divvalidate">
                <ul class="resp-tabs-list hor_1">
                    <li>Thông tin</li>

                </ul>
                <div class="resp-tabs-container hor_1">
                    <div>
                        <p>
                            <table class="admintable">
                                <tbody>
                                 <tr>
                                            <td class="key" valign="top">
                                                <label for="txtphone">Nội dung gửi mail khi đăng ký thành công</label>
                                                <br />
                                                <hr /><i>
                                                Chuỗi ký tự đặc biệt dùng để thay thế khi gửi mail<br />
                                                <b>[WEBSITE]</b>: Địa chỉ website<br />
                                                <b>[EMAIL]</b>: Tài khoản đăng nhập<br />
                                                <b>[PASS]</b>: Mật khẩu đăng nhập</i><br />
                                                <hr />
                                            </td>
                                            <td>
                                                <CKEditor:CKEditorControl ID="txtsendmailwhileregister" runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                            </td>
                                        </tr>
                                    <tr>
                                            <td class="key" valign="top">
                                                <label for="txtphone">Nội dung gửi mail khi reset mật khẩu</label>
                                                   <br />
                                                <hr /><i>
                                                Chuỗi ký tự đặc biệt dùng để thay thế khi gửi mail<br />
                                                <b>[WEBSITE]</b>: Địa chỉ website<br />
                                                <b>[EMAIL]</b>: Tài khoản đăng nhập<br />
                                                <b>[PASS]</b>: Mật khẩu đăng nhập</i><br />
                                                <hr />
                                            </td>
                                            <td>
                                                <CKEditor:CKEditorControl ID="txtsendmailwhileresetpass" runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                            </td>
                                        </tr>
                                    <tr>
                                            <td class="key" valign="top">
                                                <label for="txtphone">Nội dung gửi mail xác nhận đơn hàng</label>
                                                   <br />
                                                <hr /><i>
                                                Chuỗi ký tự đặc biệt dùng để thay thế khi gửi mail<br />
                                                <b>[WEBSITE]</b>: Địa chỉ website<br />
                                                <b>[EMAIL]</b>: Tài khoản đăng nhập<br />
                                                <b>[PASS]</b>: Mật khẩu đăng nhập</i><br />
                                                <hr />
                                            </td>
                                            <td>
                                                <CKEditor:CKEditorControl ID="txtsendmailconfirmorder" runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                            </td>
                                        </tr>
                                </tbody>
                            </table>
                        </p>
                    </div>

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

        // Child Tab
        $('#ChildVerticalTab_1').easyResponsiveTabs({
            type: 'vertical',
            width: 'auto',
            fit: true,
            tabidentify: 'ver_1', // The tab groups identifier
            activetab_bg: '#fff', // background color for active tabs in this group
            inactive_bg: '#F5F5F5', // background color for inactive tabs in this group
            active_border_color: '#c1c1c1', // border color for active tabs heads in this group
            active_content_border_color: '#5AB1D0' // border color for active tabs contect in this group so that it matches the tab head border
        });

        //Vertical Tab
        $('#parentVerticalTab').easyResponsiveTabs({
            type: 'vertical', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function (event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo2');
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


<style>
    label.error, label.error {
        color: red;
        font-style: italic;
    }

    div.error {
        display: none;
    }
</style>
