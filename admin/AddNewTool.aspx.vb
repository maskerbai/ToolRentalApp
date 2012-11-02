Partial Class sales_ToolDetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        FormView1.Focus()

    End Sub

    Protected Sub FormView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted

        Response.Redirect("~/admin/ViewAllTools.aspx")

    End Sub

    
End Class
