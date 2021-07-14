<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_list_cates.ascx.cs" Inherits="home_videos_untils_u_list_cates" %>
<div class="block-items">
    <div class="block-items-header">
        <h2><%#WEB.Common.Getlabel("lb_danhmucanh","Danh mục ảnh",WEB.Common.Lang) %></h2>
    </div>
    <div class="block-items-cont">
        <ul class="mn-cates-list">
            <asp:Repeater ID="rpcates" runat="server">
                <ItemTemplate>
                    <li><a href="<%#WEB.Common.Weburl %>thu-vien-anh/<%#Eval("valias") %>" title="<%#Eval("vname") %>"><h2><%#Eval("vname") %></h2></a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</div>