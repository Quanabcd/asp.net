<%@ Control Language="C#" AutoEventWireup="true" CodeFile="features.ascx.cs" Inherits="admin_products_features" %>

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
<div id="element-box">
    <div class="m">
        <div id="adminForm1">
            <asp:Panel ID="pnlist" runat="server">
              
                <asp:Repeater ID="rpitems" runat="server" OnItemCommand="rpitems_ItemCommand">
                    <HeaderTemplate>
                        <table cellpadding="1" summary="" class="adminlist" width="100%">
                            <thead>
                                <tr>
                                    <th width="20" class="title">
                                        <input type="checkbox" id="chkToggle" value="" onclick="selectAll(this)" name="chkToggle">
                                    </th>
                                      <th width="3%" class="title">#</th>
                                    <th class="title">Tiêu đề
                                    </th>
                                    <th style="width: 70px; text-align: center !important;" class="title">Thứ tự
                                    </th>
                                     <th width="10%" style="text-align:center"  class="title">Thao tác
                                                        </th>
                                                        <th  width="140" style="text-align:center" class="title">Thời gian
                                                        </th>
                                    <th width="80px" class="title" align="center">Trạng thái</th>
                                    <th style="width: 80px;" class="title"></th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr class="row0">
                                <td align="center">
                                    <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("icid") %>" id='cb_' name='cb_'>
                                </td>
                               <td align="center"><%#getstt1()%></td>
                                <td>
                                   <%#space(Eval("ilevel").ToString()) %> <asp:LinkButton ID="LinkButton1" Enabled='<%#checkrole("2052") %>' CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                        runat="server" ToolTip="Sửa"><%#Eval("vname")%></asp:LinkButton>
                                </td>
                               
                                <td align="center">
                                    <%#Eval("iorders")%>
                                </td>
                                
                                                       <td><%#getusercreateupdate(Eval("vusercreate").ToString(),Eval("vparam5").ToString()) %>
                                                        </td>
                                                        <td><%#getdatecreateupdate(Eval("dcreatedate").ToString(),Eval("dupdatedate").ToString()) %>
                                                        </td>
                                <td align="center">
                                    <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")+"|"+Eval("istatus")%>'
                                        runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                </td>
                                <td align="center">
                                    <asp:LinkButton ID="LinkButton4" CommandName="EditDetail" Visible='<%#checkrole("2052") %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
                                        runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                    &nbsp; &nbsp;
                                            <asp:LinkButton ID="LinkButton5" CommandName="delete" Visible='<%#checkrole("2053") %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem,"icid")%>'
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
                <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal>
                <div id="parentHorizontalTabcontent">
                    <ul class="resp-tabs-list hor_1">
                        <li>Thông tin thuộc tính</li>
                        <li aria-disabled="true" disabled="disabled" class="li-featurevalue">Giá trị khởi tạo</li>
                        <li>Danh mục sản phẩm</li>
                    </ul>
                    <div class="resp-tabs-container hor_1">
                        <div>
                            <p>
                                <table cellspacing="1" class="admintable" width="100%">
                                    <tbody>
                                        <tr>
                                            <td class="key">
                                                <label for="txtuser">Tên thuộc tính</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtname" runat="server" Width="350" CssClass="inputbox"></asp:TextBox>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Tên thuộc tính</b><br />
                                                        Nhập tên của thuộc tính (VD:Kích thước, màu sắc)
                                                    </span>
                                                </a>
                                            </td>
                                        </tr>
                                         <tr>
                                                        <td width="150" class="key">
                                                            <label for="txtuser">Thuộc</label>  (<span style='color:red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlcate" runat="server" CssClass="inputbox" Width="350"></asp:DropDownList>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Thuộc tính cha</b><br />
                                                                    Chọn thuộc tính cha của thuộc tính hiện tại
                                                                </span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                       <tr style="display:none">
                                            <td class="key">
                                                <label for="txtuser">Kiểu dữ liệu</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddltype" runat="server" CssClass="inputbox" Width="150">
                                                    <asp:ListItem Value="0" Text="Text"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Number"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Select Box"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="Check Box"></asp:ListItem>
                                                </asp:DropDownList>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kiểu dữ liệu thuộc tính</b><br />
                                                        <b>Text:</b> ô để nhập dữ liệu<br />
                                                        <b>Number:</b> Danh sách để chọn (chỉ chọn được 1)<br />
                                                        <b>Select Box:</b> Danh sách để chọn (chỉ chọn được 1)<br />
                                                        <b>Check Box:</b> Danh sách để chọn (chọn được nhiều)<br />
                                                    </span>
                                                </a>
                                            </td>
                                        </tr>
                                         <tr  style="display:none">
                                            <td class="key">
                                                <label for="txtuser">Đơn vị</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtunit" runat="server" ClientIDMode="Static" Enabled="false" Width="80" CssClass="inputbox"></asp:TextBox>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Đơn vị</b><br />
                                                        Nhập đơn vị (VD:Kg, đ,...)
                                                    </span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr  style="display:none">
                                            <td class="key">
                                                <label for="txtuser">Kiểu lọc</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlfilter" runat="server" Width="150" CssClass="inputbox">
                                                    <asp:ListItem Value="0" Text="Lọc theo 1 giá trị"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Lọc theo nhiều giá trị"></asp:ListItem>
                                                </asp:DropDownList>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kiểu lọc thuộc tính</b><br />
                                                    </span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="key">
                                                <label for="listnhom">Thứ tự</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtorder" CssClass="inputbox" Width="120"  runat="server"></asp:TextBox>
                                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Thứ tự</b><br />
                                                        Thứ tự hiện thị (VD: 1,2,3...)
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

                                    </tbody>
                                </table>
                            </p>
                        </div>
                        <div>
                            <div class="ad-feature-value-list">
                                <div class="ad-feature-value-header">
                                    <div class="ad-f-v-h-order">Thứ tự</div>
                                    <div class="ad-f-v-h-value">Giá trị</div>
                                    <div class="ad-f-v-h-tool"><a href="javascript:;" title="Thêm" class="btnaddftrvalue"></a></div>
                                    <div class="clear"></div>
                                </div>
                               
                                <table class="ad-feature-value-l">
                                    <tbody>
                                       <asp:Repeater ID="rpvalues" runat="server">
                                            <ItemTemplate>
                                                 <tr id="tr<%#getstt() %>" class="record">
                                                    <td valign="top"  align="center"><input type="text" class="txtinputftr txtftrorder" value="<%#Eval("iorder") %>" style="width:70px" name="rc-order-<%#icurrent %>" /></td>
                                                    <td valign="top"  align="center"><input type="text" class="txtinputftr txtftrvalue" value="<%#Eval("vvalue") %>" style="width:250px" name="rc-value-<%#icurrent %>" /></td>
                                                    <td  valign="top"  align="center">
                                                        <a href="javascript:void(0)" title="Xóa"  class="lnkftrdetaildelete"   id="rc-delete-<%#icurrent %>"></a>
                                                         <input type="hidden" class="rc-iid" name="rc-iid-<%#icurrent %>" value="<%#Eval("iid") %>" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <tr id="tr<%=n %>" class="record">
                                            <td valign="top"  align="center"><input type="text" class="txtinputftr txtftrorder" value="" style="width:70px" name="rc-order-<%=n %>" /></td>
                                            <td valign="top"  align="center"><input type="text" class="txtinputftr txtftrvalue" value="" style="width:250px" name="rc-value-<%=n %>" /></td>
                                            <td  valign="top"  align="center">
                                                <a href="javascript:void(0)" title="Xóa"  class="lnkftrdetaildelete"   id="rc-delete-<%=n %>"></a>
                                                <input type="hidden" class="rc-iid" name="rc-iid-<%=n %>" value="-1" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <input type="hidden" value="<%=n %>" id="hdnum" name="hdnum" /> 
                                <input type="hidden" value="<%=n %>" id="hdnumtmp" name="hdnumtmp" />
                            </div>
                        </div>
                        <div>
                            <div class="ad-cates-list-ck">
                                <p style="font-weight:bold;line-height:30px;">Chọn danh sách danh mục sản phẩm có thuộc tính này</p>
                                <asp:Literal ID="ltcatesck" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" value="" id="hndId" name="hndId">
            </asp:Panel>
            <asp:HiddenField ID="hdicid" runat="server" Value="-1" Visible="false" />
            <asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
            <asp:HiddenField ID="hdprdicidlist" runat="server" Value="" Visible="false" />
            <asp:HiddenField ID="hdcreatedate" runat="server" Visible="false" />
            <asp:HiddenField ID="hdupdatedate" runat="server" Visible="false" />
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
