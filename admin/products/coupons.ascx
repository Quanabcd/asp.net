<%@ Control Language="C#" AutoEventWireup="true" CodeFile="coupons.ascx.cs" Inherits="admin_products_coupons" %>
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
                            <asp:TextBox ID="txtkeysearch" CssClass="inputbox-top" runat="server" Width="150"></asp:TextBox>
                            <asp:DropDownList ID="ddlstatus" runat="server" CssClass="inputbox-top-select"  Width="130" >
                                <asp:ListItem Value="-1" Text="Tất cả trạng thái"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Hiển thị"></asp:ListItem>
                                <asp:ListItem Value="0" Text="Ẩn"></asp:ListItem>
                            </asp:DropDownList>
                             <asp:DropDownList ID="ddlorder" Width="110" CssClass="inputbox-top-select" runat="server">
                               <asp:ListItem Text="SX.Ngày tạo" Value="0"></asp:ListItem>
                                <asp:ListItem Text="SX.Ngày cập nhật" Value="1"></asp:ListItem>
                                <asp:ListItem Text="SX.Tiêu đề" Value="2"></asp:ListItem>
                                 <asp:ListItem Text="SX.Thứ tự" Value="3"></asp:ListItem>
                                 <asp:ListItem Text="SX.Lượt xem" Value="4"></asp:ListItem>
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

                                                <th width="3%" class="title">
                                                    <input type="checkbox" id="chkToggle" value="" onclick="selectAll(this)" name="chkToggle">
                                                </th>
                                                <th width="3%" class="title">#</th>
                                                <th  width="15%"class="title">Mã khuyến mại
                                                </th>
                                                 <th style="text-align:center" class="title">Loại
                                                </th>
                                                 <th width="10%" style="text-align:center" class="title">Số lần
                                                </th>
                                                <th width="130"  style="text-align:center" align="center" class="title">Thời gian
                                                </th>
                                                <th width="120"  style="text-align:center" align="center" class="title">Ngày tạo
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
                                                <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("iid") %>" id='cb_' name='cb_'>
                                            </td>
                                           <td align="center"><%#getstt()%></td>

                                            <td>
                                               <asp:LinkButton ID="LinkButton1" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                                    runat="server" ToolTip="Sửa"><%#Eval("vcoupon")%></asp:LinkButton>
                                            </td>
                                         
                                             <td align="center"><%#gettype(Eval("itype").ToString(),Eval("ioptions").ToString(),Eval("fdiscount").ToString(),Eval("fmoneystart").ToString()) %></td>
                                               <td align="center"><%#Eval("inumber") %></td>
                                             <td align="center"><%#getdatecreateupdate(Eval("dstart").ToString(),Eval("dend").ToString()) %>
                                                        </td>
                                  <td align="center"><%#Convert.ToDateTime(Eval("dcreate")).ToString("dd/MM/yyyy HH:mm")  %></td>
                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton2" CommandName="ChangeStatus" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")+"|"+Eval("istatus")%>'
                                                    runat="server" ToolTip="Thay đổi trạng thái"><%#endablestatus(Eval("istatus").ToString()) %></asp:LinkButton>
                                            </td>
                                            <td align="center">
                                                <asp:LinkButton ID="LinkButton3" CommandName="EditDetail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
                                                    runat="server" ToolTip="Sửa"><img src="<%=weburl%>templates/admin/images/iconedit_c.png" /></asp:LinkButton>
                                                &nbsp &nbsp
                                            <asp:LinkButton OnClientClick="return confirm('Bạn có muốn xóa không?')" ID="LinkButton4" CommandName="delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"iid")%>'
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
                            <div style="width: 98% !important;" id="parentHorizontalTab" class="divvalidate">
                                <ul class="resp-tabs-list hor_1">
                                    <li>Thông tin mã khuyến mại</li>
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
                                        <p>
                                            <span class='detail_error'>
                                                <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></span>
                                            <table cellspacing="1" class="admintable">
                                                <tbody>
                                                    <tr>
                                                        <td width="150" class="key" valign="top">
                                                            <label for="txtuser">Chi tiết khuyến mại</label> (<span style='color:red'>*</span>)
                                                        </td>
                                                        <td>
                                                            <b>Mã khuyến mại</b> &nbsp;&nbsp;- &nbsp;&nbsp;<a class="getcoupon" href="#">Tạo mã tự động</a>
                                                            <br />
                                                            <asp:TextBox ID="txtcoupon" runat="server" name="txtname" Width="200" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Mã khuyến mại</b><br />
                                                                    Mã khuyến mãi là 1 chuỗi gồm 10 ký tự bao gồm cả số và chữ (VD: 1D2BDEGEG1)
                                                                </span>
                                                            </a>
                                                            <br /><br />
                                                            <b>Số lần sử dụng của mã khuyến mại</b>
                                                            <br />
                                                            <asp:TextBox ID="txtnumber" runat="server" name="txtname" Width="100" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Số lần</b><br />
                                                                    Số lần được sử dụng của mã khuyến mãi này. VD: 10,100,...
                                                                </span>
                                                            </a>
                                                            <br /><br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="150" class="key" valign="top">
                                                            <label for="txtuser">Loại khuyến mại</label>  
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddltype" runat="server" Width="100"  CssClass="inputbox">
                                                                <asp:ListItem Text="VNĐ" Value="0"></asp:ListItem>
                                                                <asp:ListItem Text="% Giảm" Value="1"></asp:ListItem>
                                                            </asp:DropDownList> &nbsp;&nbsp;&nbsp;Giảm&nbsp;&nbsp;&nbsp;
                                                            <asp:TextBox ID="txtdiscount" runat="server" Width="100"  CssClass="inputbox"></asp:TextBox> &nbsp;<span class="kmunit">đ</span>
                                                             &nbsp;&nbsp;&nbsp;Áp dụng cho&nbsp;&nbsp;&nbsp;
                                                            <asp:DropDownList ID="ddloptions" runat="server"  CssClass="inputbox">
                                                                <asp:ListItem Text="Tất cả đơn hàng" Value="0"></asp:ListItem>
                                                                <asp:ListItem Text="Trị giá đơn hàng từ" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            &nbsp;&nbsp;
                                                            <span class="spanmoney" style="display:none"><asp:TextBox Text="0" ID="txtmoneystart" runat="server" Width="120" CssClass="inputbox"></asp:TextBox> đ</span>
                                                          <br /><br />
                                                        </td>
                                                    </tr>
                                                    
                                                     <tr>
                                                        <td width="150" class="key" valign="top">
                                                            <label for="txtuser">Thời gian áp dụng</label>  
                                                        </td>
                                                        <td>
                                                            <b>Ngày bắt đầu</b>
                                                            <br />
                                                            <asp:TextBox ID="txtstart" runat="server" name="txtname" Width="100" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Ngày bắt đầu</b><br />
                                                                    Ngày bắt đầu khuyến mãi được áp dụng
                                                                </span>
                                                            </a>
                                                            <br /><br />
                                                             <b>Ngày kết thúc</b>
                                                            <br />
                                                            <asp:TextBox ID="txtend" runat="server" name="txtname" Width="100" CssClass="inputbox error" minlength="2" required="" aria-required="true" aria-invalid="true"></asp:TextBox>
                                                            <a href="#" class="tooltip">
                                                                <img src="../templates/admin/images/help-icon.png" />
                                                                <span><b>Ngày kết thúc</b><br />
                                                                    Ngày kết thúc khuyến mãi được áp dụng
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

                                </div>
                            </div>
                            <input type="hidden" value="" id="hndId" name="hndId">
                        </asp:Panel>
                        <asp:HiddenField ID="hdicid" runat="server" Visible="false" />
                        <asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
                         <asp:HiddenField ID="hdiused" runat="server" Visible="false" />
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
        var s = $("#ddltype").val();
        if (s == "0")
            $(".kmunit").html("đ");
        else
            $(".kmunit").html("%");

        var op = $("#ddloptions").val();
        if (op == "1")
            $(".spanmoney").show();
        else
            $(".spanmoney").hide();

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
        $(document).on("change", '#ddltype', function () {
            //s.server.abc($(this).html()); //gọi hàm trong appcode
            var s = $(this).val();
            if (s == "0")
                $(".kmunit").html("đ");
            else
                $(".kmunit").html("%");
        })
        $(document).on("change", '#ddloptions', function () {
            //s.server.abc($(this).html()); //gọi hàm trong appcode
            var s = $(this).val();
            if (s == "1")
                $(".spanmoney").show();
            else
                $(".spanmoney").hide();
        })

        $(document).on("click", '.getcoupon', function () {
            var id = $(this).val();
            $.ajax({
                type: "POST",
                url: "/webservices/webservice_common.asmx/GetCoupon",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    
                    $("#txtcoupon").val(data.d);
                
                },
                error: function (data) {
                }
            })
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
