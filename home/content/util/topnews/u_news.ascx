<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_news.ascx.cs" Inherits="home_news_topnews_u_news" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<div class="Hiring_item">
			<div class="div_newstop_home"><h2>Tin mới nhất</h2></div>
            <div class="div_newstop_block">
               <asp:Repeater ID="rp_item" runat="server">
                   <ItemTemplate>
                    <div class="div_news_item_home">
                        <div style=" display:inline-block; width:100%;">
                            <div class="div_news_item_left_home">
                                <a href="<%=weburl%><%#WEB.Common.GetNewTitle(Eval("vtitle").ToString())%>"><%#getimg(Eval("vimg").ToString(),Eval("vtitle").ToString()) %></a>
                                <div style=" clear:both;"></div>
                            </div>
                            <div class="div_news_item_right_home">
                                 <a href="<%=weburl%><%#WEB.Common.GetNewTitle(Eval("vtitle").ToString())%>"><%#Cutleft(Eval("vtitle").ToString(),50) %></a>

                                <p class="desc"><%#Cutleft(Eval("vdesc").ToString(),200) %></p>
                                <div style=" clear:both;"></div>
                            </div>
                        </div>
                        <div style=" clear:both;"></div>
                    </div>
                   </ItemTemplate>
               </asp:Repeater>
            </div>
		</div>