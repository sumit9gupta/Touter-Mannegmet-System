<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_dashboard.Master" AutoEventWireup="true" CodeBehind="View_Contact.aspx.cs" Inherits="TMS_Project.Admin.View_Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="<%= ResolveUrl("~/dist/sweetalert2.min.css") %>" rel="stylesheet" />
<script src="<%= ResolveUrl("~/dist/sweetalert2.min.js") %>"></script>


    <br />
    <div class="row">
        <div class="col-md-12">
            <h1 class="bg-primary text-white text-center"> View Contact Details</h1>

        </div>
    </div>

    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-striped table-dark"
        AutoGenerateColumns="false"
        DataKeyNames="Id"
        OnPageIndexChanging="GridView1_PageIndexChanging"
        AllowPaging="true" PageSize="5"
        >
        <Columns>
            <asp:TemplateField HeaderText="id">
                <ItemTemplate>
                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Person Name">
                <ItemTemplate>
                    <asp:Label ID="lblname" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email Id">
                <ItemTemplate>
                    <asp:Label ID="lblemail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Subject">
                <ItemTemplate>
                    <asp:Label ID="lblsubject" runat="server" Text='<%# Eval("Subject")%>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Message">
                <ItemTemplate>
                    <asp:Label ID="lblMessage" runat="server" Text='<%# Eval("Message") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date/Time">
                <ItemTemplate>
                    <asp:Label ID="lbldatetime" runat="server" Text='<%# Eval("Data_Time","{0:dd-MM-yyyy hh:mm tt}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete Row">
    <ItemTemplate>
        <asp:Button ID="btndelete" runat="server" Text="Delete" 
            CommandName="DeleteRow" CommandArgument='<%# Eval("Id") %>' 
            CssClass="btn btn-danger btn-sm" OnClientClick="return ConfirmDelete();"  OnClick="btndelete_Click1" />
    </ItemTemplate>
</asp:TemplateField>

        </Columns>
        

    </asp:GridView>

</asp:Content>
