<%@ Control Language="C#" AutoEventWireup="true" CodeFile="syssetting.ascx.cs"  Inherits="admin_setting_syssetting" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<div class="widget">
    <div class="widget-title">
        <%--Header--%>
        <p style='color: #16757c; margin: 0; font-size: 11px; padding: 12px 15px 0px 15px; font-style: italic;'>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal></p>
        <div class="widget-title">
            <h4><i class="icon-reorder">
                <asp:Literal ID="lttitle" runat="server"></asp:Literal></i></h4>
            <div class="ui-widget-content ui-corner-top ui-corner-bottom">
                <div id="toolbox">

                    <div style="float: right; margin-right: 10px;" class="toolbox-content">

                        <table class="toolbar">
                            <tr>



                                <td align="center">
                                    <asp:LinkButton ID="lnkupdate" runat="server" CssClass="toolbar" OnClick="lnkupdate_Click">
							<span class="icon-ok-update"></span>
							Cập nhật
                                    </asp:LinkButton>
                                </td>

                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>
        <%----//----%>
        <div style="width: 98% !important;" id="parentHorizontalTab" class="divvalidate">
            <ul class="resp-tabs-list hor_1">
                <li>Cấu hình hệ thống</li>
            </ul>
            <div class="resp-tabs-container hor_1">
                <div>
			
						<span class='detail_error'><asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></span>
						<table cellspacing="1" class="admintable">
						<tbody>
						
                            <tr>
							<td width="180" style="width:260px !important" class="key">
                                <p><b>1. Banner</b></p>
								<label for="txttitle">Kích thước ảnh banner</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh banner</b><br />
                                                       Kích thước ảnh banner hiển thị trên trang web
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtbannerwidth" runat="server" Text="200"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtbannerheight" runat="server" Text="160"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
                               <tr>
                                  
							<td width="150" class="key">
                               <br />
                                 <p> <b>2. Danh mục sản phẩm</b></p>
								<label for="txttitle">Kích thước ảnh icon danh mục</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh icon danh mục</b><br />
                                                       Kích thước ảnh icon danh mục
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txticoncatewidth" runat="server" Text="24"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txticoncateheight" runat="server" Text="24"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
					 <tr>
							<td width="150" class="key">
								<label for="txttitle">Kích thước ảnh đại diện danh mục</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh đại diện danh mục</b><br />
                                                       Kích thước ảnh đại diện danh mục
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtimgcatewidth" runat="server" Text="600"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtimgcateheight" runat="server" Text="200"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>

                            <tr>
                                  
							<td width="150" class="key">
                               <br />
                                 <p> <b>3. Dịch vụ</b></p>
								<label for="txttitle">Kích thước ảnh nhỏ</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh icon danh mục</b><br />
                                                       Kích thước ảnh icon danh mục
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtservicewidththumbs" runat="server" Text="300"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtserviceheightthumbs" runat="server" Text="0"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
                             <tr>
                                  
							<td width="150" class="key">
								<label for="txttitle">Kích thước ảnh lớn</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh icon danh mục</b><br />
                                                       Kích thước ảnh icon danh mục
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtservicewidth" runat="server" Text="600"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtserviceheight" runat="server" Text="0"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>

                            
                            <tr>
                                  
							<td width="150" class="key">
                               <br />
                                 <p> <b>4. Trang nội dung</b></p>
								<label for="txttitle">Kích thước ảnh nhỏ</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh icon danh mục</b><br />
                                                       Kích thước ảnh icon danh mục
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtcontentwidththumbs" runat="server" Text="300"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtcontentheightthumbs" runat="server" Text="0"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
                             <tr>
                                  
							<td width="150" class="key">
								<label for="txttitle">Kích thước ảnh lớn</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh icon danh mục</b><br />
                                                       Kích thước ảnh icon danh mục
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtcontentwidth" runat="server" Text="600"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtcontentheight" runat="server" Text="0"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
                            <tr>
                            	<td width="150" class="key">
                               <br />
                                 <p> <b>5. Trang album</b></p>
								<label for="txttitle">Kích thước ảnh nhỏ</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh icon danh mục</b><br />
                                                       Kích thước ảnh icon danh mục
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtalbumwidththumbs" runat="server" Text="300"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtalbumheightthumbs" runat="server" Text="0"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
                             <tr>
                                  
							<td width="150" class="key">
								<label for="txttitle">Kích thước ảnh lớn</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh icon danh mục</b><br />
                                                       Kích thước ảnh icon danh mục
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtalbumwidth" runat="server" Text="600"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtalbumheight" runat="server" Text="0"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
                             <tr>
                            	<td width="150" class="key">
                               <br />
                                 <p> <b>6. Trang video</b></p>
								<label for="txttitle">Kích thước ảnh nhỏ</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh icon danh mục</b><br />
                                                       Kích thước ảnh icon danh mục
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtvideowidththumbs" runat="server" Text="300"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtvideoheightthumbs" runat="server" Text="0"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
                             <tr>
                                  
							<td width="150" class="key">
								<label for="txttitle">Kích thước ảnh lớn</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh icon danh mục</b><br />
                                                       Kích thước ảnh icon danh mục
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtvideowidth" runat="server" Text="600"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtvideoheight" runat="server" Text="0"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
                              <tr>
                            	<td width="150" class="key">
                               <br />
                                 <p> <b>7. Trang dự án</b></p>
								<label for="txttitle">Kích thước ảnh nhỏ</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh icon danh mục</b><br />
                                                       Kích thước ảnh icon danh mục
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtprojectwidththumbs" runat="server" Text="300"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtprojectheightthumbs" runat="server" Text="0"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
                             <tr>
                                  
							<td width="150" class="key">
								<label for="txttitle">Kích thước ảnh lớn</label> 
                                <a href="#" class="tooltip">
                                                    <img src="../templates/admin/images/help-icon.png" />
                                                    <span><b>Kích thước ảnh icon danh mục</b><br />
                                                       Kích thước ảnh icon danh mục
                                                    </span>
                                                </a>
                                <br />
                                <span style="color:#aaa;font-size:11px">( Không nên tự ý thay đổi )</span>
							</td>
							<td>
                                <table>
                                    <tr>
                                        <td>
                                            Rộng<br />
                                            <asp:TextBox ID="txtprojectwidth" runat="server" Text="600"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                        <td></td>
                                        <td>
                                            Cao<br />
                                            <asp:TextBox ID="txtprojectheight" runat="server" Text="0"  CssClass="inputbox" Width="50" ></asp:TextBox> px
                                        </td>
                                    </tr>
                                </table>
								 
                                
							</td>
						</tr>
						</tbody></table>
						</div>
            </div>
        </div>
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
