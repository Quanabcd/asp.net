<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_topfile.ascx.cs" Inherits="home_filelibrarys_topfile_u_topfile" %>
<div class="block_left">
            <div class="block_left-title-p">
                <p>Tài liệu mới nhất</p>
            </div>
            <div class="block_left-center">
                <ul class="topf">
                 <asp:Repeater ID="rpitems" runat="server">
            <ItemTemplate>
                <li>
                    <a href="/thu-vien-tai-lieu/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                        <%#Eval("vtitle") %></a>
                </li>
                <!--end .col-md-4 col-sm-6 col-xs-6 list-content-top-->
            </ItemTemplate>
        </asp:Repeater>
                    </ul>
<div class='clearfix'></div>
            </div>
        </div>
