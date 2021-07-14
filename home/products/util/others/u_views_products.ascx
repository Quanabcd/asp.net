<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_views_products.ascx.cs" Inherits="home_products_util_others_u_views_products" %>
<div id="products_sider_block" class="block products_block nopadding">
    <div class="title_block-c"><span>SẢN PHẨM ĐÃ XEM</span>
    </div>
    <div class="products-block">
          <div class="product_list_owl">
        <div class="owl-carousel slide owl-theme">
            <asp:Repeater ID="rpitems" runat="server">
                <ItemTemplate>
                 
                                            <div class="product item clearfix">
                                        <div class="product-image">
                                            <a title="<%#Eval("vtitle") %>" class="product_img_link" href="/<%#Eval("valias") %>">
                                                <img data-lazyload="/uploads/products/thumbs/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>" src="/uploads/products/thumbs/<%#Eval("vimg") %>" style="background: none;"></a>
                                           <%#getsale( Eval("foldprice").ToString(),Eval("fnewprice").ToString()) %>
                                        </div>
                                        <div class="product-desc">
                                            <div class="product-title">
                                                <h4><a title="<%#Eval("vtitle") %>" class="product_img_link" href="/<%#Eval("valias") %>"><%#Eval("vtitle") %></a></h4>
                                            <%--    <span><%#Eval("vkey") %></span>--%>
                                            </div>
                                            <div class="product-price">
                                                <%#getprice(Eval("foldprice").ToString(),Eval("fnewprice").ToString()) %>
                                            </div>
                                        </div>
                                        <div class="addtocart_sm hidden-lg hidden-md">
                                            <a title="<%#Eval("vtitle") %>" href="/add-to-cart/<%#Eval("valias") %>" class="product_quick_add col-sm-6 col-sm-push-3 col-xs-12 button noleftmargin norightmargin nopadding">Thêm vào giỏ</a>
                                        </div>
                                    </div>
                                      
                </ItemTemplate>
            </asp:Repeater>
        </div></div>
    </div>
</div>
 <script type="text/javascript">

     $(document).ready(function () {

         $('.product_list_owl .owl-carousel').owlCarousel({
             items: 5,

             navigation: true,
             addClassActive: true,
             afterInit: SetOwlCarouselFirstLast,
             afterAction: SetOwlCarouselFirstLast,
             pagination: false,
             itemsDesktop: [1199, 4],
             itemsDesktopSmall: [979, 3],
             itemsTablet: [768, 3],
             itemsTabletSmall: [480, 2],
             itemsMobile: [360, 2],

             navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
         });
         function SetOwlCarouselFirstLast(el) {
             el.find(".owl-item").removeClass("first");
             el.find(".owl-item.active").first().addClass("first");

             el.find(".owl-item").removeClass("last");
             el.find(".owl-item.active").last().addClass("last");
         };

     });
    </script>
