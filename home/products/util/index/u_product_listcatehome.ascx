<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_product_listcatehome.ascx.cs" Inherits="home_products_index_u_product_listcatehome1" %>

<asp:Repeater ID="rpcate" runat="server">
    <ItemTemplate>
      
                <div class="style_<%#stt() %> index_col_wrap">
                    <div class="index_col_title ">
                        <div class="collection-name">
                            <h2>
                                <a title="<%#Eval("vname") %>" href='/<%#Eval("valias") %>'><%#Eval("vname") %></a>
                            </h2>
                            <div class="visible-sm catelogry-xs">
                                Xem thêm  <i class="fa fa-caret-down" aria-hidden="true"></i>
                            </div>
                        </div>
                        <div class="menu_col_list">
                            <ul class="index_col_list">

                                <asp:Repeater ID="rpchild" runat="server" DataSource='<%#getchild(Eval("icid").ToString()) %>'>

                                    <ItemTemplate>
                                        <li>
                                            <h4><a href="/<%#Eval("valias") %>" title="<%#Eval("vname") %>"><span><%#Eval("vname") %></span></a></h4>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </ul>
                        </div>

                    </div>
                    <div class="index_col">
                        <div class="imgcate col-cus-2 hidden-sm hidden-xs no-padding">
                            <a title="<%#Eval("vname") %>" class="product_img_link" href="/<%#Eval("valias") %>">
                                                <img  alt="<%#Eval("vname") %>" src="/uploads/products/cates/<%#Eval("vimg") %>"></a>
                        </div>
                    <div class="product_list_owl col-cus-10">
                        <div class="owl-carousel slide owl-theme">
                            <asp:Repeater ID="rpitem" runat="server" DataSource='<%#getitemincate(Eval("icid").ToString()) %>'>
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

                        </div>
                    </div>
                        </div>

                </div>
      

    </ItemTemplate>
</asp:Repeater>
