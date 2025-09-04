<%@ Page Title="" Language="C#" MasterPageFile="~/TSM_Site.Master" AutoEventWireup="true" CodeBehind="Student_Login.aspx.cs" Inherits="TMS_Project.Student_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Student/Student_Login.css" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/dist/sweetalert2.min.css") %>" rel="stylesheet" />
    <script src="<%= ResolveUrl("~/dist/sweetalert2.min.js") %>"></script>
    <div class="login-container">
        <div class="login-box">
            <h2>Student Login</h2>
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
            <div class="btn-container">
                <asp:HyperLink ID="forgotpass" runat="server" NavigateUrl="~/Forms/ForgotPassword.aspx"> Forgot password </asp:HyperLink>
                
                <div class="btn-group-right">
                    <asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                    <%--<asp:Button ID="btnnewaccount" runat="server" Text="Sign UP" CssClass="btn btn-success" />--%> </div>
            </div>
            <br />
            <div class="text-end"><a href="Tutor_Login1.aspx" class="text-center">Login as Tutor </a></div>
            <div style="margin-top: 10px; text-align: center;">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
