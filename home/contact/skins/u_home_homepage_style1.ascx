<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_home_homepage_style1.ascx.cs" Inherits="home_homepage_u_home_homepage_style1" %>
<main class="main-content" data-role="main">
    <div id="page" class="m-b-15">
        <!-- Breadcrumb -->
        <div id="breadcrumb" class="m-b-20">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ">
                        <ol class="breadcrumb breadcrumb-arrow hidden-sm hidden-xs" itemscope="" >
                            <li ><a href="/" target="_self"><span itemprop="name">Trang chủ</span></a></li>
                            <li  class="active"><span itemprop="name">Liên hệ</span></li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <asp:PlaceHolder ID="phmain" runat="server"></asp:PlaceHolder>

        
    </div>
</main>
