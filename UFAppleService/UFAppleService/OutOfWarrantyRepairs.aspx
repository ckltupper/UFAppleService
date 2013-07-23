<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OutOfWarrantyRepairs.aspx.cs" Inherits="UFAppleService.OutOfWarrantyRepairs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DataGrid runat="server" ID="OutOfWarrantyRepairsGrid" DataSourceID="OutOfWarrantyRepairGridDataSource" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Larger" AutoGenerateColumns="false" 
        OnItemDataBound="OutOfWarrantyRepairsGrid_ItemDataBound">
        <Columns>
            <asp:BoundColumn DataField="TransactionID" HeaderText="Transaction ID" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundColumn DataField="SRONumber" HeaderText="SRO Number" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundColumn DataField="Description" HeaderText="Account" />
            <asp:BoundColumn DataField="Amount" HeaderText="Amount" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundColumn DataField="Amount" Visible="false" />
            <asp:BoundColumn DataField="Date" HeaderText="Transaction Date" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundColumn DataField="Comment" HeaderText="Comment" /> 
        </Columns>
    </asp:DataGrid>

    <asp:Label ID="totalLabel" runat="server" Font-Bold="True" Font-Size="Large" Text="Total:"></asp:Label>
    <asp:Label ID="amountTotalLabel" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>

    <asp:SqlDataSource runat="server" ID="OutOfWarrantyRepairGridDataSource" SelectCommand="SELECT dbo.Transactions.TransactionID, dbo.Transactions.SRONumber, dbo.ChartofAccounts.Description, dbo.Transactions.Amount, dbo.Transactions.Date, 
                      dbo.Comment.Comment FROM dbo.Transactions LEFT OUTER JOIN dbo.ChartofAccounts ON dbo.Transactions.COAID = dbo.ChartofAccounts.COAID LEFT OUTER JOIN dbo.Comment ON dbo.Transactions.CID = dbo.Comment.CID 
                      WHERE (dbo.Transactions.COAID = 120)" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>">
    </asp:SqlDataSource>  
</asp:Content>
