<%@ Page Title="" Language="C#" MasterPageFile="~/TSM_Site.Master" AutoEventWireup="true" CodeBehind="Tuter_SignUp.aspx.cs" Inherits="TMS_Project.Tutes_SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

    <div class="container mt-3" style="box-shadow: 1px 2px 25px 0px rgba(0,0,0,0.75); -webkit-box-shadow: 1px,2px,25px 0px rgba(0,0,0,0.75); -moz-box-shadow: 1px,2px,25px,0px,rgba(0,0,0,0.75);">
        <div class="row">
            <div class="col-md-12 mt-2">
                <h2 class="bg-primary text-white text-center">Touter Signup</h2>
            </div>

            <div class="row md-3">

                <div class="col-md-4">
                    <asp:Label For="txtfName" ID="lblFname" runat="server" CssClass="col-sm-2 col-form-label">Enter Fast Name</asp:Label>
                    <asp:TextBox ID="txtfName" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rfvEnterName" runat="server" ErrorMessage="First Name is Required " ControlToValidate="txtfName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    <asp:Label For="txtLname" ID="lblLname" runat="server" CssClass="col-sm-2 col-form-label">Enter Last Name</asp:Label>
                    <asp:TextBox ID="txtLname" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Last Name is Required " ControlToValidate="txtLname" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    <asp:Label For="ddlGender" ID="lblgender" runat="server" CssClass="col-sm-2 col-form-label">Select Gender</asp:Label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select" initialvalue="0">
                        <asp:ListItem Value="0">--Select Gender--</asp:ListItem>
                        <asp:ListItem Value="1">Male</asp:ListItem>
                        <asp:ListItem Value="2">Female</asp:ListItem>
                        <asp:ListItem Value="3">Other</asp:ListItem>
                    </asp:DropDownList><asp:RequiredFieldValidator ID="rfvGender" runat="server" ErrorMessage=" Gender Is Required " ControlToValidate="ddlGender" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                    <asp:Label For="txtAge" ID="Label1" runat="server" CssClass="col-sm-2 col-form-label">Enter Age</asp:Label>
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rfvAge" runat="server" ErrorMessage=" Age Is Required " ControlToValidate="txtAge" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>


                <div class="col-md-4">
                    <asp:Label For="txtEmail" ID="Label2" runat="server" CssClass="col-sm-2 col-form-label">Enter Email</asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage=" Email Is Required " ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revemail" runat="server" ErrorMessage="Email is Not Correct Formet " ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                    <asp:Label For="ddlMaritalStatus" ID="Label3" runat="server" CssClass="col-sm-2 col-form-label">Marital Status</asp:Label>
                    <asp:DropDownList ID="ddlMaritalStatus" runat="server" CssClass="form-select" initialvalue="0">
                        <asp:ListItem Text="-- Select Marital Status --" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Single" Value="Single"></asp:ListItem>
                        <asp:ListItem Text="Married" Value="Married"></asp:ListItem>
                        <asp:ListItem Text="Divorced" Value="Divorced"></asp:ListItem>
                        <asp:ListItem Text="Widowed" Value="Widowed"></asp:ListItem>
                    </asp:DropDownList><asp:RequiredFieldValidator ID="rfvMaritalstatus" runat="server" ErrorMessage=" Select MArital Status " ControlToValidate="ddlMaritalStatus" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                    <asp:Label For="ddlCountry" ID="lblCountry" runat="server" CssClass="col-sm-2 col-form-label">Select Country</asp:Label>
                    <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList><asp:RequiredFieldValidator ID="rfvcountery" runat="server" ErrorMessage=" Plese Select Countery " ControlToValidate="ddlCountry" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                    <asp:Label For="ddlCity" ID="lblcity" runat="server" CssClass="col-sm-2 col-form-label">Select City</asp:Label>
                    <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-select"></asp:DropDownList><asp:RequiredFieldValidator ID="rfvcity" runat="server" ErrorMessage=" Plese Select City " ControlToValidate="ddlCity" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                </div>

                <div class="col-md-4">
                    <asp:Label For="txtAddress" ID="lblAddress" runat="server" CssClass="col-sm-2 col-form-label">Enter Address</asp:Label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Style="height: 99px; width: 100%;"></asp:TextBox><asp:RequiredFieldValidator ID="rfvaddress" runat="server" ErrorMessage=" Enter Address " ControlToValidate="txtAddress" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    <asp:Label For="ddlQualification" ID="lblQualification" runat="server" CssClass="col-sm-2 col-form-label">Select Qualification</asp:Label>
                    <asp:DropDownList ID="ddlQualification" runat="server" CssClass="form-select" initialvalue="0">
                        <asp:ListItem Value="0">--Select Qualification--</asp:ListItem>
                        <asp:ListItem>Graduate</asp:ListItem>
                        <asp:ListItem>Master</asp:ListItem>
                        <asp:ListItem>Diploma</asp:ListItem>
                        <asp:ListItem>PHD</asp:ListItem>
                    </asp:DropDownList><asp:RequiredFieldValidator ID="rfvqualification" runat="server" ErrorMessage=" Select Qualification  " ControlToValidate="ddlQualification" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                    <asp:Label For="txtDegree" ID="lblDegree" runat="server" CssClass="col-sm-2 col-form-label">Enter Degree</asp:Label>
                    <asp:TextBox ID="txtDegree" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rfvdegree" runat="server" ErrorMessage="  Degree Is Required " ControlToValidate="txtDegree" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>

            </div>

        </div>
        <br />
        <div class="row">
            <div class="col-md-6">

                <asp:Label For="txtExperience" ID="lblExp" runat="server" CssClass="col-sm-2 col-form-label">Enter Experience</asp:Label>
                <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rfvexperience" runat="server" ErrorMessage=" Experience is Required " ControlToValidate="txtExperience" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Label For="txtSubject" ID="lblSubject" runat="server" CssClass="col-sm-2 col-form-label">Enter Subject</asp:Label>
                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rfvsubject" runat="server" ErrorMessage=" Subject is Required " ControlToValidate="txtSubject" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Label For="txtContactNo" ID="lblcontact" runat="server" CssClass="col-sm-2 col-form-label">Enter Contact No</asp:Label>
                <asp:TextBox ID="txtContactNo" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox><asp:RequiredFieldValidator ID="rfvContactno" runat="server" ErrorMessage=" Contact No Is Required " ControlToValidate="txtContactNo" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <div class="col-md-6">



                <asp:Label For="txtUserName" ID="Label6" runat="server" CssClass="col-sm-2 col-form-label">Enter User Name</asp:Label>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rfvusername" runat="server" ErrorMessage=" User Name is Required " ControlToValidate="txtUserName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Label For="txtPassword" ID="Label7" runat="server" CssClass="col-sm-2 col-form-label">Enter Password</asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="rfvpassword" runat="server" ErrorMessage=" Password is Required " ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Label For="txtCPassword" ID="Label8" runat="server" CssClass="col-sm-2 col-form-label">Enter Conform Password</asp:Label>
                <asp:TextBox ID="txtCPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="rfvcpassword" runat="server" ErrorMessage=" Conforme Password is Required " ControlToValidate="txtCPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>



            </div>
        </div>
       <div class="col-md-8 mx-auto text-center mt-2">
    
    <div class="d-flex justify-content-center mb-4">
        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success btn-md mx-2" 
            Text="SignUp" OnClick="btnSubmit_Click" />
        <asp:Button ID="btnReset" runat="server" CssClass="btn btn-danger btn-md mx-2" 
            Text="Reset" CausesValidation="false" OnClick="btnReset_Click" />
    </div>

   
         <div class="row mt-3 me-2 mb-3">
    <div class="col-md-12 d-flex justify-content-center mb-2">
        <a href="Tuter_SignUp.aspx" class="btn btn-success btn-lg">SignUp AS Tutor</a>
    </div>
</div>
</div>

        
           
    </div>
    <br />
</asp:Content>
