<%@ Control Language="C#" AutoEventWireup="true" CodeFile="transport.ascx.cs" Inherits="admin_settings_district" %>
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
                             <div class="row-fluid">
                    <div class="span3">
                        <div style="margin-top: 4px; font-size: 12px; font-style: italic;">
                            <asp:Literal ID="lt_count" runat="server"></asp:Literal>

                        </div>
                    
                    </div>
                    <div class="span9">
                        <div class="pagination pagination-small pagination-right">
                            
                        Khu vực: <asp:DropDownList ID="ddlcatesearch" CssClass="inputbox-top-select" Width="150"  runat="server"></asp:DropDownList>
                          
                            <asp:Button ID="btnsearch" OnClick="btnsearch_Click" runat="server" CssClass="buton-css" Text="Tìm kiếm" />
                        </div>
                        <div style="clear: both;"></div>
                    </div>
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
                                                <th class="title">Tiêu đề
                                                </th>
                                               
                                                 <th width="20%" style="text-align:center" class="title">Hạn mức
                                                </th>
                                                <th width="14%"  style="text-align:center" align="center" class="title">Giá vận chuyển
                                                </th>
                                                <th width="8%" class="title">Trạng thái
                                                </th>
                                                <th width="8%" class="title"></th>
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
                                            
                                             <td align="center"><%#WEB.Common.FomatNumber(Eval("vdesc").ToString()) %> <%#getunit(Eval("iparam2").ToString()) %>  - <%#WEB.Common.FomatNumber(Eval("vimg").ToString()) %> <%#getunit(Eval("iparam2").ToString()) %></td>
                                             <td align="center"><%#WEB.Common.FomatNumber(Eval("vicon").ToString()) %></td>
                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")+"|"+Eval("istatus")%>'
                                                    runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                            </td>
                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton3" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                                    runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                                &nbsp &nbsp
                                            <asp:LinkButton OnClientClick="return confirm('Bạn có muốn xóa không?')" ID="LinkButton4" CommandName="delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
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
                            <div style="width: 98% !important;" id="parentHorizontalTab" class="divvalidate">
                                <ul class="resp-tabs-list hor_1">
                                    <li>Thông tin</li>
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
                                                            <label for="txtuser">Tên tỉ lệ vận chuyển</label> (<span style='color:red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtname" runat="server" name="txtname" Width="364" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Tên tỉ lệ vận chuyển</b><br />
                                                                    Nhập tên tỉ lệ vận chuyển
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Thuộc khu vực</label>  
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlcate" runat="server" CssClass="inputbox"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr runat="server" id="trqh" visible="false">
                                                        <td></td>
                                                        <td>
                                                            <table>
                                                                
                                                            
                                                            <asp:Repeater ID="rpqh" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td><%#Eval("vname") %></td>
                                                                        <td><input type="text" class="inputbox" id="txt_<%#Eval("icid") %>" name="txt_<%#Eval("icid") %>" value="<%#getpricebyqh(Eval("icid").ToString()) %>" /></td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                                </table>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Tiêu chuẩn tính phí</label>  
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddltc" runat="server" CssClass="inputbox">
                                                                <asp:ListItem Text="Dựa trên giá sản phẩm" Value="0"></asp:ListItem>
                                                             <%--   <asp:ListItem Text="Dựa trên khối lượng sản phẩm" Value="1"></asp:ListItem>--%>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Hạn mức</label> (<span style='color:red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtfrom" runat="server" name="txtname" Width="100" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox> <span class="tunit">đ</span>&nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:TextBox ID="txtto" runat="server" name="txtname" Width="100" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox> <span class="tunit">đ</span>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Giá vận chuyển</label> (<span style='color:red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtprice" runat="server" name="txtname" Width="250" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox> đ
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Giá vận chuyển</b><br />
                                                                    Giá vận chuyển phải là số
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
                        <asp:HiddenField ID="hdicid" runat="server" Visible="false" />
                        <asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
                         <asp:HiddenField ID="hdqh" runat="server" Visible="false" />
                         <asp:HiddenField ID="hdpriceqh" runat="server" Visible="false" />
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
        var s = $("#ddltc").val();
        if (s == "0")
            $(".tunit").html("đ");
        else
            $(".tunit").html("g");

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
        $(document).on("change", '#ddltc', function () {
            //s.server.abc($(this).html()); //gọi hàm trong appcode
            var s = $(this).val();
            if (s == "0")
                $(".tunit").html("đ");
            else
                $(".tunit").html("g");
        })

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
</style>
