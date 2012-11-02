
Partial Class sales_ToolsDueToday
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ' Declare a variable
        Dim ToolsDueToday As String

        ' Set the variable equal to the SQL statement to perform the search
        ToolsDueToday = "SELECT * FROM TR_Rentals WHERE DateDueBack <= CONVERT(datetime,CONVERT(varchar(10),GetDate(),112))"

        ' Apply the variable (SQL statement) to the data source
        SqlDataSource1.SelectCommand = ToolsDueToday

    End Sub


End Class
