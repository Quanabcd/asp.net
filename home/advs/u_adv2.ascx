<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_adv2.ascx.cs" Inherits="home_advs_u_adv2" %>


<aside class="col-lg-3 col-md-3 hidden-sm hidden-xs">
    <asp:Repeater ID="rpitems" runat="server">
        <ItemTemplate>
            <div class="sidebar_banner">
                <div class="img_banner">
                    <a href="<%#Eval("vparam4") %>">
                        <img src="/uploads/qc/<%#Eval("vcontent") %>" alt="<%#Eval("vtitle") %>" /><div class="figcaption"></div>
                    </a>
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>
</aside>
