<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_productsSALE.ascx.cs" Inherits="home_products_util_index_u_productsSALE" %>
<section class="awe-section-2">
    <div class="section_tour-new">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section_tour-new_title">
                        <h2>Promotion</h2>
                        <div class="title-line">
                            <div class="tl-1"></div>
                            <div class="tl-2"></div>
                            <div class="tl-3"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-tour-owl products products-view-grid owl-carousel" data-lg-items='4' data-md-items='3' data-sm-items='2' data-xs-items="2" data-xss-items="1" data-margin='20' data-nav="true" data-dot="true">
                <asp:Repeater ID="rp_items" runat="server">
                    <ItemTemplate>
                          <div class="item">
                            <div class="product-box">
                                <div class="product-thumbnail">
                                    <a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                                        <img src="/uploads/products/thumbs/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>">
                                    </a>
                                    <div class="sale-off">
                                        <%#loadkhuvuc(Eval("iparam8").ToString()) %>
                                    </div>
                                </div>
                                <div class="product-info a-left">
                                    <h3 class="product-name"><a class="line-clamp" href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a></h3>

                                    <div class="box-date-tour">
                                        <%#WEB.Common.Cutleft(Eval("vdesc").ToString(),100) %>
                                    </div>
                                    <a class="btn-tourst" href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">Read More <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</section>
