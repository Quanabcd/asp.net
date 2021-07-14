<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_files_detail.ascx.cs" Inherits="home_news_default_u_files_detail" %>
<% 
    loaditemother(5);
    %>
<div class="news_detail content_main_block">
 <div class="block-detail-head-dv">
    <span class="block-detail-head-date"><asp:Literal ID="ltdate" runat="server"></asp:Literal></span>
        <span class="block-detail-head-views"><asp:Literal ID="ltviews" runat="server"></asp:Literal></span>
        </div>
     <div class="clear"></div>
<div class="news_content"><asp:Literal ID="ltcontent" runat="server"></asp:Literal></div>
      <div class="downloadb">
        <asp:Literal ID="ltdownload" runat="server"></asp:Literal>
    </div>
    <div class="news-tag hidden">
        Tag: 
        <asp:Literal ID="lttag" runat="server"></asp:Literal>
    </div>
    <div class="fb-comments" data-href="<%=WebURL %><%=Request.Url.AbsolutePath %>" data-width="100%" data-numposts="5" data-colorscheme="light"></div>
<div class='news_other'>
<asp:Repeater ID="rpitems" runat="server">
    <HeaderTemplate>
        <h2 class='n_other'><%=WEB.Common.Getlabel("lb_cactailieukhac", "Các tài liệu khác", WEB.Common.Lang) %></h2>
        <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li>
            <a class='nw_other' href='/thu-vien-tai-lieu/<%#Eval("valias") %>' title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a>
        </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>
</div>
</div>
<div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.0";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<asp:Literal ID="ltrandom" Visible="false" runat="server"></asp:Literal>
