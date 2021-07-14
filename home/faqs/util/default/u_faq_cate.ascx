<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_faq_cate.ascx.cs" Inherits="home_faq_default_u_news_cate" %>
<div class="block-cates">
    <div class="block-cates-head">
        <h1 class="hdname">
            <asp:Literal ID="ltcatename" runat="server"></asp:Literal></h1>
    </div>
    <div class="block-cates-it-list">
        <div class="box-content list-news">
            <ul>
                <asp:Repeater ID="rpitems" runat="server">
                    <ItemTemplate>
                        <li><a class="ask visible-md visible-lg" href="/hoi-dap/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                            <span class="fa fa-question-circle"></span></a>
                            <div class="ask">
                                <span><%#Convert.ToDateTime(Eval("dupdate").ToString()).ToString("dd/MM/yyyy HH:mm") %></span> <a href="/hoi-dap/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a>
                                <p>  <%#WEB.Common.Cutleft(Eval("vdesc").ToString(),100) %></p>
                            </div>
                            <div class="clear clearfix"></div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <p class='d_page'>
            <asp:Literal ID="ltpage" runat="server"></asp:Literal>
        </p>
    </div>
</div>
