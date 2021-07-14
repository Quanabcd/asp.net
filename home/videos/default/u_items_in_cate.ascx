<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_items_in_cate.ascx.cs" Inherits="home_videos_default_u_items_in_cate" %>
<div class="block-cates">
    <div class="block-cates-head-abum">
        <h2>
            <asp:Literal ID="ltcatename" runat="server"></asp:Literal></h2>
        <div class="title-line">
            <div class="tl-1"></div>
            <div class="tl-2"></div>
            <div class="tl-3"></div>
        </div>
        <div class="block-cates-it-list">
            <asp:Repeater ID="rpitems" runat="server">
                <ItemTemplate>
                    <div class="item-video col-md-3">
                        <div class="item-video-img">
                           <iframe width='100%' height='317' src='http://www.youtube.com/embed/<%#Eval("vparam6") %>'  frameborder='0' allowfullscreen ></iframe>
                        </div>
                        <div class="item-video-tit">
                                <h2><a rel="nofollow" href="https://www.youtube.com/watch?v=<%#Eval("vparam6") %>"><%#Eval("vtitle") %></a></h2>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="clear"></div>
            <p class='d_page'>
                <asp:Literal ID="ltpage" runat="server"></asp:Literal></p>
        </div>
    </div>
