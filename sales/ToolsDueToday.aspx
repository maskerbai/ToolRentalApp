<%@ Page Title="" Language="VB" MasterPageFile="~/tool.master" AutoEventWireup="false" CodeFile="ToolsDueToday.aspx.vb" Inherits="sales_ToolsDueToday" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_ToolRental %>" 
        SelectCommand="SELECT [UserID], [ToolID], [RentDate], [DateDueBack], [RentalID] FROM [TR_Rentals]">
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="RentalID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="UserID" 
                SortExpression="UserID" />
            <asp:BoundField DataField="ToolID" HeaderText="ToolID" 
                SortExpression="ToolID" />
            <asp:BoundField DataField="RentDate" HeaderText="RentDate" 
                SortExpression="RentDate" />
            <asp:BoundField DataField="DateDueBack" HeaderText="DateDueBack" 
                SortExpression="DateDueBack" />
            <asp:BoundField DataField="RentalID" HeaderText="RentalID" 
                InsertVisible="False" ReadOnly="True" SortExpression="RentalID" />
        </Columns>
    </asp:GridView>

</asp:Content>

