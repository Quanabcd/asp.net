<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_mulinfo.ascx.cs" Inherits="admin_products_u_mulinfo" %>

<div class="widget-title">
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

                        <td align="center" class="hidden">
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
<div id="element-box">
    <div class="m">
        <div id="adminForm1">
            <asp:Panel ID="pnlist" runat="server">
                
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

                                    <th class="title">Sản phẩm
                                    </th>
                                    
                                    
                                    <th style="width: 80px;" class="title">Lượt xem
                                    </th>
                                   
                                                        <th width="90" style="text-align:center"  class="title">Thao tác
                                                        </th>
                                      <th  width="140" style="text-align:center" class="title">Thời gian
                                                        </th>
                                    <th width="80" style="text-align:center" class="title">Trạng thái
                                <th style="width: 100px;" class="title"></th>
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
                                   <%#getpic(Eval("vimg").ToString())%></td>
                                <td>
                                    <asp:LinkButton ID="LinkButton1" Enabled='<%#checkrole("2022") %>' CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                        runat="server" ToolTip="Sửa"><%#Eval("vtitle")%>
                                    </asp:LinkButton>
                                    <p>Mã SP: <%#Eval("vkey") %></p>
                                </td>
                              
                              
                               
                              
                                <td align="center">
                                    <%#Eval("iviews") %>
                                </td>
                              
                                                        </td>
                                                       <td><%#getusercreateupdate(Eval("vusercreate").ToString(),Eval("vparam10").ToString()) %>
                                                        </td>
                                     <td><%#getdatecreateupdate(Eval("dcreatedate").ToString(),Eval("dupdate").ToString()) %>
                                                        </td>
                                <td align="center">
                                    <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")+"|"+Eval("istatus")%>'
                                        runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                </td>
                                <td align="center">
                                     <a href="<%#weburl %><%#Eval("valias") %>" target="_blank" title="Xem chi tiết"><img src="<%=weburl%>templates/admin/images/view.png" /></a>&nbsp; &nbsp;
                                    
                                     
                                  <br />
                                    
                                  <a href="/admin/?mod=prod&c=thongso&id=<%#Eval("iid") %>"  <%#checkrolecss("2022") %> title="Chỉnh sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></a>&nbsp; &nbsp;
                                          
                                   
                                </td>
                            </tr>
                        </tbody>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                          <tbody>
                            <tr class="row1">
                                <td align="center">
                                    <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("iid") %>" id='cb_' name='cb_'>
                                </td>
                                <td align="center">
                                   <%#getpic(Eval("vimg").ToString())%></td>
                                <td>
                                    <asp:LinkButton ID="LinkButton1" Enabled='<%#checkrole("2022") %>' CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                        runat="server" ToolTip="Sửa"><%#Eval("vtitle")%></asp:LinkButton>
                                     <p>Mã SP: <%#Eval("vkey") %></p>
                                </td>
                               
                                
                               
                              
                                 <td align="center">
                                    <%#Eval("iviews") %>
                                </td>
                                
                                                        </td>
                                                       <td><%#getusercreateupdate(Eval("vusercreate").ToString(),Eval("vparam10").ToString()) %>
                                                        </td>
                                   <td><%#getdatecreateupdate(Eval("dcreatedate").ToString(),Eval("dupdate").ToString()) %>
                                                        </td>
                                <td align="center">
                                    <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")+"|"+Eval("istatus")%>'
                                        runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                </td>
                                <td align="center">
                                   
                                      <a href="<%#weburl %><%#Eval("valias") %>" target="_blank" title="Xem chi tiết"><img src="<%=weburl%>templates/admin/images/view.png" /></a>&nbsp; &nbsp;
                                    
                                     
                                  <br />
                                    
                                  <a href="/admin/?mod=prod&c=thongso&id=<%#Eval("iid") %>"  <%#checkrolecss("2022") %> title="Chỉnh sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></a>&nbsp; &nbsp;
                                          
                                   
                                </td>
                            </tr>
                        </tbody>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <div class="page-items">
                    <asp:Literal ID="lt_pagebotom" runat="server"></asp:Literal>
                </div>
            </asp:Panel>
            <asp:Panel ID="pndetail" runat="server" Visible="false">
                <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal>
                <div id="parentHorizontalTabcontent">
                    <ul class="resp-tabs-list hor_1">
                        <li>Kích thước</li>
                        <li>Động cơ</li>
                        <li>Hệ thống truyền động</li>
                        <li>Khối lượng</li>
                        <li>Hệ thống treo</li>
                        <li>Hộp số</li>
                        <li>Vành & Lốp xe</li>
                        <li>Phanh</li>
                        <li>Đặc tính vận hành</li>
                        <li>Các trang bị khác</li>
                        <li>Ngoại thất</li>
                    </ul>
                    <div class="resp-tabs-container hor_1">
                        <div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Vết bánh xe trước/sau</label>
                                            <asp:TextBox ID="TextBox1" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">D x R x C (mm)</label>
                                            <asp:TextBox ID="TextBox2" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Chiều dài cơ sở (mm)</label>
                                            <asp:TextBox ID="TextBox3" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Khoảng sáng gầm xe (mm)</label>
                                            <asp:TextBox ID="TextBox4" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Bán kính quay vòng tối thiểu (m)</label>
                                            <asp:TextBox ID="TextBox5" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Đường kính piston, hành trình xi lanh</label>
                                            <asp:TextBox ID="TextBox6" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Khoảng nhô trước/sau</label>
                                            <asp:TextBox ID="TextBox7" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Góc nâng tối đa</label>
                                            <asp:TextBox ID="TextBox8" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Kích thước lòng thùng (D X R X C)</label>
                                            <asp:TextBox ID="TextBox9" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Trọng lượng không tải (kg)</label>
                                            <asp:TextBox ID="TextBox10" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Trọng lượng toàn tải (kg)</label>
                                            <asp:TextBox ID="TextBox11" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Số chỗ ngồi</label>
                                            <asp:TextBox ID="TextBox12" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Tỷ số nén</label>
                                            <asp:TextBox ID="TextBox13" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Mã động cơ</label>
                                            <asp:TextBox ID="TextBox14" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Động cơ</label>
                                            <asp:TextBox ID="TextBox15" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Loại động cơ</label>
                                            <asp:TextBox ID="TextBox16" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Dung tích công tác (cc)</label>
                                            <asp:TextBox ID="TextBox17" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Công suất cực đại (Ps)</label>
                                            <asp:TextBox ID="TextBox18" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Momen xoắn cực đại (Kgm)</label>
                                            <asp:TextBox ID="TextBox19" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Dung tích thùng nhiên liệu (L)</label>
                                            <asp:TextBox ID="TextBox20" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Công thức bánh xe</label>
                                            <asp:TextBox ID="TextBox21" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Đường kính piston, hành trình xi lanh (mm)</label>
                                            <asp:TextBox ID="TextBox22" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Model</label>
                                            <asp:TextBox ID="TextBox23" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Hệ thống truyền động</label>
                                            <asp:TextBox ID="TextBox24" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Khối lượng bản thân (kg)</label>
                                            <asp:TextBox ID="TextBox25" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Khối lượng tối đa</label>
                                            <asp:TextBox ID="TextBox26" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Trọng lượng không tải</label>
                                            <asp:TextBox ID="TextBox27" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Không tải phân bổ cầu trước</label>
                                            <asp:TextBox ID="TextBox28" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Không tải phân bổ cầu sau</label>
                                            <asp:TextBox ID="TextBox29" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Trọng lượng toàn tải</label>
                                            <asp:TextBox ID="TextBox30" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Toàn tải phân bổ cầu trước</label>
                                            <asp:TextBox ID="TextBox31" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Toàn tải phân bổ cầu sau</label>
                                            <asp:TextBox ID="TextBox32" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Trước</label>
                                            <asp:TextBox ID="TextBox33" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Sau</label>
                                            <asp:TextBox ID="TextBox34" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Hộp số</label>
                                            <asp:TextBox ID="TextBox35" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Loại hộp số</label>
                                            <asp:TextBox ID="TextBox36" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Kiểu lốp xe</label>
                                            <asp:TextBox ID="TextBox37" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Cỡ lốp xe (trước/sau)</label>
                                            <asp:TextBox ID="TextBox38" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Kích thước lốp</label>
                                            <asp:TextBox ID="TextBox39" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Cỡ vành (trước/sau)</label>
                                            <asp:TextBox ID="TextBox40" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Loại vành</label>
                                            <asp:TextBox ID="TextBox41" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Hệ thống phanh hỗ trợ</label>
                                            <asp:TextBox ID="TextBox42" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Hệ thống phanh chính</label>
                                            <asp:TextBox ID="TextBox43" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Trước</label>
                                            <asp:TextBox ID="TextBox44" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Sau</label>
                                            <asp:TextBox ID="TextBox45" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Khả năng vượt dốc (tanθ)</label>
                                            <asp:TextBox ID="TextBox46" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Vận tốc tối đa (km/h)</label>
                                            <asp:TextBox ID="TextBox47" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Bán kính vòng quay tối thiểu (m)</label>
                                            <asp:TextBox ID="TextBox48" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="row">
                                <div class="col-lg-6">

                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Điều hòa nhiệt độ</label>
                                            <asp:TextBox ID="TextBox49" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Ghế hành khách</label>
                                            <asp:TextBox ID="TextBox50" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Tay lái trợ lực</label>
                                            <asp:TextBox ID="TextBox51" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Vô lăng gật gù</label>
                                            <asp:TextBox ID="TextBox52" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Cửa sổ điều chỉnh điện</label>
                                            <asp:TextBox ID="TextBox53" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Radio + AUX +USB</label>
                                            <asp:TextBox ID="TextBox54" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Đèn sương mù trước</label>
                                            <asp:TextBox ID="TextBox55" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Van điều hòa lực phanh</label>
                                            <asp:TextBox ID="TextBox56" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Hộp để dụng cụ</label>
                                            <asp:TextBox ID="TextBox57" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Đồng hồ tốc độ</label>
                                            <asp:TextBox ID="TextBox58" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Hốc để kính</label>
                                            <asp:TextBox ID="TextBox59" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Hỗ trợ tựa lưng</label>
                                            <asp:TextBox ID="TextBox60" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Vô lăng điều chỉnh lên xuống</label>
                                            <asp:TextBox ID="TextBox61" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Đèn trước</label>
                                            <asp:TextBox ID="TextBox62" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Đèn sương mù phía trước</label>
                                            <asp:TextBox ID="TextBox63" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Cản trước tích hợp bậc đỡ chân</label>
                                            <asp:TextBox ID="TextBox64" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Gương chiếu hậu ngoài có sấy tích hợp đèn báo rẽ dạng LED</label>
                                            <asp:TextBox ID="TextBox65" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Bậc hành khách lên xuống chỉnh điện</label>
                                            <asp:TextBox ID="TextBox66" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="block_sp">
                                        <div class="form-group">
                                            <label class="next-label">Vành đúc 16"</label>
                                            <asp:TextBox ID="TextBox67" runat="server" Width="100%" CssClass="inputbox" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
            <asp:HiddenField ID="hdfeature" runat="server" />
            <asp:HiddenField ID="hdtitle" runat="server" Visible="false" />
            <asp:HiddenField ID="hdalias" runat="server" Visible="false" />
            <asp:HiddenField ID="hdname" runat="server" Visible="false" />
            <asp:HiddenField ID="hddmql" runat="server" Visible="false" />
            <asp:HiddenField ID="hdbrochure" runat="server" Visible="false" />
            <asp:HiddenField ID="hdgroup" runat="server" Visible="false" />
            <asp:HiddenField ID="hditemp" runat="server" Value="-1" Visible="false" />
        </div>
        <div class="clr"></div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("input[type='checkbox']").change(function () {
            $(this).siblings('ul')
                .find("input[type='checkbox']")
                .prop('checked', this.checked);
        });
    });
    $(document).ready(function () {
        $(".li-featurevalue").hide();
        if ($("#ddltype").val() != "0")
            $(".li-featurevalue").show();
        $(document).on("change", '#ddltype', function () {
            //s.server.abc($(this).html()); //gọi hàm trong appcode
            var v = $(this).val();
            if (v != "0") {
                $(".li-featurevalue").show();
            }
            else {
                $(".li-featurevalue").hide();
            }
            if (v == "1") {
                $("#txtunit").removeAttr("disabled");
            }
            else {
                $("#txtunit").attr("disabled", "disabled");
            }
        })

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
    });

    $(document).on("click", '.btnaddftrvalue', function () {
        idpr = $('.ad-feature-value-l');
        tr = idpr.children('tbody').children('tr:last');
        step = tr.clone();
        stt = parseInt($("#hdnum").val()) + 1;
        step.attr("id", "tr" + stt);
        step.children('td').children('input.txtftrorder').attr('name', 'rc-order-' + stt);
        step.children('td').children('input.txtftrvalue').attr('name', 'rc-value-' + stt);
        step.children('td').children('.rc-iid').attr('name', 'rc-iid-' + stt);
        step.children('td').children('.rc-iid').attr('value', -1);
        $("#hdnum").val(stt);
        $("#hdnumtmp").val(stt);
        step.children('td').children('.lnkftrdetaildelete').attr('id', 'rc-delete-' + stt);
        step.appendTo(idpr);
        //gettotal();
    })
    $(document).on("click", '.lnkftrdetaildelete', function () {
        var num = $("#hdnumtmp").val();
        if (num <= 1) {
            alert("Bạn không được xóa");
            return;
        }
        if (confirm("Bạn có muốn xóa không?")) {
            var id = $(this).parents('.record').attr('id');
            var stt = parseInt(num) - 1;
            $("#hdnumtmp").val(stt);
            $("#" + id).remove();
        }
    })
    function checkdata() {
        var name = $("#txtname").val();
        var order = $("#txtorder").val();
        if (name.length == 0) {
            alert("Tên thuộc tính không được để trống");
            return false;
        }

        if (IsNumeric(order) == false) {
            alert("Thứ tự phải là kiểu số");
            return false;
        }
        return true;
    }
</script>