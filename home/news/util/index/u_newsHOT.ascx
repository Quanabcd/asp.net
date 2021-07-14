<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_newsHOT.ascx.cs" Inherits="home_news_util_index_u_newsHOT" %>

<section id="blog_index" class="container m-b-20">
    <div class="row">
        <div class="col-md-12 col-xs-12">
            <div class="section-heading">
                <h2 title="tin tức nổi bật">
                    <span>Tin tức nổi bật</span>
                </h2>
            </div>
        </div>
    </div>
    <div class="row">
        <div id="blog_index_list" class="owl-carousel">
            <asp:Repeater ID="rp_items" runat="server">
                <ItemTemplate>
                    <div class="article_item">
                        <div class="article_img">
                            <a href="chi-tiet-tin-tuc.html">
                                <img src="/uploads/news/thumbs/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>" title="<%#Eval("vtitle") %>" />
                            </a>
                        </div>
                        <div class="article_content clearfix">
                            <div class="title">
                                <h4><a href="chi-tiet-tin-tuc.html" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a></h4>
                            </div>
                            <div class="article_meta">
                                <div class="article_created">
                                    <i class="fa fa-calendar" aria-hidden="true"></i> <time datetime="<%#Eval("dupdate","{0:dd/MM/yyyy}") %>"><%#Eval("dupdate","{0:dd/MM/yyyy}") %></time>
                                </div>
                            </div>
                            <div class="des">
                                <%#Eval("vdesc") %>
                            </div>
                            <a class="readmore" href="/<%#Eval("valias") %>">Đọc tiếp <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
</section>



