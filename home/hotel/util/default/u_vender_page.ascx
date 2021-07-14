<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_vender_page.ascx.cs" Inherits="home_products_util_default_u_vender_page" %>
<h1 class="page-heading product-listing cat-name">
    <asp:Literal ID="ltname" runat="server"></asp:Literal></h1>
<div class="catedesc">
    <asp:Literal ID="ltdesc" runat="server"></asp:Literal>
</div>
<div id="shop" class="product-3 clearfix">
    <div class="row sort-wrapper">
        <div class="col-md-6">
            <p class="subtext">
                Có <span class="require_symbol">
                    <asp:Literal ID="ltnums" runat="server"></asp:Literal></span> sản phẩm.
            </p>
        </div>
        <div class="browse-tags col-md-6 col-sm-12 col-xs-12">
            <div class="col-md-6 col-sm-8 col-xs-4 text-right col-xs-push-1 col-sm-push-0">
                <span>Sắp xếp theo:</span>
            </div>
            <div class="col-md-6 col-sm-4 col-xs-7 col-xs-push-1 col-sm-push-0">
                <span class="custom-dropdown custom-dropdown--white pull-right">
                    <asp:DropDownList ID="ddlsorting" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlsorting_SelectedIndexChanged" CssClass="sort-by custom-dropdown__select custom-dropdown__select--white form-control input-sm">
                        <asp:ListItem Value="-1">Sắp xếp theo</asp:ListItem>
                        <asp:ListItem Value="0">Giá: Tăng dần</asp:ListItem>
                        <asp:ListItem Value="1">Giá: Giảm dần</asp:ListItem>
                        <asp:ListItem Value="2">Tên: A-Z</asp:ListItem>
                        <asp:ListItem Value="3">Tên: Z-A</asp:ListItem>
                    </asp:DropDownList>

                </span>
            </div>
        </div>
    </div>
    <div id="grid_pagination">
        <div class="product_wrapper">
            <asp:Repeater ID="rpitems" runat="server">
                <ItemTemplate>
                                <div class="product_block col-md-25 col-xs-6 col-sm-4">
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
                    </div>

                                           
                </ItemTemplate>
            </asp:Repeater>
            <div class="pagination_wrapper">
                <p class='d_page'>
                        <asp:Literal ID="ltpage" runat="server"></asp:Literal></p>
            </div>
        </div>
    </div>
    </div>