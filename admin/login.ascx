<%@ control language="C#" autoeventwireup="true" inherits="admin_login, App_Web_p021uiuk" %>
<link rel="stylesheet" href="../templates/admin/css/login.css" type="text/css" />
<link rel="stylesheet" href="../templates/admin/css/color.css" type="text/css" />
 <div class="page-container login-container">

    <!-- Page content -->
    <div class="page-content">

      <!-- Main content -->
      <div class="content-wrapper">

        <!-- Content area -->
        <div class="content">
            <div id="particles-js"></div>
          <!-- Advanced login -->
<div id="form-login">
  <div class="panel panel-body login-form">
      <div class="logo">
                <img src="/templates/admin/images/logo.png" title="hvsolutions" alt="hvsolutions" style="width: 263px;"> 
            </div>
    <div class="text-center">
        <h5 class="tta">Đăng nhập hệ thống</h5>
      <small class="display-block"><asp:Literal ID="ltmess" runat="server"></asp:Literal></small>
    </div>

    <div class="form-group has-feedback has-feedback-left">
        <asp:TextBox ID="txtuser" runat="server"  placeholder="Tài khoản" CssClass="form-control"></asp:TextBox>
      <div class="form-control-feedback">
        <i class="icon-user text-muted"></i>
      </div>
    </div>

    <div class="form-group has-feedback has-feedback-left">
         <asp:TextBox ID="txtpass" TextMode="Password" runat="server"  placeholder="Mật khẩu" CssClass="form-control"></asp:TextBox>
      <div class="form-control-feedback">
        <i class="icon-lock2 text-muted"></i>
      </div>
    </div>

    <div class="form-group login-options">
      <div class="row">
        <div class="col-sm-6">
          <label class="checkbox-inline hidden">
            <input type="checkbox" class="styled" checked="checked">
            Remember
          </label>
        </div>

        <div class="col-sm-6 text-right">
          <a href="?f=forgetpass"><i class="fa fa-lock m-r-5"></i> Quên mật khẩu?</a>
        </div>
      </div>
    </div>

    <div class="form-group">
     
        <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" CssClass="btn btnorange btn-block bt-login" Text="Đăng nhập" />
    </div>

    <p class="mess"></p>

   
    <span class="help-block text-center no-margin">Nếu bạn cần bất cứ sự trợ giúp nào hãy liên hệ với tư vấn của chúng tôi </span>
    <div class="text-center phelp form-group"><span class="text-bold text-warning"> <i class="icon-phone2"></i> 0243 994 5268 </span> <p class="text-center"><span>hoặc</span></p> <span class="text-bold text-warning"><i class="icon-phone2"></i> 0946 90 8382</span> </div>
  </div>
</div>


              <script src="/templates/admin/js/particles.js"></script>
    <script src="/templates/admin/js/app1.js"></script>

  
<!-- /advanced login -->          
          <!-- Footer -->
          <div class="footer text-muted1">
        Xây dựng và phát triển  bởi <a target="_blank" href="http://tamnghia.com">www.tamnghia.com </a>
          </div>
          <!-- /footer -->

        </div>
        <!-- /content area -->

      </div>
      <!-- /main content -->

    </div>
    <!-- /page content -->

  </div>