<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_services_detail.ascx.cs" Inherits="home_news_default_u_services_detail" %>
<asp:Literal Visible="false" ID="ltviews" runat="server"></asp:Literal>
<asp:Literal Visible="false" ID="lttag" runat="server"></asp:Literal>
<%
    loaditemother(5);

%>
<section class="right-content col-md-9">
    <article class="article-main" itemscope="" itemtype="http://schema.org/Article">

        <div class="row">
            <div class="col-md-12">
                <h1 class="title-head">
                    <asp:Literal ID="lttitle" runat="server"></asp:Literal></h1>
                <div class="postby">
                    <span>Đăng  vào lúc
                        <asp:Literal ID="ltdate" runat="server"></asp:Literal></span>
                </div>
                <div class="article-details">
                    <div class="article-content">
                        <div class="rte">
                            <div class="caption">
                                <asp:Literal ID="ltcontent" runat="server"></asp:Literal>

                                

                            </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="blog_related">
                <h2>Bài viết liên quan</h2>
                <asp:Repeater ID="rpitems" runat="server">
                    <ItemTemplate>
                        <article class="blog_entry clearfix">
                            <h3 class="blog_entry-title"><a rel="bookmark" href="/<%#Eval("valias") %>"><i class="fa fa-angle-right" aria-hidden="true"></i><%#Eval("vtitle") %></a></h3>
                        </article>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        </div>
    </article>
</section>
