<%@ Control Language="C#" AutoEventWireup="true" CodeFile="topnewfaq.ascx.cs" Inherits="home_faq_topnews_topnewnews" %>
<div class="box hoidap">
    <div class="box-title">
        <h3><%=WEB.Common.Getlabel("lb_cauhoimoi", "Câu hỏi mới", WEB.Common.Lang) %></h3>
    </div>
    <div class="box-content">
        <ul>
            
          <asp:Repeater ID="rpitems" runat="server">
                        <ItemTemplate>
                           <li><a href="/hoi-dap/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                <span class="fa fa-comments"></span><strong><%#Eval("vparam8") %></strong> -
                    <%#Eval("vtitle") %></a> </li>
                        </ItemTemplate>
                    </asp:Repeater>
        </ul>
    </div>
</div>
