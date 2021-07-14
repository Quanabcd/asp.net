<%@ Control Language="C#" AutoEventWireup="true" CodeFile="topservices.ascx.cs" Inherits="home_news_topnews_topservices" %>
<div class="aside-item">
    <div class="heading">
        <h2 class="title-head">Dịch vụ nổi bật</h2>
    </div>
    <div class="list-blogs">
        <div class="row">
            <asp:Repeater ID="rpitems" runat="server">
                <ItemTemplate>
                    <article class="blog-item blog-item-list col-md-12">
                        <a href="/<%#Eval("valias") %>" class="panel-box-media">
                            <img src="/uploads/services/thumbs/<%#Eval("vimg") %>" width="70" height="70" alt="<%#Eval("vtitle") %>"></a>
                        <div class="blogs-rights">
                            <h3 class="blog-item-name"><a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a></h3>
                            <div class="post-time"><%#Eval("dupdate","{0:dd/MM/yyyy}") %></div>
                        </div>
                    </article>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</div>

