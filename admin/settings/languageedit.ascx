<%@ control language="C#" autoeventwireup="true" inherits="admin_settings_language, App_Web_a0q1ayaz" %>
<div class="widget">

    <div class="widget-title">
        <%--Header--%><asp:Literal ID="lt_mess" runat="server"></asp:Literal>
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
                                    <asp:LinkButton Visible="false" ID="lnkexporttoexcel" runat="server" CssClass="toolbar" OnClick="lnkexporttoexcel_Click">
							<span class="icon-ok-update"></span>
							Xuất ra file excel
                                    </asp:LinkButton>
                                </td>
                                <td align="center">
                                    <asp:LinkButton Visible="false" ID="lnkimport" runat="server" CssClass="toolbar" OnClick="lnkimport_Click">
							<span class="icon-ok-update"></span>
							Nhập từ file excel
                                    </asp:LinkButton>
                                </td>
                                 <td align="center">
                                    <asp:LinkButton ID="lnkdelete" runat="server" CssClass="toolbar" OnClientClick="return confirm('Bạn có muốn xóa dữ liệu không?')"  OnClick="lnkdelete_Click" >
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
                                    <asp:LinkButton ID="lnkclose1" runat="server" CssClass="toolbar" OnClick="lnkclose1_Click">
						<span class="icon-ok-close"></span>
							Đóng
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
                                                <th width="2%" class="title">#</th>
                                                <th class="title"  width="12%">Mã
                                                </th>
                                                 <th  class="title">Nội dung
                                                </th>
                                              
                                                <th width="8%" class="title"></th>
                                            </tr>
                                        </thead>
                                   
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tbody>
                                        <tr class="row0">
                                            <td align="center">
                                                <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("ID") %>" id='cb_' name='cb_'>
                                            </td>
                                           <td align="center"><%#getstt()%></td>
                                             <td><%#Eval("ID")%></td>
                                            <td>
                                              <asp:LinkButton ID="LinkButton1" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>'
                                                    runat="server" ToolTip="Sửa"><%#Eval("VALUE")%></asp:LinkButton>
                                            </td>
                                            
                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton3" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>'
                                                    runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                              
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
                                    <li>Thông tin ngôn ngữ</li>
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
                                        <p>
                                            <span class='detail_error'>
                                                <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></span>
                                            <table cellspacing="1" class="admintable">
                                                <tbody>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Mã</label>
                                                        </td>
                                                        <td>
                                                              <asp:TextBox ID="txt_code" runat="server" Width="150" CssClass="inputbox"></asp:TextBox>
                                                            
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                 <span><b>Mã</b><br />
                                                                    Mã viết liền không dấu
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Nội dung</label>
                                                        </td>
                                                        <td>
                                                          <asp:TextBox ID="txtname" runat="server" name="txtname" Width="600" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Nội dung</b><br />
                                                                    
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

                         <asp:Panel ID="pnimport" runat="server" Visible="false">
                             <asp:Literal ID="ltdetailmsg1" runat="server"></asp:Literal>
                            <div style="width: 98% !important;" id="parentHorizontalTab" class="divvalidate">
                                <ul class="resp-tabs-list hor_1">
                                    <li>Nhập nội dung ngôn ngữ từ file Excel</li>
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
                                        <p>
                                            <span class='detail_error'>
                                                <asp:Literal ID="Literal1" runat="server"></asp:Literal></span>
                                            <table cellspacing="1" class="admintable">
                                                <tbody>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">File excel</label>
                                                        </td>
                                                        <td>
                                                                 <asp:FileUpload CssClass="btn-change-link" ID="flexcel" Width="180" runat="server" /><br />
                                                              <span style="display:block;color:#333;font-size:11px;margin-top:10px;background:#f0f0f0;padding:10px">Thông tin ngôn ngữ phân biệt nhau bởi ID. Nếu cùng ID thì hệ thống sẽ tự cập nhật thông tin từ file excel, nếu ID  trong file excel chưa có thì hệ thống sẽ tự thêm giá trị đó vào.<br /> File excel up lên phải theo cấu trúc của mẫu excel <a target="_blank" href='/uploads/files/temp/templang.xls'>tại đây</a></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser"></label>
                                                        </td>
                                                        <td>
                                                          <asp:Button ID="btnimport" runat="server" CssClass="btn btncs" Text=" Cập nhật " OnClick="btnimport_Click" />
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

                        <asp:HiddenField ID="hdicid" runat="server" Visible="false" />
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
    .btncs{background:#ff6a00;color:#fff;text-transform:uppercase;}
</style>
