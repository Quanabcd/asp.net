<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_services_cate.ascx.cs" Inherits="home_news_default_u_services_cate" %>


<section class="right-content col-md-9 ">
    <div class="box-heading">
        <h1 class="title-head">
            <asp:Literal ID="ltname" runat="server"></asp:Literal></h1>
    </div>
    <section class="services-blogc list-blogs blog-main">
        <div class="row">
            <asp:Repeater ID="rpitems" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 col-sm-6 col-xs-6 col-100">
                        <article class="blog-item">
                            <div class="blog-item-thumbnail">
                                <a href="/<%#Eval("valias") %>" class="blog-bga">
                                    <picture>

										<img src="/uploads/services/<%#Eval("vimg") %>" alt="<%#Eval("vtitle") %>" class="img-responsive center-block">
									</picture>
                                </a>
                                <div class="articles-date">
                                    <span><%#Eval("dupdate","{0:dd/MM}") %></span>
                                    <%#Eval("dupdate","{0:yyyy}") %>
                                </div>
                            </div>
                            <h3 class="blog-item-name" style="text-align:center;"><a href="/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a></h3>
                            <p class="blog-item-summary margin-bottom-5"><%#WEB.Common.Cutleft(Eval("vdesc").ToString(),150) %></p>
                        </article>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="text-xs-right text-center pagging-css">
                    <nav class="text-center">
                        <div class='d_page'>
                            <asp:Literal ID="ltpage" runat="server"></asp:Literal>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
</section>
