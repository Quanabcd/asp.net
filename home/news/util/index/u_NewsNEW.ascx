<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_NewsNEW.ascx.cs" Inherits="home_news_util_index_u_NewsNEW" %>


<div class="container newss-page hidden-xs">
    <a href="/tin-tuc"><p class="category"><span>Tin tức</span> </p></a>
    <div class="row">
        <asp:Repeater ID="rp_items" runat="server">
            <ItemTemplate>
                <div class="col-lg-3 col-xs-12">
                    <div class="img newsas">
                        <a href="/<%#Eval("valias") %>">
                        <img src="/uploads/news/<%#Eval("vimg") %>" /></a>
                    </div>
                    <div class="title">
                        <a href="/<%#Eval("valias") %>">
                            <p><%#Eval("vtitle") %></p>
                        </a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
