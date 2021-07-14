<%@ Control Language="C#" AutoEventWireup="true" CodeFile="support.ascx.cs" Inherits="admin_supportonline_support" %>
<input type="hidden" value="" id="hndId" name="hndId">

<asp:HiddenField ID="hdid" runat="server" Visible="false" />
<asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
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
                    <div id="Div2">
                        <asp:Panel ID="pnlist" runat="server">

                            <asp:Repeater ID="rpitems" runat="server" OnItemCommand="rpitems_ItemCommand">
                                <HeaderTemplate>
                                    <table cellpadding="1" summary="" class="adminlist">
                                        <thead>
                                            <tr>
                                                <th width="3%" class="title">
                                                    <input type="checkbox" id="chkToggle" value="" onclick="selectAll(this)" name="chkToggle">
                                                </th>
                                                <th width="2%" class="title">#</th>

                                                <th class="title">Họ tên 
                                                </th>
                                                <th width="150px" style="text-align: center;" class="title">Điện thoại
                                                </th>
                                                <th style="text-align:center;" width="100" class="title">Thứ tự
                                                        </th>
                                                <th width="100px" style="text-align: center;" class="title">Trạng thái
                                                </th>
                                                <th width="120px" style="text-align: center;" class="title">Ngày tạo
                                                </th>
                                                <th style="width: 110px;"></th>

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

                                            <td>
                                                <asp:LinkButton ID="LinkButton1" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")%>'
                                                    runat="server" ToolTip="Sửa"><%#Eval("vtitle")%></asp:LinkButton>
                                            </td>
                                            <td align="center"><%#Eval("vdesc")%></td>
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
                                            <asp:LinkButton ID="LinkButton4"  OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandName="delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")%>'
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
                            <div style="width: 98% !important;" id="parentHorizontalTab" class="divvalidate">
                                <ul class="resp-tabs-list hor_1">
                                    <li>Thông tin chung </li>
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
                                        <p>
                                            <table cellspacing="1" class="admintable">
                                                <tbody>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Họ tên</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtname"  runat="server" Width="364" CssClass="inputbox"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Họ tên</b><br />
                                                        Tên đại diện hiển thị cho nickname
                                                    </span>
                                                </a>
                                                        </td>
                                                    </tr>
                                                      <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Bộ phận</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtdepartment" placeholder="Bộ phận kinh doanh..." runat="server" Width="364" CssClass="inputbox"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Bộ phận</b><br />
                                                        Bộ phận của người hỗ trợ (Chăm sóc khách hàng, Kinh doanh,...)
                                                    </span>
                                                </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="txtphone">Số điện thoại</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtphone" runat="server" Width="364" CssClass="inputbox"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Số điện thoại</b><br />
                                                        Số điện thoại liên lạc với nickname khi cần
                                                    </span>
                                                </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="txtnickname">Tên nick skype</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_skype" runat="server" Width="364" CssClass="inputbox"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="txtnickname">Tên nick yahoo</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_yahoo" runat="server" Width="364" CssClass="inputbox"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="txthoten">Kiểu hiển thị</label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList  CssClass="inputbox" Width="100" ID="ddltype" runat="server">
                                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                                                <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                                                <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                                                <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                                <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                                                <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                                                <asp:ListItem Text="13" Value="13"></asp:ListItem>
                                                                <asp:ListItem Text="14" Value="14"></asp:ListItem>
                                                                <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                                                <asp:ListItem Text="16" Value="16"></asp:ListItem>
                                                                <asp:ListItem Text="17" Value="17"></asp:ListItem>
                                                                <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                                                <asp:ListItem Text="19" Value="19"></asp:ListItem>
                                                                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                                <asp:ListItem Text="21" Value="21"></asp:ListItem>
                                                                <asp:ListItem Text="22" Value="22"></asp:ListItem>
                                                                <asp:ListItem Text="23" Value="23"></asp:ListItem>
                                                                <asp:ListItem Text="24" Value="24"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kiểu hiện thị</b><br />
                                                        Chọn kiểu hiển yahoo phù hợp với website
                                                    </span>
                                                </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="txtphone">Ảnh đại diện</label>
                                                        </td>
                                                        <td>
                                                            <asp:HiddenField ID="hdimg_old" runat="server" Visible="false" />
                                                            <asp:Literal ID="ltimage" runat="server"></asp:Literal><br />
                                                            <asp:FileUpload ID="flupload" ToolTip="Ảnh đại diện" runat="server" CssClass="upload-file" />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkdeleteimg" runat="server" Text=" Xóa ảnh" Visible="false" />
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="listnhom">Thứ tự</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtorder" CssClass="input-order" runat="server">1</asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Thứ tự</b><br />
                                                        Thứ tự hiển thị của nickname trên website so với các nickname khác
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
                            </div>
                            <input type="hidden" value="" id="Hidden1" name="hndId">
                        </asp:Panel>
                        <asp:HiddenField ID="hdicid" runat="server" Visible="false" />
                           <asp:HiddenField ID="hdcreatedate" runat="server" Visible="false" />
                        <asp:HiddenField ID="HiddenField1" runat="server" Visible="false" />
                    </div>
                    <div class="clr"></div>
                </div>
            </div>
        </div>
        <%--//--%>
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
