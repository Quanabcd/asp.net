<%@ Control Language="C#" AutoEventWireup="true" CodeFile="topnewnews.ascx.cs" Inherits="home_news_topnews_topnewnews" %>
<div id="blog_related" class="sidebar_blogs">
    <h3 title="bài viết mới nhất" class="sidebar_title">Bài viết mới nhất</h3>
    <ul class="blog_wrap">
        <asp:Repeater ID="rpitems" runat="server">
            <ItemTemplate>
                <li class="blog_item clearfix">
                    <div class="blog_item_image text-center">
                        <a href="/<%#Eval("valias") %>">
                            <img src="/uploads/news/thumbs/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>"></a>
                    </div>
                    <div class="blog_item_content">
                        <h4><a href="/<%#Eval("valias") %>"><%#Eval("vtitle") %></a></h4>
                        <time><%#Eval("dupdate","{0:dd/MM/yyyy}") %></time>
                       
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
