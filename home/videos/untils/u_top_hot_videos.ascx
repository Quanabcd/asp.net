<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_top_hot_videos.ascx.cs" Inherits="home_videos_untils_u_top_hot_videos" %>
<div class="tabvideo tableft">
    <div class="bT_sR">
        <div class="bT_sBG">
            <div class="bT_lL">
                <div class="bT_lR">
                    <div class="bT_lBG">
                        <h2>Video</h2>
                    </div>
                </div>
            </div>
            <div class="bT_sC">
                <!---->
            </div>
            <div class="bT_RSS">
                <!--viewall-->
            </div>
            <div style="clear: both"></div>
        </div>
    </div>
    <div class="bC_BG">
        <div class="bC_I">
            <asp:Literal ID="ltvideo" runat="server"></asp:Literal>
            <ul class="list-vd-hot">
            <asp:Repeater ID="rpitems" runat="server">
                <ItemTemplate>
                    <li>
                      
                            <a href="<%#weburl %>videos/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                                <h2><%#Eval("vtitle") %></h2>
                            </a>
                      
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
        </div>
    </div>
    <div class="bB_L"> <div class="bB_R"> <div class="bB_BG"> <!----> </div> </div> </div>
    </div>
