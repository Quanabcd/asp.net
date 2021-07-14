<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_productsSALE.ascx.cs" Inherits="home_products_util_index_u_productsSALE" %>
<section class="awe-section-2">
    <div class="section_tour-new">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section_tour-new_title">
                        <h2><%=WEB.Common.Getlabel("lb_title_Promotion","Promotion",WEB.Common.Lang )%></h2>
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

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</section>
