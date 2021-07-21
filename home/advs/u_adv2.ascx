<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_adv2.ascx.cs" Inherits="home_advs_u_adv2" %>
<div class="content_row row vc_row wpb_row  alt-style-1 fullwidth border_grid fixed_heights animate-cols border-bottom has-bg-image" style="background-image: url(https://emg.vn/wp-content/uploads/2015/02/pattern.jpg); background-repeat: repeat; background-size: cover; background-attachment: scroll; background-position: right top;">
    <div class="content_row_wrapper  nopadding default">
        <div class="vc_col-sm-12 wpb_column vc_column_container">
            <div class="wpb_wrapper">
                <div class="vc_empty_space" style="height: 15px"><span class="vc_empty_space_inner"></span></div>
                <div class="rt_heading_wrapper style-7">
                    <h2 class="rt_heading  aligncenter heading-font style-7" style="font-size: 35px; color: #dd8d16;"><%=WEB.Common.Getlabel("lb_tvha","THƯ VIỆN HÌNH ẢNH",WEB.Common.Lang )%></h2>
                </div>
                <div class="content_row row vc_row wpb_row vc_inner  global-style">
                    <div class="content_row_wrapper  ">
                        <div class='vc_col-sm-8 wpb_column vc_column_container'>
                            <div class='wpb_wrapper'>
                                <div class='wpb_video_widget wpb_content_element vc_clearfix   vc_video-aspect-ratio-169 vc_video-el-width-100 vc_video-align-left'>
                                    <div class='wpb_wrapper'>

                                        <div class='wpb_video_wrapper'>
                                            <div class='video-container'>
                                                <asp:Literal ID="ltvideo" runat="server"></asp:Literal>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="vc_col-sm-4 wpb_column vc_column_container">
                            <div class="wpb_wrapper">
                                <asp:Literal ID="ltvideoright" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_row row vc_row wpb_row vc_inner  global-style">
                    <div class="content_row_wrapper  ">
                        <asp:Repeater ID="rpcates" runat="server">
                            <ItemTemplate>
                                <div class="vc_col-sm-4 wpb_column vc_column_container">
                                    <div class="wpb_wrapper">
                                        <div class="rt-carousel rt-image-carousel carousel-holder clearfix rt-image-carousel " data-item-width="1" data-nav="false" data-dots="false" data-margin="" data-autoplay="false" data-timeout="5000" data-loop="false" data-tablet-item-width="1" data-mobile-item-width="1">
                                            <div class="owl-carousel">
                                                <asp:Repeater ID="rp_items" runat="server" DataSource='<%#loaditem(Eval("icid").ToString()) %>'>
                                                    <ItemTemplate>
                                                        <div>
                                                            <a id="lightbox-<%#Eval("iid")%>" class="imgeffect zoom lightbox_" data-group="slider-carousel-314811" title="<%#Eval("vtitle")%>" data-title="<%#Eval("vtitle")%>" data-sub-html="#lightbox-<%#Eval("iid")%>-description" data-thumbnail="/uploads/albums/<%#Eval("vimg")%>" data-thumbtooltip="" data-scaleup="" data-href="" data-width="" data-height="" data-flashhaspriority="" data-poster="" data-autoplay="" data-audiotitle="" data-html="" href="/uploads/albums/<%#Eval("vimg")%>">
                                                                <img src="/uploads/albums/<%#Eval("vimg")%>" alt="<%#Eval("vtitle")%>" itemprop="image"></a>
                                                            <div class="lighbox-description hidden" id="lightbox-360537-description">
                                                                <strong><%#Eval("vtitle")%></strong><br>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
