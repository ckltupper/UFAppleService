<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OpenInvoices.aspx.cs" Inherits="UFAppleService.OpenInvoices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DataGrid runat="server" ID="OpenInvoicesGrid" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Larger" 
        AutoGenerateColumns="False" AllowSorting="True" OnSortCommand="OpenInvoicesGrid_SortCommand" ShowFooter="false" OnItemDataBound="OpenInvoicesGrid_ItemDataBound">
        <Columns>
            <asp:HyperLinkColumn DataTextField="SRONumber" DataNavigateUrlField="SRONumber" DataNavigateUrlFormatString="SingleSROPaymentHistory.aspx?SRONumber={0}" NavigateUrl="~/SingleSROPaymentHistory.aspx" 
                HeaderText="SRO Number" SortExpression="SRONumber" />
            <asp:BoundColumn DataField="Balance" HeaderText="Balance" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" SortExpression="Balance DESC" />
            <asp:BoundColumn DataField="Balance" Visible="false" />
            <asp:BoundColumn DataField="DateCreated" HeaderText="Date Created" DataFormatString="{0:d}" SortExpression="DateCreated" ItemStyle-HorizontalAlign="Center" />
        </Columns>

<HeaderStyle Font-Bold="True" Font-Size="Larger"></HeaderStyle>
        
    </asp:DataGrid>

    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Total: " style="left: 100px; position: relative"></asp:Label>
    <asp:Label ID="amountTotalLabel" runat="server" Font-Bold="True" Font-Size="Large" style="left: 115px; position: relative"></asp:Label>

    <asp:SqlDataSource runat="server" ID="OpenInvoicesGridDataSource" SelectCommand="OpenSRO" SelectCommandType="StoredProcedure" 
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>">
    </asp:SqlDataSource>
    
</asp:Content>
