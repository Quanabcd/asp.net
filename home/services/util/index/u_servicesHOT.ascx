<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_servicesHOT.ascx.cs" Inherits="home_services_util_index_u_servicesHOT" %>
<section class="awe-section-8">
    <div class="section_tour-new">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section_tour-new_title">
                        <h2>OUR SERVICES</h2>
                        <div class="title-line">
                            <div class="tl-1"></div>
                            <div class="tl-2"></div>
                            <div class="tl-3"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class=" servicess servicess-view-grid owl-carousel" data-lg-items='4' data-md-items='3' data-sm-items='2' data-xs-items="2" data-xss-items="1" data-margin='20' data-nav="true" data-dot="true">
                <asp:Repeater ID="rpitems" runat="server">
                    <ItemTemplate>
                        <div class="item">
                            <div class="services-box">
                                <div class="services-thumbnail">
                                    <a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                                        <img src="/uploads/services/thumbs/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>">
                                    </a>                                  
                                </div>
                                <div class="services-info a-left">
                                    <h3 class="services-name"><a class="line-clamp" href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a></h3>

                                    <div class="box-date-tour">
                                        <%#WEB.Common.Cutleft(Eval("vdesc").ToString(),150) %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</section>
