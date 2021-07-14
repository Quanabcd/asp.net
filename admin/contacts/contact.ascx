<%@ Control Language="C#" AutoEventWireup="true" CodeFile="contact.ascx.cs" Inherits="admin_contacts_contact" %>


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


        <%--Content-products--%>
        <div class="widget-body">
        </div>
    </div>

    <div id="element-box">
        <div class="m">
            <div id="adminForm1">
                <asp:Panel ID="pnlist" runat="server">
                    <div class="row-fluid">
                    <div class="span3">
                        <div style="margin-top: 4px; font-size: 12px; font-style: italic;">
                            <asp:Literal ID="lt_count" runat="server"></asp:Literal>

                        </div>
                     
                    </div>
                    <div class="span9">
                        <div class="pagination pagination-small pagination-right">
                            <asp:TextBox ID="txtkeysearch" CssClass="inputbox-top" runat="server" Width="150"></asp:TextBox>
                            <asp:DropDownList ID="ddlstatus" runat="server" CssClass="inputbox-top-select"  Width="130" >
                                <asp:ListItem Value="-1" Text="Tất cả trạng thái"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Đã duyệt"></asp:ListItem>
                                <asp:ListItem Value="0" Text="Chưa duyệt"></asp:ListItem>
                            </asp:DropDownList>
                             <asp:DropDownList ID="ddlorder" Width="110" CssClass="inputbox-top-select" runat="server">
                               <asp:ListItem Text="SX.Ngày tạo" Value="0"></asp:ListItem>
                                <asp:ListItem Text="SX.Họ tên" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlordertype" Width="110" CssClass="inputbox-top-select" runat="server">
                                <asp:ListItem Text="Giảm dần" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Tăng dần" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btnsearch" OnClick="btnsearch_Click" runat="server" CssClass="buton-css" Text="Tìm kiếm" />
                        </div>
                       
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
                                        <th width="2%" class="title">#</th>

                                        <th class="title">Họ Tên 
                                        </th>
                                        <th width="200" class="title">Email
                                        </th>
                                        <th width="200" class="title">Số điện thoại
                                        </th>
                                        <th style="text-align: center;" width="10%" nowrap="nowrap" class="title">Ngày gửi
                                        </th>
                                        <th width="8%" class="title">Trạng thái
                                        </th>
                                        <th style="width: 100px;"></th>

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
                                    <td align="left"><%#Eval("vparam1")%></td>
                                    <td align="left"><%#Eval("vparam2")%></td>
                                    <td align="center"><%#Convert.ToDateTime(Eval("dcreatedate").ToString()).ToString("dd/MM/yyyy")%></td>
                                    <td align="center">
                                        <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")+"|"+Eval("istatus")%>'
                                            runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                    </td>
                                    <td align="center">
                                        <asp:LinkButton ID="LinkButton4" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")%>'
                                            runat="server" ToolTip="Xem chi tiết "><img src="<%=weburl%>templates/admin/images/view.png" /></asp:LinkButton>
                                    </td>

                                </tr>
                            </tbody>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                     <div class="page-items">
                    <asp:Literal ID="lt_pagebotom" runat="server"></asp:Literal>
                </div>
                </asp:Panel>
                <asp:Panel ID="pndetail" runat="server" Visible="false">
                    <div style="width: 98% !important;" id="parentHorizontalTabcontent" class="divvalidate">
                        <ul class="resp-tabs-list hor_1">
                            <li>Thông tin liên hệ</li>
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
                                                    <asp:TextBox ID="ltname" CssClass="inputbox" Width="200" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="key">
                                                    <label for="txtphone">Email</label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="ltemail" CssClass="inputbox" Width="200" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="key">
                                                    <label for="txtphone">Số điện thoại</label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="ltphone" CssClass="inputbox" Width="200" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="key">
                                                    <label for="txtphone">Địa chỉ</label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="ltaddress" CssClass="inputbox" Width="364" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="key">
                                                    <label for="txtphone">Tiêu đề</label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="lttitlecontact" CssClass="inputbox" Width="200" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="key">
                                                    <label for="txtphone">Nội dung</label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="ltcontent" CssClass="inputbox" TextMode="MultiLine" Height="100" Width="400" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>


                                            <tr>
                                                <td class="key">
                                                    <label for="listnhom">Trạng thái</label>
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="chkstatus" runat="server" Text=" đã xử lý" />

                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </p>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" value="" id="hndId" name="hndId">
                </asp:Panel>
                <asp:HiddenField ID="hdid" runat="server" Visible="false" />
                <asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
                
            </div>
            <div class="clr"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        //Horizontal Tab
        $('#parentHorizontalTabcontent').easyResponsiveTabs({
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
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        //We are binding onchange event using jQuery built-in change event
        $('#ddlSubject').change(function () {
            //get selected value and check if subject is selected else show alert box
            var SelectedValue = $("#ddlSubject").val();
            if (SelectedValue > 0) {
                //get selected text and set to label
                var SelectedText = $("#ddlSubject option:selected").text();
                lblSelectedText.innerHTML = SelectedText;
                //set selected value to label
                lblSelectedValue.innerHTML = SelectedValue;
            } else {
                //reset label values and show alert
                lblSelectedText.innerHTML = "";
                lblSelectedValue.innerHTML = "";
                alert("Please select valid subject.");
            }
        });
    });
</script>
