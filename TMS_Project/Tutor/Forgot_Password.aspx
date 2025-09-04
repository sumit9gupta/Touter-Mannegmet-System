<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgot_Password.aspx.cs" Inherits="TMS_Project.Tutor.Forgot_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
   <link href="~/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            
                <div class="col-md-12 mt-3">
                   <h1 class="bg-primary text-white text-center"> Forgot Password  </h1>
                     <button class="btn btn-primary">click</button>
                 </div>          
        </div>

         <div class="login-container">
     <div class="login-box">
         <h2>Tutor Login</h2>
         <div class="form-group">
             <label for="txtEmail">Email address</label>
             <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter email" TextMode="Email"></asp:TextBox>
             <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
         </div>
         <div class="form-group">
             <label for="txtPassword">Password</label>
             <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter password" TextMode="Password"></asp:TextBox>
             <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
         </div>
          <div class="form-group captcha-group">
     <label>Enter Captcha</label>
     <div class="captcha-container">
         <img src="CaptchaImage.ashx" alt="Captcha" class="captcha-img" />
         <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control captcha-input" placeholder="Enter Captcha"></asp:TextBox>
     </div>
 </div>
         <br />
         <div class="btn-container">
             <asp:HyperLink ID="forgotpass" runat="server" NavigateUrl="Tutor/Forgot_Password.aspx"> Forgot password </asp:HyperLink>
            
             <div class="btn-group-right">
                 <asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass="btn btn-primary"  />
                 <%--<asp:Button ID="btnnewaccount" runat="server" Text="Sign UP" CssClass="btn btn-success" />--%> </div>
         </div>
         <br />
         <div class="text-end"><a href="Student_Login.aspx" class="text-center">Login as Student </a></div>
         <div style="margin-top: 10px; text-align: center;">
             <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
         </div>
     </div>
 </div>
    </form>
</body>
</html>
