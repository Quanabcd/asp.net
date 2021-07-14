<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_home_homepage_style1.ascx.cs" Inherits="home_homepage_u_home_homepage_style1" %>
<div class="container">
<div class='block-c'>
<div class="breadcrumb">
    <asp:Literal ID="ltroadlink" runat="server"></asp:Literal>
</div>

      
        <!--end .col-sm-4 col-xs-12 side-collection-left-->
        <div class="col-md-9 col-sm-8 col-xs-12  no-padding-left">
            <div class="block-cc"> <div class="block-cc-t"><h1><asp:Literal ID="ltname" runat="server"></asp:Literal></h1> </div> <div class="block-cc-c"> 
            <asp:PlaceHolder ID="phcontrol" runat="server"></asp:PlaceHolder>
                </div>
                </div>
        </div>
  <div class="col-md-3 col-sm-4 col-xs-12  no-padding-right">
            <asp:PlaceHolder ID="phleft" runat="server"></asp:PlaceHolder>
            <!--end .box-side-collection-->
        </div>
  <div class="clearfix"></div>
    </div></div>
        <!--end .col-sm-8 col-xs-12 side-collection-left-->
   
