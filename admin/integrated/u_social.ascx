<%@ control language="C#" autoeventwireup="true" inherits="admin_integrated_social, App_Web_amcji1rc" %>
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
                                    <asp:LinkButton ID="lnkupdate" runat="server" CssClass="toolbar" OnClick="lnkupdate_Click">
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
          <p style='color: #16757c; margin: 0; font-size: 11px; padding: 12px 15px 0px 15px; font-style: italic;'>
            <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></p>
        <div style="width: 98% !important;" id="parentHorizontalTab" class="divvalidate">
           
            <ul class="resp-tabs-list hor_1">
                <li>Tích hợp các mạng xã hội</li>
            </ul>
            <div class="resp-tabs-container hor_1">
                <div>
                    <p>
                        <table cellspacing="1" class="admintable">
                            <tbody>

                                <tr>
                                    <td width="150" class="key" style="width:250px">
                                        <label for="txttitle">Facebook</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtlinkfacebook" runat="server" CssClass="inputbox" Width="450"></asp:TextBox>
                                        <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Link Facebook</b><br />
                                                        Đường link dẫn đến trang fanpage của bạn...
                                                    </span>
                                                </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="150" class="key" style="width:250px">
                                        <label for="txttitle">Google +</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtlinkgoogle" runat="server" CssClass="inputbox" Width="450"></asp:TextBox>
                                        <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Link Google</b><br />
                                                        Đường link dẫn đến trang Google + của bạn...
                                                    </span>
                                                </a>
                                    </td>
                                </tr>
                               <tr>
                                    <td width="150" class="key" style="width:250px">
                                        <label for="txttitle">Twitter</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txttwitter" runat="server" CssClass="inputbox" Width="450"></asp:TextBox>
                                        <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Link Twitter</b><br />
                                                        Đường link dẫn đến trang Twitter của bạn...
                                                    </span>
                                                </a>
                                    </td>
                                </tr>
                               
                                 <tr>
                                    <td width="150" class="key" style="width:250px">
                                        <label for="txttitle">Youtube</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtyoutube" runat="server" CssClass="inputbox" Width="450"></asp:TextBox>
                                        <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Link Youtube</b><br />
                                                        Đường link dẫn đến trang Youtube của bạn...
                                                    </span>
                                                </a>
                                    </td>
                                </tr>
                                
                                 <tr>
                                    <td width="150" class="key" style="width:250px">
                                        <label for="txttitle">Intagram</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtintagram" runat="server" CssClass="inputbox" Width="450"></asp:TextBox>
                                        <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Link Intagram</b><br />
                                                        Đường link dẫn đến trang Intagram của bạn...
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
