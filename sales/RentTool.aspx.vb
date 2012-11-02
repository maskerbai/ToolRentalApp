Imports System.Data.SqlClient

Partial Class sales_RentTool
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        tb_UserName.Focus()

    End Sub

    Protected Sub btn_Rent_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_Rent.Click

        Dim strToolId As String = tb_ToolID.Text
        Dim strUserName As String = tb_UserName.Text
        Dim RentDate As DateTime = DateTime.Now
        Dim DateDueBack As DateTime = DateAdd("d", 3, Today)


        Dim sqlConn As New SqlConnection(ConfigurationManager.ConnectionStrings("cs_ToolRental").ConnectionString)

        Dim sqlAdp As New SqlDataAdapter
        Dim sqlCmd As New SqlCommand

        sqlCmd.Connection = sqlConn
        sqlCmd.CommandText = "sp_TR_RentTool"
        sqlCmd.CommandType = Data.CommandType.StoredProcedure

        sqlCmd.Parameters.Add(New SqlParameter("@UserName", strUserName))
        sqlCmd.Parameters.Add(New SqlParameter("@ToolID", strToolId))
        sqlCmd.Parameters.Add(New SqlParameter("@RentDate", RentDate))
        sqlCmd.Parameters.Add(New SqlParameter("@DateDueBack", DateDueBack))
        sqlConn.Open()
        sqlCmd.ExecuteNonQuery()
        sqlConn.Close()

        Response.Redirect("ViewAllRentals.aspx")

    End Sub

End Class
