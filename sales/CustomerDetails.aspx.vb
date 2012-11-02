Imports System.Data.SqlClient
Imports System.Web.Security
Imports System.Web.Security.Roles
Imports System.Web.Security.Membership
Imports System.Data

Partial Class sales_CustomerDetails
    Inherits System.Web.UI.Page

    Protected Sub DeleteButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim selUser As Label = CType(FormView1.FindControl("lbl_UserName"), Label)

        If selUser IsNot Nothing Then

            Dim delUser As String = selUser.Text

            Membership.DeleteUser(selUser.Text)

        End If

    End Sub


    Protected Sub FormView1_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles FormView1.ItemDeleted

        Dim delCustomerFname As String = e.Values("FirstName").ToString()
        Dim delCustomerLname As String = e.Values("LastName").ToString()


        lbl_DeletedCustomer.Text = "The customer <span class=deletedrecordhighlight> " & delCustomerFname & " " & delCustomerLname & "</span> has been deleted from the database."

        Response.AddHeader("REFRESH", "3;URL=ViewAllCustomers.aspx")
        'Response.Redirect("ViewAllCustomers.aspx")

    End Sub



    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated

        Response.Redirect("ViewAllCustomers.aspx")

    End Sub


End Class
