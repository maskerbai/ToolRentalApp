<%@ Page Title="" Language="VB" MasterPageFile="~/tool.master" AutoEventWireup="false" CodeFile="ViewAllTools.aspx.vb" Inherits="sales_ViewAllTools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>View All Tools</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_ToolRental %>" 
        
        SelectCommand="SELECT [ToolID], [ToolName], [ToolMfg], [ToolDesc], [ToolCost], [ToolDailyRental], [ToolPhotoName], [ToolAvail], [ToolType] FROM [TR_Tools]">
        
        </asp:SqlDataSource>
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ToolID" DataSourceID="SqlDataSource1">
        
        <Columns>
            <asp:BoundField DataField="ToolID" HeaderText="ToolID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ToolID" />
            <asp:BoundField DataField="ToolName" HeaderText="ToolName" 
                SortExpression="ToolName" />
            <asp:BoundField DataField="ToolMfg" HeaderText="ToolMfg" 
                SortExpression="ToolMfg" />
            <asp:BoundField DataField="ToolDesc" HeaderText="ToolDesc" 
                SortExpression="ToolDesc" />
            <asp:BoundField DataField="ToolCost" HeaderText="ToolCost" 
                SortExpression="ToolCost" />
            <asp:BoundField DataField="ToolDailyRental" HeaderText="ToolDailyRental" 
                SortExpression="ToolDailyRental" />
            <asp:BoundField DataField="ToolPhotoName" HeaderText="ToolPhotoName" 
                SortExpression="ToolPhotoName" />
            <asp:BoundField DataField="ToolType" HeaderText="ToolType" 
                SortExpression="ToolType" />
            <asp:BoundField DataField="ToolAvail" HeaderText="ToolAvail" 
                SortExpression="ToolAvail" />
            <asp:HyperLinkField DataNavigateUrlFields="ToolID" 
                DataNavigateUrlFormatString="ToolDetails.aspx?ToolID={0}" Text="Select" />
        </Columns>

    </asp:GridView>

</asp:Content>

