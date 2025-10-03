<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_dashboard.Master" AutoEventWireup="true" CodeBehind="Admin_Index.aspx.cs" Inherits="TMS_Project.Admin.Admin_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        .card-footer a {
            color: white !important;
            text-decoration: none; /* removes underline */
        }

            .card-footer a:hover {
                text-decoration: underline; /* optional on hover */
            }
    </style>

    <h2 class="text-center bg-info p-3 text-white ">Welcome To Admin Page</h2>
    <br />
    <br />

    <div class="row">
        <div class="col-sm-4">
            <div class="card bg-danger">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <h3 class="card-title text-white">
                            <asp:Label ID="lblcountstudent" runat="server"></asp:Label>
                        </h3>
                        <h3 class="card-text text-white">Total Student</h3>
                    </div>
                    <div>
                        <i class="fas fa-users fa-3x text-white"></i>
                    </div>
                </div>
                <div class="card-footer justify-content-between  bg-transparent border-1 text-white text-center">
                    <a href="#"><span>More info <i class="fas fa-arrow-circle-right"></i></span></a>

                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="card bg-success">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <h3 class="card-title text-white">
                            <asp:Label ID="lblcountTeacher" runat="server"></asp:Label>
                        </h3>
                        <h3 class="card-text text-white">Total Teacher</h3>
                    </div>
                    <div>
                        <i class="fas fa-users fa-3x text-white"></i>
                    </div>
                </div>
                <div class="card-footer  justify-content-between  bg-transparent border-1 text-white text-center">
                    <a href="#"><span>More info <i class="fas fa-arrow-circle-right "></i></span></a>

                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="card bg-info">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <h3 class="card-title text-white">
                            <asp:Label ID="lblTotelUser" runat="server"></asp:Label>
                        </h3>
                        <h3 class="card-text text-white">Totel User</h3>
                    </div>
                    <div>
                        <i class="fas fa-users fa-3x text-white"></i>
                    </div>
                </div>
                <div class="card-footer  justify-content-between  bg-transparent border-1 text-white text-center">
                    <a href="#"><span>More info <i class="fas fa-arrow-circle-right "></i></span></a>

                </div>
            </div>
        </div>
    </div>



</asp:Content>
