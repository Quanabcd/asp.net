<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_products_cate.ascx.cs" Inherits="home_products_default_u_products_cate" %>


<asp:Literal Visible="false" ID="ltdesc" runat="server"></asp:Literal>
<asp:Literal Visible="false" ID="ltnums" runat="server"></asp:Literal>

<div class="collection-list-bg">
    <div class="container">
        <div class="row">
            <aside class="sidebar left left-content col-md-3">

                <asp:PlaceHolder ID="ph_left" runat="server"></asp:PlaceHolder>

            </aside>
            <section class="right-content col-md-9 ">
                <div class="box-heading" style="float: left; width: 100%;">
                    <h1 class="title-head" style="float: left">
                        <asp:Literal ID="ltname" runat="server"></asp:Literal>
                    </h1>
                    <asp:DropDownList ID="ddlsorting" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlsorting_SelectedIndexChanged" Style="float: right; width: 145px; margin-top: 19px;"
                        CssClass="sort-by aside-content filter-group">
                       
                    </asp:DropDownList>

                </div>
                <section class="hotelsc list-blogs blog-main">
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

                                        </div>
                                        <h3 class="blog-item-name" style="text-align: center"><a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a></h3>

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
