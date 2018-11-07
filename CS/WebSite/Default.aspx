<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dx" %>






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title></title>
	<script language="javascript" type="text/javascript">
		function ShowPopup(s, e) {
			var value = s.GetText();
			treeList.SetSelectedNode(treeList.GetNodeByText(value));
			popup.ShowAtElement(s.GetMainElement());
			popup.Caller = s;
		}
		function SetSelectedLinkText(s, e) {
			var text = treeList.GetSelectedNode().GetText();
			hiddenField.Set("value", text);
			popup.Caller.SetText(text);			
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" OnDataBinding="grid_DataBinding"
			KeyFieldName="Id" onrowinserting="grid_RowInserting" 
			onrowupdating="grid_RowUpdating">
			<Columns>
				<dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="Value" VisibleIndex="1">
					<DataItemTemplate>
						<dx:ASPxLabel ID="label" runat="server" Value='<%# Bind("Value") %>'>
						</dx:ASPxLabel>
					</DataItemTemplate>
					<EditItemTemplate>
						<dx:ASPxHyperLink ID="hShowPopup" runat="server" Text='<%# Bind("Value") %>'>
							<ClientSideEvents Click="ShowPopup" Init="function(s, e) { if (!s.GetText()) s.SetText('Select value...'); }" />
						</dx:ASPxHyperLink>
					</EditItemTemplate>
				</dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn VisibleIndex="2" ShowNewButton="True" ShowEditButton="True" ShowDeleteButton="True" ShowCancelButton="True" ShowUpdateButton="True" ShowClearFilterButton="True"/>
			</Columns>
		</dx:ASPxGridView>
		<dx:ASPxHiddenField ID="hiddenField" runat="server" 
			ClientInstanceName="hiddenField">
		</dx:ASPxHiddenField>
		<br />
		<br />
	</div>
	<dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server"
		Height="104px" ClientInstanceName="popup" PopupHorizontalAlign="OutsideRight"
		PopupVerticalAlign="TopSides">
		<ContentCollection>
			<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
				<dx:ASPxTreeView ID="treeList" runat="server" AllowSelectNode="True" ClientInstanceName="treeList">
					<ClientSideEvents NodeClick="SetSelectedLinkText" />
					<Nodes>
						<dx:TreeViewNode Text="Value 1">
						</dx:TreeViewNode>
						<dx:TreeViewNode Text="Value 2">
						</dx:TreeViewNode>
						<dx:TreeViewNode Text="Value 3">
						</dx:TreeViewNode>
					</Nodes>
				</dx:ASPxTreeView>
			</dx:PopupControlContentControl>
		</ContentCollection>
	</dx:ASPxPopupControl>
	</form>
</body>
</html>
