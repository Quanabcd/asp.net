<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_products_search_result.ascx.cs" Inherits="home_products_default_u_products_cate" %>

<asp:Literal Visible="false" ID="ltdesc" runat="server"></asp:Literal>
<asp:Literal Visible="false" ID="Literal1" runat="server"></asp:Literal>
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

<div class="collection-list-bg">
    <div class="container">
        <div class="row">
            <aside class="sidebar left left-content col-md-3">

                <asp:PlaceHolder ID="ph_left" runat="server"></asp:PlaceHolder>

            </aside>
            <section class="right-content col-md-9 ">
                <div class="box-heading">
                    <h1 class="title-head">Tìm kiếm tổng tất cả :  <span class="require_symbol">
                        <asp:Literal ID="ltnums" runat="server"></asp:Literal></span> chuyến tour phù hợp với từ khóa "<asp:Literal ID="ltkey" runat="server"></asp:Literal>" </h1>
                </div>
                <section class="list-blogs blog-main">
                    <div class="row">
                        <asp:Repeater ID="rpitems" runat="server">
                            <ItemTemplate>
                                <div class="col-md-4 col-sm-6 col-xs-6 col-100">
                                    <article class="blog-item">
                                        <div class="blog-item-thumbnail">
                                            <a href="/<%#Eval("valias") %>" class="blog-bga">
                                                <picture>

										<img src="/uploads/products/thumbs/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>" class="img-responsive center-block">
									</picture>
                                            </a>
                                            <div class="articles-date">
                                                <span><%#Eval("dupdate","{0:dd/MM}") %></span>
                                                <%#Eval("dupdate","{0:yyyy}") %>
                                            </div>
                                        </div>
                                        <h3 class="blog-item-name"><a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a></h3>
                                        <p class="blog-item-summary margin-bottom-5"><%#WEB.Common.Cutleft(Eval("vdesc").ToString(),150) %></p>
                                    </article>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="text-xs-right text-center pagging-css">
                                <nav class="text-center">
                                    <div class='d_page'>
                                        <asp:Literal ID="ltpage" runat="server"></asp:Literal>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
        </div>
    </div>
</div>
