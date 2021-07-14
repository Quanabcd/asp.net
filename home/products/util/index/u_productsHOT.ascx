<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_productsHOT.ascx.cs" Inherits="home_products_util_index_u_productsHOT" %>
<div class="clearfix">
    <div class="section-heading">
        <h2 title="sản phẩm bán chạy">
            <span>Sản phẩm bán chạy</span>
        </h2>
    </div>
</div>
<div class="clearfix">
    <div class="product-list">
        <div id="spbc" class="owl-carousel owl-carousel-banner">
            <asp:Repeater ID="rp_items" runat="server">
                <ItemTemplate>
                    <div class="product-block product-resize">
                        <div class="product-image image-resize">
                            <a href="/<%#Eval("valias") %>">
                                <img class="first-img" src="/uploads/products/thumbs/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>" />
                            </a>
                            <div class="product-actions hidden-xs">
                                <div class="btn-add-to-cart">
                                    <a href="/add-to-cart/<%#Eval("valias") %>"><i class="fa fa-shopping-bag" aria-hidden="true"></i></a>
                                </div>
                                <div class="btn_quickview">
                                    <a class="" href="/<%#Eval("valias") %>"><i class="fa fa-eye"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="product-info text-center m-t-xxs-20">
                            <h3 class="pro-name">
                                <a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a>
                            </h3>
                            <div class="pro-prices">
                                <%#getprice(Eval("foldprice").ToString(),Eval("fnewprice").ToString()) %>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
</div>
