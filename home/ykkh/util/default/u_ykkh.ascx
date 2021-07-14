<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_ykkh.ascx.cs" Inherits="home_contact_util_default_u_ykkh" %>
<asp:TextBox Visible="false" ID="txtaddress" runat="server" CssClass="form-control"></asp:TextBox>
<asp:TextBox Visible="false" ID="txtphone" runat="server" CssClass="form-control"></asp:TextBox>
<asp:TextBox Visible="false" ID="txttitle" runat="server" CssClass="form-control"></asp:TextBox>

<div class="container contact">
    <div class="row">
        <div class="col-md-3 col-md-push-9">
            <div class="widget-item info-contact in-fo-page-content">
                <asp:Literal ID="ltcontent" runat="server"></asp:Literal>
            </div>
        </div>
        <div class="col-md-9 col-md-pull-3">
            <div class="page-login">
                <div id="login">
                    <h1 class="title-head"><%=WEB.Common.Getlabel("lb_title_clientes_contact","Comentarios de los clientes",WEB.Common.Lang )%></h1>
                    <span class="margin-bottom-10 block"><%=WEB.Common.Getlabel("lb_title_clientes_contact_desc","Complete el siguiente formulario y envíenoslo. Publicaremos sus comentarios después de la recepción.",WEB.Common.Lang )%></span>
                    <div>
                        <div class="form-signup clearfix">
                            <div class="row">
                                <div class="col-lg-12">
                                    <p>
                                        <asp:Literal ID="ltmess" runat="server"></asp:Literal>
                                    </p>
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <fieldset class="form-group">
                                        <label><%=WEB.Common.Getlabel("lb_title_clientes_name","Nombre",WEB.Common.Lang )%><span class="required">*</span></label>
                                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control  form-control-lg"></asp:TextBox>
                                    </fieldset>
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <fieldset class="form-group">
                                        <label><%=WEB.Common.Getlabel("lb_title_clientes_images","Picture",WEB.Common.Lang )%><span class="required">*</span></label>
                                        <asp:FileUpload ID="flupload" runat="server" Style="border: 0; padding: 0; margin-top: 7px;" />
                                    </fieldset>
                                </div>
                                <div class="col-sm-12 col-xs-12">
                                    <fieldset class="form-group">
                                        <label><%=WEB.Common.Getlabel("lb_title_clientes_descs","Descripción",WEB.Common.Lang )%><span class="required">*</span></label>
                                        <asp:TextBox ID="txtcontent" TextMode="MultiLine" Rows="5" Columns="40" runat="server" CssClass="form-control form-control-lg"></asp:TextBox>
                                    </fieldset>
                                    <div class="pull-xs-left" style="margin-top: 20px;">
                                        <asp:Button ID="btnsend" runat="server" CssClass="btn btn-blues btn-style btn-style-active"
                                            OnClick="btnsend_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="box-maps" style="margin-top: 20px;">
    <asp:Literal ID="lt_maps" runat="server"></asp:Literal>
</div>
