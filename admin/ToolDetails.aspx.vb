Partial Class sales_ToolDetails
    Inherits System.Web.UI.Page

    Protected Sub FormView1_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles FormView1.ItemDeleted

        Dim deletedTool As String = e.Values("ToolName").ToString()

        lbl_DeletedTool.Text = "The record <span class=deletedrecordhighlight> " & deletedTool & "</span> has been deleted from the database."

        Response.AddHeader("REFRESH", "3;URL=ViewAllTools.aspx")


    End Sub



    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated

        Response.Redirect("ViewAllTools.aspx")

    End Sub

End Class
