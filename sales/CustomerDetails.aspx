<%@ Page Title="" Language="VB" MasterPageFile="~/tool.master" AutoEventWireup="false" CodeFile="CustomerDetails.aspx.vb" Inherits="sales_CustomerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>View, Edit & Delete Customer Details</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_ToolRental %>" 
        SelectCommand="SELECT TR_Tools.ToolID, TR_Tools.ToolName, TR_Tools.ToolMfg, TR_Tools.ToolDesc, TR_Rentals.DateDueBack FROM TR_Rentals INNER JOIN TR_Tools ON TR_Rentals.ToolID = TR_Tools.ToolID WHERE (TR_Rentals.UserID = @UserID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>

 <asp:FormView ID="FormView1" runat="server" DataKeyNames="UserID" DataSourceID="SqlDataSource2">

    <EditItemTemplate>
        <table>
			<tr>
				<td align="right"> First Name: </td><td align="left"><asp:TextBox ID="tb_FirstName" runat="server" Text='<%# Bind("FirstName") %>' /></td>
			</tr>
            
			<tr>
				<td align="right"> Last Name: </td><td align="left"><asp:TextBox ID="tb_LastName" runat="server" Text='<%# Bind("LastName") %>' /></td>
			</tr>
            
			<tr>
				<td align="right"> City: </td><td align="left"><asp:TextBox ID="tb_City" runat="server" Text='<%# Bind("City") %>' /></td>
			</tr>
            
			<tr>
				<td align="right"> State: </td>
				<td align="left">
					 <asp:DropDownList ID="ddlZip" runat="server" DataSourceID="SqlDataSource1" 
						DataTextField="PostalCode" DataValueField="PostalCode" SelectedValue='<%# Bind("State") %>'>
					</asp:DropDownList>
				</td>
            </tr>
						
			<tr>
				<td> &nbsp; </td><td> &nbsp; </td>
			</tr>
       
			<tr>
				<td align="right"> User ID: </td><td align="left"> <asp:Label ID="lbl_UserID" runat="server" Text='<%# Eval("UserID") %>' /> </td>
			</tr>

			<tr>
				<td align="right"> User Name: </td><td align="left"> <asp:TextBox ID="tb_UserName" runat="server" enabled="false" Text='<%# Bind("UserName") %>' /> </td>
			</tr>
			
			<tr>
				<td align="right"> Role Name: </td><td align="left"> <asp:TextBox ID="tb_RoleName" runat="server" enabled="false" Text='<%# Bind("RoleName") %>' /> </td>
			</tr>
		</table>
            
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp; &nbsp;
			<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_ToolRental %>" 
                SelectCommand="SELECT [PostalCode] FROM [TR_PostalCode]"></asp:SqlDataSource>
				
        </EditItemTemplate>
		
		
		
        <InsertItemTemplate>
            
        </InsertItemTemplate>
		
		
		
        <ItemTemplate>
           
        <table>
			<tr>
				<td align="right"> First Name: </td><td align="left"><asp:Label ID="lbl_FirstName" runat="server" Text='<%# Bind("FirstName") %>' /></td>
			</tr>
            
			<tr>
				<td align="right"> Last Name: </td><td align="left"><asp:Label ID="lbl_LastName" runat="server" Text='<%# Bind("LastName") %>' /></td>
			</tr>
            
			<tr>
				<td align="right"> City: </td><td align="left"><asp:Label ID="lbl_City" runat="server" Text='<%# Bind("City") %>' /></td>
			</tr>
            
			<tr>
				<td align="right"> State: </td> <td align="left"><asp:Label ID="lbl_PostalCode" runat="server" Text='<%# Bind("State") %>' />	</td>
            </tr>
			
			<tr>
				<td> &nbsp; </td><td> &nbsp; </td>
			</tr>
       
			<tr>
				<td align="right"> User ID: </td><td align="left"> <asp:Label ID="lbl_UserID1" runat="server" Text='<%# Eval("UserID") %>' /></td>
			</tr>

			<tr>
				<td align="right"> User Name: </td><td align="left"> <asp:Label ID="lbl_UserName" runat="server" Text='<%# Bind("UserName") %>' /></td>
			</tr>
			
			<tr>
				<td align="right"> Role Name: </td><td align="left"><asp:Label ID="lbl_RoleName" runat="server" Text='<%# Bind("RoleName") %>' /></td>
			</tr>
		</table>

		<asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />

		&nbsp;
		
		<asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" onclick="DeleteButton_Click" OnClientClick="return confirm ('Are you sure you want to delete this customer record?')"  />
                
		    <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ToolID" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:BoundField DataField="ToolID" HeaderText="ToolID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ToolID" />
                    <asp:BoundField DataField="ToolName" HeaderText="ToolName" 
                        SortExpression="ToolName" />
                    <asp:BoundField DataField="ToolMfg" HeaderText="ToolMfg" 
                        SortExpression="ToolMfg" />
                    <asp:BoundField DataField="ToolDesc" HeaderText="ToolDesc" 
                        SortExpression="ToolDesc" />
                    <asp:BoundField DataField="DateDueBack" HeaderText="DateDueBack" 
                        SortExpression="DateDueBack" />
                </Columns>
            </asp:GridView>
                
		<br />
			
		</ItemTemplate>


</asp:FormView>
   
<br />
<asp:Label ID="lbl_DeletedCustomer" runat="server" Text=""></asp:Label>
<br />


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs_ToolRental %>" 
		
		DeleteCommand="DELETE FROM [aspnet_Users] WHERE [UserID] = @UserID" 
               
        SelectCommand="SELECT TR_UserProfile.UserID, TR_UserProfile.FirstName, TR_UserProfile.LastName, TR_UserProfile.City, TR_UserProfile.State, aspnet_Users.UserName, aspnet_Roles.RoleName FROM TR_UserProfile INNER JOIN aspnet_Users ON TR_UserProfile.UserID = aspnet_Users.UserId INNER JOIN aspnet_Roles ON aspnet_Users.ApplicationId = aspnet_Roles.ApplicationId INNER JOIN aspnet_UsersInRoles ON aspnet_Users.UserId = aspnet_UsersInRoles.UserId AND aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId WHERE (TR_UserProfile.UserID = @UserID)" 
        
        UpdateCommand="UPDATE [TR_UserProfile] SET [FirstName] = @FirstName, [LastName] = @LastName, [City] = @City, [State] = @State  WHERE [UserID] = @UserID">
        
        <DeleteParameters>
            <asp:Parameter Name="UserID" Type="Object" />
        </DeleteParameters>

        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" />
        </SelectParameters>

        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" />
			<asp:Parameter Name="UserID" />
         </UpdateParameters>

    </asp:SqlDataSource>


</asp:Content>

