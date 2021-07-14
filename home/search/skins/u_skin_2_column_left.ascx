<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_skin_2_column_left.ascx.cs" Inherits="home_rooms_skins_u_skin_2_column_left" %>
<section class="bread-crumb margin-bottom-10">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul class="breadcrumb">
                    <li class="home">
                        <a itemprop="url" href="/" title="Trang chủ"><span itemprop="title"><%=WEB.Common.Getlabel("lb_title_home_cates","Inicio",WEB.Common.Lang )%></span></a>
                        <span><i class="fa fa-angle-right"></i></span>
                    </li>
                    <li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem"><strong>Tìm kiếm</strong></li>
                </ul>
            </div>
        </div>
    </div>
</section>
<asp:PlaceHolder ID="phcontrol" runat="server"></asp:PlaceHolder>
