Imports System.Data.SqlClient

Partial Class sales_ReturnTool
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        tb_ToolID.Focus()

    End Sub

    Protected Sub btn_Return_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_Return.Click

        Dim strToolId As String = tb_ToolID.Text

        Dim sqlConn As New SqlConnection(ConfigurationManager.ConnectionStrings("cs_ToolRental").ConnectionString)

            Dim sqlAdp As New SqlDataAdapter
            Dim sqlCmd As New SqlCommand

            sqlCmd.Connection = sqlConn
        sqlCmd.CommandText = "sp_TR_ToolReturn"
            sqlCmd.CommandType = Data.CommandType.StoredProcedure

            sqlCmd.Parameters.Add(New SqlParameter("@toolID", strToolId))

            sqlConn.Open()
            sqlCmd.ExecuteNonQuery()
            sqlConn.Close()

        Response.Redirect("ViewAllRentals.aspx")

    End Sub

End Class
