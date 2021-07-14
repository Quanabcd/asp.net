<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_productsNEW.ascx.cs" Inherits="home_products_util_index_u_productsNEW" %>
<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
    <div class="product_home">
        <div class="clearfix">
            <div class="section-heading a">
                <h2 title="sản phẩm nổi bật">
                    <span>Sản phẩm nổi bật</span>
                </h2>
            </div>
        </div>
        <div class="clearfix">
            <div class="product-list">
                <asp:Repeater ID="rp_items" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 product-wrapper zoomIn wow" data-wow-delay="50ms">
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
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>
</div>
