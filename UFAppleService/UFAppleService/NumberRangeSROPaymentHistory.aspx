<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NumberRangeSROPaymentHistory.aspx.cs" Inherits="UFAppleService.NumberRangeSROPaymentHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="beginningSROLabel" runat="server" Text="Beginning SRO:"></asp:Label>
    <asp:Label ID="sROLabel1" runat="server" Text="S-"></asp:Label>
    <asp:TextBox ID="beginningSROTextBox" runat="server" Width="90px" MaxLength="10"></asp:TextBox>
    <asp:Label ID="endSROLabel" runat="server" Text="End SRO:"></asp:Label>
    <asp:Label ID="sROLabel2" runat="server" Text="S-"></asp:Label>
    <asp:TextBox ID="endSROTextBox" runat="server" MaxLength="10" Width="90px"></asp:TextBox>
    <asp:Button ID="viewButton" runat="server" Text="View" OnClick="viewButton_Click" />
    <asp:DataGrid runat="server" ID="NumberRangePaymentHistoryGrid" DataSourceID="NumberRangePaymentHistoryGridDataSource" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Larger" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundColumn DataField="SRONumber" HeaderText="SRO Number" />
            <asp:BoundColumn DataField="TransactionID" HeaderText="Transaction ID" />
            <asp:BoundColumn DataField="Date" HeaderText="Date" DataFormatString="{0:d}" />
            <asp:BoundColumn DataField="Description" HeaderText="Account" />
            <asp:BoundColumn DataField="Amount" HeaderText="Amount" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundColumn DataField="Comment" HeaderText="Comment" />
        </Columns>
    </asp:DataGrid>
    <asp:SqlDataSource runat="server" ID="NumberRangePaymentHistoryGridDataSource" SelectCommand="SRONumberRange" SelectCommandType="StoredProcedure" 
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>">
        <SelectParameters>
            <asp:Parameter Name="SROMin" />
            <asp:Parameter Name="SROMax" />
        </SelectParameters>
    </asp:SqlDataSource> 
</asp:Content>
