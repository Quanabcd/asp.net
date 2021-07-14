<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_products_detail.ascx.cs" Inherits="home_products_default_u_products_detail" %>
<%
    loaditemrelative(12);
    loaditemrelative1(12);
%>
<asp:Literal Visible="false" ID="ltrl" runat="server"></asp:Literal>
<asp:Literal Visible="false" ID="ltsale" runat="server"></asp:Literal>
<asp:Literal Visible="false" ID="ltpricenew" runat="server"></asp:Literal>
<div class="quantity product-quantity clearfix col-md-6 col-xs-12 noleftpadding" style="display: none">
    <input type="button" value="-" class="minus">
    <input type="text" id='quantity' min="1" name="quantity" value="1" title="Qty" class="qty" size="4" />
    <input type="button" value="+" class="plus">
</div>
<script>
    var quantity = parseInt($('#ProductDetailsForm .product-quantity input.qty').val());
    $('#ProductDetailsForm .minus').click(function () {
        if (quantity > 0) {
            if (quantity == 1) {
                $('#addtocart').attr('disabled', 'disabled');
            }
            quantity -= 1;
        }
        else {
            quantity = 0;
        }
        $('#ProductDetailsForm .product-quantity input.qty').val(quantity);
    });
    $('#ProductDetailsForm  .plus').click(function () {
        $('.add-to-cart').removeAttr('disabled');
        if (quantity < 100) {
            quantity += 1;
        }
        else {
            quantity = 100;
        }
        $('#ProductDetailsForm .product-quantity input.qty').val(quantity)
    });
</script>
<asp:Button Visible="false" ID="btnbuy" runat="server" Text=" Thêm vào giỏ " OnClick="btnbuy_Click" />
<section class="product p-multiple">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 details-product">
                <div class="row margin-bottom-10 margin-bottom-20">
                    <div class="col-md-6">
                        <div id="sync1" class="owl-carousel owl-theme not-dqowl">
                            <asp:Literal ID="ltimg" runat="server"></asp:Literal>
                        </div>
                        <div id="sync2" class="owl-carousel owl-theme not-dqowl">
                            <asp:Literal ID="ltimgthumb" runat="server"></asp:Literal>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="details-pro">
                            <h1 class="title-head">
                                <asp:Literal ID="ltname" runat="server"></asp:Literal>
                            </h1>
                            <ul class="ct_course_list">
                                <li>
                                    <strong><%=WEB.Common.Getlabel("key_khuvuc","Ubicación" ,lang)%> :</strong>
                                    <asp:Literal ID="lthsx" runat="server"></asp:Literal>
                                </li>
                                 <li>
                                    <strong><%=WEB.Common.Getlabel("key_danhgia ","Calificaciones" ,lang)%> :</strong> 
                                     <asp:Literal ID="ltratings" runat="server"></asp:Literal>
                                </li>
                                <li>
                                    <strong><%=WEB.Common.Getlabel("key_hotline","Línea directa" ,lang)%> :</strong>
                                    <asp:Literal ID="lt_status" runat="server"></asp:Literal>

                                </li>
                                <li>
                                    <strong><%=WEB.Common.Getlabel("key_sophong","Número de habitación" ,lang)%> :</strong>
                                    <asp:Literal ID="ltbh" runat="server"></asp:Literal>

                                </li>
                                <li>
                                    <strong><%=WEB.Common.Getlabel("key_dautu","Inversor" ,lang)%> :</strong>
                                    <asp:Literal ID="txtxuatxu" runat="server"></asp:Literal>
                                </li>

                            </ul>
                            <div class="product-summary product_description margin-bottom-10 margin-top-5">
                                <div class="rte description">
                                    <strong><%=WEB.Common.Getlabel("key_mota","Describir" ,lang)%></strong>
                                    <p>
                                        <asp:Literal ID="ltdesc" runat="server"></asp:Literal></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-9 margin-top-15 margin-bottom-10">
                        <div class="tour-tab-title">
                            <%=WEB.Common.Getlabel("key_chitiet","Detail" ,lang)%>
                        </div>
                        <div class="product-tab">
                            <asp:Literal ID="ltcontent" runat="server"></asp:Literal>
                            
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                        <div class="right_module">
                            <div class="similar-product">
                                <div class="right-bestsell clearfix">
                                    <h2><%=WEB.Common.Getlabel("key_hotel","Hotel Same Location" ,lang)%></h2>
                                    <div class="list-bestsell clearfix">
                                        <asp:Repeater ID="RP" runat="server">
                                            <ItemTemplate>
                                                <div class="list-bestsell-item">
                                                    <div class="thumbnail-container clearfix">
                                                        <div class="product-image">
                                                            <a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                                                                <img class="img-responsive" src="/uploads/products/thumbs/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>" />
                                                            </a>
                                                        </div>
                                                        <div class="product-meta">
                                                            <h3><a href="/<%#Eval("valias") %>"><%#Eval("vtitle") %></a></h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="related-product margin-bottom-30">
                    <div class="section_tour-new_title">
                        <h2><a><%=WEB.Common.Getlabel("key_hotel","Hotel" ,lang)%> <span><%=WEB.Common.Getlabel("key_lienquan","Other" ,lang)%></span></a></h2>
                        <div class="title-line">
                            <div class="tl-1"></div>
                            <div class="tl-2"></div>
                            <div class="tl-3"></div>
                        </div>
                    </div>
                    <div class="section-tour-owls-rela owl-carousel owl-theme not-dqowl">
                        <asp:Repeater ID="rpother" runat="server">
                            <ItemTemplate>
                                <div class="product-box">
                                    <div class="product-thumbnail">
                                        <a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                                            <img src="/uploads/products/thumbs/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>">
                                        </a>
                                    </div>
                                    <div class="product-info a-left">
                                        <h3 class="product-name"><a class="line-clamp" href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a></h3>
                                        <p class="blog-item-summary margin-bottom-5"><%#WEB.Common.Cutleft(Eval("vdesc").ToString(),150) %></p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
