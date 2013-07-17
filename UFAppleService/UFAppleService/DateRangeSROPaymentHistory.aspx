<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DateRangeSROPaymentHistory.aspx.cs" Inherits="UFAppleService.DateRangeSROPaymentHistory" %>
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
    <asp:DataGrid runat="server" ID="DateRangePaymentHistoryGrid" DataSourceID="DateRangePaymentHistoryGridDataSource" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Larger" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundColumn DataField="SRONumber" HeaderText="SRO Number" />
            <asp:BoundColumn DataField="TransactionID" HeaderText="Transaction ID" />
            <asp:BoundColumn DataField="Date" HeaderText="Date" DataFormatString="{0:d}" />
            <asp:BoundColumn DataField="Description" HeaderText="Account" />
            <asp:BoundColumn DataField="Amount" HeaderText="Amount" DataFormatString="{0:c}" />
            <asp:BoundColumn DataField="Comment" HeaderText="Comment" />
        </Columns>
    </asp:DataGrid>
    <asp:SqlDataSource runat="server" ID="DateRangePaymentHistoryGridDataSource" SelectCommand="SRODateRange" SelectCommandType="StoredProcedure" 
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>">
        <SelectParameters>
            <asp:Parameter Name="DateMin" />
            <asp:Parameter Name="DateMax" />
        </SelectParameters>
    </asp:SqlDataSource> 
</asp:Content>
