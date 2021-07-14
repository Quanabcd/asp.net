<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_faq_form.ascx.cs" Inherits="home_contact_u_faq_form" %>


              <div class="box hoidap">
    <div class="box-title">
        <h3><%=WEB.Common.Getlabel("lb_cauhoimoi", "Câu hỏi mới", WEB.Common.Lang) %></h3>
    </div>
                    <p class="c_mess">
                    <asp:Literal ID="ltmess" runat="server"></asp:Literal></p>
                
                   
                    <div>
                        <p style="display: none; color: red"></p>
                        <div class="row">
                            <div class="col-sm-12">
                                <asp:TextBox ID="txtname" runat="server" placeholder="Họ và tên" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-12">
                             <asp:TextBox ID="txtemail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-12">
                                <asp:TextBox ID="txtphone" runat="server" placeholder="Số điện thoại" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-12">
                               <asp:TextBox ID="txtcontent"  placeholder="Nội dung câu hỏi" TextMode="MultiLine" Rows="5" Columns="40" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <p>
                             <asp:Button ID="btnsend" runat="server" CssClass="btn btn-secondary"
                                Text=" Gửi câu hỏi " OnClick="btnsend_Click" />
                           
                        </p>
                    </div>
                </div>

           