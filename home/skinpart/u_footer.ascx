<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_footer.ascx.cs" Inherits="home_skinpart_u_footer" %>
<footer id="footer" class="clearfix footer" data-footer="">
    <section class="footer_widgets content_row row clearfix footer border_grid fixed_heights footer_contents fullwidth">
        <div class="content_row_wrapper default clearfix">
            <div id="footer-column-1" class="col col-xs-12 col-sm-4 widgets_holder">
                <div id="text-6" class="footer_widget widget widget_text">
                    <div class="textwidget">
                        <p>
                            <img class="alignnone wp-image-3231 size-full" src="/uploads/banners/<%=WEB.Config.getvaluebykey(WEB.Config.k_webbannermobile,lang) %>" alt="<%=WEB.Config.getvaluebykey(WEB.Config.k_webtitle,lang) %>" width="400" height="160" />
                        </p>
                        <%=WEB.Config.getvaluebykey(WEB.Config.k_webfooter,lang) %>
                    </div>
                </div>
            </div>
            <div id="footer-column-2" class="col col-xs-12 col-sm-4 widgets_holder">
                <div id="text-13" class="footer_widget widget widget_text">
                    <asp:Repeater ID="rphcm" runat="server">
                        <ItemTemplate>

                            <h5><%#Eval("vtitle")%></h5>
                            <div class="textwidget">
                                <div class="with_icons style-1 ">
                                    <%#Eval("vcontent")%>
                                </div>

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div id="footer-column-3" class="col col-xs-12 col-sm-4 widgets_holder">
                <div id="text-14" class="footer_widget widget widget_text">
                    <asp:Repeater ID="rphn" runat="server">
                        <ItemTemplate>

                            <h5><%#Eval("vtitle")%></h5>
                            <div class="textwidget">
                                <div class="with_icons style-1 ">
                                    <%#Eval("vcontent")%>
                                </div>

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <di v id="social_media_icons-1" class="footer_widget widget widget_social_media_icons">
                    <ul class="social_media">
                        <li class="mail"><a class="icon-mail" target="_blank" href="mailto:<%=WEB.Config.getvaluebykey(WEB.Config.k_socialgoogleurl,lang) %>" title="Email" rel="nofollow"><span><%=WEB.Common.Getlabel("lb_contact_us","Contact Us",WEB.Common.Lang )%></span></a></li>
                        <li class="twitter"><a class="icon-twitter" target="_blank" href="<%=WEB.Config.getvaluebykey(WEB.Config.k_socialtwitterurl,lang) %>" title="Twitter" rel="nofollow"><span><%=WEB.Common.Getlabel("lb_fl_tw","Follow us on Twitter",WEB.Common.Lang )%></span></a></li>
                        <li class="facebook"><a class="icon-facebook" target="_self" href="<%=WEB.Config.getvaluebykey(WEB.Config.k_socialfaceurl,lang) %>" title="Facebook" rel="nofollow"><span><%=WEB.Common.Getlabel("lb_fl_fb","Follow us on Facebook",WEB.Common.Lang )%></span></a></li>
                    </ul>
                </di>
                <div id="search-2" class="footer_widget widget widget_search">
                    <h5>Tìm Kiếm</h5>
                    <div class="wp-search-form rt_form">
                        <div id="widget-subscribe-form-result1"></div>
                        <ul>
                            <li>
                                <input type="text" id="email" class='search showtextback' placeholder="search" name="s" />
                                <span onclick="checkemail();" class="icon-search-1"></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="content_row row clearfix footer_contents footer_info_bar fullwidth">
        <div class="content_row_wrapper default clearfix">
            <div class="col col-sm-12">
                <div class="copyright ">© <%=WEB.Common.Getlabel("lb_coppy_right","EMG Education 2019. All rights reserved",WEB.Common.Lang )%> </div>
                <ul id="footer-navigation" class="menu">
                    <asp:Repeater ID="rpitems" runat="server">
                        <ItemTemplate>
                            <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children"><a href="<%#Eval("vdesc")%>" title="<%#Eval("vname")%>"><%#Eval("vname")%></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <li class="menu-item wpml-ls-slot-26 wpml-ls-item wpml-ls-item-vi wpml-ls-current-language wpml-ls-menu-item wpml-ls-first-item menu-item-type-wpml_ls_menu_item menu-item-object-wpml_ls_menu_item menu-item-has-children menu-item-wpml-ls-26-vi"><a href="?Lang=VIE">
                        <img class="wpml-ls-flag" src="https://emg.vn/wp-content/plugins/sitepress-multilingual-cms/res/flags/vi.png" alt="vi" title="Tiếng Việt"></a></li>
                    <li class="menu-item wpml-ls-slot-26 wpml-ls-item wpml-ls-item-vi wpml-ls-current-language wpml-ls-menu-item wpml-ls-first-item menu-item-type-wpml_ls_menu_item menu-item-object-wpml_ls_menu_item menu-item-has-children menu-item-wpml-ls-26-vi"><a href="?Lang=ENG">
                        <img class="wpml-ls-flag" src="https://emg.vn/wp-content/plugins/sitepress-multilingual-cms/res/flags/en.png" alt="vi" title="Tiếng Anh"></a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<script>
    function checkemail() {
        var email = jQuery('#email').val();
        if (validateEmail(email) == false) {
            jQuery("#widget-subscribe-form-result1").html("<%=WEB.Common.Getlabel("lb_ennter_youremail","Vui lòng nhập đúng địa chỉ email",WEB.Common.Lang )%> ");
            jQuery("#widget-subscribe-form-result1").css("color", "red");
            jQuery('#email').focus();
            return;
        }
        jQuery.ajax({
            type: "POST",
            url: "webservices/SearchAirport.asmx/sendemailservices",
            data: "{email1: '" + email + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d == "1") {
                    jQuery("#widget-subscribe-form-result1").html("<%=WEB.Common.Getlabel("lb_suc_email","Đăng ký email thành công",WEB.Common.Lang )%> ");
                    jQuery("#widget-subscribe-form-result1").css("color", "blue");
                }
                else {
                    jQuery("#widget-subscribe-form-result1").html("<%=WEB.Common.Getlabel("lb_enter_full_email","Vui lòng nhập đầy đủ thông tin",WEB.Common.Lang )%> ");
                }
            },
            error: function (data) {
            }
        })
    }
    function validateEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }
</script>
