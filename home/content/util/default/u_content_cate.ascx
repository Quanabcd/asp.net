<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_content_cate.ascx.cs" Inherits="home_news_default_u_news_cate" %>
<div class="content_row row vc_row wpb_row  default-style fullwidth has-bg-overlay has-bg-image" style="background-image: url('<%=img%>'); background-repeat: repeat; background-size: cover; background-attachment: scroll; background-position: center top;">
    <div class="content_row_wrapper  fullwidth" style="padding-top: 300px; padding-bottom: 300px;">
        <div class="vc_col-sm-12 wpb_column vc_column_container">
            <div class="wpb_wrapper">

                <div class="wpb_text_column wpb_content_element wpb_animate_when_almost_visible wpb_fadeInUpBig fadeInUpBig wpb_start_animation animated">
                    <div class="wpb_wrapper">
                        <h1 title="tin tức" class="page-heading" style="text-align: center; color: #ffffff;">
                            <asp:Literal ID="ltname" runat="server"></asp:Literal>
                        </h1>

                    </div>
                </div>

            </div>
        </div>

    </div>
</div>
<div class="content_row row vc_row wpb_row  default-style fullwidth border-bottom">

    <div class="content_row_wrapper  align-contents content-align-middle nopadding default">
        <div class="vc_col-sm-12 wpb_column vc_column_container">
            <div class="wpb_wrapper">
                <div class="vc_empty_space" style="height: 15px"><span class="vc_empty_space_inner"></span></div>
                <asp:Repeater ID="rpcontent" runat="server">
                    <ItemTemplate>
                        <div class="rt_heading_wrapper style-4">
                            <h2 class="rt_heading  style-4"><%#Eval("vtitle") %></h2>
                        </div>
                        <div class="content_row row vc_row wpb_row vc_inner  global-style">
                            <%#Eval("vcontent") %>
                            <div class="content_row_wrapper  " style="padding-left: 80px; padding-right: 80px;">
                                <div class="vc_col-sm-6 wpb_column vc_column_container">
                                    <div class="wpb_wrapper">

                                        <div class="wpb_text_column wpb_content_element ">
                                            <div class="wpb_wrapper">
                                                <p style="text-align: justify;"><strong>EMG Education</strong> là một trong những tổ chức giáo dục tư nhân lớn nhất Việt Nam với sứ mệnh mang tới cho người học trên mọi miền tổ quốc cơ hội và hành trang để gặt hái thành công trên trường thế giới.</p>

                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="vc_col-sm-6 wpb_column vc_column_container">
                                    <div class="wpb_wrapper">

                                        <div class="wpb_text_column wpb_content_element ">
                                            <div class="wpb_wrapper">
                                                <p style="text-align: justify;">Thành lập vào năm 2005, <strong>EMG Education</strong> luôn là đơn vị dẫn đầu trong ngành giáo dục Việt Nam với các giải pháp sáng tạo, mang đến cho người học tại Việt Nam những chương trình học và tài liệu học thuật có chất lượng tốt nhất trên thế giới cũng như các bằng cấp được công nhận trên toàn cầu.</p>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="vc_empty_space" style="height: 40px"><span class="vc_empty_space_inner"></span></div>
                <div class="content_row row vc_row wpb_row vc_inner  global-style">
                    <div class="content_row_wrapper  ">
                        <asp:Repeater ID="rpitemsqc" runat="server">
                            <ItemTemplate>
                                <div class="vc_col-sm-4 wpb_column vc_column_container">
                                    <div class="wpb_wrapper">

                                        <div class="wpb_single_image wpb_content_element vc_align_center">

                                            <figure class="wpb_wrapper vc_figure">
                                                <div class="vc_single_image-wrapper vc_box_border_grey">
                                                    <img width="150" height="150" src="/uploads/qc/<%#Eval("vcontent") %>" class="vc_single_image-img attachment-medium" alt="<%#Eval("vtitle") %>" />
                                                </div>
                                            </figure>
                                        </div>
                                        <h6 style="font-size: 20px; text-align: center" class="vc_custom_heading wpb_animate_when_almost_visible wpb_fadeInUp fadeInUp wpb_start_animation animated"><%#Eval("vtitle") %></h6>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="vc_empty_space" style="height: 40px"><span class="vc_empty_space_inner"></span></div>
            </div>
        </div>

    </div>
</div>
<asp:Literal ID="ltitems" runat="server"></asp:Literal>
<div class='d_page'>
    <asp:Literal ID="ltpage" runat="server"></asp:Literal>
</div>
<asp:Repeater ID="rpitems" runat="server">
    <ItemTemplate>
        <div class="content_row row vc_row wpb_row  default-style fullwidth has-bg-image" style="background-image: url('/uploads/<%#Eval("vparam2")%>'); background-repeat: repeat; background-size: cover; background-attachment: scroll; background-position: left bottom; background-color: #ffffff;">

            <div class="content_row_wrapper  align-contents content-align-middle default" style="padding-top: 50px; padding-bottom: 50px;">
                <div class="vc_col-sm-3 wpb_column vc_column_container">
                    <div class="wpb_wrapper">
                        <div class="content_row row vc_row wpb_row vc_inner  global-style">

                            <div class="content_row_wrapper  ">
                                <div class="vc_col-sm-12 wpb_column vc_column_container">
                                    <div class="wpb_wrapper">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="vc_col-sm-6 wpb_column vc_column_container">
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element wpb_animate_when_almost_visible wpb_zoomIn zoomIn wpb_start_animation animated">
                            <div class="wpb_wrapper">
                                <%#Eval("vcontent")%>
                                <p style="text-align: justify;"><span style="color: #ffffff;">Là một tập thể luôn lấy sự sáng tạo và chất lượng làm kim chỉ nam cùng với bề dày kinh nghiệm và thành công đã được minh chứng trong công tác phát triển chương trình giáo dục và các dịch vụ kiểm tra đánh giá, EMG Education sẽ tiếp tục hợp tác chặt chẽ với các đối tác uy tín trong nước và trên toàn thế giới nhằm mang đến những thành công lớn hơn nữa cho các học sinh và trường học tại Việt Nam.</span></p>
                                <p style="text-align: center;"><span style="color: #f57d27;"><span style="color: #ffffff;">EMG Education có trụ sở tại&nbsp;<a style="color: #ffffff;" href="https://goo.gl/maps/xWxN4HaCF8P2" target="_blank" rel="noopener noreferrer nofollow">TP. Hồ Chí Minh</a>&nbsp;và&nbsp;<a style="color: #ffffff;" href="https://goo.gl/maps/EpyYieV6Dxj" target="_blank" rel="noopener noreferrer nofollow">Hà Nội</a>.</span></span></p>

                            </div>
                        </div>
                        <div class="wpb_single_image wpb_content_element vc_align_center wpb_animate_when_almost_visible wpb_flipInX flipInX wpb_start_animation animated">
                            <figure class="wpb_wrapper vc_figure">
                                <%=imglang%>
                            </figure>
                        </div>
                    </div>
                </div>

                <div class="vc_col-sm-3 wpb_column vc_column_container">
                    <div class="wpb_wrapper">
                    </div>
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

