<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_prices.ascx.cs" Inherits="home_products_util_others_u_price" %>
<div class="block block_shopby">
    <div class="title_block">
        <span>Khoảng giá</span>
    </div>
    <div class="block_content">
        <ul id="ul_catalog_vendor" class="list-block list-unstyled">
            <asp:Repeater ID="rpvenders" runat="server">
            <ItemTemplate>
                <li>
                    <a class="mnpriceitem<%#getselected(Eval("valias").ToString()) %>" href="<%#geturl(Eval("vparam2").ToString(),Eval("vparam3").ToString()) %>" title="<%#Eval("vname") %>"><%#Eval("vname") %></a>
                </li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
    </div>
</div>
