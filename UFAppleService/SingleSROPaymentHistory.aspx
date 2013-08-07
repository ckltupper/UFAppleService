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
    <asp:DataGrid runat="server" ID="PaymentHistoryGrid" DataSourceID="PaymentHistoryGridDataSource" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Larger" 
        AutoGenerateColumns="False" FooterStyle-Font-Bold="true" FooterStyle-Font-Size="Large" OnItemDataBound="PaymentHistoryGrid_ItemDataBound">
        <Columns>
            <asp:BoundColumn DataField="TransactionID" HeaderText="Transaction" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundColumn DataField="Date" HeaderText="Date" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundColumn DataField="Description" HeaderText="Account" />
            <asp:BoundColumn DataField="Amount" HeaderText="Amount" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundColumn DataField="Amount" Visible="false" />            
            <asp:BoundColumn DataField="Comment" HeaderText="Comment" />
        </Columns>


        
    </asp:DataGrid>
    <asp:Label ID="balanceLabel" runat="server" Font-Bold="True" Font-Size="Large" Text="Balance:" style="left: 325px; position: relative" Visible="false"></asp:Label>
    <asp:Label ID="amountBalanceLabel" runat="server" Font-Bold="True" Font-Size="Large" style="left: 333px; position: relative"></asp:Label>
    <asp:SqlDataSource runat="server" ID="PaymentHistoryGridDataSource" SelectCommand="SROPaymentHistory" SelectCommandType="StoredProcedure" 
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>">
        <SelectParameters>
            <asp:Parameter Name="SRONumber" />
        </SelectParameters>
    </asp:SqlDataSource> 
</asp:Content>
