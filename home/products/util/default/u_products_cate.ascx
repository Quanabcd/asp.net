<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_products_cate.ascx.cs" Inherits="home_products_default_u_products_cate" %>
<asp:Literal Visible="false" ID="ltdesc" runat="server"></asp:Literal>
<asp:Literal Visible="false" ID="ltnums" runat="server"></asp:Literal>
<asp:DropDownList Visible="false" ID="ddlsorting" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlsorting_SelectedIndexChanged" CssClass="sort-by custom-dropdown__select custom-dropdown__select--white form-control input-sm">
    <asp:ListItem Value="-1">Sắp xếp theo</asp:ListItem>
    <asp:ListItem Value="0">Giá: Tăng dần</asp:ListItem>
    <asp:ListItem Value="1">Giá: Giảm dần</asp:ListItem>
    <asp:ListItem Value="2">Tên: A-Z</asp:ListItem>
    <asp:ListItem Value="3">Tên: Z-A</asp:ListItem>
    <asp:ListItem Value="4">Sản phẩm mới</asp:ListItem>
    <asp:ListItem Value="5">Sản phẩm tiêu biểu</asp:ListItem>
    <asp:ListItem Value="6">Sản phẩm bán chạy</asp:ListItem>
</asp:DropDownList>

<main class="main-content" data-role="main">
    <div id="collection" class="m-b-30">
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
        <div class="container m-b-20">
            <div class="row">
                <div class="col-md-12 col-xs-12 col-sm-12">
                    <img src="/templates/home/images/collection_image_default.jpg" alt="Products">
                </div>
            </div>
        </div>
        <div class="products-cates">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-xs-12 col-sm-4">
                        <div class="navbar-collapse collapse" id="filterleft">
                            <asp:PlaceHolder ID="ph_left" runat="server"></asp:PlaceHolder>
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-12 col-xs-12">
                        <h1 title="products" class="page_heading ">
                            <asp:Literal ID="ltname" runat="server"></asp:Literal>
                        </h1>
                        <div class="product_list  clearfix grid">
                            <asp:Repeater ID="rpitems" runat="server">
                                <ItemTemplate>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-6 product-wrapper zoomIn wow" data-wow-delay="50ms" style="visibility: visible; animation-delay: 50ms; animation-name: zoomIn;">
                                        <div class="product-block product-resize m-b-20 fixheight" >
                                            <div class="product-image image-resize">
                                                <a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                                                    <img class="first-img" src="/uploads/products/thumbs/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>">
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
                                                    <a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %>7</a>
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
                        <div class='d_page'>
                            <asp:Literal ID="ltpage" runat="server"></asp:Literal>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>