<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxTreeView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHiddenField" tagprefix="dx" %>
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
						<dx:ASPxLabel ID="label" runat="server" Value='<%#Bind("Value")%>'>
						</dx:ASPxLabel>
					</DataItemTemplate>
					<EditItemTemplate>
						<dx:ASPxHyperLink ID="hShowPopup" runat="server" Text='<%#Bind("Value")%>'>
							<ClientSideEvents Click="ShowPopup" Init="function(s, e) { if (!s.GetText()) s.SetText('Select value...'); }" />
						</dx:ASPxHyperLink>
					</EditItemTemplate>
				</dx:GridViewDataTextColumn>
				<dx:GridViewCommandColumn VisibleIndex="2">
					<NewButton Visible="True">
					</NewButton>
					<EditButton Visible="True">
					</EditButton>
					<DeleteButton Visible="True">
					</DeleteButton>
					<CancelButton Visible="True">
					</CancelButton>
					<UpdateButton Visible="True">
					</UpdateButton>
					<ClearFilterButton Visible="True">
					</ClearFilterButton>
				</dx:GridViewCommandColumn>
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