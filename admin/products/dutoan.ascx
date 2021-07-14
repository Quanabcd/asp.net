<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dutoan.ascx.cs" Inherits="admin_products_dutoan" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<div class="widget">

    <div class="widget-title">
        <%--Header--%>
        <asp:Literal ID="lt_mess" runat="server"></asp:Literal>
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
                                                <th style="width: 80px; text-align: center !important;" class="title">Thứ tự
                                                </th>

                                                <th width="140" style="text-align: center" class="title">Thời gian
                                                </th>

                                                <th width="8%" class="title">Trạng thái
                                                </th>
                                                <th width="100" class="title"></th>
                                            </tr>
                                        </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tbody>
                                        <tr class="row0">
                                            <td align="center">
                                                <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("ino") %>" id='cb_' name='cb_'>
                                            </td>
                                            <td align="center"><%#getstt()%></td>

                                            <td>
                                                <asp:LinkButton ID="LinkButton1" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")%>'
                                                    runat="server" ToolTip="Sửa">
                                                      <%#Eval("vtitle")%>
                                                </asp:LinkButton>
                                            </td>

                                            <td align="center"><%#Eval("iorders")%></td>

                                            <td><%#getdatecreateupdate(Eval("dcreatedate").ToString(),Eval("dupdate").ToString()) %>
                                            </td>

                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")+"|"+Eval("istatus")%>'
                                                    runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                            </td>
                                            <td align="center">

                                                <asp:LinkButton ID="LinkButton3" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")%>'
                                                    runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                                &nbsp; &nbsp;
                                                                    <asp:LinkButton ID="LinkButton4" CommandName="delete" OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")%>'
                                                                        runat="server" ToolTip="Xóa"><img src="<%=weburl%>templates/admin/images/icondelete_c.png" /></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </tbody>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tbody>
                                        <tr class="row1">
                                            <td align="center">
                                                <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("ino") %>" id='cb_' name='cb_'>
                                            </td>
                                            <td align="center"><%#getstt()%></td>

                                            <td>
                                                <asp:LinkButton ID="LinkButton1" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")%>'
                                                    runat="server" ToolTip="Sửa">
                                                      <%#Eval("vtitle")%>
                                                </asp:LinkButton>
                                            </td>

                                            <td align="center"><%#Eval("iorders")%></td>

                                            <td><%#getdatecreateupdate(Eval("dcreatedate").ToString(),Eval("dupdate").ToString()) %>
                                            </td>

                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")+"|"+Eval("istatus")%>'
                                                    runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                            </td>
                                            <td align="center">

                                                <asp:LinkButton ID="LinkButton3" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")%>'
                                                    runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                                &nbsp; &nbsp;
                                                                    <asp:LinkButton ID="LinkButton4" CommandName="delete" OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ino")%>'
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
                            <div id="parentHorizontalTab" class="divvalidate">
                                <ul class="resp-tabs-list hor_1">
                                    <li>Thông tin chung</li>
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
                                        <p>
                                            <span class='detail_error'>
                                                <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></span>
                                            <table width="100%" cellspacing="1" class="admintable">
                                                <tbody>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Tiêu đề dự toán</label>
                                                            (<span style='color: red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtname" runat="server" name="txtname" Width="350" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Dòng xe</label>
                                                            (<span style='color: red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:Literal ID="ltino" Visible="false" runat="server"></asp:Literal>
                                                            <asp:DropDownList ID="ddldongxe" runat="server" CssClass="inputbox"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Nơi đăng ký</label>
                                                            (<span style='color: red'>*</span>)
                                                        </td>
                                                        <td>

                                                            <asp:DropDownList ID="ddlcity" runat="server" CssClass="inputbox"></asp:DropDownList>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="key">
                                                            <label for="listnhom">Phí trước bạ</label>(<span style='color: red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtphitruocba" CssClass="inputbox" Width="80" runat="server"></asp:TextBox>
                                                            %
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Phí trước bạ</b><br />
                                                                    Nhập phí trước bạ là số viết liền không dấu(VD:2,12,10...)
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="listnhom">Phí đăng ký</label>
                                                            (<span style='color: red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtphidangky" CssClass="inputbox" Width="80" runat="server"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Phí đăng ký</b><br />
                                                                    Nhập phí đăng ký là số viết liền không dấu(VD:500000,1000000,...)
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="listnhom">Phí đăng kiểm</label>
                                                            (<span style='color: red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtphidangkiem" CssClass="inputbox" Width="80" runat="server"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Phí đăng kiểm</b><br />
                                                                    Nhập phí đăng kiểm là số viết liền không dấu(VD:500000,1000000,...)
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="listnhom">Bảo hiểm TNDS</label>
                                                            (<span style='color: red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtbhtnds" CssClass="inputbox" Width="80" runat="server"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Bảo hiểm TNDS</b><br />
                                                                    Bảo hiểm TNDS là số viết liền không dấu(VD:500000,1000000,...)
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="listnhom">Bảo hiểm Vật chất</label>
                                                            (<span style='color: red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtbhvc" CssClass="inputbox" Width="80" runat="server"></asp:TextBox>
                                                            %
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Bảo hiểm Vật chất</b><br />
                                                                    Bảo hiểm TNDS là số viết liền(VD:1.65 , 2 ,...)
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>

                                                    <tr style="display: none">
                                                        <td class="key">
                                                            <label for="listnhom">Thứ tự</label>
                                                            (<span style='color: red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtorder" CssClass="inputbox" Width="80" runat="server"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Thứ tự</b><br />
                                                                    Nhập thứ tự hiển thị của danh mục(VD:1,2,3...)
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
                                                    <asp:Literal ID="ltlink" runat="server"></asp:Literal>
                                                </tbody>
                                            </table>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" value="" id="hndId" name="hndId">
                        </asp:Panel>

                        <asp:HiddenField ID="hdino" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdiid" runat="server" Visible="false" Value="-1" />
                        <asp:HiddenField ID="hdcreate" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdtitle" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdalias" runat="server" Visible="false" />
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