<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_vertical_slide_menu.ascx.cs" Inherits="home_news_menu_u_vertical_slide_menu" %>
<div id="categories_block" class="block">
    <div class="title_block">
        <span>
        <%=TN.Common.GetLabel("lb_danhmuctin", "Danh mục tin", TN.Common.Lang) %>    </span>
    </div>
    <div class="block_content">
        <asp:Literal ID="ltmenu" runat="server"></asp:Literal>
    </div>
</div>
