<%@ Page Title="" Language="VB" MasterPageFile="~/tool.master" AutoEventWireup="false" CodeFile="ViewAllRentals.aspx.vb" Inherits="sales_ViewRentals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_ToolRental %>" 
        SelectCommand="SELECT [UserID], [RentalID], [ToolID], [RentDate], [DateDueBack] FROM [TR_Rentals]">
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="RentalID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="RentalID" HeaderText="RentalID" ReadOnly="True" 
                SortExpression="RentalID" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" 
                SortExpression="UserID" />
            <asp:BoundField DataField="ToolID" HeaderText="ToolID" 
                SortExpression="ToolID" />
            <asp:BoundField DataField="RentDate" HeaderText="RentDate" 
                SortExpression="RentDate" />
            <asp:BoundField DataField="DateDueBack" HeaderText="DueDate" 
                SortExpression="DateDueBack" />
        </Columns>
    </asp:GridView>
</asp:Content>

