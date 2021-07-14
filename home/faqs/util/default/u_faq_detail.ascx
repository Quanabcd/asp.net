<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_faq_detail.ascx.cs" Inherits="home_faq_default_u_news_detail" %>
<% 
    loaditemother(5);
%>
<div class="page-content">
    <div class="news_detail content_main_block">
        <div class="messages">
              <h1><asp:Literal ID="lttitle" runat="server"></asp:Literal></h1>
            <div class="hdfaq">
                <span class="ico fa fa-question-circle" style="font-size: 60px; color: #00a1e4"></span>
                <div class="faqifo">
                    
                        <h5><asp:Literal ID="ltname" runat="server"></asp:Literal></h5>
                        <span class="user-info">(<asp:Literal ID="ltinfo" runat="server"></asp:Literal>)</span>   <span class="block-detail-head-date">
                <asp:Literal ID="ltdate" runat="server"></asp:Literal></span>
                      
                    </div>
                   
             
            </div>
            </div>
             <div class="ndch">
                         <asp:Literal ID="ltdesc" runat="server"> </asp:Literal>
                    </div>
            <hr>
            <div class="reply">
                 <asp:Literal ID="ltcontent" runat="server"></asp:Literal>
            </div>
        </div>
        
        <div class="toolshare">
            <table border="0" width="100%" cellspacing="0" cellpadding="0" id="table1">
                <tr>
                    <td width="50">
                        <g:plusone size="medium"></g:plusone>
                    </td>
                    <td width="50"><a href="https://twitter.com/share" class="twitter-share-button">Tweet</a></td>
                    <td width="50">
                        <div id='facebook'></div>
                    </td>
                </tr>
            </table>

            <script type="text/javascript">
                (function () {
                    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                    po.src = 'https://apis.google.com/js/plusone.js';
                    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                    document.getElementById('facebook').innerHTML = '<iframe src="//www.facebook.com/plugins/like.php?href=' + document.URL + '&amp;send=false&amp;layout=button_count&amp;width=60&amp;show_faces=true&amp;action=like&amp;colorscheme=light&amp;font&amp;height=23" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:80px; height:23px;" allowTransparency="true"></iframe>';
                })();
            </script>
            <script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");</script>


        </div>
        <div class="clear"></div>
       
        <div class="fb-comments" data-href="<%=WebURL %><%=Request.Url.AbsolutePath %>" data-width="100%" data-numposts="5" data-colorscheme="light"></div>
        <div class='news_other'>
            <asp:Repeater ID="rpitems" runat="server">
                <HeaderTemplate>
                    <h2 class='n_other'><%=WEB.Common.Getlabel("lb_cauhoikhac", "Câu hỏi khác", WEB.Common.Lang) %></h2>
                       <div class="box-content list-news">
            <ul>
                </HeaderTemplate>
                <ItemTemplate>
                     <li><a class="ask visible-md visible-lg" href="/hoi-dap/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>">
                            <span class="fa fa-question-circle"></span></a>
                            <div class="ask">
                                <span><%#Convert.ToDateTime(Eval("dupdate").ToString()).ToString("dd/MM/yyyy HH:mm") %></span> <a href="/hoi-dap/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a>
                                <p>  <%#WEB.Common.Cutleft(Eval("vdesc").ToString(),100) %></p>
                            </div>
                         <div class="clear clearfix"></div>
                        </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul></div>
                </FooterTemplate>
            </asp:Repeater>
          
           
        </div>
       
    </div>

<div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.0";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
