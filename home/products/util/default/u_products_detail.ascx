<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_products_detail.ascx.cs" Inherits="home_products_default_u_products_detail" %>
<%
    loaditemrelative(12);
    loaditemrelative1(12);
%>
<asp:Literal Visible="false" ID="ltsale" runat="server"></asp:Literal>
<asp:Literal Visible="false" ID="txtxuatxu" runat="server"></asp:Literal>
<asp:Literal Visible="false" ID="ltbh" runat="server"></asp:Literal>
<asp:Literal Visible="false" ID="ltlichtrinh" runat="server"></asp:Literal>
<asp:Literal Visible="false" ID="lt_status" runat="server"></asp:Literal>

<main class="main-content" data-role="main">
    <div id="product" class="m-b-30">
        <div id="breadcrumb" class="m-b-20">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ">
                        <ol class="breadcrumb breadcrumb-arrow hidden-sm hidden-xs">
                            <li itemprop="itemListElement"><a href="index.html" target="_self"><span itemprop="name">Trang chủ</span></a><meta itemprop="position" content="1"></li>
                            <asp:Literal ID="ltrl" runat="server"></asp:Literal>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div id="img_product" class="m-b-20">
                        <%-- <span class="sale_label">-31%</span>--%>
                        <asp:Literal ID="ltimg" runat="server"></asp:Literal>
                        <div class="product_thumb">
                            <asp:Literal ID="ltimgthumb" runat="server"></asp:Literal>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <h1 title="bàn trưởng phòng cao cấp ud12" class="name m-b-5">
                        <asp:Literal ID="ltname" runat="server"></asp:Literal>
                    </h1>
                    <div class="product_sku m-b-5">
                        Mã sản phẩm:
                        <asp:Literal ID="ltkey" runat="server"></asp:Literal>
                    </div>
                    <div class="product_price p-b-10">
                        <asp:Literal ID="ltpricenew" runat="server"></asp:Literal>
                    </div>
                    <div class="variants clearfix m-b-10 p-b-10">


                        <div class="clearfix quantity product_quantity product-quantity  m-t-10 m-b-20 ">
                            <button type="button" value="-" class="button btn_minus minus">-</button>
                            <input type="text" min="1" name="quantity" value="1" title="Qty" class="qty quantity text-center" size="4" />
                            <button type="button" value="+" class=" button btn_plus plus">+</button>
                        </div>


                        <div class="clearfix  m-t-10 m-b-20">
                            <label class="label_quantity m-b-5">Mô tả:</label>
                            <div class="description">
                                <asp:Literal ID="ltdesc" runat="server"></asp:Literal>
                            </div>
                        </div>
                        <div class="clearfix">
                            <div class="col-lg-6 col-sm-6 col-xs-6 col-xxs-12 p-l-0 p-r-xxs-0 m-b-10">

                                <asp:Button ID="btnbuy" runat="server" Text=" Thêm vào giỏ " OnClick="btnbuy_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row product_description">
                <div class="col-md-9 col-sm-9 col-xs-12">
                    <div role="tabpanel" class="product-tabs panel-group">
                        <ul class="nav nav-tabs n-pro" role="tablist">
                            <li role="presentation" class="active">
                                <a onclick="owl1();" data-toggle="tab" href="#mota" aria-controls="mota" role="tab">CHI TIẾT SẢN PHẨM</a>
                            </li>
                            <li role="presentation">
                                <a onclick="owl();" data-toggle="tab" href="#comment" aria-controls="comment" role="tab">Bình luận</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="mota" class="tab-pane fade in active">
                                <div data-rte="" class="container-fluid rte product-description-wrapper">
                                    <asp:Literal ID="ltcontent" runat="server"></asp:Literal>
                                </div>
                            </div>
                            <div id="comment" class="tab-pane fade">
                                <div class="fb-comments" data-href="<%=WebURL %><%=Request.Url.AbsolutePath %>" data-width="100%" data-numposts="5" data-colorscheme="light"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-3 col-xs-12">
                    <aside>
                        <div id="product-related" class="widget_block_sidebar">
                            <div class="title_product_related widget_title_sidebar">
                                <h3>Sản phẩm cùng loại
                                </h3>
                            </div>
                            <ul class="list_product_related widget_list_sidebar clearfix product_thumb1">
                                <asp:Repeater ID="RP" runat="server">
                                    <ItemTemplate>
                                        <li class="pro-loop clearfix item_img">
                                            <div class="col-md-5 col-sm-5 col-xs-5">
                                                <a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                                                    <img src="/uploads/products/thumbs/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>" />
                                                </a>
                                            </div>
                                            <div class="col-md-7 col-sm-7 col-xs-7">
                                                <a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                                                    <h3 class="product_related_name"><%#Eval("vtitle") %>
                                                    </h3>
                                                    <p class="product_related_price">
                                                        <span class="product_related_price"><%#WEB.Common.FomatPrice(Eval("fnewprice").ToString()) %></span>
                                                    </p>
                                                </a>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </aside>
                </div>
            </div>
        </div>
    </div>
</main>
<script>
    var quantity = parseInt($('.product-quantity input.qty').val());
    $('.minus').click(function () {
        if (quantity > 0) {
            if (quantity == 1) {
                $('#addtocart').attr('disabled', 'disabled');
            }
            quantity -= 1;
        }
        else {
            quantity = 0;
        }
        $('.product-quantity input.qty').val(quantity);
    });
    $('.plus').click(function () {
        $('.add-to-cart').removeAttr('disabled');
        if (quantity < 100) {
            quantity += 1;
        }
        else {
            quantity = 100;
        }
        $('.product-quantity input.qty').val(quantity)
    });
</script>
