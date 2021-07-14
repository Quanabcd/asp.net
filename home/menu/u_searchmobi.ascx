<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_searchmobi.ascx.cs" Inherits="home_menu_u_searchmobi" %>
<div class="search_mobile col-md-12">
    <div class="search_box">
        <div class="search_wrapper">
           <asp:TextBox ID='txt_search' CssClass="index_input_search" placeholder="Nhập từ khóa tìm kiếm" runat='server'></asp:TextBox>
            <asp:LinkButton  ID='lk_search' runat='server' CssClass='btn_search_submit btn' OnClick='lk_search_Click'><span><i class="fa fa-search"></i></span></asp:LinkButton>
        </div>
    </div>
</div>
