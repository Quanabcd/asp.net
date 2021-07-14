<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_content_cate.ascx.cs" Inherits="home_news_default_u_news_cate" %>
<main class="main-content" data-role="main">
    <div id="blog" class="m-b-30">
        <div id="breadcrumb" class="m-b-20">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ">
                        <ol class="breadcrumb breadcrumb-arrow hidden-sm hidden-xs">
                            <li itemprop="itemListElement"><a href="/" target="_self"><span itemprop="name">Trang chủ</span></a></li>
                            <asp:Literal ID="ltrl" runat="server"></asp:Literal>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div id="blog-template">
            <div class="new-cates">
                <div class="container">
                <div class="row">
                    <div class="col-md-9 col-sm-8 col-xs-12">
                        <h1 title="tin tức" class="page-heading">
                            <asp:Literal ID="ltname" runat="server"></asp:Literal>
                        </h1>
                        <div class="blog_wrap ">
                            <asp:Repeater ID="rpitems" runat="server">
                                <ItemTemplate>
                                    <article class="blog_item clearfix">
                                        <div class="blog_item_image text-center">
                                            <a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                                                <img src="/uploads/contents/thumbs/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>"></a>
                                        </div>
                                        <div class="blog_item_content">
                                            <a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                                                <h2 title="<%#Eval("vtitle") %>"><%#WEB.Common.Cutleft(Eval("vtitle").ToString(),40) %></h2>
                                            </a>
                                            <p>
                                                Ngày: <%#Eval("dupdate","{0:dd/MM/yyyy}") %>
                                            </p>
                                            <div class="blog-content-short-description">
                                                <p><%#WEB.Common.Cutleft(Eval("vdesc").ToString(),80) %></p>
                                            </div>
                                        </div>
                                    </article>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="paginate">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="pagination">
                                <div class="row">
                                    <div class='d_page'>
                                        <asp:Literal ID="ltpage" runat="server"></asp:Literal>
                                    </div>
                                </div>
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