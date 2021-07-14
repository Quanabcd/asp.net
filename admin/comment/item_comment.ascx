<%@ Control Language="C#" AutoEventWireup="true" CodeFile="item_comment.ascx.cs" Inherits="admin_products_item" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
    $(function () {
        $("#txt_updatetime").datepicker({
            dateFormat: 'dd/mm/yy'
        });

    });
</script>
<div class="widget-title">

    <h4><i class="icon-reorder-items">
        <asp:Literal ID="lttitle" runat="server"></asp:Literal></i></h4>
    <div class="ui-corner-top ui-corner-bottom">
        <div id="toolbox">

            <div style="float: right; margin-right: 10px;" class="toolbox-content">

                <table class="toolbar">
                    <tr>

                      

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

                    </div>
                    <div class="span9">
                        <div class="pagination pagination-small pagination-right">
                            <asp:TextBox ID="txtkeysearch" CssClass="inputbox-top" runat="server" Width="150"></asp:TextBox>
                           
                            <asp:DropDownList ID="ddlstatus" runat="server" CssClass="inputbox-top-select" Width="130">
                                <asp:ListItem Value="-1" Text="Tất cả trạng thái"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Hiển thị"></asp:ListItem>
                                <asp:ListItem Value="0" Text="Ẩn"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlorder" Width="110" CssClass="inputbox-top-select" runat="server">
                                <asp:ListItem Text="SX.Ngày tạo" Value="0"></asp:ListItem>
                                <asp:ListItem Text="SX.Họ tên" Value="1"></asp:ListItem>
                                <asp:ListItem Text="SX.Email" Value="2"></asp:ListItem>
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
                                    <th width="20" class="title">
                                        <input type="checkbox" id="chkToggle" value="" onclick="selectAll(this)" name="chkToggle">
                                    </th>
                                   
                                    <th class="title">Nội dung
                                    </th>
                                    <th style="width: 300px; text-align: center !important;" class="title">Thông tin
                                    </th>
                                   
                                    <th width="140" style="text-align: center" class="title">Thời gian
                                    </th>
                                    <th width="80" class="title">Trạng thái  </th>
                                <th style="width: 120px;" class="title"></th>
                                  
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr class="row0">
                                <td align="center">
                                    <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("icmid") %>" id='cb_' name='cb_'>
                                </td>
                               <td>
                                    <asp:LinkButton ID="LinkButton1"  Enabled='<%#checkrole("2122") %>' CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icmid")%>'
                                        runat="server" ToolTip="Sửa"><%#WEB.Common.Cutleft(WEB.Common.RemoveTagHtml( Eval("vcontent").ToString()),200)%></asp:LinkButton>
                                </td>
                                <td align="center">
                                   <%#Eval("vname") %> /  <%#Eval("vemail") %> /  <%#Eval("vpr1") %>
                                </td>
                                <td align="center">
                                    <%#Convert.ToDateTime(Eval("dcreatedate")).ToString("dd/MM/yyyy HH:mm") %>
                                </td>

                                <td align="center">
                                    <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icmid")+"|"+Eval("istatus")%>'
                                        runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                </td>
                                <td align="center">
                                    <asp:LinkButton ID="LinkButton3" CommandName="Answer" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icmid")+"|"+Eval("iid")%>'
                                        runat="server" ToolTip="Trả lời"><img src="<%=weburl%>templates/admin/images/view.png" /></asp:LinkButton>
                                    &nbsp &nbsp
                                    <asp:LinkButton ID="LinkButton4" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icmid")%>'
                                        runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                    &nbsp &nbsp
                                            <asp:LinkButton ID="LinkButton5" CommandName="delete"  OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icmid")%>'
                                                runat="server" ToolTip="Xóa"><img src="<%=weburl%>templates/admin/images/icondelete_c.png" /></asp:LinkButton>

                                </td>
                            </tr>
                        </tbody>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tbody>
                            <tr class="row1">
                                <td align="center">
                                    <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("icmid") %>" id='cb_' name='cb_'>
                                </td>
                               <td>
                                    <asp:LinkButton ID="LinkButton1"  Enabled='<%#checkrole("2122") %>' CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icmid")%>'
                                        runat="server" ToolTip="Sửa"><%#WEB.Common.Cutleft(WEB.Common.RemoveTagHtml( Eval("vcontent").ToString()),200)%></asp:LinkButton>
                                </td>
                                <td align="center">
                                   <%#Eval("vname") %> /  <%#Eval("vemail") %> /  <%#Eval("vpr1") %>
                                </td>
                                <td align="center">
                                    <%#Convert.ToDateTime(Eval("dcreatedate")).ToString("dd/MM/yyyy HH:mm") %>
                                </td>

                                <td align="center">
                                    <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icmid")+"|"+Eval("istatus")%>'
                                        runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                </td>
                                <td align="center">
                                    <asp:LinkButton ID="LinkButton3" CommandName="Answer" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icmid")+"|"+Eval("iid")%>'
                                        runat="server" ToolTip="Trả lời"><img src="<%=weburl%>templates/admin/images/view.png" /></asp:LinkButton>
                                    &nbsp &nbsp
                                    <asp:LinkButton ID="LinkButton4" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icmid")%>'
                                        runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                    &nbsp &nbsp
                                            <asp:LinkButton ID="LinkButton5" CommandName="delete"  OnClientClick="return confirm('Bạn có muốn xóa không?')" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icmid")%>'
                                                runat="server" ToolTip="Xóa"><img src="<%=weburl%>templates/admin/images/icondelete_c.png" /></asp:LinkButton>

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
                <span class='detail_error'>
                    <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></span>
                <div id="parentHorizontalTabcontent">
                    <ul class="resp-tabs-list hor_1">
                        <li>Thông tin chung</li>
                    </ul>
                    <div class="resp-tabs-container hor_1">

                        <div>
                              <div class="row">
                                <div class="col-sm-8">
                                    <div class="block_sp">
                                    
                                        <div class="form-group">
                                            <label class="next-label">Tiêu đề</label> <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Tiêu đề </b><br />
                                                        Nhập tiêu đề, độ dài tiêu đề không quá 150 ký tự
                                                    </span>
                                                </a>
                                             <asp:TextBox ID="txtnewsname" runat="server" Width="100%" CssClass="inputbox" placeholder="Nhập tiêu đề tin"></asp:TextBox>
                                        </div>
                                       
                                         <div class="form-group">
                                            <label class="next-label">Chi tiết</label>
                                             <CKEditor:CKEditorControl ID="txtcontent" Height="400" runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                        </div>
                                        </div>

                                   
                                    </div>

                                   <div class="col-sm-4">
                                           <div class="block_sp">
                                                 <div class="form-group">
                                            <label class="next-label">Link bài viết/sản phẩm được bình luận</label><br />
                                            <asp:Literal ID="ltlink" runat="server"></asp:Literal>
                                        </div>
                                               </div>
                                        <div class="block_sp">
                                           
                                                <div class="form-group">
                                            <label class="next-label">Họ tên</label> <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                </a>
                                             <asp:TextBox ID="txtname" runat="server" Width="100%" CssClass="inputbox" ></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label class="next-label">Email</label> <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                </a>
                                             <asp:TextBox ID="txtemail" runat="server" Width="100%" CssClass="inputbox" ></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label class="next-label">Số điện thoại</label> <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                </a>
                                             <asp:TextBox ID="txtphone" runat="server" Width="100%" CssClass="inputbox" ></asp:TextBox>
                                        </div>
                                        </div>
                                       
                                         <div class="block_sp">
                                        <p class="ttg">Số sao <a href="#" class="tooltip">
                                                                        <img src="../templates/admin/images/help-icon.png" />
                                                                        <span><b>Số sao</b><br />
                                                                            Số sao : 1->5
                                                                        </span>
                                                                    </a></p>
                                                 <div class="form-group">
                                               <asp:TextBox ID="txtorder" onkeypress=" return isNumberKey(event)" CssClass="inputbox" Width="100%" runat="server"></asp:TextBox>
                                                     </div>
                                             </div>
                                       
                                         <div class="block_sp hidden">
                                        <p class="ttg">Ngày đăng <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Cập nhật ngày đăng</b><br />
                                                        Thay đổi ngày đăng tin, ngày phải theo định dạng ngày/tháng/năm (20/10/2014)
                                                    </span>
                                                </a></p>
                                        <div class="form-group">
                                          
                                            <asp:TextBox ID="txt_updatetime" CssClass="inputbox" Width="92"  runat="server"></asp:TextBox>
                                                &nbsp;
                                                lúc &nbsp;<asp:DropDownList ID="ddlhour" runat="server" CssClass="inputbox"></asp:DropDownList>
                                                giờ&nbsp;&nbsp;
                                                <asp:DropDownList ID="ddlminute" runat="server" CssClass="inputbox"></asp:DropDownList>
                                                phút
                                               
                                            
                                        </div>
                                             </div>
                                         <div class="block_sp">
                                        <div class="form-group">
                                               <p class="ttg">Trạng thái</p>
                                              <asp:CheckBox ID="chkstatus" runat="server" Text="" />  Hiển thị<br />
                                        </div>
                                        </div></div>
                                       </div>

                                 
                           
                               

                        </div>
                         


                </div>
                </div>
            </asp:Panel>
            
            <asp:Panel ID="pnanswer" runat="server" Visible="false">
                <span class='detail_error'>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></span>
                <div id="parentHorizontalTabcontent">
                    <ul class="resp-tabs-list hor_1">
                        <li>Thông tin trả lời bình luận</li>
                    </ul>
                    <div class="resp-tabs-container hor_1">

                        <div>
                              <div class="row">
                                <div class="col-sm-8">
                                    <div class="block_sp">
                                    
                                        <div class="form-group">
                                            <label class="next-label">Tiêu đề</label> <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Tiêu đề </b><br />
                                                        Nhập tiêu đề, độ dài tiêu đề không quá 150 ký tự
                                                    </span>
                                                </a>
                                             <asp:TextBox ID="txttitleanswer" runat="server" Width="100%" CssClass="inputbox" placeholder="Nhập tiêu đề tin"></asp:TextBox>
                                        </div>
                                       
                                         <div class="form-group">
                                            <label class="next-label">Chi tiết</label>
                                             <CKEditor:CKEditorControl ID="txtcontentanswer" Height="400" runat="server" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                        </div>
                                        </div>

                                   
                                    </div>

                                   <div class="col-sm-4">
                                           <div class="block_sp">
                                                 <div class="form-group">
                                            <label class="next-label">Link bài viết/sản phẩm được bình luận</label><br />
                                            <asp:Literal ID="ltlinkanswer" runat="server"></asp:Literal>
                                        </div>
                                               </div>
                                        <div class="block_sp">
                                           
                                                <div class="form-group">
                                            <label class="next-label">Họ tên</label> <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                </a>
                                             <asp:TextBox ID="txtnameanswer" runat="server" Width="100%" CssClass="inputbox" ></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label class="next-label">Email</label> <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                </a>
                                             <asp:TextBox ID="txtemailanswer" runat="server" Width="100%" CssClass="inputbox" ></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label class="next-label">Số điện thoại</label> <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                </a>
                                             <asp:TextBox ID="txtphoneanswer" runat="server" Width="100%" CssClass="inputbox" ></asp:TextBox>
                                        </div>
                                        </div>
                                       
                                         <div class="block_sp">
                                        <div class="form-group">
                                               <p class="ttg">Trạng thái</p>
                                              <asp:CheckBox ID="chkstatusanswer" runat="server" Text="" />  Hiển thị<br />
                                        </div>
                                        </div></div>
                                       </div>

                                 
                           
                               

                        </div>
                         


                </div>
                </div>
            </asp:Panel>
            <asp:HiddenField ID="hdiid" runat="server" Visible="false" />
             <asp:HiddenField ID="hditem" runat="server" Visible="false" />
            <asp:HiddenField ID="hdlevel" runat="server" Visible="false" />
              <asp:HiddenField ID="hdnumanswer" runat="server" Visible="false" />
            <asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
            <asp:HiddenField ID="hdimg_old" runat="server" Visible="false" />
            <asp:HiddenField ID="hdiviews" runat="server" Visible="false" />
            <asp:HiddenField ID="hdcreatedate" runat="server" Visible="false" />
            <asp:HiddenField ID="hdupdatedate" runat="server" Visible="false" />
            <asp:HiddenField ID="hdiusercreate" Value="-1" runat="server" Visible="false" />
            <asp:HiddenField ID="hdvusercreate" runat="server" Visible="false" />
            <asp:HiddenField ID="hdtitle" runat="server" Visible="false" />
            <asp:HiddenField ID="hdalias" runat="server" Visible="false" />
            <asp:HiddenField ID="hdname" runat="server" Visible="false" />
            <asp:HiddenField ID="hdgroup" runat="server" Visible="false" />
              <asp:HiddenField ID="hddmql" runat="server" Visible="false" />
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

        $("#txt_updatetime").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy'
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
