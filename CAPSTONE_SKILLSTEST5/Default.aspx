<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CAPSTONE_SKILLSTEST5._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <div>
       <h2>Create Users</h2>
       <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
       <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
       <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
       <asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox>
       <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_OnClick" />
   </div>
    <div>
        <h2>Users</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField ="ID" HeaderText="ID" ReadOnly="true" SortExpression="ID" />
                <asp:BoundField DataField ="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField ="Email" HeaderText="TEST" SortExpression="Email" />
                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString ="<%$ConnectionStrings:SkillsTestDB5 %>"
            SelectCommand ="SELECT [ID], [Name], [Email] FROM [Users]"
            DeleteCommand ="DELETE FROM [Users] WHERE [ID] = @ID"
            UpdateCommand ="UPDATE [Users] SET [Name] = @Name, [Email] = @Email WHERE [ID] = @ID" >


            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>

        </asp:SqlDataSource>
    </div>

</asp:Content>
