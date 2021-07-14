<%@ Control Language="C#" AutoEventWireup="true" CodeFile="advbycate.ascx.cs" Inherits="admin_advs_adv1" %>
<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>--%>
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
                                    <asp:LinkButton ID="lnkadd" runat="server" CssClass="toolbar" OnClick="lnkadd_Click">
						<span class="icon-ok-new"></span>
							Thêm
                                    </asp:LinkButton>
                                </td>

                                <td align="center">
                                    <asp:LinkButton ID="lnkdelete" runat="server" CssClass="toolbar" OnClientClick="return confirm('Bạn có muốn xóa dữ liệu không?')" OnClick="lnkdelete_Click">
							<span class="icon-ok-delete"></span>
							Xóa
                                    </asp:LinkButton>
                                </td>
                                <td align="center">
                                    <asp:LinkButton ID="lnkupdate" runat="server" CssClass="toolbar" OnClientClick="return validation()" OnClick="lnkupdate_Click">
							<span class="icon-ok-update"></span>
							Cập nhật
                                    </asp:LinkButton>
                                </td>
                                <td align="center">
                                    <asp:LinkButton ID="lnkclose" runat="server" CssClass="toolbar" OnClick="lnkclose_Click">
						<span class="icon-ok-close"></span>
							Đóng
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

            <div id="element-box">

                <div class="m">
                    <div id="adminForm1">
                        <asp:Panel ID="pnlist" runat="server">
                            <div class="row-fluid">
                    <div class="span3">
                        <div style="margin-top: 4px; font-size: 12px; font-style: italic;">
                            <asp:Literal ID="lt_count" runat="server"></asp:Literal>

                        </div>
                        <div style="clear: both;"></div>
                    </div>
                    <div class="span9">
                        <div class="pagination pagination-small pagination-right">
                            <asp:TextBox ID="txtkeysearch" CssClass="inputbox-top" runat="server" Width="150"></asp:TextBox>
                            <asp:DropDownList ID="ddlcatesearch" CssClass="inputbox-top-select" runat="server"></asp:DropDownList>
                            <asp:Button ID="btnsearch" runat="server" CssClass="buton-css" Text="Tìm kiếm" OnClick="btnsearch_Click" />
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </div>
                            <div class="page-items">
                    <asp:Literal ID="ltpage" runat="server"></asp:Literal>
                </div>
                            <asp:Repeater ID="rpitems" runat="server" OnItemCommand="rpitems_ItemCommand">
                                <HeaderTemplate>
                                    <table cellpadding="1" summary="" class="adminlist">
                                        <thead>
                                            <tr>
                                                <th width="3%" class="title">
                                                    <input type="checkbox" id="chkToggle" value="" onclick="selectAll(this)" name="chkToggle">
                                                </th>
                                                <th width="3%" class="title">#</th>
                                                 <th width="100" class="title">Hình ảnh
                                                </th>
                                                <th class="title">Tiêu đề
                                                </th>
                                               
                                                <th width="200" class="title">Liên kết
                                                </th>
                                                <th style="text-align:center;" width="8%" class="title">Thứ tự
                                                </th>
                                                <th style="text-align:center;" width="8%" class="title">Trạng thái
                                                </th>
                                                <th width="120px" style="text-align: center;" class="title">Ngày tạo
                                                </th>
                                                <th width="80"></th>
                                            </tr>
                                        </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tbody>
                                        <tr class="row0">
                                            <td align="center">
                                                <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("ino") %>" id='cb_' name='cb_'>
                                            </td>
                                            <td align="center"><%#Eval("rowindex")%></td>
                                            <td align="center"><%#getpic_flash(Eval("vcontent").ToString())%></td>
                                            <td>
                                                <asp:LinkButton ID="LinkButton1" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")%>'
                                                    runat="server" ToolTip="Sửa"><%#Eval("vtitle")%></asp:LinkButton>
                                            </td>
                                            <td align="left"><%#Eval("vparam4")%></td>
                                            <td align="center"><%#Eval("iorders")%></td>
                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")+"|"+Eval("istatus")%>'
                                                    runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                            </td>
                                              <td align="center"><%#Convert.ToDateTime( Eval("dcreatedate")).ToString("dd/MM/yyyy hh:mm")%></td>
                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton3" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")%>'
                                                    runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                                &nbsp &nbsp
                                            <asp:LinkButton ID="LinkButton4" OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandName="delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")%>'
                                                runat="server" ToolTip="Xóa"><img src="<%=weburl%>templates/admin/images/icondelete_c.png" /></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </tbody>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                        <asp:Panel ID="pndetail" runat="server" Visible="false">
                             <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal>
                            <div style="width: 98% !important;" id="parentHorizontalTab" class="divvalidate">
                                <ul class="resp-tabs-list hor_1">
                                    <li>Thông tin quảng cáo</li>
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
                                        <p>
                                            <table cellspacing="1" class="admintable">
                                                <tbody>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Tiêu đề</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtname" runat="server"  placeholder="Quảng cáo ..." Width="364" CssClass="inputbox"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Tiêu đề</b><br />
                                                                    Tên quảng cáo vd: Quảng cáo trang chủ, ...
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="txtphone">Mô tả ngắn</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_vdesc" runat="server" TextMode="MultiLine" Width="500" Height="100" CssClass="inputbox"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Mô tả ngắn</b><br />
                                                                    Mô tả ngắn gọn về nội dung quảng cáo
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="txtphone">Link liên kết</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtlink" runat="server" placeholder="http://" Width="500" CssClass="inputbox"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Link liên kết</b><br />
                                                                    Gắn link đích đến cho quảng cáo
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="txtphone">Hình ảnh/Flash</label>
                                                        </td>
                                                        <td>
                                                            <asp:Literal ID="ltimageflash" runat="server"></asp:Literal><br />
                                                            <asp:FileUpload ID="flupload" runat="server" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="key">
                                                            <label for="txtphone">Vị trí quảng cáo</label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlposition" CssClass="inputbox" Width="200" runat="server">
                                                            </asp:DropDownList>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Vị trí quảng cáo</b><br />
                                                                    Chọn vị trí quảng cáo xuất hiện ở đâu trên trang web
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td class="key">
                                                            <label for="txtphone">Danh mục</label>  <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Danh mục hiển thị quảng cáo</b><br />
                                                                    Chọn danh mục sẽ hiển thị quảng cáo trên trang web. Chỉ sử dụng cho 1 số vị trí quảng cáo nhất định
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <div class="lcate">
                                                           <asp:Literal ID="ltcates" runat="server"></asp:Literal></div>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="key">
                                                            <label for="txtphone">Chiều rộng (px)</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtwidth" Text="0" runat="server" Width="80" CssClass="inputbox"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Chiều rộng</b><br />
                                                                    Chiều rộng của hình ảnh hoặc flash hiển thị trên website<br />
                                                                    <b>0</b>: kích thước mặc định
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="txtphone">Chiều cao (px)</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtheight" Text="0" runat="server" Width="80" CssClass="inputbox"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Chiều cao</b><br />
                                                                    Chiều cao của hình ảnh hoặc flash hiển thị trên website<br />
                                                                     <b>0</b>: kích thước mặc định
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="listnhom">Thứ tự</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox Text="1" ID="txtorder" CssClass="input-order" runat="server"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Thứ tự</b><br />
                                                                    Thứ tự hiển thị quảng cáo
                                                                </span>
                                                            </a>


                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="key">
                                                            <label for="listnhom">Trạng thái</label>
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="chkstatus" runat="server" Text=" Hiển thị" />

                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </p>
                                    </div>
                                </div>
                                <div class="clr"></div>
                                <input type="hidden" value="" id="hndId" name="hndId">
                        </asp:Panel>
                        <asp:HiddenField ID="hdid" runat="server" Visible="false" />
                        <asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdadvs_old" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdprdicidlist" runat="server" Visible="false" />
                    </div>
                    <div class="clr"></div>
                </div>
            </div>
        </div>
        <%--</contenttemplate>
</asp:UpdatePanel>--%>
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
            .lcate ul {
                border-bottom: 1px solid #f0f0f0;margin:10px 0px;padding-bottom:10px;
            }
            .lcate ul ul {
                margin:0px 0px 0px 25px;border:0px;padding:0px;
            }
        </style>
