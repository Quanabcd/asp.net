<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_venders.ascx.cs" Inherits="home_products_util_others_u_venders" %>

<aside class="aside-filter aside-filter-css">
    <div class="aside-title">
        <h2 class="title-head margin-top-0"><span>Khu vực Hotel</span></h2>
    </div>
    <div class="aside-content filter-group">
        <ul>
            <asp:Repeater ID="rpvenders" runat="server">
                <ItemTemplate>
                    <li class="filter-item filter-item--check-box filter-item--green">
                        <a class="mnvenderitem<%#getselected(Eval("valias").ToString()) %>" href="<%#geturl(Eval("valias").ToString()) %>" title="<%#Eval("vname") %>">
                            <span>
                                <label for="filter-sai-gon">
                                  
                                    <i class="fa fa-angle-right"></i>
                                    <%#Eval("vname") %>
                                </label>
                            </span>
                        </a>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</aside>
