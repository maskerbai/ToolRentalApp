<%@ Page Title="" Language="VB" MasterPageFile="~/tool.master" AutoEventWireup="false" CodeFile="AddNewTool.aspx.vb" Inherits="sales_ToolDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Add A New Tool</title>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_ToolRental %>" 
        
        DeleteCommand="DELETE FROM [TR_Tools] WHERE [ToolID] = @ToolID" 
        
        InsertCommand="INSERT INTO [TR_Tools] ([ToolName], [ToolMfg], [ToolDesc], [ToolCost], [ToolDailyRental], [ToolPhotoName], [ToolAvail], [ToolType]) VALUES (@ToolName, @ToolMfg, @ToolDesc, @ToolCost, @ToolDailyRental, @ToolPhotoName, @ToolAvail, @ToolType)" 
        
        SelectCommand="SELECT [ToolID], [ToolName], [ToolMfg], [ToolDesc], [ToolCost], [ToolDailyRental], [ToolPhotoName], [ToolAvail], [ToolType] FROM [TR_Tools]" 
        
        UpdateCommand="UPDATE [TR_Tools] SET [ToolName] = @ToolName, [ToolMfg] = @ToolMfg, [ToolDesc] = @ToolDesc, [ToolCost] = @ToolCost, [ToolDailyRental] = @ToolDailyRental, [ToolPhotoName] = @ToolPhotoName, [ToolAvail] = @ToolAvail, [ToolType] = @ToolType WHERE [ToolID] = @ToolID">
        
        <DeleteParameters>
            <asp:Parameter Name="ToolID" Type="Int32" />
        </DeleteParameters>
        
        <InsertParameters>
            <asp:Parameter Name="ToolName" Type="String" />
            <asp:Parameter Name="ToolMfg" Type="String" />
            <asp:Parameter Name="ToolDesc" Type="String" />
            <asp:Parameter Name="ToolCost" Type="Double" />
            <asp:Parameter Name="ToolDailyRental" Type="Double" />
            <asp:Parameter Name="ToolPhotoName" Type="String" />
            <asp:Parameter Name="ToolAvail" Type="String" />
            <asp:Parameter Name="ToolType" Type="String" />
        </InsertParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="ToolName" Type="String" />
            <asp:Parameter Name="ToolMfg" Type="String" />
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
        
        SelectCommand="SELECT [ToolAvailDisplay], [ToolAvail] FROM [TR_Avail]">
    
    </asp:SqlDataSource>
    
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ToolID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
        <EditItemTemplate>
        </EditItemTemplate>
        
        <InsertItemTemplate>
          <table>
			            
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
						DataTextField="ToolType" DataValueField="ToolType" SelectedValue='<%# Bind("ToolType") %>' 
                         AppendDataBoundItems="True">
					     <asp:ListItem Value="0">Select Tool Type</asp:ListItem>
					</asp:DropDownList>
				</td>
            </tr>

            
             <tr>
				<td align="right"> Available: </td>
				<td align="left">
					 <asp:DropDownList ID="ddl_ToolAvail" runat="server" DataSourceID="SqlDataSource3" 
						DataTextField="ToolAvailDisplay" DataValueField="ToolAvail" 
                         SelectedValue='<%# Bind("ToolAvail") %>' AppendDataBoundItems="True">
					     <asp:ListItem Value="0">Select Tool Availability</asp:ListItem>
					</asp:DropDownList>
				</td>
            </tr>

		  </table>

          <br />

            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add New Item" />

            &nbsp; &nbsp;

			<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />

    
         
            
        </InsertItemTemplate>
        
        <ItemTemplate>
        </ItemTemplate>

    </asp:FormView>

   
      

</asp:Content>

