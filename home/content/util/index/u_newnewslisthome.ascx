<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_newnewslisthome.ascx.cs" Inherits="home_news_index_u_newnewslisthome" %>
<div class="wp_news_home">
    <div class="div_tieude_home_news">
        <h2>Tin tức</h2>
    </div>
    <div class="div_content_home_news">
        <asp:Repeater ID="rp_items" runat="server">
            <ItemTemplate>
                <div class="items_list">
                    <a href="<%#Getlink(Eval("vparam5").ToString(),Eval("valias").ToString())%>"><%#Eval("vname") %>
                        <img src="<%=weburl%>uploads/news/<%#Eval("vimg")%>" alt="<%#Eval("vname")%>" />
                    </a>
                       <%-- <p class="desc"><%#WEB.Common.Cutleft(Eval("vdesc").ToString(),200) %></p>--%>
                    <div style="clear:both;"></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
