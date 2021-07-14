<%@ Control Language="C#" AutoEventWireup="true" Inherits="admin_account_roles, App_Web_u0cwcr4d" %>
<div class="widget">

    <div class="widget-title">

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
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
                                        <table cellspacing="1" width="100%" class="admintable admintablem">
                                            <tbody>


                                                <tr>
                                                    <td width="150" class="key">
                                                        <label for="txtuser">Tên quyền truy cập</label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtname" runat="server" Width="305" CssClass="inputbox"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="key">
                                                        <label for="listnhom">Thứ tự</label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtorder" CssClass="inputbox" Width="50" runat="server"></asp:TextBox>
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
                                                    <td width="150" class="key" valign="top">
                                                        <label for="txtuser">Danh sách quyền</label>
                                                    </td>
                                                    <td>
                                                        <ul>
                                                            <li>
                                                                <input type="checkbox" name="chkrole" id="chkrole" value="1" <%=check("|1|") %> />
                                                                Cấu hình website 
                                         <ul>
                                             <li>
                                                 <input type="checkbox" name="chkrole" id="Checkbox86" value="11" <%=check("|11|") %> />
                                                 Cấu hình chung</li>
                                             <li>
                                                 <input type="checkbox" name="chkrole" id="Checkbox87" value="12" <%=check("|12|") %> />
                                                 Banner & logo - Chân trang</li>
                                             <li>
                                                 <input type="checkbox" name="chkrole" id="Checkbox88" value="13" <%=check("|13|") %> />
                                                 Cấu hình email hệ thống</li>
                                             <li>
                                                 <input type="checkbox" name="chkrole" id="Checkbox89" value="14" <%=check("|14|") %> />
                                                 Cấu hình nội dung email</li>
                                             <li>
                                                 <input type="checkbox" name="chkrole" id="Checkbox91" value="15" <%=check("|15|") %> />
                                                 Cấu hình vận chuyển</li>
                                             <li>
                                                 <input type="checkbox" name="chkrole" id="Checkbox90" value="16" <%=check("|16|") %> />
                                                 Cấu hình thanh toán</li>
                                             <li>
                                                 <input type="checkbox" name="chkrole" id="Checkbox71" value="17" <%=check("|17|") %> />
                                                 Quản lý ngôn ngữ</li>
                                             <li>
                                                 <input type="checkbox" name="chkrole" id="Checkbox107" value="18" <%=check("|18|") %> />
                                                 Quản lý tỉnh thành/quận huyện</li>
                                         </ul>
                                                            </li>
                                                            <li>
                                                                <input type="checkbox" name="chkrole" id="chkrole" value="2" <%=check("|2|") %> />
                                                                Quản lý menu 
                                          <ul>
                                              <li>
                                                  <input type="checkbox" name="chkrole" id="Checkbox92" value="900" <%=check("|900|") %> />
                                                  Quản lý menu chính</li>
                                              <li>
                                                  <input type="checkbox" name="chkrole" id="Checkbox93" value="901" <%=check("|901|") %> />
                                                  Quản lý menu trên cùng</li>
                                              <li>
                                                  <input type="checkbox" name="chkrole" id="Checkbox94" value="902" <%=check("|902|") %> />
                                                  Quản lý menu dưới cùng</li>
                                              <li>
                                                  <input type="checkbox" name="chkrole" id="Checkbox95" value="903" <%=check("|903|") %> />
                                                  Quản lý menu nội dung</li>
                                          </ul>
                                                            </li>
                                                            <li id="liprod" runat="server">
                                                                <input type="checkbox" name="chkrole" id="chkrole" value="20" <%=check("|20|") %> />
                                                                Sản phẩm
                                        <ul>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="chkrole" value="201" <%=check("|201|") %> />
                                                Danh mục sản phẩm
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="2011" <%=check("|2011|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="2012" <%=check("|2012|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="2013" <%=check("|2013|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="chkrole" value="202" <%=check("|202|") %> />
                                                Danh sách sản phẩm
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="2021" <%=check("|2021|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="2022" <%=check("|2022|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="2023" <%=check("|2023|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="chkrole" value="203" <%=check("|203|") %> />
                                                Nhóm sản phẩm
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="2031" <%=check("|2031|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="2032" <%=check("|2032|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="2033" <%=check("|2033|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox1" value="204" <%=check("|204|") %> />
                                                Nhà sản xuất
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox2" value="2041" <%=check("|2041|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox3" value="2042" <%=check("|2042|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox4" value="2043" <%=check("|2043|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox9" value="205" <%=check("|205|") %> />
                                                Thuộc tính sản phẩm
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox10" value="2051" <%=check("|2051|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox11" value="2052" <%=check("|2052|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox12" value="2053" <%=check("|2053|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <%-- <li><input type="checkbox" name="chkrole" id="Checkbox5" value="206" <%=check("|206|") %> /> Phản hồi sản phẩm</li>--%>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox8" value="209" <%=check("|209|") %> />
                                                Quản lý khoảng giá</li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox6" value="207" <%=check("|207|") %> />
                                                Quản lý đơn hàng</li>
                                            <%-- <li><input type="checkbox" name="chkrole" id="Checkbox7" value="208" <%=check("|208|") %> /> Quản lý mã khuyến mại</li>--%>

                                            <%--    <li><input type="checkbox" name="chkrole" id="Checkbox14" value="2002" <%=check("|2002|") %> /> Nhập xuất dữ liệu</li>--%>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox85" value="2003" <%=check("|2003|") %> />
                                                Cấu hình sản phẩm</li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox73" value="2004" <%=check("|2004|") %> />
                                                Thêm nhanh sản phẩm</li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox75" value="2005" <%=check("|2005|") %> />
                                                Phiên bản sản phẩm</li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox76" value="2006" <%=check("|2006|") %> />
                                                Xuất ra excel</li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox77" value="2007" <%=check("|2007|") %> />
                                                Nhập từ excel</li>
                                        </ul>
                                                            </li>
                                                            <li id="linews" runat="server">
                                                                <input type="checkbox" name="chkrole" id="Checkbox15" value="21" <%=check("|21|") %> />
                                                                Tin tức
                                        <ul>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox16" value="211" <%=check("|211|") %> />
                                                Danh mục tin tức
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox17" value="2111" <%=check("|2111|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox18" value="2112" <%=check("|2112|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox19" value="2113" <%=check("|2113|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox5" value="214" <%=check("|214|") %> />
                                                Nhóm tin
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox7" value="2141" <%=check("|2141|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox13" value="2142" <%=check("|2142|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox14" value="2143" <%=check("|2143|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox20" value="212" <%=check("|212|") %> />
                                                Danh sách tin tức
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox21" value="2121" <%=check("|2121|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox22" value="2122" <%=check("|2122|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox23" value="2123" <%=check("|2123|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox84" value="213" <%=check("|213|") %> />
                                                Cấu hình tin tức</li>
                                        </ul>
                                                            </li>
                                                            <li id="liartical" runat="server">
                                                                <input type="checkbox" name="chkrole" id="Checkbox24" value="22" <%=check("|22|") %> />
                                                                Trang nội dung
                                        <ul>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox25" value="221" <%=check("|221|") %> />
                                                Danh mục trang nội dung
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox26" value="2211" <%=check("|2211|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox27" value="2212" <%=check("|2212|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox28" value="2213" <%=check("|2213|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox29" value="222" <%=check("|222|") %> />
                                                Danh sách trang nội dung
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox30" value="2221" <%=check("|2221|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox31" value="2222" <%=check("|2222|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox32" value="2223" <%=check("|2223|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                                            </li>
                                                            <li id="liservice" runat="server">
                                                                <input type="checkbox" name="chkrole" id="Checkbox33" value="23" <%=check("|23|") %> />
                                                                Dịch vụ
                                        <ul>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox34" value="231" <%=check("|231|") %> />
                                                Danh mục dịch vụ
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox35" value="2311" <%=check("|2311|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox36" value="2312" <%=check("|2312|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox37" value="2313" <%=check("|2313|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox38" value="232" <%=check("|232|") %> />
                                                Danh sách dịch vụ
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox39" value="2321" <%=check("|2321|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox40" value="2322" <%=check("|2322|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox41" value="2323" <%=check("|2323|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                                            </li>
                                                            <li id="livideo" runat="server">
                                                                <input type="checkbox" name="chkrole" id="Checkbox42" value="24" <%=check("|24|") %> />
                                                                Thư viện video
                                        <ul>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox43" value="241" <%=check("|241|") %> />
                                                Danh mục video
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox44" value="2411" <%=check("|2411|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox45" value="2412" <%=check("|2412|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox46" value="2413" <%=check("|2413|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox47" value="242" <%=check("|242|") %> />
                                                Danh sách video
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox48" value="2421" <%=check("|2421|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox49" value="2422" <%=check("|2422|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox50" value="2423" <%=check("|2423|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                                            </li>
                                                            <li id="lialbum" runat="server">
                                                                <input type="checkbox" name="chkrole" id="Checkbox51" value="25" <%=check("|25|") %> />
                                                                Thư viện hình
                                        <ul>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox52" value="251" <%=check("|251|") %> />
                                                Danh mục hình
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox53" value="2511" <%=check("|2511|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox54" value="2512" <%=check("|2512|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox55" value="2513" <%=check("|2513|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox56" value="252" <%=check("|252|") %> />
                                                Danh sách hình
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox57" value="2521" <%=check("|2521|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox58" value="2522" <%=check("|2522|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox59" value="2523" <%=check("|2523|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                                            </li>
                                                            <li id="lifile" runat="server">
                                                                <input type="checkbox" name="chkrole" id="Checkbox60" value="26" <%=check("|26|") %> />
                                                                Thư viện tài liệu
                                        <ul>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox61" value="261" <%=check("|261|") %> />
                                                Danh mục tài liệu
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox62" value="2611" <%=check("|2611|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox63" value="2612" <%=check("|2612|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox64" value="2613" <%=check("|2613|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox65" value="262" <%=check("|262|") %> />
                                                Danh sách tài liệu
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox66" value="2621" <%=check("|2621|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox67" value="2622" <%=check("|2622|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox68" value="2623" <%=check("|2623|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                                            </li>
                                                            <li id="liproject" runat="server">
                                                                <input type="checkbox" name="chkrole" id="Checkbox108" value="27" <%=check("|27|") %> />
                                                                Dự án
                                        <ul>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox109" value="271" <%=check("|271|") %> />
                                                Danh mục dự án
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox110" value="2711" <%=check("|2711|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox111" value="2712" <%=check("|2712|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox112" value="2713" <%=check("|2713|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox113" value="272" <%=check("|272|") %> />
                                                Danh sách dự án
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="Checkbox114" value="2721" <%=check("|2721|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox115" value="2722" <%=check("|2722|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="Checkbox116" value="2723" <%=check("|2723|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                                            </li>
                                                            <li id="lifaq" runat="server">
                                                                <input type="checkbox" name="chkrole" id="Checkbox69" value="55" <%=check("|55|") %> />
                                                                Hỏi đáp
                                        <ul>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox70" value="551" <%=check("|551|") %> />
                                                Danh mục hỏi đáp
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox74" value="552" <%=check("|552|") %> />
                                                Danh sách hỏi đáp
                                               
                                            </li>
                                        </ul>
                                                            </li>
                                                            <li id="ltcusre" runat="server">
                                                                <input type="checkbox" name="chkrole" id="Checkbox78" value="28" <%=check("|28|") %> />
                                                                Ý kiến khách hàng
                                        <ul>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox79" value="281" <%=check("|281|") %> />
                                                Danh mục ý kiến khách hàng</li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox83" value="282" <%=check("|282|") %> />
                                                Danh sách ý kiến khách hàng</li>
                                        </ul>
                                                            </li>
                                                            <li id="ltcontact" runat="server">
                                                                <input type="checkbox" name="chkrole" id="Checkbox80" value="29" <%=check("|29|") %> />
                                                                Liên hệ
                                        <ul>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox81" value="291" <%=check("|291|") %> />
                                                Quản lý danh sách liên hệ</li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox82" value="292" <%=check("|292|") %> />
                                                Cấu hình & bản đồ</li>
                                        </ul>
                                                            </li>
                                                            <li id="licomment" runat="server">
                                                                <input type="checkbox" name="chkrole" id="Checkbox169" value="77" <%=check("|77|") %> />
                                                                Comment
                                        <ul>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox170" value="771" <%=check("|771|") %> />
                                                Danh sách Comment
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox174" value="772" <%=check("|772|") %> />
                                                Cấu hình Comment
                                               
                                            </li>
                                        </ul>
                                                            </li>
                                                            <li>
                                                                <input type="checkbox" name="chkrole" id="Checkbox106" value="104" <%=check("|104|") %> />
                                                                Thành viên</li>
                                                            <li>
                                                                <input type="checkbox" name="chkrole" id="Checkbox106" value="72" <%=check("|72|") %> />
                                                                Hotel</li>
                                                            <li>
                                                                <input type="checkbox" name="chkrole" id="Checkbox72" value="105" <%=check("|105|") %> />
                                                                Báo cáo</li>
                                                            <li>
                                                                <input type="checkbox" name="chkrole" id="chkrole" value="100" <%=check("|100|") %> />
                                                                Tích hợp
                                        <ul>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox96" value="1001" <%=check("|1001|") %> />
                                                Tích hợp SEO</li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox97" value="1002" <%=check("|1002|") %> />
                                                Tích hợp Facebook Fanpage</li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox98" value="1003" <%=check("|1003|") %> />
                                                Tích hợp Livechat</li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox99" value="1004" <%=check("|1004|") %> />
                                                Tích hợp Google Analytic</li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="Checkbox100" value="1005" <%=check("|1005|") %> />
                                                Tích hợp mạng xã hội</li>
                                        </ul>
                                                            </li>
                                                            <li>
                                                                <input type="checkbox" name="chkrole" id="chkrole" value="101" <%=check("|101|") %> />
                                                                Tiện ích
                                         <ul>
                                             <li>
                                                 <input type="checkbox" name="chkrole" id="Checkbox101" value="1011" <%=check("|1011|") %> />
                                                 Hỗ trợ trực tuyến</li>
                                             <li>
                                                 <input type="checkbox" name="chkrole" id="Checkbox102" value="1012" <%=check("|1012|") %> />
                                                 Đăng ký email</li>
                                             <li>
                                                 <input type="checkbox" name="chkrole" id="Checkbox103" value="1013" <%=check("|1013|") %> />
                                                 Quản lý quảng cáo</li>
                                             <li>
                                                 <input type="checkbox" name="chkrole" id="Checkbox104" value="1014" <%=check("|1014|") %> />
                                                 Quản lý liên kết</li>
                                             <li>
                                                 <input type="checkbox" name="chkrole" id="Checkbox105" value="1015" <%=check("|1015|") %> />
                                                 Nội dung độc lập</li>
                                         </ul>
                                                            </li>
                                                            <li>
                                                                <input type="checkbox" name="chkrole" id="chkrole" value="102" <%=check("|102|") %> />
                                                                Tài khoản
                                        <ul>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="chkrole" value="1021" <%=check("|1021|") %> />
                                                Quản lý tài khoản
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="10211" <%=check("|10211|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="10212" <%=check("|10212|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="10213" <%=check("|10213|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="chkrole" value="1022" <%=check("|1022|") %> />
                                                Quản lý quyền
                                                <ul>
                                                    <li>
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="10221" <%=check("|10221|") %> />
                                                        Thêm &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="10222" <%=check("|10222|") %> />
                                                        Sửa &nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" name="chkrole" id="chkrole" value="10223" <%=check("|10223|") %> />
                                                        Xóa &nbsp;&nbsp;&nbsp;
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <input type="checkbox" name="chkrole" id="chkrole" value="1023" <%=check("|1023|") %> />
                                                Truy cập log</li>
                                        </ul>
                                                            </li>
                                                        </ul>

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

                                </div>
                            </div>
                            <input type="hidden" value="" id="hndId" name="hndId">
                        </asp:Panel>
                        <asp:HiddenField ID="hdicid" runat="server" Visible="false" />
                        <asp:HiddenField ID="hdroles" runat="server" Visible="false" />
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
<style>
    .admintablem li ul {
        padding-left: 20px;
    }
</style>
