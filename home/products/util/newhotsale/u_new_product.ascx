<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_new_product.ascx.cs" Inherits="home_products_util_newhotsale_u_new_product" %>
<div class="filter_box" id="pricebox">
    <div id="blog_related" class="sidebar_blogs">
        <h3 title="bài viết mới nhất" class="sidebar_title">San phẩm bán chạy</h3>
        <ul class="blog_wrap">
            <asp:Repeater ID="rpitems" runat="server">
                <ItemTemplate>
                    <li class="blog_item clearfix">
                        <div class="blog_item_image text-center">
                            <a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                                <img src="/uploads/products/thumbs/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>"></a>
                        </div>
                        <div class="blog_item_content">
                            <h4><a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a></h4>
                            <div class="pro-price">
                                 <%#getprice(Eval("foldprice").ToString(),Eval("fnewprice").ToString()) %>
                            </div>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</div>

