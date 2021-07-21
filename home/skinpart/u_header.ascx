<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_header.ascx.cs" Inherits="home_skinpart_u_header" %>
<header class="top-header fullwidth sticky">



    <div class="header-elements default">

        <div class="mobile-menu-button"><span></span><span></span><span></span></div>
        <div id="logo" class="site-logo">
            <a href="/" title="<%=WEB.Config.getvaluebykey(WEB.Config.k_webtitle,lang) %>">
                <img src="/uploads/banners/<%=WEB.Config.getvaluebykey(WEB.Config.k_webbanner,lang) %>" alt="<%=WEB.Config.getvaluebykey(WEB.Config.k_webtitle,lang) %>" width="500" height="158" class="main_logo" /></a>
        </div>
        <div class="header-right">
            <nav class="main-navigation">
                <ul id="navigation" class="menu">
                    <asp:Literal ID="ltmenu" runat="server"></asp:Literal>
                    <li class="wpml-ls-item wpml-ls-item-vi wpml-ls-current-language wpml-ls-menu-item wpml-ls-first-item menu-item-type-wpml_ls_menu_item menu-item-object-wpml_ls_menu_item "><a href="?Lang=VIE"><span>
                        <img class="wpml-ls-flag" src="/templates/home/images/vi.png" alt="vi" title="Tiếng Việt"></span></a>
                    </li>
                    <li class="wpml-ls-item wpml-ls-item-vi wpml-ls-current-language wpml-ls-menu-item wpml-ls-first-item menu-item-type-wpml_ls_menu_item menu-item-object-wpml_ls_menu_item"><a href="?Lang=ENG"><span>
                        <img class="wpml-ls-flag" src="/templates/home/images/en.png" alt="vi" title="Tiếng Anh"></span></a>
                    </li>
                </ul>
            </nav>
            <div id="tools">
                <ul>
                    <li><a href="#" class="rt-search-button" title="Search"><span class="icon-search"></span></a></li>
                </ul>
            </div>
        </div>
        <div class="mobile-nav">
            <nav>
                <ul id="mobile-navigation" class="mobile-navigation-menu">
                    <asp:Literal ID="ltmenumb" runat="server"></asp:Literal>
                    <li class="wpml-ls-item wpml-ls-item-vi wpml-ls-current-language wpml-ls-menu-item wpml-ls-first-item menu-item-type-wpml_ls_menu_item menu-item-object-wpml_ls_menu_item ">
                        <a href="?Lang=VIE"><span>
                        <img class="wpml-ls-flag" src="/templates/home/images/vi.png" alt="vi" title="Tiếng Việt"></span></a>
                        <a href="?Lang=ENG"><span>
                        <img class="wpml-ls-flag" src="/templates/home/images/en.png" alt="vi" title="Tiếng Anh"></span></a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
