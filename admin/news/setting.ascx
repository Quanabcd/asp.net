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
                                    <td width="150" class="key" style="width:250px">
                                        <label for="txttitle">Số tin mới</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtnumnew" runat="server" onkeypress=" return isNumberKey(event)" CssClass="inputbox" Width="100"></asp:TextBox>
                                        <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Số tin mới</b><br />
                                                        Số tin được hiển thị trong mục tin mới
                                                    </span>
                                                </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="150" class="key">
                                        <label for="txttitle">Số tin nổi bật</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtnumhot" runat="server" onkeypress=" return isNumberKey(event)" CssClass="inputbox" Width="100"></asp:TextBox>
                                        <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Số tin nổi bật</b><br />
                                                        Số tin được hiển thị trong mục tin nổi bật
                                                    </span>
                                                </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="150" class="key">
                                        <label for="txttitle">Số tin trên mỗi trang danh mục</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtperpage" runat="server" onkeypress=" return isNumberKey(event)" CssClass="inputbox" Width="100"></asp:TextBox>
                                        <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Số tin trên mỗi trang danh mục</b><br />
                                                        Số tin được hiển thị trên mỗi trang của danh mục
                                                    </span>
                                                </a>
                                    </td>
                                </tr>
                                <tr style="display:none">
                                    <td width="150" class="key">
                                        <label for="txttitle">Hiển thị bình luận Facebook</label>
                                    </td>
                                    <td>
                                       <asp:CheckBox ID="chkdisplayfacebookcomment" runat="server" />
                                         <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Hiển thị bình luận Facebook</b><br />
                                                        Tùy chọn kích hoạt hiển thị bình luận Facebook dưới mỗi tin
                                                    </span>
                                                </a>
                                    </td>
                                </tr>
                                  <tr>
							<td width="150" class="key">
								<label for="txttitle">Kích thước ảnh nhỏ</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh nhỏ</b><br />
                                                       Kích thước ảnh tin tức hiển thị trên các khối kích thước nhỏ
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtimgthumbwidth" onkeypress=" return isNumberKey(event)" runat="server" Text="200"  CssClass="inputbox" Width="100" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtimgthumbheight" onkeypress=" return isNumberKey(event)" runat="server" Text="160"  CssClass="inputbox" Width="100" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
                                 <tr>
							<td width="150" class="key">
								<label for="txttitle">Kích thước ảnh lớn</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh lớn</b><br />
                                                       Kích thước ảnh tin tức hiển thị trên trang danh mục tin tức, rang chi tiết 
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtwidthbig" runat="server" onkeypress=" return isNumberKey(event)" Text="400"  CssClass="inputbox" Width="100" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtheightbig" runat="server" onkeypress=" return isNumberKey(event)" Text="300"  CssClass="inputbox" Width="100" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
                                <tr style="display:none">
                                    <td width="150" class="key">
                                        <label for="txttitle">Số tin tức tìm kiếm</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtnumsearch" runat="server" onkeypress=" return isNumberKey(event)" CssClass="inputbox" Width="100"></asp:TextBox>
                                         <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Số tin tức tìm kiếm</b><br />
                                                        Số tin được hiển thị trên mỗi trang của mục tìm kiếm
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
