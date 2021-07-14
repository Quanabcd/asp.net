<%@ Control Language="C#" AutoEventWireup="true" CodeFile="vendor.ascx.cs" Inherits="admin_products_group" %>
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
                                    <asp:LinkButton ID="lnkupdate" runat="server" CssClass="toolbar" OnClientClick="return checkdata()" OnClick="lnkupdate_Click">
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
                                                <th class="title">Khu Vực
                                                </th>

                                                <th style="text-align: center;" width="8%" class="title">Thứ tự
                                                </th>
                                                <th width="10%" style="text-align: center" class="title">Thao tác
                                                </th>
                                                <th width="140" style="text-align: center" class="title">Thời gian
                                                </th>
                                                <th width="8%" class="title">Trạng thái
                                                </th>
                                                <th width="10%" class="title"></th>
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
                                            <td><%#getusercreateupdate(Eval("vusercreate").ToString(),Eval("vparam5").ToString()) %>
                                            </td>
                                            <td><%#getdatecreateupdate(Eval("dcreatedate").ToString(),Eval("dupdatedate").ToString()) %>
                                            </td>
                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")+"|"+Eval("istatus")%>'
                                                    runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                            </td>
                                            <td align="center">
                                                <a href="<%#weburl %><%#Eval("valias") %>" target="_blank" title="Xem chi tiết">
                                                    <img src="<%=weburl%>templates/admin/images/view.png" /></a>&nbsp; &nbsp;
                                                <asp:LinkButton ID="LinkButton3" CommandName="EditDetail" Visible='<%#checkrole("2041") %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                    runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                                &nbsp &nbsp
                                            <asp:LinkButton ID="LinkButton4" CommandName="delete" Visible='<%#checkrole("2043") %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
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
                                            <td><%#getusercreateupdate(Eval("vusercreate").ToString(),Eval("vparam5").ToString()) %>
                                            </td>
                                            <td><%#getdatecreateupdate(Eval("dcreatedate").ToString(),Eval("dupdatedate").ToString()) %>
                                            </td>
                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")+"|"+Eval("istatus")%>'
                                                    runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                            </td>
                                            <td align="center">
                                                <a href="<%#weburl %><%#Eval("valias") %>" target="_blank" title="Xem chi tiết">
                                                    <img src="<%=weburl%>templates/admin/images/view.png" /></a>&nbsp; &nbsp;
                                                <asp:LinkButton ID="LinkButton3" CommandName="EditDetail" Visible='<%#checkrole("2041") %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                    runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                                &nbsp &nbsp
                                            <asp:LinkButton ID="LinkButton4" CommandName="delete" Visible='<%#checkrole("2043") %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
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
                                    <li>Thông tin chi tiết</li>
                                    <li>Danh mục sản phẩm</li>
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
                                                            <label for="txtuser">Tên khu vực </label>
                                                            (<span style='color: red; font-size: 11px'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtname" runat="server" name="txtname" Width="250" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Tiêu đề</b><br />
                                                                    Nhập tên khu vực  (VD:Việt Nam, Mỹ, Apple,...)
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key" valign="top">
                                                            <label for="txtphone">Ảnh đại diện</label>
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
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Số điện thoại</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtphone" runat="server" name="txtname" Width="100" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Email</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtemail" runat="server" name="txtname" Width="250" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Địa chỉ</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtaddress" runat="server" name="txtname" Width="400" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="key">
                                                            <label for="listnhom">Thứ tự</label>
                                                            (<span style='color: red; font-size: 11px'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox onkeypress=" return isNumberKey(event)" ID="txtorder" CssClass="inputbox" Width="100" runat="server"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Thứ tự</b><br />
                                                                    Nhập thứ tự hiển thị của khu vực (VD:1,2,3...)
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Mô tả</label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtdesc" Rows="5" Columns="62" TextMode="MultiLine" runat="server" name="txtname" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>
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
                                    <div>
                                        <div class="ad-cates-list-ck">
                                            <p style="font-weight: bold; line-height: 30px;">Chọn danh sách danh mục sản phẩm thuộc nhà cung cấp này</p>
                                            <asp:Literal ID="ltcatesck" runat="server"></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" value="" id="hndId" name="hndId">
                        </asp:Panel>
                        <asp:HiddenField ID="hdicid" runat="server" Visible="false" />
                        <asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdprdicidlist" runat="server" Value="" Visible="false" />
                    </div>
                    <div class="clr"></div>
                </div>
            </div>
        </div>
        <%--//--%>
    </div>
</div>
<script type="text/javascript">
    function checkdata() {
        var name = $("#txtname").val();
        var order = $("#txtorder").val();
        if (name.length == 0) {
            alert("khu vực  không được để trống");
            return false;
        }

        if (IsNumeric(order) == false) {
            alert("Thứ tự phải là kiểu số");
            return false;
        }
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
