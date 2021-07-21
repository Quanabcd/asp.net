<%@ Control Language="C#" AutoEventWireup="true" CodeFile="topnewnews.ascx.cs" Inherits="home_news_topnews_topnewnews" %>
<div class="content_row row vc_row wpb_row  light-style fullwidth border_grid fixed_heights animate-cols border-bottom" style="background-color: #f4f4f4;">

    <div class="content_row_wrapper  align-contents content-align-middle default">
        <div class="vc_col-sm-12 wpb_column vc_column_container" style="background-color: #f4f4f4;">
            <div class="wpb_wrapper">
                <div class="rt_heading_wrapper style-4" style="padding-top: 1px; padding-bottom: 1px;">
                    <h3 class="rt_heading  heading-font style-4" style="font-size: 28px; color: #0a0a0a;"><%=TN.Common.GetLabel("lb_newsnew","TIN TỨC &amp; BLOG",lang) %> </h3>
                </div>
                <div class="vc_empty_space" style="height: 15px"><span class="vc_empty_space_inner"></span></div>
                <div class="content_row row vc_row wpb_row vc_inner  default-style" style="background-color: #f4f4f4;">

                    <div class="content_row_wrapper  ">
                        <div class="vc_col-sm-6 wpb_column vc_column_container">
                            <div class="wpb_wrapper">

                                <div id="slider-blog-carousel-dynamicID-619992" class="rt-carousel rt-image-carousel carousel-holder clearfix blog-carousel" data-item-width="1" data-nav="true" data-dots="true" data-margin="15" data-autoplay="true" data-timeout="5000" data-loop="false" data-tablet-item-width="" data-mobile-item-width="1">
                                    <div class="owl-carousel">
                                        <asp:Repeater ID="rpitems" runat="server">
                                            <ItemTemplate>
                                                <div>
                                                    <div class="item post">
                                                        <article class="loop post-8537 post type-post status-publish format-standard has-post-thumbnail hentry category-tin-tuc tag-act tag-bai-thi-act tag-tuyen-sinh-dai-hoc-2020 tag-tuyen-thang-dai-hoc-viet-nam" id="post-8537">
                                                            <figure class="featured_image">
                                                                <a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                                                                    <img src="/uploads/news/thumbs/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>" class="" /></a>
                                                            </figure>
                                                            <div class="date"><%#Eval("dupdate","{0:dd MMMM,yyyy}") %></div>
                                                            <div class="text">
                                                                <h5 class="clean_heading"><a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>" rel="bookmark"><%#Eval("vtitle") %></a></h5>
                                                                <%#WEB.Common.Cutleft(Eval("vdesc").ToString(),80)%>
                                                            </div>
                                                        </article>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <div id="slider-blog-carousel-dynamicID-619992-dots" class="dots-holder">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="vc_col-sm-6 wpb_column vc_column_container">
                            <div class="wpb_wrapper">
                                <section class="latest_news clearfix style-1">
                                    <asp:Repeater ID="rpnewsright" runat="server">
                                        <ItemTemplate>
                                            <article>
                                                <div class="date">
                                                    <span class="day"><%#Eval("dupdate","{0:dd}") %></span>
                                                    <span class="year"><%#Eval("dupdate","{0:MMMM}") %>&nbsp<%#Eval("dupdate","{0:yyyy}") %></span>
                                                </div>
                                                <div class="text">
                                                    <h5 class="clean_heading"><a class="title" href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>" rel="bookmark"><%#Eval("vtitle") %></a></h5>
                                                    <p><%# WEB.Common.Cutleft(Eval("vdesc").ToString(),80)%></p>
                                                </div>
                                            </article>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
