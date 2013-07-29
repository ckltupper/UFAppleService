<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditSRO.aspx.cs" Inherits="UFAppleService.EditSRO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="sROLabel1" runat="server" Text="SRO Number:"></asp:Label>
    <asp:Label ID="sROLabel2" runat="server" Text="S-"></asp:Label>
    <asp:TextBox ID="sROTextBox" runat="server" MaxLength="6" Width="57px"></asp:TextBox>

    <asp:Button ID="findButton" runat="server" OnClick="findButton_Click" Text="Find" />

    <div>
    <asp:Label ID="dateCreatedLabel" runat="server" Text="Date Created:"></asp:Label>
    <asp:TextBox ID="dateCreatedTextBox" runat="server" MaxLength="10" Width="90px"></asp:TextBox>
    <asp:Label ID="pONumberLabel1" runat="server" Text="Apple PO Number:"></asp:Label>
    <asp:Label ID="pONumberLabel2" runat="server" Text="PO-"></asp:Label>
    <asp:TextBox ID="pONumberTextBox" runat="server" MaxLength="6" Width="57px"></asp:TextBox>
    <asp:Button ID="saveButton" runat="server" OnClick="saveButton_Click" Text="Update" />
    </div>

</asp:Content>
