<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_adv3.ascx.cs" Inherits="home_advs_u_adv3" %>
<div class="product_home_image">
    <asp:Repeater ID="rpitems" runat="server">
        <ItemTemplate>
            <a href="<%#Eval("vparam4") %>">
                <img src="/uploads/qc/<%#Eval("vcontent") %>" alt="<%#Eval("vtitle") %>" />
                <div class="figcaption"></div>
            </a>
        </ItemTemplate>
    </asp:Repeater>
</div>


