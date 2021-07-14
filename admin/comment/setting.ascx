<%@ Control Language="C#" AutoEventWireup="true" CodeFile="setting.ascx.cs" Inherits="admin_news_setting" %>
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
        <div style="width: 98% !important;" id="parentHorizontalTab" class="divvalidate">
             <span class='detail_error'>  
            <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></span>
            <ul class="resp-tabs-list hor_1">
                <li>Cấu hình tin tức</li>
            </ul>
            <div class="resp-tabs-container hor_1">
                <div>
                    <p>
                        <table cellspacing="1" class="admintable">
                            <tbody>

                               
                                <tr>
                                    <td width="250" class="key">
                                        <label for="txttitle">Gửi mail khi có bình luận</label>
                                    </td>
                                    <td>
                                       <asp:CheckBox ID="chksendmail" runat="server" />
                                         <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Gửi mail khi có bình luận</b><br />
                                                        Nếu click chọn thì sẽ có email gửi về khi có bình luận mới
                                                    </span>
                                                </a>
                                    </td>
                                </tr>
                                  <tr>
							<td width="250" class="key">
								<label for="txttitle">Email nhận khi có bình luận mới</label> 
                               
                                
							</td>
							<td>
                               
                                            <asp:TextBox ID="txtemail" runat="server" Text=""  CssClass="inputbox" Width="300" ></asp:TextBox> 
                                       
                                
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
