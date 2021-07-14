<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_slides.ascx.cs" Inherits="home_advs_u_slides" %>
<section id="slider">
    <div class="container m-b-10">
        <div class="row">
            <div class="col-md-3 col-sm-12 col-xs-12 vertical_menu">
            </div>
            <div class="col-md-9 col-sm-12 col-xs-12 p-d-0-xs">
                <div class="homeslider">
                    <div id="owl-slider" class="owl-carousel owl-carousel-banner">
                        <asp:Repeater ID="rpitems" runat="server">
                            <ItemTemplate>
                                <div class="item">
                                    <a href="<%#Eval("vparam4") %>">
                                        <img src="/uploads/qc/<%#Eval("vcontent") %>" alt="<%#Eval("vtitle") %>" /></a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


