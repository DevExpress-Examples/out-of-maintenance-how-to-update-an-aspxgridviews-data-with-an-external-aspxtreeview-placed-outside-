using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
	private DataTable table;


	public DataTable CustomDataSource {
		get {
			if (table == null)
				table = Session["table"] as DataTable;
			if (table == null)
				table = CreateDataSource();
			return table;
		}
		set { table = value; }
	}
	protected void Page_Load(object sender, EventArgs e) {
		if (!IsPostBack)
			Session.Clear();
		grid.DataBind();

	}

	private DataTable CreateDataSource() {
		DataTable dt = new DataTable();

		dt.Columns.Add("Id", typeof(int));
		dt.Columns.Add("Value", typeof(string));
		dt.PrimaryKey = new DataColumn[] { dt.Columns[0] };

		dt.Rows.Add(0, "Value 1");
		dt.Rows.Add(1, "Value 2");
		dt.Rows.Add(2, "Value 3");
		dt.Rows.Add(3, "Value 1");
		dt.Rows.Add(4, "Value 1");

		Session["table"] = dt;
		return dt;
	}

	private void UpdateTable() {
		Session["table"] = table;
		grid.DataBind();
	}
	protected void grid_DataBinding(object sender, EventArgs e) {
		grid.DataSource = CustomDataSource;
	}
	protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
		DataRow row = CustomDataSource.Rows.Find(e.OldValues["Id"]);
		row[0] = e.NewValues["Id"];
		if (hiddenField.Contains("value"))
			row[1] = hiddenField["value"];
		UpdateTable();
		e.Cancel = true;
		grid.CancelEdit();
	}
	protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e) {
		CustomDataSource.Rows.Add(e.NewValues["Id"], hiddenField["value"]);
		e.Cancel = true;
		grid.CancelEdit();
	}
}
