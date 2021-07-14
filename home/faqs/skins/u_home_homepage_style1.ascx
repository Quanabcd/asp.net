<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_home_homepage_style1.ascx.cs" Inherits="home_faqs_u_home_homepage_style1" %>
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
        <div id="center_column" class="col-sm-8 col-md-8">
          <div class="page-wrap">
          
               <asp:PlaceHolder ID="phcontrol" runat="server"></asp:PlaceHolder>
              </div>
            </div>
          <div id="right_column" class="col-sm-4">
       
               <asp:PlaceHolder ID="phright" runat="server"></asp:PlaceHolder>
            
            </div>
      
        </div>
  
</div>
    </section>
    </main>

		
