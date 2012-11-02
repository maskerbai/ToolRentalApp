<%@ Page Title="" Language="VB" MasterPageFile="~/tool.master" AutoEventWireup="false" CodeFile="RentTool.aspx.vb" Inherits="sales_RentTool" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <br />
    <br />

    <table class="center">
		<tr>
			<td align="right"> Username: </td><td align="left"><asp:TextBox ID="tb_UserName" runat="server"></asp:TextBox></td>
			
            <td align="left">
            
                <asp:RequiredFieldValidator ID="rfd_UserNameRequired" runat="server" 
                           ControlToValidate="tb_UserName" ErrorMessage="Please enter the UserName of the person renting the tool." 
                           ToolTip="Please enter the UserName of the person renting the tool.">
                           <span class=rfd>*** Please enter the UserName of the person renting the tool.</span>
                </asp:RequiredFieldValidator>
             </td>
        </tr>

        <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
        <tr>
			<td align="right"> Tool ID:  </td><td align="left"><asp:TextBox ID="tb_ToolID" runat="server"></asp:TextBox></td>
			
            <td align="left">
            
               <asp:RequiredFieldValidator ID="rfd_ToolIdRequired" runat="server" 
                        ControlToValidate="tb_UserName" ErrorMessage="Please enter the Tool ID of the tool being rented." 
                        ToolTip="Please enter the Tool ID of the tool being rented.">
                        <span class=rfd>*** Please enter the Tool ID of the tool being rented.</span>
               </asp:RequiredFieldValidator>
             </td>
        </tr>

    </table>

    <br />
    <br />
   
    <asp:Button ID="btn_Rent" runat="server" Text="Rent Tool" />



</asp:Content>

