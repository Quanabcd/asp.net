<%@ control language="C#" autoeventwireup="true" inherits="admin_home_home, App_Web_k3s0kuly" %>
<figure class="block-summary clearfix">
    <div class="rowh">
        <div class="col-lg-3 col-md-6 col-sm-6" runat="server" id="divproduct">
            <a href="/admin/?mod=prod&c=items" title="" class="nth1 trans-hover">
                <div class="icon"></div>
                <div class="info">
                    <span>
                        <asp:Literal ID="ltregbooking" runat="server"></asp:Literal></span>
                    <small>Tổng số sản phẩm</small>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
            <a href="/admin/?mod=news&c=items" title="" class="nth2 trans-hover">
                <div class="icon"></div>
                <div class="info">
                    <span>
                        <asp:Literal ID="ltnewsnum" runat="server"></asp:Literal></span>
                    <small>Tổng số tin tức</small>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
            <a href="/admin/?mod=report" title="" class="nth3 trans-hover">
                <div class="icon"></div>
                <div class="info">
                    <span>
                        <asp:Literal ID="ltnumaccess" runat="server"></asp:Literal></span>
                    <small>Tổng truy cập</small>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
            <a href="/admin/?mod=contacts&c=items" title="" class="nth4 trans-hover">
                <div class="icon"></div>
                <div class="info">
                    <span>
                        <asp:Literal ID="ltcontactnum" runat="server"></asp:Literal></span>
                    <small>Liên hệ mới</small>
                </div>
            </a>
        </div>
    </div>
</figure>
<div id="element-box-home">

    <div id="cpanel">
        <div>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=settings&c=support" target="_blank">
                    <img src="<%=weburl %>templates/admin/images/header/ico_guide.png" alt="Hướng dẫn quản trị">
                    <span>Hướng dẫn quản trị</span>
                </a>
            </div>
        </div>
        <div <%=checkrole("1") %>>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=settings&c=websetting">
                    <img src="<%=weburl %>templates/admin/images/header/icon-48-config.png" alt="Global Configuration">
                    <span>Cấu hình chung</span>
                </a>
            </div>
        </div>
        <div <%=checkrole("900") %>>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=menus&c=mainmenu">
                    <img src="<%=weburl %>templates/admin/images/header/icon-48-menumgr.png" alt="Quản lý menu">
                    <span>Quản lý menu</span>
                </a>
            </div>
        </div>

        <div  <%=checkrole("211") %>  <%=checkrole("21") %>>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=news&c=cates">
                    <img src="<%=weburl %>templates/admin/images/header/icon-48-category.png" alt="Article Manager">
                    <span>Quản lý danh mục tin</span>
                </a>
            </div>
        </div>

        <div <%=checkrole("212") %>  <%=checkrole("21") %>>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=news&c=items">
                    <img src="<%=weburl %>templates/admin/images/header/ico_newsmn.png" alt="Section Manager">
                    <span>Quản lý danh sách tin</span>
                </a>
            </div>
        </div>





        <div <%=checkrole("221") %>  <%=checkrole("22") %>>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=content&c=cate">
                    <img src="<%=weburl %>templates/admin/images/header/icon-48-content.png" alt="Danh mục trang nội dung">
                    <span>Danh mục trang nội dung</span>
                </a>
            </div>
        </div>
        <div <%=checkrole("222") %>  <%=checkrole("22") %>>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=content&c=items">
                    <img src="<%=weburl %>templates/admin/images/header/icon-48-article.png" alt="Danh sách trang nội dung">
                    <span>Danh sách trang nội dung</span>
                </a>
            </div>
        </div>

        <div <%=checkrole("201") %> <%=checkrole("20") %>>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=prod&c=cate">
                    <img src="<%=weburl %>templates/admin/images/header/icon-48-section.png" alt="Danh mục sản phẩm">
                    <span>Danh mục sản phẩm</span>
                </a>
            </div>
        </div>
        <div <%=checkrole("202") %> <%=checkrole("20") %>>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=prod&c=items">
                    <img src="<%=weburl %>templates/admin/images/header/icon-48-generic.png" alt="Danh sách sản phẩm">
                    <span>Danh sách sản phẩm</span>
                </a>
            </div>
        </div>


        <div <%=checkrole("291") %> <%=checkrole("29") %>>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=contacts&c=items">
                    <img src="<%=weburl %>templates/admin/images/header/ico_contactmn.png" alt="Danh sách liên hệ">
                    <span>Danh sách liên hệ</span>
                </a>
            </div>
        </div>


        <div <%=checkrole("1021") %>>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=accounts&c=items">
                    <img src="<%=weburl %>templates/admin/images/header/icon-48-user.png" alt="Add New Article">
                    <span>Quản lý tài khoản</span>
                </a>
            </div>
        </div>
        <div <%=checkrole("1001") %>>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=integrated&c=seo">
                    <img src="<%=weburl %>templates/admin/images/header/icon-seo.png" alt="SEO">
                    <span>Tối ưu SEO</span>
                </a>
            </div>
        </div>
        <div <%=checkrole("1013") %>>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=utilities&c=advs">
                    <img src="<%=weburl %>templates/admin/images/header/ico_advmn.png" alt="Quản lý quảng cáo">
                    <span>Quản lý quảng cáo</span>
                </a>
            </div>
        </div>
        <div <%=checkrole("1011") %>>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=utilities&c=supports">
                    <img src="<%=weburl %>templates/admin/images/header/ico_homemn.png" alt="Hỗ trợ trực tuyến">
                    <span>Hỗ trợ trực tuyến</span>
                </a>
            </div>
        </div>

        <div <%=checkrole("1005") %>>
            <div class="icon">
                <a href="<%=weburl %>admin/?mod=integrated&c=social">
                    <img src="<%=weburl %>templates/admin/images/header/icon-social.png" alt="Mạng xã hội">
                    <span>Mạng xã hội</span>
                </a>
            </div>
        </div>
        
    </div>
    <div style="clear: both;"></div>
