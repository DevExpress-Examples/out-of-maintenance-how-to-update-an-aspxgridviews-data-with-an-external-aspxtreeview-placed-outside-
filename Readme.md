<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# How to update an ASPxGridView's data with an external ASPxTreeView (placed outside of the grid)


<p>In this example, we have an ASPxGridView bound to a DataTable. The grid has two columns: 'Id' and 'Value'. The second column has a DataItemTemplate and EditItemTemplate. The first template contains an ASPxLabel. It displays bound data. The second template contains an ASPxHyperLink. It is used in the grid's edit form. If a user clicks on it, an ASPxPopupControl appears. The popup contains an ASPxTreeView. When a user click on the list item, the same value is set for the hyperlink.</p>

<br/>


