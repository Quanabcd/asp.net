<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_doitac.ascx.cs" Inherits="home_advs_u_doitac" %>
<div class="content_row row vc_row wpb_row  alt-style-1 fullwidth border_grid fixed_heights animate-cols" style="background-color: #e1e1e1;">
    <div class="content_row_wrapper  align-contents content-align-middle default">
        <div class="vc_col-sm-12 wpb_column vc_column_container">
            <div class="wpb_wrapper">
                <div class="rt_heading_wrapper style-4" style="padding-top: 1px; padding-bottom: 1px;">
                    <h3 class="rt_heading  heading-font style-4" style="font-size: 28px; color: #0a0a0a;"><%=WEB.Common.Getlabel("lb_title_partner","ĐỐI TÁC TIÊU BIỂU",WEB.Common.Lang )%> </h3>
                </div>
                <div class="content_row row vc_row wpb_row vc_inner  global-style">
                    <div class="content_row_wrapper">
                        <asp:Repeater ID="rpitems" runat="server">
                            <ItemTemplate>
                                <div class="vc_col-sm-4 wpb_column vc_column_container">
                                    <div class="wpb_wrapper">
                                        <div class="wpb_single_image wpb_content_element vc_align_left">
                                            <figure class="wpb_wrapper vc_figure">
                                                <div class="vc_single_image-wrapper vc_box_border_grey">
                                                    <img width="500" height="226" src="/uploads/qc/<%#Eval("vcontent") %>" class="vc_single_image-img attachment-full" alt=""<%#Eval("vtitle") %> />
                                                </div>
                                            </figure>
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
