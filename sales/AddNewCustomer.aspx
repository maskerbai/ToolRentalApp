<%@ Page Title="" Language="VB" MasterPageFile="~/tool.master" AutoEventWireup="false" CodeFile="AddNewCustomer.aspx.vb" Inherits="sales_AddNewCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Add A New Customer</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
        LoginCreatedUser="False">

    <WizardSteps>
        <asp:CreateUserWizardStep runat="server" >
        
            <ContentTemplate>
                <table>
                    <tr>
                        <td align="center" colspan="2">
                            Sign Up for Your New Account</td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                ControlToValidate="Password" ErrorMessage="Password is required." 
                                ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                ControlToValidate="ConfirmPassword" 
                                ErrorMessage="Confirm Password is required." 
                                ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                        </td>
                        <td>
                            
                            <asp:DropDownList ID="Question" runat="server"> 
                                <asp:ListItem Value="-1">Select Question</asp:ListItem>
                                <asp:ListItem>What is your favorite color?</asp:ListItem>
                                <asp:ListItem>What is your favorite tree?</asp:ListItem>
                                <asp:ListItem>Are you happy today?</asp:ListItem>
                            </asp:DropDownList>
                            
                            <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                ControlToValidate="Question" ErrorMessage="Security question is required." 
                                ToolTip="Security question is required." InitialValue="-1"  ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                ControlToValidate="Answer" ErrorMessage="Security answer is required." 
                                ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                Display="Dynamic" 
                                ErrorMessage="The Password and Confirmation Password must match." 
                                ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="color:Red;">
                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:CreateUserWizardStep>
        
        <asp:WizardStep ID="UserProfile" runat="server" StepType="Step" Title="User Profile Settings">
            
            <table>
                <tr>
                    <td align=right>First Name:</td> <td align=left> <asp:TextBox ID="tb_FirstName" runat="server" Columns="50"></asp:TextBox></td>
               
                    <td>
                    
                    <asp:RequiredFieldValidator ID="FirstNameRequired" runat="server" 
                                    ControlToValidate="tb_FirstName" ErrorMessage="First name is required." 
                                    ToolTip="First name is required.">
                                    <span class="rfd">*** Please enter a first name.</span>
                    </asp:RequiredFieldValidator>
                    
                    </td>
               
                </tr>

                <tr>
                    <td align=right>Last Name:</td> <td align=left> <asp:TextBox ID="tb_LastName" runat="server" Columns="50"></asp:TextBox></td>
                
                    <td>
                    
                     <asp:RequiredFieldValidator ID="LastNameRequired" runat="server" 
                                    ControlToValidate="tb_LastName" ErrorMessage="Last name is required." 
                                    ToolTip="Last name is required.">
                                    <span class="rfd">*** Please enter a last name.</span>
                    </asp:RequiredFieldValidator>
                    
                    </td>
                    
                
                </tr>

                <tr>
                    <td align=right>City:</td> <td align=left> <asp:TextBox ID="tb_City" runat="server" Columns="50"></asp:TextBox></td>
                </tr>

                <tr>
                    <td align=right>State:</td> <td align=left> <asp:DropDownList ID="ddl_State" 
                        runat="server" DataSourceID="ds_ddlState" DataTextField="PostalCode" 
                        DataValueField="PostalCode" AppendDataBoundItems="True"> 
                    <asp:ListItem Value="0">Select State</asp:ListItem>
                    </asp:DropDownList> </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfd_StateRequired" runat="server" 
                                    ControlToValidate="ddl_State" ErrorMessage="State is required." 
                                    ToolTip="State is required." InitialValue="0">
                                    <span class="rfd">*** Please enter a state.</span>
                        </asp:RequiredFieldValidator>
                    </td>

                </tr>
            </table>

                   <asp:SqlDataSource runat="server" 
                    ID="ds_ddlState"
                    ConnectionString="<%$ ConnectionStrings:cs_ToolRental %>" 
                    SelectCommand="SELECT [PostalCode] FROM [TR_PostalCode]"></asp:SqlDataSource>





        </asp:WizardStep>
        
        <asp:CompleteWizardStep runat="server" >
            <ContentTemplate>
                <table>
                    <tr>
                        <td align="center">
                            Complete</td>
                    </tr>
                    <tr>
                        <td>
                            Your account has been successfully created.</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                CommandName="Continue" onclick="ContinueButton_Click" Text="Continue" 
                                ValidationGroup="CreateUserWizard1" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:CompleteWizardStep>

    </WizardSteps>
</asp:CreateUserWizard>



</asp:Content>

