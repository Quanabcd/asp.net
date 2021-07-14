<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_search.ascx.cs" Inherits="home_menu_u_search" %>
<div class="col-lg-6 col-md-5 col-sm-4 hidden-xs">
    <div class="search_box">
        <div class="search_wrapper">
            <asp:TextBox ID='txt_search' CssClass="index_input_search" runat='server'></asp:TextBox>
            <asp:Button ID="lk_search" type="button" Text="Tìm ngay" CssClass="btn_search_submit btn " runat="server" OnClick='lk_search_Click'></asp:Button>
        </div>
    </div>
</div>
