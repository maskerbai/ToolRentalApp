
Partial Class tool
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Display the date in the #menubar div
        lbl_date.Text = DateTime.Now.ToLongDateString

        'Display the date for the copyright
        lbl_copy.Text = DateTime.Now.Year
    End Sub

    'When a user logs out, redirect them to the default home page.
    Protected Sub LoginStatus1_LoggedOut(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoginStatus1.LoggedOut
        Response.Redirect("~/default.aspx")
    End Sub

End Class

