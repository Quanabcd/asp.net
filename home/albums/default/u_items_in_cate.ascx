<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_items_in_cate.ascx.cs" Inherits="home_videos_default_u_items_in_cate" %>
<div class="block-cates">
    <div class="block-cates-head-abum">
        <h2>
            <asp:Literal ID="ltcatename" runat="server"></asp:Literal></h2>
<div class="title-line">
                            <div class="tl-1"></div>
                            <div class="tl-2"></div>
                            <div class="tl-3"></div>
                        </div>

    </div>
    <div class="block-cates-it-list">
        <!-- Add mousewheel plugin (this is optional) -->
        <script type="text/javascript" src="<%=weburl %>templates/home/js/jquery.mousewheel-3.0.6.pack.js"></script>
        <!-- Add fancyBox main JS and CSS files -->
        <script type="text/javascript" src="<%=weburl %>templates/home/js/jquery.fancybox.js"></script>
        <link rel="stylesheet" type="text/css" href="<%=weburl %>templates/home/css/jquery.fancybox.css" media="screen" />
        <!-- Add Button helper (this is optional) -->
        <link rel="stylesheet" type="text/css" href="<%=weburl %>templates/home/js/jquery.fancybox-buttons.css" />
        <script type="text/javascript" src="<%=weburl %>templates/home/js/helpers/jquery.fancybox-buttons.js"></script>
        <!-- Add Thumbnail helper (this is optional) -->
        <link rel="stylesheet" type="text/css" href="<%=weburl %>templates/home/js/jquery.fancybox-thumbs.css" />
        <script type="text/javascript" src="<%=weburl %>templates/home/js/jquery.fancybox-thumbs.js"></script>
        <asp:Repeater ID="rpitems" runat="server">
            <ItemTemplate>
                <div class="item-album col-md-3">
                    <div class="item-album-img">
                        <a class="fancybox" rel="gallery1" href="<%#weburl %>uploads/albums/<%#Eval("vimg") %>" title="<%#Eval("vtitle") %>">
                            <%#getimg(Eval("vimg").ToString(),Eval("vtitle").ToString()) %>
                        </a>
                    </div>
                    <div class="item-album-tit">
                        <h2><%#Eval("vtitle") %></h2>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Repeater ID="rpcates" runat="server">
            <ItemTemplate>
                <div class="item-album col-md-3">
                    <div class="item-album-img">
                        <a href="<%#weburl %>thu-vien-anh/<%#Eval("valias") %>" title="<%#Eval("vname") %>">
                            <%#getimgcate(Eval("vimg").ToString(),Eval("vname").ToString()) %>
                        </a>
                    </div>
                    <div class="item-album-tit">
                        <a href="<%#weburl %>thu-vien-anh/<%#Eval("valias") %>" title="<%#Eval("vname") %>">
                            <h2><%#Eval("vname") %></h2>
                        </a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".fancybox").fancybox({
                    openEffect: 'none',
                    closeEffect: 'none',
                    helpers: {
                        thumbs: {
                            width: 50,
                            height: 50
                        }
                    }
                });
            });
        </script>
        <div class="clear"></div>
        <p class='d_page'>
            <asp:Literal ID="ltpage" runat="server"></asp:Literal>
        </p>
    </div>
</div>
