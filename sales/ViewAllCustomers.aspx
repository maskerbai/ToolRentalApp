<%@ Page Title="" Language="VB" MasterPageFile="~/tool.master" AutoEventWireup="false" CodeFile="ViewAllCustomers.aspx.vb" Inherits="sales_ViewAllCustomers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>View All Customers</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:cs_ToolRental %>" 
    
        SelectCommand="SELECT [FirstName], [City], [LastName], [State], [UserID] FROM [TR_UserProfile]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" DataKeyNames="UserID" AllowPaging="True" 
        AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" 
                SortExpression="State" />
            <asp:HyperLinkField DataNavigateUrlFields="UserID" 
                DataNavigateUrlFormatString="CustomerDetails.aspx?UserID={0}" Text="Select" />
        </Columns>
    </asp:GridView>


</asp:Content>

