<%@ Control Language="C#" AutoEventWireup="true" CodeFile="websetting.ascx.cs" Inherits="admin_settings_websetting" %>
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
                    <li>Cấu hình chung</li>

                </ul>
                <div class="resp-tabs-container hor_1">
                    <div>
                        <p>
                            <table class="admintable">
                                <tbody>

                                    <tr>
                                        <td width="150" class="key">
                                            <label for="txttitle">Tên công ty/cá nhân</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtcompanyname" runat="server" CssClass="inputbox" Width="364"></asp:TextBox>
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Tên công ty/cá nhân</b><br />
                                                    Thông tin tên công ty hoặc cá nhân
                                                </span>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="key">
                                            <label for="txttitle">Slogan</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtslogan" runat="server" CssClass="inputbox" Width="364"></asp:TextBox>
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Slogan</b><br />
                                                    Câu khẩu hiệu của công ty
                                                </span>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="key">
                                            <label for="txttitle">Số điện thoại</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtphone" runat="server" CssClass="inputbox" Width="364"></asp:TextBox>
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Số điện thoại</b><br />
                                                    Số điện thoại di động, điện thoại bàn hay hotline của công ty
                                                </span>
                                            </a>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td width="150" class="key">
                                            <label for="txttitle">Email quản trị</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_emailqt" runat="server" CssClass="inputbox" Width="364"></asp:TextBox>
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Email quản trị</b><br />
                                                    Tất cả các liên hệ hay đơn đặt hàng của khách hàng sẽ được gửi vào email quản trị
                                                </span>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="key">
                                            <label for="txttitle">Địa chỉ</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtaddress" runat="server" CssClass="inputbox" Width="500"></asp:TextBox>
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Địa chỉ</b><br />
                                                    Địa chỉ công ty / cá nhân
                                                </span>
                                            </a>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td width="150" class="key">
                                            <label for="txtkeyword">Quốc gia</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlnational"   Width="150" runat="server" CssClass="inputbox">
                                                <asp:ListItem Value="1" Text="Việt Nam"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="key">
                                            <label for="txtkeyword">Tỉnh/Thành phố</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlcity" Width="150" OnSelectedIndexChanged="ddlcity_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass="inputbox">
                                            </asp:DropDownList>
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Tỉnh/Thành phố</b><br />
                                                    Được sử dụng để tính mức giá vận chuyển
                                                </span>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="key">
                                            <label for="txtkeyword">Quận / Huyện</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddldistrict"  Width="150" runat="server" CssClass="inputbox">
                                            </asp:DropDownList>
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Quận / Huyện</b><br />
                                                    Được sử dụng để tính mức giá vận chuyển
                                                </span>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="key">
                                            <label for="txtkeyword">Ngôn ngữ mặc định</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="dd_lang" runat="server" Width="150" CssClass="inputbox">
                                                <asp:ListItem Value="VIE" Text="Ngôn ngữ tiếng việt"></asp:ListItem>
                                                <asp:ListItem Value="ENG" Text="Ngôn ngữ tiếng anh"></asp:ListItem>
                                            </asp:DropDownList>
                                            <a href="#" class="tooltip">
                                                <img src="../templates/admin/images/help-icon.png" />
                                                <span><b>Ngôn ngữ mặc định</b><br />
                                                    Lựa chọn ngôn ngữ mặc định khi vào website
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
