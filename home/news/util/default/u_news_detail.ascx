<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_news_detail.ascx.cs" Inherits="home_news_default_u_news_detail" %>
<main class="main-content" data-role="main">
    <div id="article" class="m-b-30">
        <div id="breadcrumb" class="m-b-20">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 blog-breadcrumb">
                        <ol class="breadcrumb breadcrumb-arrow hidden-sm hidden-xs">
                            <li itemprop="itemListElement"><a href="/" target="_self"><span itemprop="name">Trang chủ</span></a></li>
                            <asp:Literal ID="ltrl" runat="server"></asp:Literal>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="article-detail ">
            <div class="news-details">
                <div class="container">
                    <div class="row">

                        <div class="col-md-9 col-sm-8 col-xs-12 articles_page clearfix">
                            <h1 title="Thanh lịch căn hộ màu trắng xám" class="page-heading">
                                <asp:Literal ID="lttitle" runat="server"></asp:Literal></h1>
                            <div class="content-page">
                                <p class="createdat_article">
                                    Ngày:
                                <asp:Literal ID="ltdate" runat="server"></asp:Literal>
                                </p>
                                <div class="content_article rte clearfix">
                                    <asp:Literal ID="ltcontent" runat="server"></asp:Literal>
                                    <div class="fb-comments" data-href="<%=WebURL %><%=Request.Url.AbsolutePath %>" data-width="100%" data-numposts="5" data-colorscheme="light"></div>
                                </div>
                                <div class="extra_blogs">
                                    <h4>Tin cùng danh mục
                                    </h4>
                                    <ul>
                                        <asp:Repeater ID="rpitems" runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <a href="/<%#Eval("valias") %>" title=""><%#Eval("vtitle") %> (<%#Eval("dupdate","{0:dd/MM/yyyy}") %>)</a>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <aside class="col-md-3 col-sm-4 col-xs-12">
                            <asp:PlaceHolder ID="ph_left" runat="server"></asp:PlaceHolder>
                        </aside>
                    </div>
                </div>
            </div>

        </div>
    </div>
</main>