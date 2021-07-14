<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_search_box.ascx.cs" Inherits="home_rooms_untils_u_search_box" %>
<div class="block-check-booking-form-box">
        <table>
            <tr>
                <td>Địa điểm: <asp:DropDownList ID="ddllocation" Width="160" runat="server"></asp:DropDownList></td>
                <td>Từ ngày: <asp:TextBox ID="txtfrom" Width="130" runat="server"></asp:TextBox></td>
                <td>Đến ngày: <asp:TextBox ID="txtto" Width="130" runat="server"></asp:TextBox></td>
                <td><asp:Button ID="btncheck" runat="server" Text="Tìm kiếm" OnClick="btncheck_Click" /></td>
            </tr>
        </table>
    </div>