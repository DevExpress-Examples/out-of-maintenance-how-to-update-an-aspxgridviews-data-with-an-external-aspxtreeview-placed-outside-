Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private table As DataTable


	Public Property CustomDataSource() As DataTable
		Get
			If table Is Nothing Then
				table = TryCast(Session("table"), DataTable)
			End If
			If table Is Nothing Then
				table = CreateDataSource()
			End If
			Return table
		End Get
		Set(ByVal value As DataTable)
			table = value
		End Set
	End Property
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If (Not IsPostBack) Then
			Session.Clear()
		End If
		grid.DataBind()

	End Sub

	Private Function CreateDataSource() As DataTable
		Dim dt As New DataTable()

		dt.Columns.Add("Id", GetType(Integer))
		dt.Columns.Add("Value", GetType(String))
		dt.PrimaryKey = New DataColumn() { dt.Columns(0) }

		dt.Rows.Add(0, "Value 1")
		dt.Rows.Add(1, "Value 2")
		dt.Rows.Add(2, "Value 3")
		dt.Rows.Add(3, "Value 1")
		dt.Rows.Add(4, "Value 1")

		Session("table") = dt
		Return dt
	End Function

	Private Sub UpdateTable()
		Session("table") = table
		grid.DataBind()
	End Sub
	Protected Sub grid_DataBinding(ByVal sender As Object, ByVal e As EventArgs)
		grid.DataSource = CustomDataSource
	End Sub
	Protected Sub grid_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
		Dim row As DataRow = CustomDataSource.Rows.Find(e.OldValues("Id"))
		row(0) = e.NewValues("Id")
		If hiddenField.Contains("value") Then
			row(1) = hiddenField("value")
		End If
		UpdateTable()
		e.Cancel = True
		grid.CancelEdit()
	End Sub
	Protected Sub grid_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
		CustomDataSource.Rows.Add(e.NewValues("Id"), hiddenField("value"))
		e.Cancel = True
		grid.CancelEdit()
	End Sub
End Class
