<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FindMissingSROs.aspx.cs" Inherits="UFAppleService.FindMissingSROs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DataGrid runat="server" ID="MissingSROGrid" DataSourceID="MissingSROGridDataSource" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Larger" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundColumn DataField="MissingSRO" HeaderText="Missing SRO" ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </asp:DataGrid>
    <asp:SqlDataSource runat="server" ID="MissingSROGridDataSource" SelectCommand="MissingSRONumbers" SelectCommandType="StoredProcedure" 
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>">
    </asp:SqlDataSource> 
</asp:Content>
