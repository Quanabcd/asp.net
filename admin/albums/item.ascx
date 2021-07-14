<%@ Control Language="C#" AutoEventWireup="true" CodeFile="item.ascx.cs" Inherits="admin_products_item" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<div class="widget-title">
    <p style='color: #16757c;margin: 0;font-size: 11px;padding: 12px 15px 0px 15px;font-style: italic;'><asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></p>
    <h4><i class="icon-reorder-items">
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
                            <asp:LinkButton ID="lnkupdate" runat="server" CssClass="toolbar" OnClick="lnkupdate_Click">
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
                            <asp:DropDownList ID="ddlcatesearch"  Width="110" CssClass="inputbox-top-select" runat="server"></asp:DropDownList>
                            <asp:DropDownList ID="ddlorder" Width="110" CssClass="inputbox-top-select" runat="server">
                                <asp:ListItem Text="SX.Ngày tạo" Value="0"></asp:ListItem>
                                <asp:ListItem Text="SX.Ngày cập nhật" Value="1"></asp:ListItem>
                                <asp:ListItem Text="SX.Tiêu đề" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlordertype" Width="110" CssClass="inputbox-top-select" runat="server">
                                <asp:ListItem Text="Giảm dần" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Tăng dần" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btnsearch" OnClick="btnsearch_Click" runat="server" CssClass="buton-css" Text="Tìm kiếm" />
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
                                    <th width="20" class="title">
                                        <input type="checkbox" id="chkToggle" value="" onclick="selectAll(this)" name="chkToggle">
                                    </th>
                                    <th width="80" class="title">Hình ảnh
                                    </th>

                                    <th class="title">Tiêu đề ảnh
                                    </th>
                                    <th style="width: 70px; text-align: center !important;" class="title">Thứ tự
                                    </th>
                                    <th  width="13%" style="text-align:center" class="title">Ngày tạo
                                    </th>
                                    <th width="10%" style="text-align:center"  class="title">Người tạo
                                    </th>
                                    <th width="80" class="title">Trạng thái
                                <th style="width: 70px;" class="title"></th>
                                    </th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr class="row0">
                                <td align="center">
                                    <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("iid") %>" id='cb_' name='cb_'>
                                </td>
                                <td align="center">
                                    <asp:LinkButton ID="LinkButton3" CommandName="EditDetail" Enabled='<%#checkrole("2522") %>'  CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                        runat="server" ToolTip="Sửa"><%#getpic(Eval("vimg").ToString())%></asp:LinkButton></td>
                                <td>
                                    <asp:LinkButton ID="LinkButton1" CommandName="EditDetail" Enabled='<%#checkrole("2522") %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                        runat="server" ToolTip="Sửa"><%#Eval("vtitle")%></asp:LinkButton>
                                </td>
                                <td align="center"><%#Eval("iparam1") %>
                                </td>
                                <td align="center"><%#Convert.ToDateTime( Eval("dcreatedate")).ToString("dd/MM/yyyy HH:mm") %>
                                </td>
                                <td align="center"><%#Eval("vusercreate") %>
                                </td>
                                <td align="center">
                                    <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")+"|"+Eval("istatus")%>'
                                        runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                </td>
                                <td align="center">
                                    <asp:LinkButton ID="LinkButton4" CommandName="EditDetail" Visible=  '<%#checkrole("2522") %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                        runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                    &nbsp &nbsp
                                            <asp:LinkButton ID="LinkButton5"  Visible=  '<%#checkrole("2523") %>'   OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandName="delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                                runat="server" ToolTip="Xóa"><img src="<%=weburl%>templates/admin/images/icondelete_c.png" /></asp:LinkButton>
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
                <div id="parentHorizontalTabcontent">
                    <ul class="resp-tabs-list hor_1">
                        <li>Thông tin chung</li>
                        <li style="display:none">Cấu hình SEO</li>
                    </ul>
                    <div class="resp-tabs-container hor_1">
                        <div>
                            <p>
                                <table cellspacing="1" class="admintable">
                                    <tbody>
                                        <tr>
                                            <td class="key">
                                                <label for="txtuser">Tiêu đề ảnh (<span class="requirecss">*</span>)</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtnewsname" runat="server" Width="350" CssClass="inputbox"></asp:TextBox>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Tiêu đề ảnh</b><br />
                                                        Nhập tên của ảnh (VD:Samsung Galaxy S)
                                                    </span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="150" class="key">
                                                <label for="txtphone">Thuộc album ảnh (<span class="requirecss">*</span>)</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlcate" runat="server"  Width="350"  CssClass="inputbox"></asp:DropDownList>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Thuộc album ảnh</b><br />
                                                        Lựa chọn danh mục chứa ảnh
                                                    </span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr style="display:none">
                                            <td class="key">
                                                <label for="txtphone">Link ảnh (<span class="requirecss">*</span>)</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtlink"  runat="server" Width="450" CssClass="inputbox"></asp:TextBox>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Link ảnh</b><br />
                                                        Link ảnh 
                                                    </span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr style="display:none">
                                            <td valign="top" class="key">
                                                <label for="txtphone">Mô tả</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtdesc" TextMode="MultiLine" runat="server" Rows="5" Columns="70" CssClass="inputbox"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="key">
                                                <label for="txtphone">Hình ảnh</label>
                                            </td>
                                            <td>
                                                <asp:Literal ID="ltimage" runat="server"></asp:Literal><br />
                                                <asp:FileUpload ID="flupload" CssClass="upload-file" runat="server" />

                                            </td>
                                        </tr>
                                        <tr style="display:none">
                                            <td  valign="top"  class="key">
                                                <script type="text/javascript" src="<%=weburl%>ckeditor/ckeditor.js"></script>
                                                <script type="text/javascript" src="<%=weburl%>ckeditor/adapters/jquery.js"></script>
                                                <script type="text/javascript">
                                                    $(function () {
                                                        CKEDITOR.replace('<%=txtcontent.ClientID %>', {
                                                            filebrowserImageUploadUrl: '<%=weburl%>/upload.ashx',
                                                            //filebrowserImageBrowseUrl: '/_Samples/ckeditor',
                                                            //filebrowserImageUploadUrl: '/_Samples/ckeditor'
                                                        });
                                                    });
                                                </script>
                                                <label for="txtphone">Chi tiết</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtcontent" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="display:none">
                                            <td class="key">
                                                <label for="txtphone">Tag liên quan</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_tag" runat="server" Width="450" CssClass="inputbox"></asp:TextBox>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Tag liên quan</b><br />
                                                        Các từ khóa liên quan đến ảnh cách nhau bởi dấu ;
                                                    </span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr style="display:none">
                                            <td class="key">
                                                <label for="listnhom">Cập nhật ngày</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_updatetime" CssClass="inputbox" runat="server"></asp:TextBox>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span>Cập nhật ngày đăng<br />
                                                        Thay đổi ngày đăng ảnh như mong muốn
                                                    </span>
                                                </a>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="key">
                                                <label for="listnhom">Thứ tự</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtorder" CssClass="inputbox" Width="120" runat="server">1</asp:TextBox>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Thứ tự</b><br />
                                                        Thứ tự hiện thị của sản phẩm trong 1 danh mục
                                                    </span>
                                                </a>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="key">
                                                <label for="txtphone">Tùy chọn</label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chknew" runat="server" Text=" " /> Ảnh mới
                                                &nbsp  &nbsp
							    <asp:CheckBox ID="chkhot" runat="server" Text=" " /> Ảnh nổi bật
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
                       
                        <div style="display:none">

                            <p>
                                <table class="admintable">
                                    <tbody>
                                        <tr>
                                            <td width="150" class="key">
                                                <label for="txttitle">Thẻ tiêu đề trang</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txttitleweb" runat="server" CssClass="inputbox" Width="310"></asp:TextBox>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Tiêu đề trang</b><br />
                                                        Nội dung được hiển thị dưới dạng tiêu đề trong kết quả tìm kiếm và trên trình duyệt của người dùng.
                                                    </span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="150" class="key">
                                                <label for="txtkeyword">Thẻ từ khóa</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtkeyword" runat="server" CssClass="inputbox" TextMode="MultiLine" Rows="5" Height="80" Columns="50"></asp:TextBox>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Thẻ từ khóa</b><br />
                                                        Mô tả các từ khóa chính của website
                                                    </span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="key">
                                                <label for="txtdesciption">Thẻ mô tả</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtmetadesc" runat="server" CssClass="inputbox" TextMode="MultiLine" Height="80" Rows="5" Columns="50"></asp:TextBox>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Thẻ mô tả</b><br />
                                                        Cung cấp một mô tả ngắn của trang. Trong vài trường hợp, mô tả này được sử dụng như một phần của đoạn trích được hiển thị trong kết quả tìm kiếm.
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
                <input type="hidden" value="" id="hndId" name="hndId">
            </asp:Panel>
            <asp:HiddenField ID="hdiid" runat="server" Visible="false" />
            <asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
            <asp:HiddenField ID="hdimg_old" runat="server" Visible="false" />
            <asp:HiddenField ID="hdiviews" runat="server" Visible="false" />
            <asp:HiddenField ID="hdcreatedate" runat="server" Visible="false" />
            <asp:HiddenField ID="hdupdatedate" runat="server" Visible="false" />


        </div>
        <div class="clr"></div>
    </div>
</div>
<%--        <script type="text/javascript" src="<%=weburl%>ckeditor/jquery-1.4.1.min.js"></script>--%>

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
