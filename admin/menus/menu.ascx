<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu.ascx.cs" Inherits="admin_menus_menu" %>
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

                            <asp:Repeater ID="rpitems" runat="server" OnItemCommand="rpitems_ItemCommand">
                                <HeaderTemplate>
                                    <table cellpadding="1" summary="" class="adminlist">
                                        <thead>
                                            <tr>
                                                <th width="3%" class="title">
                                                    <input type="checkbox" id="chkToggle" value="" onclick="selectAll(this)" name="chkToggle">
                                                </th>
                                                <th width="3%" class="title">#</th>

                                                <th class="title">Tiêu đề 
                                                </th>

                                                <th align="center" width="8%" class="title">Thứ tự
                                                </th>
                                                <th width="8%" class="title">Trạng thái
                                                </th>
                                                <th width="10%" nowrap="nowrap" class="title">Ngày cập nhật
                                                </th>
                                                <th width="80"></th>
                                            </tr>
                                        </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tbody>
                                        <tr class="row0">

                                            <td align="center">
                                                <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("icid") %>" id='cb_' name='cb_'>
                                            </td>
                                            <td align="center"><%#getstt()%></td>
                                            <td>
                                                <%#space(Eval("ilevel").ToString()) %><asp:LinkButton ID="LinkButton1" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                    runat="server" ToolTip="Sửa"><%#Eval("vname")%></asp:LinkButton>
                                            </td>

                                            <td align="center"><%#Eval("iorders")%></td>
                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")+"|"+Eval("istatus")%>'
                                                    runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                            </td>
                                            <td align="center"><%#formatdate(Convert.ToDateTime(Eval("dcreatedate").ToString()))%></td>

                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton4" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                    runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                                &nbsp &nbsp
                                                                    <asp:LinkButton ID="LinkButton5" CommandName="delete" OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                                        runat="server" ToolTip="Xóa"><img src="<%=weburl%>templates/admin/images/icondelete_c.png" /></asp:LinkButton>
                                            </td>

                                        </tr>
                                    </tbody>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tbody>
                                        <tr class="row1">

                                            <td align="center">
                                                <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("icid") %>" id='cb_' name='cb_'>
                                            </td>
                                            <td align="center"><%#getstt()%></td>
                                            <td>
                                                <%#space(Eval("ilevel").ToString()) %><asp:LinkButton ID="LinkButton1" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                    runat="server" ToolTip="Sửa"><%#Eval("vname")%></asp:LinkButton>
                                            </td>

                                            <td align="center"><%#Eval("iorders")%></td>
                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")+"|"+Eval("istatus")%>'
                                                    runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                            </td>
                                            <td align="center"><%#formatdate(Convert.ToDateTime(Eval("dcreatedate").ToString()))%></td>

                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton4" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                    runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                                &nbsp &nbsp
                                                                    <asp:LinkButton ID="LinkButton5" CommandName="delete" OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                                        runat="server" ToolTip="Xóa"><img src="<%=weburl%>templates/admin/images/icondelete_c.png" /></asp:LinkButton>
                                            </td>

                                        </tr>
                                    </tbody>
                                </AlternatingItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                        <asp:Panel ID="pndetail" runat="server" Visible="false">
                            <asp:Literal ID="lt_mess" runat="server"></asp:Literal>
                            <div id="parentHorizontalTab" class="divvalidate">
                                <ul class="resp-tabs-list hor_1">
                                    <li>Thông tin chung</li>
                                    <li>Thông tin thêm</li>
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
                                        <table cellspacing="1" width="100%" class="admintable">
                                            <tbody>

                                                <tr>
                                                    <td width="150" class="key">
                                                        <label for="txtuser">Thuộc menu</label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlcate" CssClass="inputbox" Width="450" runat="server"></asp:DropDownList>
                                                        <a href="#" class="tooltip">
                                                            <img src="../templates/admin/images/help-icon.png" />
                                                            <span><b>Chọn menu</b><br />
                                                                Chọn menu này là menu chính hay là menu con của 1 mục nào đó
                                                            </span>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="150" class="key">
                                                        <label for="txtuser">Tiêu đề</label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtname" runat="server" Width="450" CssClass="inputbox"></asp:TextBox>
                                                        <a href="#" class="tooltip">
                                                            <img src="../templates/admin/images/help-icon.png" />
                                                            <span><b>Tiêu đề</b><br />
                                                                Tiêu đề của menu VD: Trang chủ, Sản phẩm, Liên hệ...
                                                            </span>
                                                        </a>
                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td valign="top" class="key">
                                                        <label for="txtphone">Liên kết </label>
                                                    </td>
                                                    <td>
                                                        <ul>
                                                            <li><span style="display: none; width: 140px;">
                                                                <asp:RadioButton ID="rdlinkinput" runat="server" Text=" Nhập liên kết" GroupName="link" Checked="true" /></span><asp:TextBox ID="txtlink" runat="server" Width="450" CssClass="inputbox"></asp:TextBox>
                                                                <a href="#" class="tooltip">
                                                                    <img src="../templates/admin/images/help-icon.png" />
                                                                    <span><b>Liên kết</b><br />
                                                                        Lấy liên kết từ tin tức,bài viết, sản phẩm,...
                                                                    </span>
                                                                </a>
                                                                <br />
                                                                <br />
                                                            </li>
                                                            <li  style="display:none;"><span style="display:none; width: 140px;">
                                                                <asp:RadioButton ID="rdlinkfrommodule" runat="server" Text=" Chọn từ module " GroupName="link" />
                                                            </span>
                                                                <asp:DropDownList ID="ddllinkfrommodule" runat="server" Visible="false" CssClass="inputbox" Enabled="false">
                                                                </asp:DropDownList><br />
                                                                <br />
                                                            </li>
                                                            <li><span style="display: inline-block; width: 140px;">
                                                                <asp:RadioButton ID="rdlinkfromcate" runat="server" Text=" Chọn từ danh mục " GroupName="link" />
                                                            </span>
                                                                <asp:DropDownList ID="ddllinkfromcate" Width="200" runat="server" CssClass="inputbox" Enabled="false">
                                                                </asp:DropDownList>
                                                                <a href="#" class="tooltip">
                                                            <img src="../templates/admin/images/help-icon.png" />
                                                            <span><b>Chọn từ danh mục</b><br />
                                                                Click chọn 1 trong số các danh mục hiển thị bên dưới
                                                            </span>
                                                        </a>
                                                                <div class="linklist"></div>
                                                            </li>
                                                        </ul>
                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td class="key">
                                                        <label for="listnhom">Thứ tự</label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtorder"  onkeypress=" return isNumberKey(event)" CssClass="inputbox" Width="130" runat="server"></asp:TextBox>
                                                        <a href="#" class="tooltip">
                                                            <img src="../templates/admin/images/help-icon.png" />
                                                            <span><b>Thứ tự</b><br />
                                                                Thứ tự hiển thị của menu (VD: 1,2,3...)
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
                                                <tr>
                                                    <td class="key">
                                                        <label for="listnhom">Ngày tạo</label>
                                                    </td>
                                                    <td>
                                                        <asp:Literal ID="ltdatetime" runat="server"></asp:Literal>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div>
                                        <table cellspacing="1" width="100%" class="admintable">
                                            <tbody>

                                                <tr>
                                                    <td width="150" class="key">
                                                        <label for="txtuser">Ảnh đại diện</label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="flicon" runat="server" />
                                                        <a href="#" class="tooltip">
                                                            <img src="../templates/admin/images/help-icon.png" />
                                                            <span><b>Ảnh đại diện</b><br />
                                                                Ảnh đại diện cho menu
                                                            </span>
                                                        </a>
                                                        <br />
                                                        <asp:Literal ID="lticon" runat="server"></asp:Literal>
                                                        <asp:HiddenField ID="hdicon" runat="server" Visible="false" />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkdeleteimg" runat="server" Text=" Xóa ảnh" Visible="false" />
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="150" class="key">
                                                        <label for="txtuser">Mô tả</label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" CssClass="inputbox" Rows="5" Columns="70"></asp:TextBox>
                                                        <a href="#" class="tooltip">
                                                            <img src="../templates/admin/images/help-icon.png" />
                                                            <span><b>Mô tả</b><br />
                                                                Thông tin mô tả ngắn cho menu
                                                            </span>
                                                        </a>

                                                    </td>
                                                </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" value="" id="hndId" name="hndId">
                        </asp:Panel>
                        <asp:HiddenField ID="hdicid" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdicate" runat="server" Value=""  Visible="false" />
                        <asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
                    </div>
                    <div class="clr"></div>
                </div>

            </div>
        </div>
        <%--//--%>
    </div>
</div>
<script type="text/javascript">
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
    });


</script>
