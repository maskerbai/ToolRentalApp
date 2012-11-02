<%@ Page Title="" Language="VB" MasterPageFile="~/tool.master" AutoEventWireup="false" CodeFile="ToolDetails.aspx.vb" Inherits="sales_ToolDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>View, Edit, and Delete Tool Details</title>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




   

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_ToolRental %>" 
        SelectCommand="SELECT [ToolID], [ToolMfg], [ToolName], [ToolDesc], [ToolCost], [ToolDailyRental], [ToolPhotoName], [ToolAvail], [ToolType] FROM [TR_Tools] WHERE ([ToolID] = @ToolID)" 
        >
        
        
        
        <SelectParameters>
            <asp:QueryStringParameter Name="ToolID" QueryStringField="ToolID" 
                Type="Int32" />
        </SelectParameters>
        
    </asp:SqlDataSource>
    



    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_ToolRental %>" 
        SelectCommand="SELECT TR_UserProfile.UserID, TR_UserProfile.FirstName, TR_UserProfile.LastName, TR_UserProfile.City, TR_UserProfile.State FROM TR_Rentals INNER JOIN TR_UserProfile ON TR_Rentals.UserID = TR_UserProfile.UserID WHERE (TR_Rentals.ToolID = @toolID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ToolID" QueryStringField="ToolID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


<asp:FormView ID="FormView1" runat="server" DataKeyNames="ToolID" DataSourceID="SqlDataSource1">
        
        <EditItemTemplate>
        
        </EditItemTemplate>



        <InsertItemTemplate>
            
        </InsertItemTemplate>
        


        <ItemTemplate>

          <table>
			<tr>
				<td align="right"> ToolID #: </td><td align="left"><asp:Label ID="lbl_ToolID" runat="server" Text='<%# Bind("ToolID") %>' /></td>
			</tr>
            
			<tr>
				<td align="right"> Name: </td><td align="left"><asp:Label ID="lbl_ToolName" runat="server" Text='<%# Bind("ToolName") %>' /></td>
			</tr>
            
			<tr>
				<td align="right"> Mfg: </td><td align="left"><asp:Label ID="lbl_ToolMfg" runat="server" Text='<%# Bind("ToolMfg") %>' /></td>
			</tr>
            
            <tr>
				<td align="right"> Description: </td><td align="left"><asp:Label ID="lbl_ToolDesc" runat="server" Text='<%# Bind("ToolDesc") %>' /></td>
			</tr>
            
            <tr>
				<td align="right"> Original Cost: </td><td align="left"><asp:Label ID="lbl_ToolCost" runat="server" Text='<%# Bind("ToolCost") %>' /></td>
			</tr>
            
            <tr>
				<td align="right"> Daily Rental Fee: </td><td align="left"><asp:Label ID="lbl_ToolDailyRental" runat="server" Text='<%# Bind("ToolDailyRental") %>' /></td>
			</tr>
            
            <tr>
				<td align="right"> Photo Name: </td><td align="left"><asp:Label ID="lbl_ToolPhotoName" runat="server" Text='<%# Bind("ToolPhotoName") %>' /></td>
			</tr>

            <tr>
				<td align="right"> Type: </td><td align="left"><asp:Label ID="lbl_ToolType" runat="server" Text='<%# Bind("ToolType") %>' /></td>
			</tr>

            <tr>
				<td align="right"> Available: </td><td align="left"><asp:Label ID="lbl_ToolAvail" runat="server" Text='<%# Bind("ToolAvail") %>' /></td>
			</tr>
		
		</table>
            
             
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="UserID" DataSourceID="SqlDataSource4">
                <Columns>
                    <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" 
                        SortExpression="UserID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                        SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" 
                        SortExpression="LastName" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" 
                        SortExpression="State" />
                </Columns>
            </asp:GridView>

            <br /><br />

            <asp:DataList ID="ToolPhotoDataList" runat="server" DataSourceID="SQLDataSource1">
                <ItemTemplate>

                <a href='<%# Eval ("ToolPhotoName", "../tool_images/{0}") %>' target="_blank">

                    <asp:Image ID="ToolImage1" runat="server" 
                    ImageUrl='<%# Eval ("ToolPhotoName", "~/tool_images/{0}") %>' 
                    Height="200px"
                    AlternateText='<%# Eval ("ToolDesc") %>'
                    ToolTip='<%# Eval ("ToolDesc") %>'
                    />
               
                </a>

                </ItemTemplate>
            </asp:DataList>
            
        </ItemTemplate>

    </asp:FormView>

      

</asp:Content>

