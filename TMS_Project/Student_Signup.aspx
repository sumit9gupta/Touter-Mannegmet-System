<%@ Page Title="" Language="C#" MasterPageFile="~/TSM_Site.Master" AutoEventWireup="true" CodeBehind="Student_Signup.aspx.cs" Inherits="TMS_Project.Student_Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    function SucessContactinfo() {
        Swal.fire({
            title: "Sucess",
            text: "Form has been Submited Sucessfully",
            icon: "success"
        });           
    }
    function FailContactinfo() {
        Swal.fire({
            title: "Fail",
            text: "Form Submition Failed",
            icon: "error"
        });
    }
   
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    <div class="container mt-3" style="box-shadow: 1px 2px 25px 0px rgba(0,0,0,0.75); -webkit-box-shadow: 1px,2px,25px 0px rgba(0,0,0,0.75); -moz-box-shadow: 1px,2px,25px,0px,rgba(0,0,0,0.75);">
        <div class="row">
            <div class="col-md-12 mt-2">
                <h2 class="bg-primary text-white text-center">Student Signup</h2>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <label for="txtFname" class="form-label">First Name</label>
                    <asp:TextBox ID="txtFname" runat="server" CssClass="form-control" placeholder="Enter Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFname" runat="server" ErrorMessage="Name Is Required" ControlToValidate="txtFname" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <label for="txtLname" class="form-label">Last Name</label>
                    <asp:TextBox ID="txtLname" runat="server" CssClass="form-control" placeholder="Enter Last Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLname" runat="server" ErrorMessage="Last Name Is Required" ControlToValidate="txtLname" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <label for="ddlGender" class="form-label">Select Gender</label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select" InitialValue="">
                        <asp:ListItem>--Select Gender--</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>

                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ErrorMessage="Gender Is Required " ControlToValidate="ddlGender" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <label for="txtFathername" class="form-label">Father Name</label>
                    <asp:TextBox ID="txtFathername" runat="server" CssClass="form-control" placeholder="Enter Father Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFatherName" runat="server" ErrorMessage="Father Name Is Required " ControlToValidate="txtFathername" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <label for="txtAge" class="form-label">Enter Age</label>
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="Enter Age"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfvAge" runat="server" ErrorMessage="Age Is Required " ControlToValidate="txtAge" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" Display="Dynamic" ErrorMessage="Age Should be 10 to 60" ForeColor="Red" MaximumValue="60" MinimumValue="10" Type="Integer" ControlToValidate="txtAge"></asp:RangeValidator>
                </div>

                <div class="col-md-4">
                    <label for="ddlCountry" class="form-label">Select Country</label>
                    <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="true" InitialValue="" ></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ErrorMessage="Please Select Country " ControlToValidate="ddlCountry" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <label for="ddlCity" class="form-label">Select City</label>
                    <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-select"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="Please Select City " ControlToValidate="ddlCity" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <label for="txtAddress" class="form-label">Enter Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode="MultiLine" Columns="50" Rows="4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is Reqired " ControlToValidate="txtAddress" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <label for="txtStandard" class="form-label">Enter Standard</label>
                    <asp:TextBox ID="txtStandard" runat="server" CssClass="form-control" placeholder="Enter Standerd"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfvStandard" runat="server" ErrorMessage="Standerd Is Reqired " ControlToValidate="txtStandard" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>

                <div class="col-md-4">
                    <label for="ddlGoingTo" class="form-label">Going To</label>
                    <asp:DropDownList ID="ddlGoingTo" runat="server" CssClass="form-select" initialvalue="0">

                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                        <asp:ListItem>School</asp:ListItem>
                        <asp:ListItem>College</asp:ListItem>
                        <asp:ListItem>Univeristy</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="rfvGoingto" runat="server" ErrorMessage="Going To Is Reqired " ControlToValidate="ddlGoingTo" Display="Dynamic" ForeColor="Red" InitialValue="0" ></asp:RequiredFieldValidator>
                    <label for="txtSubject" class="form-label">Enter Subject</label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter Subject" TextMode="Phone"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Subject Is Reqired " ControlToValidate="txtSubject" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <label for="txtContactNo" class="form-label">Contact No</label>
                    <asp:TextBox ID="txtContactNo" runat="server" CssClass="form-control" placeholder="Contact No"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfvContact" runat="server" ErrorMessage="Contact No Is Reqired " ControlToValidate="txtContactNo" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    <label for="ddlTuitiontype" class="form-label">Tuition Type</label>
                    <asp:DropDownList InitialValue="--Select Tuition Type--"  ID="ddlTuitiontype" runat="server" CssClass="form-select">
                        <asp:ListItem Value="0">--Select Tuition Type--</asp:ListItem>
                        <asp:ListItem>Online</asp:ListItem>
                        <asp:ListItem>OffLine</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvTuitiontype" runat="server" ErrorMessage="Select Tuition Type " ControlToValidate="ddlTuitiontype" Display="Dynamic" ForeColor="Red" initialvalue="0" ></asp:RequiredFieldValidator>
                    <label for="ddlTuterPreferred" class="form-label">Tutor Prefered</label>
                    <asp:DropDownList ID="ddlTuterPreferred" runat="server" CssClass="form-select" initialvalue="0">

                        <asp:ListItem Value="0">--Select Edgucated Teacher--</asp:ListItem>
                        <asp:ListItem>Graduation</asp:ListItem>
                        <asp:ListItem>Masters</asp:ListItem>
                        <asp:ListItem>PHD</asp:ListItem>
                        <asp:ListItem>MPHIL</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvTuterprefered" runat="server" ErrorMessage="Select How many edgucated teacher dou want " ControlToValidate="ddlTuterPreferred" Display="Dynamic" ForeColor="Red" initialvalue="0"></asp:RequiredFieldValidator>
                </div>

            </div>

        </div>
        <br />
        <div class="row">
            <div class="col-md-6">


                <label for="txtUsername" class="form-label">User Name</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter USer Name" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Enter User Name " ControlToValidate="txtUsername" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <label for="txtEmail" class="form-label">Enter G-Mail ID</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="abc@gmail.com" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMail" runat="server" ErrorMessage="Enter Gmail " ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Gmail id is not correct formet" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
            </div>
            <div class="col-md-6">



                <label for="txtpassword" class="form-label">Password</label>
                <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvpassword" runat="server" ErrorMessage="Enter Password " ControlToValidate="txtpassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <label for="txtConfopassword" class="form-label">Conform Password</label>
                <asp:TextBox ID="txtConfopassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Shold be same" ControlToCompare="txtpassword" ControlToValidate="txtConfopassword" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Conforme Password  " ControlToValidate="txtConfopassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row mt-3 me-2">
            <div class="col-md-12 text-center mb-3">
                <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary btn-block" Text="SignUp" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnReset" runat="server" class="btn btn-danger btn-block" Text="Reset" OnClick="btnReset_Click1" CausesValidation="false"  />
            </div>

        </div>
      <div class="row mt-3 me-2 mb-3">
    <div class="col-md-12 mb-2 text-center">
        <a href="Tuter_SignUp.aspx" class="btn btn-success btn-lg text-end">SignUp AS Tutor</a>
    </div>
</div>
    </div>
    <br />

</asp:Content>
