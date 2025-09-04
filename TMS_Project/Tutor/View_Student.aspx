<%@ Page Title="" Language="C#" MasterPageFile="~/Tutor/Tutor_Dashboard.Master" AutoEventWireup="true" CodeBehind="View_Student.aspx.cs" Inherits="TMS_Project.Tutor.View_Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <br />
   <div class="row">
    <div class="col-md-12">
        <h1 class="bg-primary text-white text-center"> View Tutor Student Details </h1>

    </div>
</div>

        <div class="row">
    <div class="col-md-12">
        <div class="d-flex gap-3">
            
            
            <div class="d-flex flex-column mr-3">
                <label for="txtclass">Student Class</label>
                <asp:TextBox ID="txtclass" runat="server" CssClass="form-control" placeholder="class-12" />
            </div>


            <div class="d-flex flex-column mr-3">
                <label for="ddltype">Type</label>
                <asp:DropDownList ID="ddltype" runat="server" CssClass="form-control" initialvalue="0">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem Value="Online">Online</asp:ListItem>
                    <asp:ListItem Value="Offline">Offline</asp:ListItem>
                   
                </asp:DropDownList>
            </div>


            <div class="d-flex flex-column mr-3">
                <label for="txtsub">Enter Subject</label>
                <asp:TextBox ID="txtsub" runat="server" CssClass="form-control" />
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
                    <div class="card bg-dark text-white text-center">
                        <div class="card-header">
                                <small style="color:antiquewhite !important;   font-size:15px;" >Name</small>

                            <h3>
                                <asp:Label ID="lblheder" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                            </h3>
                        </div>
                        <div class="card-body">
                                <small style="color:antiquewhite !important;  font-size:15px;" >Email Id</small>

                            <h5>
                                <asp:Label ID="lblemail" runat="server" Text='<%#Bind("UserName") %>'></asp:Label></h5>
                                
                            <small style="color:antiquewhite !important;  font-size:15px;" >Country Name</small>

                            <h5> <asp:Label ID="lblcountery" runat="server" Text='<%#Bind("Country") %>'></asp:Label></h5>
                            <small style="color:antiquewhite !important; font-size:15px;" >Subject</small>
                            <h5><asp:Label ID="lblqlf" runat="server" Text='<%#Bind("Subject") %>'></asp:Label></h5>
                            <small style="color:antiquewhite !important;  font-size:15px;" >Tuition Type</small>

                            <h5> <asp:Label ID="lblexperience" runat="server" Text='<%#Bind("Tuition_Type") %>'></asp:Label></h5>
                            <small style="color:antiquewhite !important;  font-size:15px;" >Contact No</small>

                           <h4> <asp:Label ID="lblContact" runat="server" Text='<%#Bind("Contact_No") %>'></asp:Label></h4>


                        </div>
                        <div class="card-footer">
                        </div>
                            <small style="color:antiquewhite !important;  font-size:15px;" >Class</small>

                        <h4>

                            <asp:Label ID="lblDegree" runat="server" Text='<%#Bind("Standard") %>'></asp:Label></h4>
                    </div>
                    <br />
                </div>


            </ItemTemplate>
        </asp:Repeater>

    </div>
</asp:Content>
