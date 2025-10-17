<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_dashboard.Master" AutoEventWireup="true" CodeBehind="Approve_Teacher.aspx.cs" Inherits="TMS_Project.Admin.Approve_Teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="<%= ResolveUrl("~/dist/sweetalert2.min.js") %>"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <h2 class="text-center bg-info p-3 text-white ">Approve Teacher</h2>
    <asp:Label ID="lblid" runat="server" Text="Enter Teacher ID"></asp:Label>
   <asp:TextBox ID="txtId" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtId_TextChanged" TextMode="Number" ></asp:TextBox>
    <asp:Label ID="lblres" runat="server"></asp:Label>
    <br/>


     <asp:Label ID="lblAproveTeacher" runat="server" Text="Approve Teacher"></asp:Label>
<asp:DropDownList ID="ddlvalue" runat="server" CssClass="form-select">
   
    <asp:ListItem Value="1">Approve</asp:ListItem>
    <asp:ListItem Value="0">Reject</asp:ListItem>
</asp:DropDownList>

    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary mt-3 " OnClick="btnSubmit_Click"/>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>

    <asp:GridView ID="MyGrid" runat="server" CssClass="mt-3 table table-bordered table-hover table-striped table-dark" BackColor="WhiteSmoke" AutoGenerateColumns="false"
       HeaderStyle-CssClass="btn-primary"
        HeaderStyle-ForeColor="#3333ff"
         HeaderStyle-Font-Bold="true"
        AllowPaging="true"
        PageSize="10">
        <Columns>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text=' <%# Eval("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="lblName" runat="server" Text=' <%# Eval("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LastName">
    <ItemTemplate>
        <asp:Label ID="lblLastName" runat="server" Text=' <%# Eval("LastName") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
            <asp:TemplateField HeaderText="Country">
                <ItemTemplate>
                    <asp:Label ID="lblCountry" runat="server" Text=' <%# Eval("Country") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Qulification">
                <ItemTemplate>
                    <asp:Label ID="lblQulification" runat="server" Text=' <%# Eval("Qualification") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Experience">
    <ItemTemplate>
        <asp:Label ID="lblExperience" runat="server" Text=' <%# Eval("Experience") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
            <asp:TemplateField HeaderText="Subject">
                <ItemTemplate>
                    <asp:Label ID="lblSubject" runat="server" Text=' <%# Eval("Subject") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text=' <%# Eval("Status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate> 
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-warning" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-sucess" />
                    <asp:Button ID="btnCancle" runat="server" Text="Cancle" CssClass="btn btn-Danger" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
</asp:Content>
