<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddSRO.aspx.cs" Inherits="UFAppleService.AddSRO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="sROLabel1" runat="server" Text="SRO Number:"></asp:Label>
    <asp:Label ID="sROLabel2" runat="server" Text="S-"></asp:Label>
    <asp:TextBox ID="sROTextBox" runat="server" MaxLength="6" Width="57px" AutoPostBack="true" OnTextChanged="sROTextBox_TextChanged" ></asp:TextBox>
    <asp:Label ID="dateCreatedLabel" runat="server" Text="Date Created:"></asp:Label>
    <asp:TextBox ID="dateCreatedTextBox" runat="server" MaxLength="10" Width="90px" AutoPostBack="true" OnTextChanged="dateCreatedTextBox_TextChanged"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid date." 
        ValidationExpression="(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})" 
        ControlToValidate="dateCreatedTextBox" EnableClientScript="False"></asp:RegularExpressionValidator>
    <asp:Label ID="pONumberLabel1" runat="server" Text="Apple PO Number:"></asp:Label>
    <asp:Label ID="pONumberLabel2" runat="server" Text="PO-"></asp:Label>
    <asp:TextBox ID="pONumberTextBox" runat="server" MaxLength="6" Width="57px"></asp:TextBox>
    <asp:Button ID="saveButton" runat="server" OnClick="saveButton_Click" Text="Save" Visible="false" />

</asp:Content>
