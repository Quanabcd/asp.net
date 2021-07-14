<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_adv1.ascx.cs" Inherits="home_advs_u_adv1" %>
<section id="service">
    <div class="container m-b-30">
        <div class="row">
            <div id="service_home" class=" clearfix">
                <asp:Repeater ID="rpitems" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 col-xxs-12 text-center m-b-xs-10">
                            <div class="service_item">
                                <div class="icon icon_product">
                                    <img src="/uploads/qc/<%#Eval("vcontent") %>" alt="<%#Eval("vtitle") %>">
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</section>
