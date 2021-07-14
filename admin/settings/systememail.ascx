<%@ Control Language="C#" AutoEventWireup="true" CodeFile="systememail.ascx.cs" Inherits="admin_settings_systememail" %>
<asp:UpdatePanel ID="up" runat="server">
    <ContentTemplate>
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
                    <li>Thông tin chung</li>

                </ul>
                <div class="resp-tabs-container hor_1">
                    <div>
                        <p>
                            <table width="100%" cellspacing="1" class="admintable">
                                <tbody>
                                    <tr>
                                        <td width="150" class="key" valign="top">
                                            <label for="txtthongbao">Tùy chọn email gửi</label>
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdfromsys"  OnCheckedChanged="rdfromsys_CheckedChanged" AutoPostBack="true" GroupName="rdchk" runat="server" Text=" " /> Email của hệ thống
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Email hệ thống</b><br />
                                                    Website sẽ lấy email mặc định của hệ thống để gửi
                                                </span>
                                            </a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdfrompersonal" runat="server" OnCheckedChanged="rdfrompersonal_CheckedChanged" AutoPostBack="true" GroupName="rdchk"  Text=" " /> Email cá nhân
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Email  cá nhân</b><br />
                                                    Website sẽ lấy email cá nhân để gửi
                                                </span>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="key">
                                            <label for="txtthongbao">Máy chủ SMTP</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtsmtp" runat="server" CssClass="inputbox" Width='200'></asp:TextBox>
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Máy chủ gửi mail</b><br />
                                                    VD: smtp.gmail.com
                                                </span>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="key">
                                            <label for="txtthongbao">Cổng SMTP</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtport" runat="server" CssClass="inputbox" Width='200'></asp:TextBox>
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Cổng SMTP</b><br />
                                                    VD: 587, 465, 25
                                                </span>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="key">
                                            <label for="txtthongbao">Email</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtemail" runat="server" CssClass="inputbox" Width='200'></asp:TextBox>
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Email</b><br />
                                                    Tài khoản email để gửi mail
                                                </span>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="key">
                                            <label for="txtthongbao">Mật khẩu</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtpass" TextMode="Password" CssClass="inputbox" runat="server" Width='200'></asp:TextBox>
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Mật khẩu</b><br />
                                                    Mật khẩu email
                                                </span>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="key">
                                            <label for="txtthongbao">Tùy chọn SSL</label>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkssl" runat="server" Text=" " /> kích hoạt
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Tùy chọn SSL</b><br />
                                                    Đối với mail Gmail, Yahoo, Live, Zoho,... thì tích chọn SSL
                                                </span>
                                            </a>
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
        </ContentTemplate>
    </asp:UpdatePanel>
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
