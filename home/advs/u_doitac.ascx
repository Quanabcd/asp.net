<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_doitac.ascx.cs" Inherits="home_advs_u_doitac" %>
<section id="brand_index" class="container m-b-20">
    <div class="row">
        <div class="col-md-12 col-xs-12">
            <div class="section-heading">
                <h2 title="thương hiệu">
                    <span>Thương hiệu</span>
                </h2>
            </div>
        </div>
    </div>
    <div class="row">
        <div id="brand_owl">
            <asp:Repeater ID="rpitems" runat="server">
                <ItemTemplate>
                    <div class="item">
                        <a href="<%#Eval("vparam4") %>">
                            <img src="/uploads/qc/<%#Eval("vcontent") %>" alt="<%#Eval("vtitle") %>" />
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</section>
