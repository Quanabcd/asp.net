<%@ Control Language="C#" AutoEventWireup="true" CodeFile="setting.ascx.cs"  Inherits="admin_news_setting" %>

<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>--%>
<div id="toolbar-box">
				<div class="t"><div class="t"><div class="t"></div></div></div>
				<div class="m">
				<div id="toolbar" class="toolbar">
				<table summary="" class="toolbar">
				<tbody><tr>
					
					<td id="toolbar-save" class="button">
					
					<asp:LinkButton ID="lnkupdate" runat="server" CssClass="toolbar" OnClick="lnkupdate_Click" >
							<span title="Cập nhật" class="icon-32-save"></span>
							Cập nhật
							</asp:LinkButton>
					</td>
					
				</tr>
				</tbody></table>
				</div>
				<div class="header icon-48-langmanager"><asp:Literal ID="lttitle" runat="server"></asp:Literal></div>
				<div class="clr"></div>
			</div>
			<div class="b"><div class="b"><div class="b"></div></div></div>
  		</div>
   		<div class="clr"></div>
		<div id="element-box">
			<div class="t"><div class="t"><div class="t"></div></div></div>
			<div class="m">
			<div id="adminForm1">
			
			
			    <div class="col width-60">
						<fieldset class="adminform">
						<legend>Thông tin chi tiết</legend>
						<span class='detail_error'><asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal></span>
						<table cellspacing="1" class="admintable">
						<tbody>
						
						<tr>
							<td width="150" class="key">
								<label for="txttitle">Số tin tức mới</label>
							</td>
							<td>
								<asp:TextBox ID="txtnumnew" runat="server" Width="100" ></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td width="150" class="key">
								<label for="txttitle">Số tin tức nóng</label>
							</td>
							<td>
								<asp:TextBox ID="txtnumhot" runat="server" Width="100" ></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td width="150" class="key">
								<label for="txttitle">Số tin xem nhiều</label>
							</td>
							<td>
								<asp:TextBox ID="txtnumview" runat="server" Width="100" ></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td width="150" class="key">
								<label for="txttitle">Số tin tức mỗi trang danh mục</label>
							</td>
							<td>
								<asp:TextBox ID="txtperpage" runat="server" Width="100" ></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td width="150" class="key">
								<label for="txttitle">Số tin tức tìm kiếm</label>
							</td>
							<td>
								<asp:TextBox ID="txtnumsearch" runat="server" Width="100" ></asp:TextBox>
							</td>
						</tr>
						
						
						</tbody></table>
						</fieldset>
					</div>
					<div class="col width-40">
						<fieldset class="adminform">
						<legend>Cấu hình khác</legend>
						<table cellspacing="1" class="admintable">
						<tbody>
						
						
						
						</tbody></table>
						</fieldset>
						
						
					</div>
					<div class="clr"></div>
					<input type="hidden" value="" id="hndId" name="hndId">
			    
			
			<asp:HiddenField ID="hdid" runat="server" Visible="false" />
			<asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
			<asp:HiddenField ID="hdadvs_old" runat="server" Visible="false" />
			</div>
			<div class="clr"></div>
			</div>
			<div class="b"><div class="b"><div class="b"></div></div></div>
   		</div>
   		<%--</contenttemplate>
</asp:UpdatePanel>--%>