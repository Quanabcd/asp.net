<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_top_videos.ascx.cs" Inherits="home_videos_untils_u_top_videos" %>
<div class="block-items">
    <div class="block-items-header">
        <h2><%#WEB.Common.Getlabel("lt_videocategory","Danh mục video",WEB.Common.Lang) %>Video nổi bật</h2>
    </div>
    <div class="block-items-cont">
        <ul class="mn-vd-items-list">
            <asp:Repeater ID="rpitems" runat="server">
                <ItemTemplate>
                    <li>
                         <div class="item-video-top-img">
                            <a href="<%#weburl %>videos/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#getimg(Eval("vimg").ToString(),Eval("vtitle").ToString()) %></a>
                        </div>
                        <div class="item-video-top-tit">
                            <a href="<%#weburl %>videos/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><h2><%#Eval("vtitle") %></h2></a>
                        </div>
                        <div class="item-video-top-tool">
                            <span class="item-video-tool-date"><%#Convert.ToDateTime(Eval("dcreatedate")).ToString("dd/MM") %></span>
                            <span class="item-video-tool-view"><%#Eval("iviews") %></span>
                        </div>
						<div class='clear'></div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</div>