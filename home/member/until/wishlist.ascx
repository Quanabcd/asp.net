<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wishlist.ascx.cs" Inherits="home_member_until_wishlist" %>
<div class="cartblock mbblock">
    <div class="container">
        <h1  class="ttm">Trang thành viên</h1>

        <div class="blockmb">
            <div class="col-sm-9">
                <h2>Danh sách sản phẩm yêu thích</h2>
                 
                      <asp:Repeater ID="rpitems" OnItemCommand="rpitems_ItemCommand" runat="server">
                     <ItemTemplate>
                         <div class="itemwish">
                         <div class="row">
                             <div class="col-sm-2 col-md-1">
                                   <a href="<%#WEB.Common.Weburl %><%#Eval("valias")%>" title="<%#Eval("vtitle")%>">
                        <img class="img-responsive" src="<%#WEB.Common.Weburl %>uploads/products/thumbs/<%#Eval("vimg")%>" alt="<%#Eval("vtitle")%>" /></a>
                             </div>
                             <div class="col-sm-9"><a href="<%#WEB.Common.Weburl %><%#Eval("valias")%>" title="<%#Eval("vtitle")%>"><%#Eval("vtitle")%></a>
                                 <p style="font-size:12px"><%#Eval("vkey")%></p>
                             </div>
                             <div class="col-sm-1">  <asp:LinkButton ID="LinkButton2" CommandName="delete" CssClass="btn btn-link btn-item-delete remove-item-cart" OnLoad="Delete_Load" CommandArgument='<%#Eval("iid")%>'
                            runat="server">X</asp:LinkButton></div>
                         </div>
                             </div>
                     </ItemTemplate>
                 </asp:Repeater>
                <p class="messnorecord"><asp:Literal ID="ltnorecord" runat="server"></asp:Literal></p>
            </div>
             <div class="col-sm-3">
                 <div class="cctv">
                 <p class="tttv">Công cụ thành viên</p>
                 <ul>
                     <li><a href="/account/info" title="Thông tin thành viên"><i class="fa fa-angle-right "></i> Thông tin thành viên</a></li>
                      <li><a href="/account/wishlist" title="Sản phẩm yêu thích"><i class="fa fa-angle-right "></i> Sản phẩm yêu thích</a></li>
                      <li><a href="/account/order" title="Danh sách đơn hàng"><i class="fa fa-angle-right "></i> Danh sách đơn hàng</a></li>
                 </ul>
                     </div>
             </div>
            <div class="clear"></div>
        </div>
    </div>
</div>