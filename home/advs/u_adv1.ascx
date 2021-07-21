<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_adv1.ascx.cs" Inherits="home_advs_u_adv1" %>
<div class="content_row row vc_row wpb_row  default-style fullwidth" style="background-color: #f57d27;">
    <div class="content_row_wrapper  fullwidth" style="padding-top: 2px; padding-bottom: 3px;">
        <div class="vc_col-sm-12 wpb_column vc_column_container">
            <div class="wpb_wrapper">
            </div>
        </div>

    </div>
</div>
<div class="content_row row vc_row wpb_row  default-style fullwidth border_grid fixed_heights animate-cols" style="background-color: #ffffff;">
    <div class="content_row_wrapper  align-contents content-align-middle default">
        <div class="vc_col-sm-12 wpb_column vc_column_container">
            <div class="wpb_wrapper">
                <div class="vc_empty_space" style="height: 30px"><span class="vc_empty_space_inner"></span></div>
                <div class="rt_heading_wrapper style-7" style="padding-top: 0px; padding-bottom: 0px;">
                    <h3 class="rt_heading  aligncenter heading-font style-7" style="font-size: 28px; color: #0a0a0a;"><%=TN.Common.GetLabel("lb_cacsanpham","CÁC SẢN PHẨM CỦA CHÚNG TÔI",WEB.Common.Lang) %></h3>
                </div>
                <div class="rt_divider style-6 " style="border-color: #dd8c11;"></div>
                <div class="content_row row vc_row wpb_row vc_inner  default-style" style="background-color: #ffffff;">

                    <div class="content_row_wrapper  align-contents content-align-middle ">

                        <asp:Repeater ID="rpitems" runat="server">
                            <ItemTemplate>
                                <div class="vc_col-sm-6 wpb_column vc_column_container">
                                    <div class="wpb_wrapper">
                                        <div class="wpb_text_column wpb_content_element ">
                                            <div class="wpb_wrapper">
                                                <p>
                                                    <a href="<%#Eval("vparam4") %>" title="<%#Eval("vtitle") %>">
                                                        <img loading="lazy" class="alignleft wp-image-3507 size-thumbnail" src="/uploads/qc/<%#Eval("vcontent") %>" alt="<%#Eval("vtitle") %>" width="150" height="150" srcset="https://emg.vn/wp-content/uploads/2019/04/ICON-03-150x150.png 150w, https://emg.vn/wp-content/uploads/2019/04/ICON-03-300x300.png 300w, https://emg.vn/wp-content/uploads/2019/04/ICON-03.png 500w" sizes="(max-width: 150px) 100vw, 150px" /></a>
                                                </p>
                                                <p style="text-align: justify;">
                                                    <span style="font-size: 14pt;"><strong>
                                                        <br />
                                                        <span style="color: #000000;"><a style="color: #000000;" href="<%#Eval("vparam4") %>" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a></span></strong></span><br />
                                                    <span style="font-size: 14pt;"><%#Eval("vdesc") %></span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
