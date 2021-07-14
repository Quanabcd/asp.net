<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_supportonline_top.ascx.cs" Inherits="home_untilities_supportonline_u_supportonline_top" %>
<div class="filter_box" id="colorbox">
    <div class="filter_box" id="vlbox">
        <div id="blog_related" class="sidebar_blogs">
            <h3 title="bài viết mới nhất" class="sidebar_title">Hỗ trợ trực tuyến</h3>
            <ul class="blog_wrap">
                <asp:Repeater ID="rp_items" runat="server">
                    <ItemTemplate>
                        <li class="blog_item clearfix">
                            <div class="blog_item_image text-center" style="width: 30%;">
                                <a>
                                    <img src="/uploads/supports/<%#Eval("vparam3") %>" alt="<%#Eval("vtitle") %>"></a>
                            </div>
                            <div class="blog_item_content">
                                <h4><a><%#Eval("vtitle") %></a></h4>
                                <time><i class="fa fa-phone">&nbsp <%#Eval("vdesc") %></i></time>
                                <span><%#Eval("vcontent") %></span>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
</div>

