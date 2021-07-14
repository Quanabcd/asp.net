<%@ Control Language="C#" AutoEventWireup="true" CodeFile="contents.ascx.cs" Inherits="admin_contacts_contents" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<div class="widget">
    <div class="widget-title">
        <%--Header--%>
        
        <div class="widget-title">
            <h4><i class="icon-reorder">
                <asp:Literal ID="lttitle" runat="server"></asp:Literal></i></h4>
            <div class="ui-widget-content ui-corner-top ui-corner-bottom">
                <div id="toolbox">

                    <div style="float: right; margin-right: 10px;" class="toolbox-content">

                        <table class="toolbar">
                            <tr>

                                <td align="center">
                                    <asp:LinkButton ID="update" runat="server" CssClass="toolbar" OnClientClick="return validation()" OnClick="update_Click">
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
        <%--Content-products--%>
        <div class="widget-body">
            <asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal>
            <div style="width: 98% !important;" id="parentHorizontalTab" class="divvalidate">
                <ul class="resp-tabs-list hor_1">
                    <li>Nội dung liên hệ</li>
                    <li>Bản đồ</li>

                </ul>
                <div class="resp-tabs-container hor_1">
                    <div>
                        <p>
                            <table class="admintable">
                                <tbody>
                                   <tr>
                                            <td class="key" valign="top">
                                                
                                                <label for="txtphone">Nội dung trang liên hệ</label>
                                            </td>
                                            <td>
                                                  <CKEditor:CKEditorControl ID="txtcontent" runat="server"  BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                            </td>
                                        </tr>
                                </tbody>
                            </table>
                        </p>
                    </div>
                    <div>
                        <p>
                           <table class="admintable">
                                <tbody>
                                   <tr>
                                            <td class="key">
                                              
                                                <label for="txtphone">Bản đồ</label>
                                            </td>
                                            <td>
                                                <CKEditor:CKEditorControl ID="txt_bando" runat="server"  BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                                              
                                            </td>
                                        </tr>
                                </tbody>
                            </table>
                        </p>
                    </div>
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
</style>