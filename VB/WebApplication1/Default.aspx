<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebApplication1._Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxGauges.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGauges" TagPrefix="dxg" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGauges.Gauges" TagPrefix="dxg" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" TagPrefix="dxg" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" TagPrefix="dxg" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGauges.Gauges.State" TagPrefix="dxg" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" TagPrefix="dxg" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Untitled Page</title>
</head>
<body>
	 <form id="form1" runat="server">
		<div>
			<dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="masterDataSource"
				KeyFieldName="CustomerID" Width="100%">
				<Columns>
					<dxwgv:GridViewDataColumn FieldName="ContactName" VisibleIndex="0">
					</dxwgv:GridViewDataColumn>
					<dxwgv:GridViewDataColumn FieldName="CompanyName" VisibleIndex="1">
					</dxwgv:GridViewDataColumn>
					<dxwgv:GridViewDataColumn FieldName="City" VisibleIndex="2">
					</dxwgv:GridViewDataColumn>
					<dxwgv:GridViewDataColumn FieldName="Region" Visible="False">
					</dxwgv:GridViewDataColumn>
					<dxwgv:GridViewDataColumn FieldName="Country" VisibleIndex="3">
					</dxwgv:GridViewDataColumn>
				</Columns>
				<Templates>
					<DetailRow>
						Contact Phone: <b><%#Eval("Phone")%></b></br>
						<dxg:ASPxGaugeControl ID="ASPxGaugeControl1" runat="server" BackColor="White" Height="93px"
							Width="336px" DefaultValue='<%#Eval("Phone")%>' >
							<Gauges>
								<dxg:DigitalGauge ID="Gauge0" AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#00FFFFFF&quot;/&gt;"
									AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:WhiteSmoke&quot;/&gt;"
									Bounds="0, 0, 336, 93" DigitCount="12" Padding="20, 20, 20, 20" Text="00,000">
									<BackgroundLayers>
										<dxg:DigitalBackgroundLayerComponent BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent7"
											ShapeType="Style7" TopLeft="20, 0" ZOrder="1000" />
									</BackgroundLayers>
								</dxg:DigitalGauge>
							</Gauges>
						</dxg:ASPxGaugeControl>
					</DetailRow>
				</Templates>
				<SettingsDetail ShowDetailRow="True" />
				<Settings ShowGroupPanel="True" />
				<SettingsCustomizationWindow Enabled="True" />
			</dxwgv:ASPxGridView>
			<asp:AccessDataSource ID="masterDataSource" runat="server" DataFile="~/App_Data/nwind.mdb"
				SelectCommand="SELECT * FROM [Customers]"></asp:AccessDataSource>
			<asp:AccessDataSource ID="detailDataSource" runat="server" DataFile="~/App_Data/nwind.mdb"
				SelectCommand="SELECT * FROM [Invoices] Where CustomerID = ?">
				<SelectParameters>
					<asp:SessionParameter Name="CustomerID" SessionField="CustomerID" Type="String" />
				</SelectParameters>
			</asp:AccessDataSource>
		</div>
	</form>
</body>
</html>
