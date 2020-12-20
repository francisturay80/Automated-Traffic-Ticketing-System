<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RoadTransportOffence.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="theme-color" content="#000000">
    <title>RTC</title>
    <meta name="description" content="Mobilekit HTML Mobile UI Kit">
    <meta name="keywords" content="bootstrap 4, mobile template, cordova, phonegap, mobile, html" />
    <link rel="icon" type="image/png" href="asset_mob/img/favicon.png" sizes="32x32">
    <link rel="apple-touch-icon" sizes="180x180" href="asset_mob/img/icon/192x192.png">
    <link rel="stylesheet" href="asset_mob/css/style.css">
    <link rel="manifest" href="__manifest.json">
</head>
<body class="bg-white">
    <form id="form1" runat="server">
      <!-- loader -->
  <%--  <div id="loader">
        <div class="spinner-border text-primary" role="status"></div>
    </div>--%>
    <!-- * loader -->


    <div id="appCapsule" class="pt-0">

        <div class="login-form mt-1">
            <div class="section">
                <img src="../assets/SLRSAL.png"  alt="image" class="form-image"/>
            </div>
            <div class="section mt-1">
                <h3>SLRSA</h3>
                <h4>Please Login</h4>
            </div>
            <div class="section mt-1 mb-5">
                 <asp:Label ID="lblMsg" runat="server" Style="color:  font-weight: 700; font-size: large;"></asp:Label>

                    <div class="form-group boxed">
                        <div class="input-wrapper">
                           
                            <asp:TextBox ID="Username" runat="server" Class="form-control" placeholder="User Name"></asp:TextBox>
                            <i class="clear-input">
                                <ion-icon name="close-circle"></ion-icon>
                            </i>
                        </div>
                    </div>

                    <div class="form-group boxed">
                        <div class="input-wrapper">
                           
                              <asp:TextBox ID="Password" runat="server" textmode="Password" Class="form-control" placeholder="Password"></asp:TextBox>
                            <i class="clear-input">
                                <ion-icon name="close-circle"></ion-icon>
                            </i>
                        </div>
                    </div>

                          <asp:Button ID="login" runat="server" Text="Login" class="btn btn-primary btn-block btn-lg" OnClick="login_Click"  />
                   <div class="form-links mt-2">
                     <%--   <div>
                            <a href="register.aspx">Register Now</a>
                        </div>--%>
<%--                        <div><a href="forgot-password.aspx" class="text-muted">Forgot Password?</a></div>--%>
                    </div>

                <asp:TextBox ID="LoginTime" runat="server" Visible="False"></asp:TextBox>
                                <asp:Label ID="lblDate" runat="server" Text="Date" Visible="False"></asp:Label>

                <%--</form>--%>
            </div>
            
        </div>
        
        
    </div>
        

   
    <!-- Jquery -->
    <script src="asset_mob/js/lib/jquery-3.4.1.min.js"></script>
    <!-- Bootstrap-->
    <script src="asset_mob/js/lib/popper.min.js"></script>
    <script src="asset_mob/js/lib/bootstrap.min.js"></script>
    <!-- Ionicons -->
    <script type="module" src="../../unpkg.com/ionicons%405.0.0/dist/ionicons/ionicons.js"></script>
    <!-- Owl Carousel -->
    <script src="asset_mob/js/plugins/owl-carousel/owl.carousel.min.js"></script>
    <!-- jQuery Circle Progress -->
    <script src="asset_mob/js/plugins/jquery-circle-progress/circle-progress.min.js"></script>
    <!-- Base Js File -->
    <script src="asset_mob/js/base.js"></script>
    </form>
</body>
</html>
