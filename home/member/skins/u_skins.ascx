<%@ Control Language="C#"%>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        string c = "";
        c = WEB.Common.GeturlParam("c");
        switch (c)
        {
            case "login":
                WEB.Layout.LoadControlToPlaceholder(ref phmain, "~/home/member/until/login.ascx");
                break;
            case "reg":
                WEB.Layout.LoadControlToPlaceholder(ref phmain, "~/home/member/until/register.ascx");
                break;
            case "info":
                WEB.Layout.LoadControlToPlaceholder(ref phmain, "~/home/member/until/info.ascx");
                break;
            case "wishlist":
                WEB.Layout.LoadControlToPlaceholder(ref phmain, "~/home/member/until/wishlist.ascx");
                break;
            case "order":
                WEB.Layout.LoadControlToPlaceholder(ref phmain, "~/home/member/until/order.ascx");
                break;
            case "forgetpass":
                WEB.Layout.LoadControlToPlaceholder(ref phmain, "~/home/member/until/forgetpass.ascx");
                break;
            case "logout":
                WEB.Layout.LoadControlToPlaceholder(ref phmain, "~/home/member/until/logout.ascx");
                break;
            default:
                WEB.Layout.LoadControlToPlaceholder(ref phmain, "~/home/member/until/login.ascx");
                break;
        }
    }
</script>
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
        <div id="center_column" class="col-sm-12 col-md-12">
          <div class="page-wrap">
               <asp:PlaceHolder ID="phmain" runat="server"></asp:PlaceHolder>
              </div>
            </div>
        </div>
</div>
    </section>
    </main>
