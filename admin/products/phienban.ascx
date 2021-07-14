<%@ Control Language="C#" AutoEventWireup="true" CodeFile="phienban.ascx.cs" Inherits="admin_products_phienban" %>
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
                                                <th class="title">Hình ảnh
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
                                                    runat="server" ToolTip="Sửa"><%#getpic(Eval("vparam1").ToString())%>&nbsp;&nbsp;&nbsp;
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
                                                    runat="server" ToolTip="Sửa"><%#getpic(Eval("vparam1").ToString())%>&nbsp;&nbsp;&nbsp;
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
                                                            <label for="txtuser">Tiêu đề</label>
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
                                                            <asp:DropDownList ID="ddldongxe" runat="server" CssClass="inputbox"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key" valign="top">
                                                            <label for="txtphone">Hình ảnh</label>
                                                            (<span style='color: red'>*</span>)
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Ảnh đại diện</b><br />
                                                                    Ảnh có định dạng .png,.jpg,.gif. Kích thước ảnh: 24px * 24px
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <asp:FileUpload ID="flupload" ToolTip="Ảnh đại diện" runat="server" CssClass="upload-file" />
                                                            <br />
                                                            <asp:HiddenField ID="hdimg_old" runat="server" Visible="false" />
                                                            <asp:Literal ID="ltimage" runat="server"></asp:Literal>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkdeleteimg" runat="server" Text=" Xóa ảnh" Visible="false" />
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key" valign="top">
                                                            <label for="listnhom">Giá</label>
                                                            (<span style='color: red'>*</span>)
                                                        </td>
                                                        <td>Giá mới:&nbsp;<asp:TextBox ID="txtpricenew" Text="0" CssClass="inputbox" Width="150" runat="server"></asp:TextBox><br />
                                                            <br />
                                                            Giá cũ:&nbsp;&nbsp;&nbsp;
                                                            <asp:TextBox ID="txtpriceold" Text="0" CssClass="inputbox" Width="150" runat="server"></asp:TextBox><br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Mô tả</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_mota" TextMode="MultiLine" Rows="8" Columns="100" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Nội dung</label>
                                                        </td>
                                                        <td>
                                                            <CKEditor:CKEditorControl ID="txtcontent" runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                                        </td>
                                                    </tr>
                                                    <tr>
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
                        <asp:HiddenField ID="hdino" Value="-1" runat="server" Visible="false" />
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