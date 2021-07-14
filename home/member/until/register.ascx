<%@ Control Language="C#" AutoEventWireup="true" CodeFile="register.ascx.cs" Inherits="home_member_register" %>
<div class="cartblock">
<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="account-create">
							<div class="page-title">
								<h1 class="ttm"><%=WEB.Common.Getlabel("lt_titleregister", "Đăng ký tài khoản", lan) %></h1>
							</div>
			<p style="color:red" class="messerror">
<asp:Literal ID="ltmess" runat="server"></asp:Literal>
                </p>				
							
							
								<div class="row">
									<div class="frm-register">
										<div class="fieldset">
										
											<ul class="form-list">
												<li class="fields">
															<div class="input-box">
                                                                <asp:TextBox ID="txtname" placeholder="Họ và tên" runat="server" CssClass="form-control"></asp:TextBox>
															</div>
													
												</li>
												<li>
													<div class="input-box">
														 <asp:TextBox ID="txtemail"  placeholder="Email" runat="server" CssClass="form-control"></asp:TextBox>
													</div>
												</li>
												<li>
													<div class="input-box">
														 <asp:TextBox ID="txtpass"  placeholder="Mật khẩu" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
													</div>
												</li>
                                                <li>
													<div class="input-box">
														 <asp:TextBox ID="txtrepass" placeholder="Nhập lại mật khẩu" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
													</div>
												</li>
												<li>
													<div class="buttons-set">
														<div class="action_bottom">
                                                            <asp:Button ID="btnregister" OnClick="btnregister_Click" runat="server" CssClass=" btnregister" Text="Đăng ký tài khoản" />
																	
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>

							
						</div>
					</div>
				</div>
			</div></div>