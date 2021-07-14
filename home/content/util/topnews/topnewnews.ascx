<%@ Control Language="C#" AutoEventWireup="true" CodeFile="topnewnews.ascx.cs" Inherits="home_news_topnews_topnewnews" %>
<div class='tab'>
    <div class='tab_tl'>
        <div class='tab_tr'>
            <div class='tab_tc'>Tin tức mới</div>
        </div>
    </div>
    <div class='tab_cl'>
        <div class='tab_cr'>
            <div class='tab_cc'>
                <div class="top_news">
                                            <asp:Repeater ID="rpitems" runat="server">
                                                <ItemTemplate>
                                                        <a class="item_news" href='<%#Getlink(Eval("vparam6").ToString(),Eval("valias").ToString())%>'>
                                                            <img src='<%=weburl%>uploads/news/<%#Eval("vimg")%>' alt='<%#Eval("vtitle") %>'/>
                                                            <%#Eval("vtitle") %>
                                                            <span>Xem thêm</span>
                                                        </a>  
                                                </ItemTemplate>
                                            </asp:Repeater>
                                    
                                        
                </div>  
               </div>
        </div>
    </div>
    <div class='tab_bl'>
        <div class='tab_br'>
            <div class='tab_bc'></div>
        </div>
    </div>
               
</div>