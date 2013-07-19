<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SingleSROPaymentHistory.aspx.cs" Inherits="UFAppleService.SingleSROPaymentHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="sROLabel1" runat="server" Text="SRO:"></asp:Label>
    <asp:Label ID="sROLabel2" runat="server" Text="S-"></asp:Label>
    <asp:TextBox ID="sROTextBox" runat="server" Width="57px"></asp:TextBox>
    <asp:Button ID="viewButton" runat="server" OnClick="viewButton_Click" Text="View" />
    <asp:DataGrid runat="server" ID="PaymentHistoryGrid" DataSourceID="PaymentHistoryGridDataSource" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Larger" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundColumn DataField="TransactionID" HeaderText="Transaction ID" />
            <asp:BoundColumn DataField="Date" HeaderText="Date" DataFormatString="{0:d}" />
            <asp:BoundColumn DataField="Description" HeaderText="Account" />
            <asp:BoundColumn DataField="Amount" HeaderText="Amount" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundColumn DataField="Comment" HeaderText="Comment" />
        </Columns>
    </asp:DataGrid>
    <asp:SqlDataSource runat="server" ID="PaymentHistoryGridDataSource" SelectCommand="SROPaymentHistory" SelectCommandType="StoredProcedure" 
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>">
        <SelectParameters>
            <asp:Parameter Name="SRONumber" />
        </SelectParameters>
    </asp:SqlDataSource> 
</asp:Content>
