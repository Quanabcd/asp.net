<%@ control language="C#" autoeventwireup="true" inherits="admin_integrated_Webmaster, App_Web_amcji1rc" %>
<div class="widget">
    <div class="widget-title">
        <%--Header--%>
        <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal>
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
             <div style="width: 98% !important;" id="parentHorizontalTab" class="divvalidate">
                                <ul class="resp-tabs-list hor_1">
                                    <li>Mã xác minh Google Master Tool</li>
                                    
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
                                        <p>
                                            <table cellspacing="1" class="admintable">
                                                <tbody>
                                                   <tr>
                                                        <td class="key">
                                                            <label for="txtphone">Nhúng xác minh</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_code" TextMode="MultiLine" placeholder=" Trong phần xác minh google master tool chọn 'Các phương thức thay thế'. Sau đó chọn 'Thẻ HTML'. Sau đó copy mã code trong thẻ 'content' vào đây. Ví dụ: KBfwXD4fcJ4IbWmubM3q1nPWjxwdnTmXoO85AOkmGxk" CssClass="inputbox" runat="server" Width="500" Height="100"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Nhúng xác minh</b><br />
                                                                    Trong phần xác minh google master tool chọn <b>"Các phương thức thay thế"</b>
                                                                    <br />
                                                                    Sau đó chọn <b>"Thẻ HTML"</b>
                                                                    <br />
                                                                    Sau đó copy mã code trong thẻ "content" vào đây
                                                                    <br />
                                                                    Ví dụ: <textarea rows="8" cols="40" onclick="this.select();" readonly="" class="token">&lt;meta name="google-site-verification" content="KBfwXD4fcJ4IbWmubM3q1nPWjxwdnTmXoO85AOkmGxk" /&gt;</textarea> thì chỉ copy nội dung "KBfwXD4fcJ4IbWmubM3q1nPWjxwdnTmXoO85AOkmGxk"
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
