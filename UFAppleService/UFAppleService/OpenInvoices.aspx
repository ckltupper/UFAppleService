<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OpenInvoices.aspx.cs" Inherits="UFAppleService.OpenInvoices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DataGrid runat="server" ID="OpenInvoicesGrid" DataSourceID="OpenInvoicesGridDataSource" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Larger" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundColumn DataField="SRONumber" HeaderText="SRO Number" />
            <asp:BoundColumn DataField="Balance" HeaderText="Balance" DataFormatString="{0:c}" />
        </Columns>
    </asp:DataGrid>
    <asp:SqlDataSource runat="server" ID="OpenInvoicesGridDataSource" SelectCommand="OpenSRO" SelectCommandType="StoredProcedure" 
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>">
    </asp:SqlDataSource> 
</asp:Content>
