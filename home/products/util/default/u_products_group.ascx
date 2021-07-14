<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_products_group.ascx.cs" Inherits="home_products_default_u_products_cate" %>
<div id="breadcrumbs" class="hidden-xs rld">
    <div class="moduletable">
        <span class="breadcrumbs pathway">111
          
                <li><a href="/" class="pathway"><%=TN.Common.GetLabel("lb_trangchu", "Trang chủ", TN.Common.Lang) %></a></li>
             
         <asp:Literal ID="ltrl" runat="server"></asp:Literal>
        </span>
    </div>
    <div class="clear"></div>
</div>

<h1 class="page-heading product-listing cat-name">
    <asp:Literal ID="ltname" runat="server"></asp:Literal></h1>
<div class="catedesc">
    <asp:Literal ID="ltdesc" runat="server"></asp:Literal>
</div>
<div id="shop" class="product-3 clearfix">
    <div class="row sort-wrapper">
        <div class="col-md-8 col-xs-6">
            <p class="subtext">
                <%=TN.Common.GetLabel("lb_co", "Có", TN.Common.Lang) %> <span class="require_symbol">
                    <asp:Literal ID="ltnums" runat="server"></asp:Literal></span> <%=TN.Common.GetLabel("lb_cosanpham", "sản phẩm", TN.Common.Lang) %>.
            </p>
        </div>
        <div class="browse-tags col-md-4 col-sm-6 col-xs-6">
            <div>
                <span class="custom-dropdown custom-dropdown--white pull-right">
                    <asp:DropDownList ID="ddlsorting" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlsorting_SelectedIndexChanged" CssClass="sort-by custom-dropdown__select custom-dropdown__select--white form-control input-sm">
                        <asp:ListItem Value="-1">Sắp xếp theo</asp:ListItem>
                        <asp:ListItem Value="0">Giá: Tăng dần</asp:ListItem>
                        <asp:ListItem Value="1">Giá: Giảm dần</asp:ListItem>
                        <asp:ListItem Value="2">Tên: A-Z</asp:ListItem>
                        <asp:ListItem Value="3">Tên: Z-A</asp:ListItem>
                        <asp:ListItem Value="4">Sản phẩm mới</asp:ListItem>
                        <asp:ListItem Value="5">Sản phẩm tiêu biểu</asp:ListItem>
                        <asp:ListItem Value="6">Sản phẩm bán chạy</asp:ListItem>
                    </asp:DropDownList>

                </span>
            </div>
        </div>
    </div>
    <div id="grid_pagination" class="product-border product_list grid">
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
                    <asp:Literal ID="ltpage" runat="server"></asp:Literal>
                </p>
            </div>
        </div>
    </div>
</div>
