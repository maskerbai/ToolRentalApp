<%@ Page Title="" Language="VB" MasterPageFile="~/tool.master" AutoEventWireup="false" CodeFile="ReturnTool.aspx.vb" Inherits="sales_ReturnTool" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br />
<br />

    <table class="center">
    
        <tr>
			<td align="right"> Tool ID to be returned: </td><td align="left"><asp:TextBox ID="tb_ToolID" runat="server"></asp:TextBox></td>
			
            <td align="left">
       
                <asp:RequiredFieldValidator ID="rfd_ToolIdRequired" runat="server" 
                           ControlToValidate="tb_ToolID" ErrorMessage="Please enter the ID of the tool to be returned." 
                           ToolTip="Please enter the ID of the tool to be returned.">
                           <span class=rfd>*** Please enter the ID of the tool to be returned.</span>
                </asp:RequiredFieldValidator>
            
            </td>                           
    
        </tr>

    </table>

    <br /><br />
    <asp:Button ID="btn_Return" runat="server" Text="Return Tool" />


</asp:Content>

