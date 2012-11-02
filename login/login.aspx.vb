
Partial Class login_login
    Inherits System.Web.UI.Page

    'Have the cursor automatically appear in the username box so the user doesn't have to click into the box.
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Login1.Focus()

    End Sub


    Protected Sub Login1_LoggedIn(sender As Object, e As System.EventArgs) Handles Login1.LoggedIn

        If Roles.IsUserInRole(Login1.UserName, "r_admin") = True Then
            Response.Redirect("~/admin/default.aspx")

        ElseIf Roles.IsUserInRole(Login1.UserName, "r_sales") = True Then
            Response.Redirect("~/sales/default.aspx")

        ElseIf Roles.IsUserInRole(Login1.UserName, "r_customer") = True Then
            Response.Redirect("~/customer/default.aspx")

        Else : Response.Redirect("default.aspx")

        End If

    End Sub


End Class
