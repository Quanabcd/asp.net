<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_item_detail.ascx.cs" Inherits="home_videos_default_u_item_detail" %>
<div class="block-detail">
    <div class="block-detail-head">
        <h1><asp:Literal ID="ltdetail" runat="server"></asp:Literal></h1>
        
    </div>
    <div class="block-detail-cnt">
         <div class="block-detail-head-dv">
    <span class="block-detail-head-date"><asp:Literal ID="ltdate" runat="server"></asp:Literal></span>
        <span class="block-detail-head-views"><asp:Literal ID="ltviews" runat="server"></asp:Literal></span>
        </div>
     <div class="toolshare">
             <table border="0" width="100%" cellspacing="0" cellpadding="0" id="table1">
	<tr>
		<td width="50"><g:plusone size="medium"></g:plusone></td>
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


        </div><div class="clear"></div>
        <div class="block-detail-cnt-desc"><asp:Literal ID="ltdesc" runat="server"></asp:Literal></div>
        <div class="block-detail-cnt-vd"><asp:Literal ID="ltvideo" runat="server"></asp:Literal></div>
        <asp:Literal ID="ltcontent" runat="server"></asp:Literal>
    </div>
    <div class="block-detail-other">
        <div class="block-detail-other-h">
            <h2>Video cùng loại</h2>
        </div>
        <div class="block-detail-other-c">
                <asp:Repeater ID="rpsames" runat="server">
                    <ItemTemplate>
                        <div class="item-video">
                            <div class="item-video-img">
                                <a href="<%#WebURL %>videos/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#getimg(Eval("vimg").ToString(),Eval("vtitle").ToString()) %></a>
                            </div>
                            <div class="item-video-tit">
                                <a href="<%#WebURL %>videos/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><h2><%#Eval("vtitle") %></h2></a>
                            </div>
                            <div class="item-video-tool">
                                <span class="item-video-tool-date"><%#Convert.ToDateTime(Eval("dcreatedate")).ToString("dd/MM") %></span>
                                <span class="item-video-tool-view"><%#Eval("iviews") %></span>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
           <div class="clear"></div>
        </div>
    </div>
</div>