<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_counter.ascx.cs" Inherits="home_untilities_counter_u_counter" %>
<div class='blocktk'>
    
            <div class='tab_tc'><%=WEB.Common.Getlabel("lb_thongke","Thống kê",lang) %></div>
    
                <div class='d_counter'>
                    <ul>
                        <li class="lionline"><%=WEB.Common.Getlabel("lb_dangonline","Online",lang) %>: <span><asp:Literal ID="ltonline" runat="server"></asp:Literal></span></li>
                        <li  class="licday"><%=WEB.Common.Getlabel("lb_truycaphomnay","Hôm nay",lang) %>: <span><asp:Literal ID="lttoday" runat="server"></asp:Literal></span></li>
                        <li  class="licyes"><%=WEB.Common.Getlabel("lb_truycaphomqua","Hôm qua",lang) %>: <span><asp:Literal ID="ltyesterday" runat="server"></asp:Literal></span></li>
                        <li class="licmonth"><%=WEB.Common.Getlabel("lb_truycaptrongthang","Trong tháng",lang) %>: <span><asp:Literal ID="ltcountinmonth" runat="server"></asp:Literal></span></li>
                        <li class="lictotal"><%=WEB.Common.Getlabel("lb_tongtruycap","Tổng",lang) %>: <span><asp:Literal ID="lttotal" runat="server"></asp:Literal></span></li>
                    </ul>
                   </div>
            
               
</div>