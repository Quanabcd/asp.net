<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_files_cate.ascx.cs" Inherits="home_news_default_u_files_cate" %>
<div class="block-cates">
  
         <div id="posts" class="small-thumbs">
                    <asp:Repeater ID="rpitems" runat="server">
                        <ItemTemplate>
                           

					

					<div class="entry">
						
							
							
							
						<div class="col-md-3">
							<a href="/thu-vien-tai-lieu/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>" data-lightbox="image"><img class="image_fade"  src="<%=weburl%>uploads/files/images/<%#Eval("vimg")%>" alt="<%#Eval("vtitle") %>"></a>
						</div>
						<div class="col-md-9">
							<div class="entry-title">
								<h2><a href="/thu-vien-tai-lieu/<%#Eval("valias") %>" title="<%#Eval("vtitle") %>"><%#Eval("vtitle") %></a></h2>
							</div>
							<ul class="entry-meta clearfix">
								<li><i class="icon-calendar3"></i><%#Convert.ToDateTime(Eval("dcreatedate")).ToString("dd/MM/yyyy") %></li>
								
							</ul>
							<div class="entry-content">
								  <p><%#WEB.Common.Cutleft(Eval("vdesc").ToString(),200) %></p>
								<a href="/thu-vien-tai-lieu/<%#Eval("valias") %>" title="<%#WEB.Common.Getlabel("lb_xemtiep", "Xem tiếp", WEB.Common.Lang) %>" class="more-link"><%#WEB.Common.Getlabel("lb_xemtiep", "Xem tiếp", WEB.Common.Lang) %>  </a>
							</div>
						</div>
                        <div class="clearfix"></div>
					</div>
					
					
                        </ItemTemplate>
                    </asp:Repeater>
                    <p class='d_page'>
                        <asp:Literal ID="ltpage" runat="server"></asp:Literal></p>
         </div>
    </div>