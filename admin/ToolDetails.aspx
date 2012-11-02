<%@ Page Title="" Language="VB" MasterPageFile="~/tool.master" AutoEventWireup="false" CodeFile="ToolDetails.aspx.vb" Inherits="sales_ToolDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>View, Edit, and Delete Tool Details</title>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




   

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_ToolRental %>" 
        DeleteCommand="DELETE FROM [TR_Tools] WHERE [ToolID] = @ToolID" 
        
        InsertCommand="INSERT INTO [TR_Tools] ([ToolMfg], [ToolName], [ToolDesc], [ToolCost], [ToolDailyRental], [ToolPhotoName], [ToolAvail], [ToolType]) VALUES (@ToolMfg, @ToolName, @ToolDesc, @ToolCost, @ToolDailyRental, @ToolPhotoName, @ToolAvail, @ToolType)" 
        
        SelectCommand="SELECT [ToolID], [ToolMfg], [ToolName], [ToolDesc], [ToolCost], [ToolDailyRental], [ToolPhotoName], [ToolAvail], [ToolType] FROM [TR_Tools] WHERE ([ToolID] = @ToolID)" 
        
        UpdateCommand="UPDATE [TR_Tools] SET [ToolMfg] = @ToolMfg, [ToolName] = @ToolName, [ToolDesc] = @ToolDesc, [ToolCost] = @ToolCost, [ToolDailyRental] = @ToolDailyRental, [ToolPhotoName] = @ToolPhotoName, [ToolAvail] = @ToolAvail, [ToolType] = @ToolType WHERE [ToolID] = @ToolID">
        
        <DeleteParameters>
            <asp:Parameter Name="ToolID" Type="Int32" />
        </DeleteParameters>
        
        <InsertParameters>
            <asp:Parameter Name="ToolMfg" Type="String" />
            <asp:Parameter Name="ToolName" Type="String" />
            <asp:Parameter Name="ToolDesc" Type="String" />
            <asp:Parameter Name="ToolCost" Type="Double" />
            <asp:Parameter Name="ToolDailyRental" Type="Double" />
            <asp:Parameter Name="ToolPhotoName" Type="String" />
            <asp:Parameter Name="ToolAvail" Type="String" />
            <asp:Parameter Name="ToolType" Type="String" />
        </InsertParameters>
        
        <SelectParameters>
            <asp:QueryStringParameter Name="ToolID" QueryStringField="ToolID" 
                Type="Int32" />
        </SelectParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="ToolMfg" Type="String" />
            <asp:Parameter Name="ToolName" Type="String" />
            <asp:Parameter Name="ToolDesc" Type="String" />
            <asp:Parameter Name="ToolCost" Type="Double" />
            <asp:Parameter Name="ToolDailyRental" Type="Double" />
            <asp:Parameter Name="ToolPhotoName" Type="String" />
            <asp:Parameter Name="ToolAvail" Type="String" />
            <asp:Parameter Name="ToolType" Type="String" />
            <asp:Parameter Name="ToolID" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs_ToolRental %>" 
        
        SelectCommand="SELECT [ToolType] FROM [TR_ToolType]">
    
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cs_ToolRental %>" 
    
        SelectCommand="SELECT [ToolAvail] FROM [TR_Avail]">
    
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
          
          <table>
			<tr>
				<td align="right"> ToolID #: </td><td align="left"><asp:TextBox ID="tb_ToolID" runat="server" enabled="false" Text='<%# Bind("ToolID") %>' /></td>
			</tr>
            
			<tr>
				<td align="right"> Name: </td><td align="left"><asp:TextBox ID="tb_ToolName" runat="server" Text='<%# Bind("ToolName") %>' /></td>
			</tr>
            
			<tr>
				<td align="right"> Mfg: </td><td align="left"><asp:TextBox ID="tb_ToolMfg" runat="server" Text='<%# Bind("ToolMfg") %>' /></td>
			</tr>
            
            <tr>
				<td align="right"> Description: </td><td align="left"><asp:TextBox ID="tb_ToolDesc" runat="server" Text='<%# Bind("ToolDesc") %>' /></td>
			</tr>
            
            <tr>
				<td align="right"> Original Cost: </td><td align="left"><asp:TextBox ID="tb_ToolCost" runat="server" Text='<%# Bind("ToolCost") %>' /></td>
			</tr>
            
            <tr>
				<td align="right"> Daily Rental Fee: </td><td align="left"><asp:TextBox ID="tb_ToolDailyRental" runat="server" Text='<%# Bind("ToolDailyRental") %>' /></td>
			</tr>
            
            <tr>
				<td align="right"> Photo Name: </td><td align="left"><asp:TextBox ID="tb_ToolPhotoName" runat="server" Text='<%# Bind("ToolPhotoName") %>' /></td>
			</tr>

            <tr>
				<td align="right"> Type: </td>
				<td align="left">
					 <asp:DropDownList ID="ddl_ToolType" runat="server" DataSourceID="SqlDataSource2" 
						DataTextField="ToolType" DataValueField="ToolType" SelectedValue='<%# Bind("ToolType") %>'>
					</asp:DropDownList>
				</td>
            </tr>

            <tr>
				<td align="right"> Available: </td>
				<td align="left">
					 <asp:DropDownList ID="ddl_ToolAvail" runat="server" DataSourceID="SqlDataSource3" 
						DataTextField="ToolAvail" DataValueField="ToolAvail" SelectedValue='<%# Bind("ToolAvail") %>'>
					</asp:DropDownList>
				</td>
            </tr>
		
		  </table>



            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />

            &nbsp; &nbsp;

			<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />

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
            
            <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />

		        &nbsp;
		
		    <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm ('Are you sure you want to delete this tool record?')"  />
            
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

<asp:Label ID="lbl_DeletedTool" runat="server" Text=""></asp:Label>
       

</asp:Content>

