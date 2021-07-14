<%@ Control Language="C#" AutoEventWireup="true" CodeFile="main.ascx.cs" Inherits="admin_main" %>
<div id="wrapper">
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%=weburl %>admin">
                <img height="50" src="<%=weburl%>templates/admin/images/logo2.png" /></a>

        </div>
        <div class="companyname">
            <asp:Literal ID="ltcompanyname" runat="server"></asp:Literal>
        </div>
        <!-- Top Menu Items -->
        <ul class="nav navbar-right top-nav">
            <li class="">
                <a href="<%=weburl%>" target="_blank">Xem Website</a>

            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>Xin chào: 
                    <asp:Literal ID="ltwelcome" runat="server"></asp:Literal><b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="<%=weburl%>admin/?mod=accounts&c=info"><i class="fa fa-fw fa-user"></i>Tài khoản</a>
                    </li>
                    <li>
                        <a href="<%=weburl%>admin/?mod=accounts&c=logout"><i class="fa fa-fw fa-power-off"></i>Thoát</a>
                    </li>
                </ul>
            </li>
            <li class="dlang">
                <asp:Repeater ID="rplang" runat="server">
                    <ItemTemplate>
                        <a href="<%=weburl %>admin/?lang=<%#Eval("vimg") %>" class="langitem<%#getcss(Eval("vimg").ToString()) %>" title="<%#Eval("vname") %>">
                            <img src="<%#weburl %>uploads/icon/<%#Eval("vimg").ToString().ToLower() %>.gif" alt="<%#Eval("vname") %>"></a>
                    </ItemTemplate>
                </asp:Repeater>
            </li>

        </ul>

        <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <script type="text/javascript">
                ddaccordion.init({
                    headerclass: "submenuheader",
                    contentclass: "submenu",
                    revealtype: "click",
                    mouseoverdelay: 200,
                    collapseprev: true,
                    defaultexpanded: [0],
                    onemustopen: false,
                    animatedefault: false,
                    persiststate: false,
                    toggleclass: ["", ""],
                    animatespeed: "fast",
                    oninit: function (headers, expandedindices) {
                        //do nothing
                    },
                    onopenclose: function (header, index, state, isuseractivated) {
                        //do nothing
                    }
                })
            </script>
            <ul class="nav navbar-nav side-nav">
                <li><a href="<%=weburl%>admin"><i class="fa fa-fw fa-home"></i>Home</a></li>
                <li<%=checkrole("1") %>><a  data-toggle="collapse" data-target="#pnsetting" href="javascript:void(0)" title="Cấu hình"><i class="fa fa-fw fa-gear"></i>Cấu hình<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pnsetting" class="collapse <%=cssselect("settings") %>">
                        <li<%=checkrole("11") %>><a href="<%=weburl %>admin/?mod=settings&c=websetting" title="Cấu hình chung"><i class="fa fa-fw fa fa-caret-right"></i>Cấu hình chung</a></li>
                        <li<%=checkrole("12") %>><a href="<%=weburl %>admin/?mod=settings&c=banner_logo" title="Banner & Hình nền"><i class="fa fa-fw fa fa-caret-right"></i>Banner & Logo - Chân trang</a></li>
                        <li<%=checkrole("13") %>><a href="<%=weburl %>admin/?mod=settings&c=systememail" title="Cấu hình email hệ thống"><i class="fa fa-fw fa fa-caret-right"></i>Cấu hình email hệ thống</a></li>
                        <li<%=checkrole("14") %>><a href="<%=weburl %>admin/?mod=settings&c=emailcontent" title="Cấu hình nội dung email"><i class="fa fa-fw fa fa-caret-right"></i>Cấu hình nội dung email</a></li>
                        <li<%=checkrole("15") %>><a href="<%=weburl %>admin/?mod=settings&c=transport" title="Cấu hình vận chuyển"><i class="fa fa-fw fa fa-caret-right"></i>Cấu hình vận chuyển</a></li>
                        <li<%=checkrole("16") %>><a href="<%=weburl %>admin/?mod=settings&c=payment" title="Cấu hình thanh toán"><i class="fa fa-fw fa fa-caret-right"></i>Cấu hình thanh toán</a></li>
                        <li<%=checkrole("17") %>><a href="<%=weburl %>admin/?mod=settings&c=language" title="Cấu hình ngôn ngữ"><i class="fa fa-fw fa fa-caret-right"></i>Cấu hình ngôn ngữ</a></li>
                        <li<%=checkrole("18") %>><a href="<%=weburl %>admin/?mod=settings&c=region" title="Quản lý tỉnh thành"><i class="fa fa-fw fa fa-caret-right"></i>Quản lý tỉnh thành</a></li>
                        <li<%=checkrole("18") %>><a href="<%=weburl %>admin/?mod=settings&c=district" title="Quản lý quận huyện"><i class="fa fa-fw fa fa-caret-right"></i>Quản lý quận huyện</a></li>
                    </ul>
                </li>
                <li<%=checkrole("2") %>><a  data-toggle="collapse" data-target="#pnmenu" href="javascript:void(0)" title="Menu"><i class="fa fa-fw fa-align-justify"></i>Menu<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pnmenu" class="collapse <%=cssselect("menus") %>">
                        <li<%=checkrole("900") %>><a href="<%=weburl %>admin/?mod=menus&c=mainmenu" title="Menu chính"><i class="fa fa-fw fa fa-caret-right"></i>Menu chính</a></li>
                        <li<%=checkrole("901") %>><a href="<%=weburl %>admin/?mod=menus&c=upmenu" title="Menu trên"><i class="fa fa-fw fa fa-caret-right"></i>Menu trên cùng</a></li>
                        <li<%=checkrole("902") %>><a href="<%=weburl %>admin/?mod=menus&c=downmenu" title="Menu dưới"><i class="fa fa-fw fa fa-caret-right"></i>Menu dưới cùng</a></li>
                        <li<%=checkrole("903") %>><a href="<%=weburl %>admin/?mod=menus&c=contents" title="Menu nội dung"><i class="fa fa-fw fa fa-caret-right"></i>Menu nội dung</a></li>
                    </ul>
                </li>

                <li<%=checkrole("20") %>><a  data-toggle="collapse" data-target="#pnproduct" href="javascript:void(0)" title="Sản phẩm"><i class="fa fa-fw fa-list-alt"></i>Sản phẩm<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pnproduct" class="collapse <%=cssselect("prod") %>">
                        <li <%=checkrole("201") %>><a href="<%=weburl %>admin/?mod=prod&c=cates" title="Danh mục Sản phẩm"><i class="fa fa-fw fa fa-caret-right"></i>Danh mục Sản phẩm</a></li>
                        <li <%=checkrole("202") %>><a href="<%=weburl %>admin/?mod=prod&c=items" title="Danh sách Sản phẩm"><i class="fa fa-fw fa fa-caret-right"></i>Danh sách Sản phẩm</a></li>
                        <li <%=checkrole("203") %>><a  href="<%=weburl %>admin/?mod=prod&c=groups"  title="Nhóm Sản phẩm"><i class="fa fa-fw fa fa-caret-right"></i>Nhóm Sản phẩm</a></li>
                        <li <%=checkrole("204") %>><a  href="<%=weburl %>admin/?mod=prod&c=vendors"  title="Hãng sản xuất"><i class="fa fa-fw fa fa-caret-right"></i>Hãng sản xuất</a></li>
                        <li <%=checkrole("205") %>><a  href="<%=weburl %>admin/?mod=prod&c=features"  title="Thuộc tính Sản phẩm"><i class="fa fa-fw fa fa-caret-right"></i>Thuộc tính Sản phẩm</a></li>
                        <li <%=checkrole("206") %>><a  href="<%=weburl %>admin/?mod=prod&c=comments" title="Phản hồi Sản phẩm"><i class="fa fa-fw fa fa-caret-right"></i>Phản hồi Sản phẩm</a></li>
                        <li <%=checkrole("209") %>><a href="<%=weburl %>admin/?mod=prod&c=prices" title="Quản lý khoảng giá"><i class="fa fa-fw fa fa-caret-right"></i>Quản lý khoảng giá</a></li>
                        <li <%=checkrole("207") %>><a href="<%=weburl %>admin/?mod=prod&c=orders" title="Quản lý đơn hàng"><i class="fa fa-fw fa fa-caret-right"></i>Quản lý đơn hàng</a></li>
                        <li <%=checkrole("208") %>><a  href="<%=weburl %>admin/?mod=prod&c=coupons" title="Mã khuyến mại Sản phẩm"><i class="fa fa-fw fa fa-caret-right"></i>Mã khuyến mại</a></li>
                        <li <%=checkrole("2002") %>><a  href="<%=weburl %>admin/?mod=prod&c=import_export" title="Nhập, xuất danh sách Sản phẩm"><i class="fa fa-fw fa fa-caret-right"></i>Nhập, xuất danh sách Sản phẩm</a></li>
                        <li <%=checkrole("2003") %>><a href="<%=weburl %>admin/?mod=prod&c=settings" title="Cấu hình Sản phẩm"><i class="fa fa-fw fa fa-caret-right"></i>Cấu hình Sản phẩm</a></li>
                    </ul>
                </li>

                    <li <%=checkrole("72") %>><a data-toggle="collapse" data-target="#pnhotel" href="javascript:void(0)" title="Hotel"><i class="fa fa-fw fa-list-alt"></i>Hotel<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="pnhotel" class="collapse<%=cssselect("hotel") %> ">
                            <li><a href="<%=weburl %>admin/?mod=hotel&c=cates" title="Danh mục hotel"><i class="fa fa-fw fa fa-caret-right"></i>Danh mục Hotel</a></li>
                            <li><a href="<%=weburl %>admin/?mod=hotel&c=items" title="Danh sách hotel"><i class="fa fa-fw fa fa-caret-right"></i>Danh sách Hotel</a></li>
                            <li><a href="<%=weburl %>admin/?mod=hotel&c=groups" title="Nhóm hotel"><i class="fa fa-fw fa fa-caret-right"></i>Nhóm Hotel</a></li>
                            <li><a href="<%=weburl %>admin/?mod=hotel&c=vendors" title="Khu vực khách sạn"><i class="fa fa-fw fa fa-caret-right"></i>Khu vực khách sạn</a></li>
                            <li style="display: none"><a href="<%=weburl %>admin/?mod=hotel&c=features" title="Thuộc tính hotel"><i class="fa fa-fw fa fa-caret-right"></i>Thuộc tính Hotel</a></li>
                            <li style="display: none"><a href="<%=weburl %>admin/?mod=hotel&c=comments" title="Phản hồi hotel"><i class="fa fa-fw fa fa-caret-right"></i>Phản hồi Hotel</a></li>
                            <li style="display: none"><a href="<%=weburl %>admin/?mod=hotel&c=prices" title="Quản lý khoảng giá"><i class="fa fa-fw fa fa-caret-right"></i>Quản lý khoảng giá</a></li>
                            <li style="display: none"><a href="<%=weburl %>admin/?mod=hotel&c=orders" title="Quản lý đơn hàng"><i class="fa fa-fw fa fa-caret-right"></i>Quản lý đơn hàng</a></li>
                            <li style="display: none"><a href="<%=weburl %>admin/?mod=hotel&c=coupons" title="Mã khuyến mại hotel"><i class="fa fa-fw fa fa-caret-right"></i>Mã khuyến mại</a></li>
                            <li style="display: none"><a href="<%=weburl %>admin/?mod=hotel&c=import_export" title="Nhập, xuất danh sách hotel"><i class="fa fa-fw fa fa-caret-right"></i>Nhập, xuất danh sách Hotel</a></li>
                            <li style="display: none"><a href="<%=weburl %>admin/?mod=hotel&c=settings" title="Cấu hình hotel"><i class="fa fa-fw fa fa-caret-right"></i>Cấu hình Hotel</a></li>
                        </ul>
                    </li>

                <li<%=checkrole("21") %>><a  data-toggle="collapse" data-target="#pnnews" href="javascript:void(0)" title="Tin tức"><i class="fa fa-fw fa-file"></i>Tin tức<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pnnews" class="collapse <%=cssselect("news") %>">
                        <li <%=checkrole("211") %>><a href="<%=weburl %>admin/?mod=news&c=cates" title="Danh mục tin"><i class="fa fa-fw fa fa-caret-right"></i>Danh mục tin</a></li>
                         <li <%=checkrole("214") %>><a href="<%=weburl %>admin/?mod=news&c=group" title="Nhóm tin"><i class="fa fa-fw fa fa-caret-right"></i>Nhóm tin</a></li>
                        <li <%=checkrole("212") %>><a href="<%=weburl %>admin/?mod=news&c=items" title="Danh sách tin"><i class="fa fa-fw fa fa-caret-right"></i>Danh sách tin</a></li>
                        <li <%=checkrole("213") %>><a href="<%=weburl %>admin/?mod=news&c=settings" title="Cấu hình tin"><i class="fa fa-fw fa fa-caret-right"></i>Cấu hình tin</a></li>
                    </ul>
                </li>
                 <li<%=checkrole("22") %>><a  data-toggle="collapse" data-target="#pncontent" href="javascript:void(0)" title="Bài viết"><i class="fa fa-fw fa-folder-o"></i>Trang nội dung<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pncontent" class="collapse <%=cssselect("content") %>">
                        <li <%=checkrole("221") %>><a href="<%=weburl %>admin/?mod=content&c=cates" title="Danh mục trang nội dung"><i class="fa fa-fw fa fa-caret-right"></i>Danh mục trang nội dung</a></li>
                        <li <%=checkrole("222") %>><a href="<%=weburl %>admin/?mod=content&c=items" title=">Danh sách trang nội dung"><i class="fa fa-fw fa fa-caret-right"></i>Danh sách trang nội dung</a></li>
                    </ul>
                </li>
                <li<%=checkrole("23") %>><a  data-toggle="collapse" data-target="#pnservices" href="javascript:void(0)" title="Dịch vụ"><i class="fa fa-object-group"></i>Dịch vụ<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pnservices" class="collapse <%=cssselect("services") %>">
                        <li<%=checkrole("231") %>><a href="<%=weburl %>admin/?mod=services&c=cates" title="Danh mục dịch vụ"><i class="fa fa-fw fa fa-caret-right"></i>Danh mục dịch vụ</a></li>
                        <li<%=checkrole("232") %>><a href="<%=weburl %>admin/?mod=services&c=items" title="Danh sách dịch vụ"><i class="fa fa-fw fa fa-caret-right"></i>Danh sách dịch vụ</a></li>
                    </ul>
                </li>
                <li<%=checkrole("24") %>><a  data-toggle="collapse" data-target="#pnvideo" href="javascript:void(0)" title="Thư viện video"><i class="fa fa-fw fa-video-camera"></i>Thư viện video<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pnvideo" class="collapse <%=cssselect("videos") %>">
                        <li<%=checkrole("241") %>><a href="<%=weburl %>admin/?mod=videos&c=cates" title="Danh mục video"><i class="fa fa-fw fa fa-caret-right"></i>Danh mục video</a></li>
                        <li<%=checkrole("242") %>><a href="<%=weburl %>admin/?mod=videos&c=items" title="Danh sách video"><i class="fa fa-fw fa fa-caret-right"></i>Danh sách video</a></li>
                   
                    </ul>
                </li>
                <li<%=checkrole("25") %>><a  data-toggle="collapse" data-target="#pnalbum" href="javascript:void(0)" title="Thư viện hình"><i class="fa fa-fw fa-file-image-o"></i>Thư viện hình<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pnalbum" class="collapse <%=cssselect("albums") %>">
                        
                        <li<%=checkrole("251") %>><a  href="<%=weburl %>admin/?mod=albums&c=cates"  title="Danh mục ảnh"><i class="fa fa-fw fa fa-caret-right"></i>Danh mục ảnh</a></li>
                        <li<%=checkrole("252") %>><a  href="<%=weburl %>admin/?mod=albums&c=items"  title="Danh sách ảnh"><i class="fa fa-fw fa fa-caret-right"></i>Danh sách ảnh</a></li>
                    </ul>
                </li>
                <li<%=checkrole("26") %>><a  data-toggle="collapse" data-target="#pnfile" href="javascript:void(0)" title="Thư viện tài liệu"><i class="fa fa-fw fa-file-archive-o"></i>Thư viện tài liệu<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pnfile" class="collapse <%=cssselect("files") %>">
                        
                        <li<%=checkrole("261") %>><a  href="<%=weburl %>admin/?mod=files&c=cates"  title="Danh mục tài liệu"><i class="fa fa-fw fa fa-caret-right"></i>Danh mục tài liệu</a></li>
                        <li<%=checkrole("262") %>><a  href="<%=weburl %>admin/?mod=files&c=items"  title="Danh sách tài liệu"><i class="fa fa-fw fa fa-caret-right"></i>Danh sách tài liệu</a></li>
                    </ul>
                </li>
                    <li<%=checkrole("27") %>><a  data-toggle="collapse" data-target="#pnprojects" href="javascript:void(0)" title="Dự án"><i class="fa fa-fw fa-file-archive-o"></i>Dự án<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pnprojects" class="collapse <%=cssselect("projects") %>">
                        
                        <li<%=checkrole("271") %>><a  href="<%=weburl %>admin/?mod=projects&c=cates"  title="Danh mục dự án"><i class="fa fa-fw fa fa-caret-right"></i>Danh mục dự án</a></li>
                        <li<%=checkrole("272") %>><a  href="<%=weburl %>admin/?mod=projects&c=items"  title="Danh sách dự án"><i class="fa fa-fw fa fa-caret-right"></i>Danh sách dự án</a></li>
                    </ul>
                </li>
                <li<%=checkrole("55") %>><a  data-toggle="collapse" data-target="#pnfaq" href="javascript:void(0)" title="Hỏi đáp"><i class="fa fa-fw fa-question-circle"></i>Hỏi đáp<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pnfaq" class="collapse <%=cssselect("faq") %>">
                        
                        <li<%=checkrole("551") %>><a  href="<%=weburl %>admin/?mod=faq&c=cates"  title="Danh mục hỏi đáp"><i class="fa fa-fw fa fa-caret-right"></i>Danh mục hỏi đáp</a></li>
                        <li<%=checkrole("552") %>><a  href="<%=weburl %>admin/?mod=faq&c=items"  title="Danh sách hỏi đáp"><i class="fa fa-fw fa fa-caret-right"></i>Danh sách hỏi đáp</a></li>
                    </ul>
                </li>
                <li<%=checkrole("28") %>><a  data-toggle="collapse" data-target="#pncustomer_reviews" href="javascript:void(0)" title="Ý kiến khách hàng"><i class="fa fa-fw fa-comments-o"></i>Ý kiến khách hàng<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pncustomer_reviews" class="collapse  <%=cssselect("customer_reviews") %>">
                          <li<%=checkrole("281") %>><a href="<%=weburl %>admin/?mod=customer_reviews&c=cates" title="Ý kiến khách hàng"><i class="fa fa-fw fa fa-caret-right"></i>Danh mục ý kiến khách hàng</a></li>
                        <li<%=checkrole("282") %>><a href="<%=weburl %>admin/?mod=customer_reviews&c=items" title="Hotline"><i class="fa fa-fw fa fa-caret-right"></i>Danh sách ý kiến khách hàng</a></li>
                    </ul>
                </li>
                <li<%=checkrole("29") %>><a  data-toggle="collapse" data-target="#pncontacts" href="javascript:void(0)" title="Liên hệ"><i class="fa fa-fw fa-support"></i>Liên hệ<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pncontacts" class="collapse <%=cssselect("contacts") %>">
                         <li<%=checkrole("291") %>><a href="<%=weburl %>admin/?mod=contacts&c=items" title="Danh sách liên hệ"><i class="fa fa-fw fa fa-caret-right"></i>Danh sách liên hệ</a></li>
                        <li<%=checkrole("292") %>><a href="<%=weburl %>admin/?mod=contacts&c=contents" title="Thông tin liên hệ & bản đồ"><i class="fa fa-fw fa fa-caret-right"></i>Thông tin liên hệ & bản đồ</a></li>
                    </ul>
                </li>
                       <li<%=checkrole("77") %>><a  data-toggle="collapse" data-target="#pncomment" href="javascript:void(0)" title="Liên hệ"><i class="fa fa-fw fa-support"></i>Bình luận<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pncomment" class="collapse <%=cssselect("comment") %>">
                         <li<%=checkrole("771") %>><a href="<%=weburl %>admin/?mod=comment&c=items" title="Danh sách bình luận"><i class="fa fa-fw fa fa-caret-right"></i>Danh sách bình luận</a></li>
                        <li<%=checkrole("772") %>><a href="<%=weburl %>admin/?mod=comment&c=setting" title="Cấu hình"><i class="fa fa-fw fa fa-caret-right"></i>Cấu hình</a></li>
                    </ul>
                </li>
                 <li<%=checkrole("104") %>><a href="<%=weburl%>admin/?mod=members"><i class="fa  fa-user"></i>Thành viên</a></li>
               <li<%=checkrole("100") %>><a  data-toggle="collapse" data-target="#pnintegrated" href="javascript:void(0)" title="Tích hợp"><i class="fa fa-tasks"></i>Tích hợp<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pnintegrated" class="collapse <%=cssselect("integrated") %>">
                          <li<%=checkrole("1001") %>><a href="<%=weburl %>admin/?mod=integrated&c=seo" title="Tích hợp SEO"><i class="fa fa-fw fa fa-caret-right"></i>Tích hợp SEO</a></li>
                                                      <li<%=checkrole("1004") %>><a href="<%=weburl %>admin/?mod=integrated&c=analytics" title="Tích hợp Google Analytics"><i class="fa fa-fw fa fa-caret-right"></i>Tích hợp Google Analytics</a></li>
                             <li<%=checkrole("1004") %>><a href="<%=weburl %>admin/?mod=integrated&c=mastertool" title="Tích hợp Google Master Tool"><i class="fa fa-fw fa fa-caret-right"></i>Tích hợp Google Master Tool</a></li>
                                 <li<%=checkrole("1001") %>><a href="<%=weburl %>admin/?mod=integrated&c=redirect301" title="Chuyển hướng 301"><i class="fa fa-fw fa fa-caret-right"></i>Chuyển hướng 301</a></li>
                        <li<%=checkrole("1002") %>><a href="<%=weburl %>admin/?mod=integrated&c=facebook" title="Tích hợp Facebook"><i class="fa fa-fw fa fa-caret-right"></i>Tích hợp Facebook Fanpage</a></li>
                        <li<%=checkrole("1003") %>><a href="<%=weburl %>admin/?mod=integrated&c=livechat" title="Tích hợp Livechat"><i class="fa fa-fw fa fa-caret-right"></i>Tích hợp Livechat</a></li>
                        <li<%=checkrole("1005") %>><a href="<%=weburl %>admin/?mod=integrated&c=social" title="Tích hợp mạng xã hội"><i class="fa fa-fw fa fa-caret-right"></i>Tích hợp mạng xã hội</a></li>
                        <li><a href="<%=weburl %>admin/?mod=integrated&c=error" title="Nội dung trang lỗi"><i class="fa fa-fw fa fa-caret-right"></i>Nội dung trang lỗi</a></li>
                    </ul>
                </li>
              <li<%=checkrole("101") %>><a  data-toggle="collapse" data-target="#pnutilities" href="javascript:void(0)" title="Tiện ích"><i class="fa fa-fw fa-globe"></i>Tiện ích<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pnutilities" class="collapse <%=cssselect("utilities") %>">
                         <li<%=checkrole("1011") %>><a href="<%=weburl %>admin/?mod=utilities&c=supports" title="Hỗ trợ trực tuyến"><i class="fa fa-fw fa fa-caret-right"></i>Hỗ trợ trực tuyến</a></li>
                        <li<%=checkrole("1012") %>><a href="<%=weburl %>admin/?mod=utilities&c=emailregister" title="Đăng ký nhận khuyến mại"><i class="fa fa-fw fa fa-caret-right"></i>Đăng ký email</a></li>
                        <%--<li><a href="<%=weburl %>admin/?mod=utilities&c=positionsadvs" title="Quản lý quảng cáo"><i class="fa fa-fw fa fa-caret-right"></i>Quản lý vị trí quảng cáo</a></li>--%>
                        <li<%=checkrole("1013") %>><a href="<%=weburl %>admin/?mod=utilities&c=advs" title="Quản lý quảng cáo"><i class="fa fa-fw fa fa-caret-right"></i>Quản lý quảng cáo</a></li>
                        <li<%=checkrole("1014") %>><a  href="<%=weburl %>admin/?mod=utilities&c=weblinks" title="Quản lý liên kết"><i class="fa fa-fw fa fa-caret-right"></i>Quản lý liên kết</a></li>
                        <%--<li><a  href="<%=weburl %>admin/?mod=utilities&c=survey" title="Thăm dò ý kiến"><i class="fa fa-fw fa fa-caret-right"></i>Thăm dò ý kiến</a></li>--%>
                        <li<%=checkrole("1015") %>><a href="<%=weburl %>admin/?mod=utilities&c=independent" title="Nội dung độc lập"><i class="fa fa-fw fa fa-caret-right"></i>Nội dung độc lập</a></li>
                    </ul>
                </li>
                
              
               <li<%=checkrole("102") %>><a  data-toggle="collapse" data-target="#pnaccounts" href="javascript:void(0)" title="Tài khoản"><i class="fa fa-fw fa-users"></i>Tài khoản<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pnaccounts" class="collapse <%=cssselect("accounts") %>">
                        <li<%=checkrole("1021") %>><a href="<%=weburl %>admin/?mod=accounts&c=items" title="Danh sách tài khoản"><i class="fa fa-fw fa fa-caret-right"></i>Danh sách tài khoản</a></li>
                        <li<%=checkrole("1022") %>><a href="<%=weburl %>admin/?mod=accounts&c=roles" title="Định nghĩa quyền"><i class="fa fa-fw fa fa-caret-right"></i>Định nghĩa quyền</a></li>
                        <li<%=checkrole("1023") %>><a href="<%=weburl %>admin/?mod=accounts&c=history" title="Lịch sử truy cập"><i class="fa fa-fw fa fa-caret-right"></i>Lịch sử truy cập</a></li>
                    </ul>
                </li>
                     <li<%=checkrole("105") %>><a href="<%=weburl%>admin/?mod=report"><i class="fa fa-bar-chart"></i>Báo cáo</a></li>
               <%--<li><a  data-toggle="collapse" data-target="#pnsys" href="javascript:void(0)" title="Tài khoản"><i class="fa fa-fw fa fa-gears"></i>Hệ thống<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="pnsys" class="collapse <%=cssselect("sys") %>">
                         <li><a href="<%=weburl %>admin/?mod=sys&c=module" title="Module"><i class="fa fa-fw fa fa-caret-right"></i>Module</a></li>
                        <li><a href="<%=weburl %>admin/?mod=sys&c=design" title="Giao diện"><i class="fa fa-fw fa fa-caret-right"></i>Giao diện</a></li>
                    </ul>
                </li>--%>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
    <div id="page-wrapper">
        <asp:PlaceHolder ID="phcontrol" runat="server"></asp:PlaceHolder>
    </div>
</div>
