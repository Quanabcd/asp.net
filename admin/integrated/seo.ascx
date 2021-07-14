<%@ Control Language="C#" AutoEventWireup="true" CodeFile="seo.ascx.cs" Inherits="admin_integrated_seo" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
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
                                     <li>Hỗ trợ SEO</li>
                                    <li>File robots.txt</li>
                                    <li>File sitemaps.xml</li>
                                     <li>RSS</li>
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                     <div>
                                        <p>
                                            <table cellspacing="1" class="admintable">
                                                <tbody>
                                                       <tr>
                                                        <td width="150" class="key">
                                                            <label for="txttitle">Thẻ tiêu đề website</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txttitleweb" runat="server" CssClass="inputbox" Width="364"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Tiêu đề website</b><br />
                                                                    Nội dung được hiển thị dưới dạng tiêu đề trong kết quả tìm kiếm và trên trình duyệt của người dùng.<br />
                                                                    <i>Tiêu đề tối đa 70 ký tự</i>
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtkeyword">Thẻ từ khóa</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtkeyword" runat="server" CssClass="inputbox" TextMode="MultiLine" Rows="5" Columns="55"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Thẻ từ khóa</b><br />
                                                                    Danh sách các từ khóa chính của website, các từ khóa cách nhau bởi dấu ","
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="txtdesciption">Thẻ mô tả</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtdesc" runat="server" CssClass="inputbox" TextMode="MultiLine"  Rows="5" Columns="55"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Thẻ mô tả</b><br />
                                                                    Cung cấp một mô tả ngắn của trang. Trong vài trường hợp, mô tả này được sử dụng như một phần của đoạn trích được hiển thị trong kết quả tìm kiếm.
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>

                                                      <tr>
                                                        <td class="key">
                                                            <label for="txtdesciption">Cấu hình thẻ H1 tại trang chủ</label>
                                                        </td>
                                                        <td>
  
                                                             <CKEditor:CKEditorControl ID="txth1home" runat="server"  BasePath="~/ckeditor"></CKEditor:CKEditorControl><a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Thẻ h1 trang chủ</b><br />
                                                                    Cung cấp nội dung cho H1 tại trang chủ
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </p>
                                        </div>
                                    <div>
                                        <p>
                                            <table cellspacing="1" class="admintable">
                                                <tbody>
                                                     <tr>
                                                        <td class="key" style="width:200px">
                                                            <label for="txtphone">Đường dẫn tới file robot</label>
                                                        </td>
                                                        <td>
                                                           <p><a href="<%=WEB.Common.Weburl %>robots.txt"><%=WEB.Common.Weburl %>robots.txt</a></p>
                                                        </td>
                                                    </tr>
                                                   <tr>
                                                        <td class="key">
                                                            <label for="txtphone">Nội dung file robots.txt</label>  <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Nội dung file</b><br />
                                                                  Nhập nội dung file robots.txt tại đây
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtrobot" runat="server" CssClass="inputbox" TextMode="MultiLine" Rows="5"  Columns=  "100"></asp:TextBox>
                                                           
                                                        </td>
                                                    </tr>
                                                   
                                                    </tbody>
                                                </table>
                                            </p>
                                        </div>
                                     <div>
                                        <p>
                                            <table cellspacing="1" class="admintable">
                                                <tbody>
                                                    <tr>
                                                        <td class="key" style="width:200px">
                                                            <label for="txtphone">Đường dẫn tới sitemap</label> 
                                                        </td>
                                                        <td>
                                                            <p><a href="<%=WEB.Common.Weburl %>sitemap.xml"><%=WEB.Common.Weburl %>sitemap.xml</a></p>
                                                        </td>
                                                    </tr>
                                                   <tr>
                                                        <td class="key">
                                                            <label for="txtphone">Nội dung file sitemap.xml</label> <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Nội dung file</b><br />
                                                                  Nhập nội dung file sitemap tại đây<br />
                                                                    Để trống nếu lấy sitemap mặc định từ hệ thống
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td>
                                                          <asp:TextBox ID="txtsitemap" runat="server" CssClass="inputbox" TextMode="MultiLine" Rows="15" Columns=  "100"></asp:TextBox>
                                                            
                                                        </td>
                                                    </tr>
                                                      
                                                    </tbody>
                                                </table>
                                            </p>
                                        </div>
                                    <div>
                                        <p>
                                            <table cellspacing="1" class="admintable">
                                                <tbody>
                                                    <tr>
                                                        <td class="key" style="width:200px">
                                                            <label for="txtphone">Đường dẫn tới RSS</label> 
                                                        </td>
                                                        <td>
                                                            <p><a href="<%=WEB.Common.Weburl %>feed"><%=WEB.Common.Weburl %>feed</a></p>
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
