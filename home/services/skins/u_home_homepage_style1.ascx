<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_home_homepage_style1.ascx.cs" Inherits="home_services_u_home_homepage_style1" %>
<section class="bread-crumb margin-bottom-10">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul class="breadcrumb" >
                    <li class="home">
                        <a itemprop="url" href="/" title="Trang chủ"><span itemprop="title"><%=WEB.Common.Getlabel("lb_title_home_cates","Inicio",WEB.Common.Lang )%></span></a>
                        <span><i class="fa fa-angle-right"></i></span>
                    </li>
                    <asp:Literal ID="ltroadlink" runat="server"></asp:Literal>
                </ul>
            </div>
        </div>
    </div>
</section>

<div class="container article-wraper">
    <div class="container">
        <div class="row">
            <aside class="sidebar left left-content col-md-3">
                
                <asp:PlaceHolder ID="ph_left" runat="server"></asp:PlaceHolder>
                
            </aside>
            <asp:PlaceHolder ID="phcontrol" runat="server"></asp:PlaceHolder>

           
        </div>
    </div>
</div>

