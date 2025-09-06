<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student_Dashboard.Master" AutoEventWireup="true" CodeBehind="View_Tutors.aspx.cs" Inherits="TMS_Project.Student.View_Tutors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="row">
        <div class="col-md-12">
            <h1 class="bg-primary text-white text-center">View Teacher Details</h1>

        </div>
    </div>

    <div class="row">
    <div class="col-md-12">
        <div class="d-flex gap-3">
            
            
            <div class="d-flex flex-column mr-3">
                <label for="txtname">Enter Name</label>
                <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Tutor Name" />
            </div>


            <div class="d-flex flex-column mr-3">
                <label for="ddlexp">Select Experience</label>
                <asp:DropDownList ID="ddlexp" runat="server" CssClass="form-control">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem Value="2 year">2 year</asp:ListItem>
                    <asp:ListItem Value="3 year">3 year</asp:ListItem>
                    <asp:ListItem Value="5 year">5 year</asp:ListItem>
                    <asp:ListItem Value="8+ Year">8+ Year</asp:ListItem>
                </asp:DropDownList>
            </div>


            <div class="d-flex flex-column mr-3">
                <label for="txtqfc">Enter Qualification/Degree</label>
                <asp:TextBox ID="txtqfc" runat="server" CssClass="form-control" />
            </div>

           
            <div class="d-flex flex-column mr-3">
                <label for="txtcountry">Enter Country</label>
                <asp:TextBox ID="txtcountry" runat="server" CssClass="form-control" />
            </div>

           
            <div class="d-flex flex-column justify-content-end">
                <asp:Button ID="btnserch" runat="server" Text="Search" CssClass="btn btn-success" OnClick="btnserch_Click" />
            </div>
        </div>
    </div>
</div>

    <br />

    <div class="row">

        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="col-md-4">
                    <div class="card bg-secondary text-white text-center">
                        <div class="card-header">
                            <small style="color: antiquewhite !important; font-size: 15px;">Name</small>

                            <h3>
                                <asp:Label ID="lblheder" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                            </h3>
                        </div>
                        <div class="card-body">
                            <small style="color: antiquewhite !important; font-size: 15px;">Email Id</small>

                            <h5>
                                <asp:Label ID="lblemail" runat="server" Text='<%#Bind("UserName") %>'></asp:Label></h5>

                            <small style="color: antiquewhite !important; font-size: 15px;">Country Name</small>

                            <h5>
                                <asp:Label ID="lblcountery" runat="server" Text='<%#Bind("Country") %>'></asp:Label></h5>
                            <small style="color: antiquewhite !important; font-size: 15px;">Email Id</small>
                            <h5>
                                <asp:Label ID="lblqlf" runat="server" Text='<%#Bind("Qualification") %>'></asp:Label></h5>
                            <small style="color: antiquewhite !important; font-size: 15px;">Totel Experience</small>

                            <h5>
                                <asp:Label ID="lblexperience" runat="server" Text='<%#Bind("Experience") %>'></asp:Label></h5>
                            <small style="color: antiquewhite !important; font-size: 15px;">Contact No</small>

                            <h4>
                                <asp:Label ID="lblContact" runat="server" Text='<%#Bind("Contact_No") %>'></asp:Label></h4>


                        </div>
                        <div class="card-footer">
                        </div>
                        <small style="color: antiquewhite !important; font-size: 15px;">Degree</small>

                        <h4>

                            <asp:Label ID="lblDegree" runat="server" Text='<%#Bind("Degree") %>'></asp:Label></h4>
                    </div>
                    <br />
                </div>


            </ItemTemplate>
        </asp:Repeater>

    </div>
</asp:Content>
