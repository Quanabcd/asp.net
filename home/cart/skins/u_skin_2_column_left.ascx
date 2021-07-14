<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_skin_2_column_left.ascx.cs" Inherits="home_rooms_skins_u_skin_2_column_left" %>
<main class="main-content" role="main">
<section id="columns" class="columns-container">
<div class="container">
    <div id="breadcrumbs">     
        <nav role="navigation" aria-label="breadcrumbs">
          <ol class="breadcrumb" itemscope="" itemtype="http://schema.org/BreadcrumbList">
           
           <asp:Literal ID="ltroadlink" runat="server"></asp:Literal>
          </ol>
        </nav>  
    </div>
    <div class="row">
      
          <div class="page-wrap">
      
               <asp:PlaceHolder ID="phcontrol" runat="server"></asp:PlaceHolder>
              </div>
            </div>
        
</div>
    </section>
    </main><link href="/templates/home/css/base.scss.css" rel="stylesheet" />