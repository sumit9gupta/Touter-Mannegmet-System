<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="TMS_Project.Admin.Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    
<link href="<%= ResolveUrl("~/Student/Student_Login.css") %>" rel="stylesheet" />
<script src="<%= ResolveUrl("~/Scripts/Jquery-3.3.1.min.js") %>"></script>
<script src="<%= ResolveUrl("~/Scripts/Capitalizing.js") %>"></script>
 <script src="<%= ResolveUrl("~/dist/sweetalert2.min.js") %>"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link href="/Images/logoimg2.png" rel="icon"/>

</head>
    <body>
         <form id="form1" runat="server">
             <asp:ScriptManager ID="ScriptManager1" runat="server" />

<div class="login-container">
    <div class="login-box">
        <h2>Login Admin</h2>
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
        <img src="../CaptchaImage.ashx" alt="Captcha" class="captcha-img" />
        <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control captcha-input" placeholder="Enter Captcha"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvCaptcha" runat="server" ControlToValidate="txtCaptcha" ErrorMessage="Captcha is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>
        <br />
        <div class="btn-container">
            <asp:HyperLink ID="forgotpass" runat="server" NavigateUrl="Tutor/Forgot_Password.aspx"> Forgot password </asp:HyperLink>
           
            <div class="btn-group-right">
                <asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                <%--<asp:Button ID="btnnewaccount" runat="server" Text="Sign UP" CssClass="btn btn-success" />--%> </div>
        </div>
        <br />
        <div class="text-end"><a href="../Student_Login.aspx" class="text-center">Login as Student </a></div>
        <div style="margin-top: 10px; text-align: center;">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
        </div>
    </div>
</div>
</form>
</body>
</html>


