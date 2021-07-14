<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_advs.ascx.cs" Inherits="home_advs_u_topthuonghieu" %>
<div class="block_left hidden-xs">
            <div class="block_left-title">
                <h2>Quảng cáo</h2>
            </div>
            <div class="block_left-center">
                 <asp:Repeater ID="rpitems" runat="server">
            <ItemTemplate>
                <div class="col-xs-12 list-content-top">
                    <a href="<%#Eval("vparam4") %>">
                        <img src="uploads/qc/<%#Eval("vcontent") %>" alt="<%#Eval("vtitle") %>" class="img-responsive" /></a>
                </div>
			
                <!--end .col-md-4 col-sm-6 col-xs-6 list-content-top-->
            </ItemTemplate>
        </asp:Repeater>
<div class='clearfix'></div>
            </div>
        </div>
