<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_productsHOT.ascx.cs" Inherits="home_products_util_index_u_productsHOT" %>

<section class="awe-section-6">
    <div class="section_tour-location">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section_tour-new_title">
                        <h2><%=WEB.Common.Getlabel("lb_title_HOTEL","HOTEL",WEB.Common.Lang )%></h2>
                        <div class="title-line">
                            <div class="tl-1"></div>
                            <div class="tl-2"></div>
                            <div class="tl-3"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="section-location-owl owl-carousel owl-theme not-dqowl">
                    <asp:Literal ID="ltitems" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>
</section>
