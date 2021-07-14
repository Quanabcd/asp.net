<%@ control language="C#" autoeventwireup="true" inherits="admin_logs_logs, App_Web_u0cwcr4d" %>
<div class="widget">

    <div class="widget-title">
   
        <div class="widget-title">
            <h4><i class="icon-reorder">
                <asp:Literal ID="lttitle" runat="server"></asp:Literal></i></h4>
            <div class="ui-widget-content ui-corner-top ui-corner-bottom">
                <div id="toolbox">

                    <div style="float: right; margin-right: 10px;" class="toolbox-content">

                       

                    </div>
                </div>
            </div>
        </div>
        <%----//----%>
        <%--Content-products--%>
        <div class="widget-body">
		<div id="element-box">
			
			<div class="m">
			<div id="adminForm1">
		<div class="page-items">
                    <asp:Literal ID="ltpage" runat="server"></asp:Literal>
                </div>
                <asp:Repeater ID="rpitems" runat="server" >
                <HeaderTemplate>
			    <table cellpadding="1" summary="" class="adminlist">
			        <thead>
				        <tr>
					        <th width="2%" class="title">#</th>
					        <th width="3%" class="title">
						        <input type="checkbox" id="chkToggle" onclick="selectAll(this)" value="" name="chkToggle">
					        </th>
					        <th class="title">
						        Tên người dùng
					        </th>
					        <th width="55%" class="title">
						        Hành động
					        </th>
        					
					        <th width="15%" class="title">
						        Thời gian
					        </th>
					        
					        <th width="5%" nowrap="nowrap" class="title">
						        ID
					        </th>
				        </tr>
			        </thead>
			    
			    </HeaderTemplate>
			    <ItemTemplate>
			        <tbody>
								    <tr class="row0">
					    <td align="center"><%#Eval("rowindex")%></td>
					    <td align="center">
						    <input type="checkbox" onclick="isChecked(this.checked);" value="<%#Eval("ilog") %>" id='cb_' name='cb_'>
					    </td>
					    <td>
						  
                                      <%#Eval("user_log")%>
					    </td>
					    <td align="left"><%#Eval("action_log")%></td>
    				
					    
					    <td align="center"><%#formatdate(Convert.ToDateTime( Eval("time_log").ToString()))%></td>
					    <td align="center"><%#Eval("ilog")%></td>
				    </tr>
				    </tbody>
		        </ItemTemplate>
		        <FooterTemplate>
			        </table>
			    </FooterTemplate>
			    </asp:Repeater>
			 <div class="page-items">
                    <asp:Literal ID="lt_pagebotom" runat="server"></asp:Literal>
                </div>
			
			</div>
			<div class="clr"></div>
			</div>
			
   		</div>
   	 </div>
        <%--//--%>
    </div>
</div>
