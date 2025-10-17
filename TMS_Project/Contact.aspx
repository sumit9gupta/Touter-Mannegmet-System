<%@ Page Title="" Language="C#" MasterPageFile="~/TSM_Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TMS_Project.Contact" %>
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
    <!-- Page Title -->
    <div class="page-title dark-background">
      <div class="container position-relative">
        <h1>Contact</h1>
        <p>Esse dolorum voluptatum ullam est sint nemo et est ipsa porro placeat quibusdam quia assumenda numquam molestias.</p>
        <nav class="breadcrumbs">
         <%-- <ol>
            <li><a href="index.html">Home</a></li>
            <li class="current">Contact</li>
          </ol>--%>
        </nav>
      </div>
    </div><!-- End Page Title -->

    <!-- Contact Section -->
    <section id="contact" class="contact section">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">
          <div class="col-lg-6 ">
            <div class="row gy-4">

              <div class="col-lg-12">
                <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="200">
                  <i class="bi bi-geo-alt"></i>
                  <h3>Address</h3>
                  <p>Ameerpet Telangana, India, 500038</p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="300">
                  <i class="bi bi-telephone"></i>
                  <h3>Call Us</h3>
                  <p>+91 9770157348</p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="400">
                  <i class="bi bi-envelope"></i>
                  <h3>Email Us</h3>
                  <p>guptag9770@gmail.com</p>
                </div>
              </div><!-- End Info Item -->

            </div>
          </div>

          <div class="col-lg-6 " style="border:1px solid;">
            <form action="forms/contact.php" method="post" class="php-email-form" data-aos="fade-up" data-aos-delay="500">
              <div class="row gy-4">

                <div class="col-md-6">
                    <asp:TextBox ID="txtname" runat="server" class="form-control mt-3" placeholder="Your Name"></asp:TextBox>                  
                  <asp:RequiredFieldValidator ID="rfvname" runat="server" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Name is Importent" ControlToValidate="txtname"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6 ">
                 
                     <asp:TextBox ID="txtemail" runat="server" class="form-control mt-3" placeholder="Your Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvemail" runat="server" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Email is Importent" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revemail" runat="server" ErrorMessage="Enter Vaild Mail" ControlToValidate="txtemail" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>

                <div class="col-md-12">
                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-select">
                        <asp:ListItem Text="--Select--" Enabled="True" Value=""></asp:ListItem>
                        <asp:ListItem Text="Suggetion" Enabled="True" Value="Suggetion"></asp:ListItem>
                        <asp:ListItem Text="Feedback" Enabled="true" Value="Feedback"></asp:ListItem>
                        <asp:ListItem Text="Complain" Enabled="true" Value="Complain"></asp:ListItem>
                        
                    </asp:DropDownList> 
                    <asp:RequiredFieldValidator  InitialValue="" ID="rfv" runat="server" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Please Select Subject" ControlToValidate="ddlSubject"></asp:RequiredFieldValidator>

                </div>

                <div class="col-md-12">
                 
                     <asp:TextBox ID="txttextarea" runat="server" class="form-control" placeholder="Enter Masseg" TextMode="MultiLine" Columns="50" Rows="5"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfvmessage" runat="server" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Pleas Write your message" ControlToValidate="txttextarea"></asp:RequiredFieldValidator>
                </div>
                  <asp:Label ID="lblMessage" runat="server"></asp:Label>

                <div class="col-md-12 text-center">
                  <%--<div class="loading">Loading</div>--%>
                  <div class="error-message"></div>
                  <%--<div class="sent-message">Your message has been sent. Thank you!</div>--%>

                 
                    <asp:Button ID="btnsubmit" runat="server" class="btn btn-primary mb-3" Text="Send Massage" OnClick="btnsubmit_Click" />
                </div>

              </div>
            </form>
          </div><!-- End Contact Form -->

        </div>

      </div>

      <%--<div class="mt-5" data-aos="fade-up" data-aos-delay="200">
        <iframe style="border:0; width: 100%; height: 370px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d48389.78314118045!2d-74.006138!3d40.710059!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a22a3bda30d%3A0xb89d1fe6bc499443!2sDowntown%20Conference%20Center!5e0!3m2!1sen!2sus!4v1676961268712!5m2!1sen!2sus" frameborder="0" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
      </div><!-- End Google Maps -->--%><div class="mt-5" data-aos="fade-up" data-aos-delay="200">
        <iframe style="border:0; width: 100%; height: 370px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d24640.94579870392!2d78.43390594075967!3d17.43145166288936!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb90c8a05d2125%3A0xee84a18a25bbfce2!2sNaresh%20i%20Technologies!5e0!3m2!1sen!2sin!4v1757064839949!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
      </div><!-- End Google Maps -->



    </section><!-- /Contact Section -->
</asp:Content>
