<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NoTransactions.aspx.cs" Inherits="UFAppleService.NoTransactions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DataGrid runat="server" ID="NoTransactionsGrid" DataSourceID="NoTransactionsGridDataSource" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Larger" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundColumn DataField="SRONumber" HeaderText="SRO Number" ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </asp:DataGrid>
    <asp:SqlDataSource runat="server" ID="NoTransactionsGridDataSource" SelectCommand="SRONoTransaction" SelectCommandType="StoredProcedure" 
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>">
    </asp:SqlDataSource> 
</asp:Content>
