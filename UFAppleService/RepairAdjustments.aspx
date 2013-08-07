<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RepairAdjustments.aspx.cs" Inherits="UFAppleService.RepairAdjustments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="beginningDateLabel" runat="server" Text="Beginning Date:"></asp:Label>
    <asp:TextBox ID="beginningDateTextBox" runat="server" Width="90px" MaxLength="10"></asp:TextBox>
    <asp:Label ID="endDateLabel" runat="server" Text="End Date:"></asp:Label>
    <asp:TextBox ID="endDateTextBox" runat="server" MaxLength="10" Width="90px"></asp:TextBox>
    <asp:Button ID="viewButton" runat="server" Text="View" OnClick="viewButton_Click" />

    <asp:DataGrid runat="server" ID="RepairAdjustmentsGrid" DataSourceID="RepairAdjustmentGridDataSource" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Larger" AutoGenerateColumns="false" 
        OnItemDataBound="RepairAdjustmentsGrid_ItemDataBound">
        <Columns>
            <asp:BoundColumn DataField="TransactionID" HeaderText="Transaction" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundColumn DataField="SRONumber" HeaderText="SRO Number" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundColumn DataField="Description" HeaderText="Account" />
            <asp:BoundColumn DataField="Amount" HeaderText="Amount" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundColumn DataField="Amount" Visible="false" />
            <asp:BoundColumn DataField="Date" HeaderText="Transaction Date" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundColumn DataField="Comment" HeaderText="Comment" /> 
        </Columns>
    </asp:DataGrid>

     <asp:Label ID="totalLabel" runat="server" Font-Bold="True" Font-Size="Large" Text="Total:" Visible="false" style="left: 340px; position: relative"></asp:Label>
    <asp:Label ID="amountTotalLabel" runat="server" Font-Bold="True" Font-Size="Large" style="left: 347px; position: relative"></asp:Label>

    <asp:SqlDataSource runat="server" ID="RepairAdjustmentGridDataSource" SelectCommand="RepairAdjustment" SelectCommandType="StoredProcedure" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>">
        <SelectParameters>
            <asp:Parameter Name="DateMin" />
            <asp:Parameter Name="DateMax" />
        </SelectParameters>
    </asp:SqlDataSource>  
</asp:Content>