</div>

<div id="element-box-right">
     <section class="web-info" style="background:#fba026">
        <h3 style="color:#fff;font-size:14px">Hướng dẫn quản trị website tự động (<span style="color:#fff;font-size:12px">Sử dụng công nghệ AI</span>)
                                        	
        </h3>
        <div class="bla">
            <input type="text" id="txtkey" class="inputbox" placeholder="Nhập nội dung cần chỉnh sửa, chỉ cần nhập 3 đến 5 từ" style="width:100%" />
            <p style="color:#fff;font-size:11px;margin-top:5px">Nhập nội dung ở bất kỳ phần nào trên website vào ô trên sau đó nhấn nút <b>"Enter"</b>, hệ thống sẽ tự tìm và đưa ra hướng dẫn quản trị nội dung đó cho bạn</p>
        <ul class="guideresult">
           


        </ul>
            </div>
    </section>
    <asp:Panel ID="phinfo" Visible="false" runat="server">
    <section class="web-info">
        <h3>Thông tin web
                                        	
        </h3>
        <ul>
            <li><asp:Literal ID="ltinformation" runat="server"></asp:Literal>
            </li>

        </ul>
    </section>
        </asp:Panel>
    
    <section class="web-info">
        <h3>Có thể bạn quan tâm
                                        	
        </h3>
        <ul>
            <asp:Repeater ID="rpnews" runat="server">
                <ItemTemplate>
                    <li>
                        <a href="<%#Eval("url") %>" title="<%#Eval("title") %>" target="_blank"><%#Eval("title") %></a>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            <li></li>


        </ul>
    </section>
   

    <div style="clear: both;"></div>
</div>
 <div style="clear: both;"></div>
<script type="text/javascript">
    $(document).ready(function () {
        //Horizontal Tab
        $('#parentHorizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function (event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });

        // Child Tab
        $('#ChildVerticalTab_1').easyResponsiveTabs({
            type: 'vertical',
            width: 'auto',
            fit: true,
            tabidentify: 'ver_1', // The tab groups identifier
            activetab_bg: '#fff', // background color for active tabs in this group
            inactive_bg: '#F5F5F5', // background color for inactive tabs in this group
            active_border_color: '#c1c1c1', // border color for active tabs heads in this group
            active_content_border_color: '#5AB1D0' // border color for active tabs contect in this group so that it matches the tab head border
        });

        //Vertical Tab
        $('#parentVerticalTab').easyResponsiveTabs({
            type: 'vertical', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function (event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo2');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
    });
</script>
