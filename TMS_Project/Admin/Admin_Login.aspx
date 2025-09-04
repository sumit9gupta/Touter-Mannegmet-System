<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="TMS_Project.Admin.Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link href="~/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="<%= ResolveUrl("~/dist/sweetalert2.min.css") %>" rel="stylesheet" />
<script src="<%= ResolveUrl("~/dist/sweetalert2.min.js") %>"></script>

    <style>
        body {
            background-color: #f8f9fa;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full height */
            border: 2px solid;
            
            background-size: cover;
            background-position: center;
            background-color:aquamarine;
        }

        .login-box {
            width: 420px;
            height: 320px;
            padding: 20px;
            border: 2px solid #ccc;
            border-radius: 10px;
            background: #f8f9fa;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }

        .btn-container {
            display: flex;
            justify-content: space-between; /* Forgot left & buttons right */
            align-items: center;
            margin-top: 10px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: blue;
        }

        .btn-group-right {
            display: flex;
            gap: 10px;
        }
    </style>

   
</head>
     
<body>
    <form id="form1" runat="server">


        <div class="login-container">
            <div class="login-box">
                <h2>Login Page</h2>

                <div class="form-group">
                    <label for="txtEmail">Email address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter email" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                        ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>


                <div class="btn-container">

                    <asp:HyperLink ID="forgotpass" runat="server" NavigateUrl="~/Forms/ForgotPassword.aspx">
        Forgot password
                    </asp:HyperLink>


                    <div class="btn-group-right">
                        <asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                        <%--<asp:Button ID="btnnewaccount" runat="server" Text="Sign UP" CssClass="btn btn-success" />--%>
                    </div>
                </div>

                <div style="margin-top: 10px; text-align: center;">
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                </div>
                </div>
            </div>
    </form>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script src="~/assets/vendor/bootstrap/js/bootstrap.min.js"></script>



</body>
</html>
