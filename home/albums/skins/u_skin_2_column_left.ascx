<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_skin_2_column_left.ascx.cs" Inherits="home_albums_skins_u_skin_2_column_left" %>
<section class="bread-crumb margin-bottom-10">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul class="breadcrumb">
                    <asp:Literal ID="ltroadlink" runat="server"></asp:Literal>
                </ul>
            </div>
        </div>
    </div>
</section>

<div class="container article-wraper">
    <div class="container">
        <div class="row">
            <asp:PlaceHolder ID="phcontrol" runat="server"></asp:PlaceHolder>
        </div>
    </div>
</div>

