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
        ValidationExpression="^(1[0-2]|0?[1-9])/(3[01]|[12][0-9]|0?[1-9])/(?:[0-9]{2})?[0-9]{2}$" 
        ControlToValidate="dateCreatedTextBox" EnableClientScript="False"></asp:RegularExpressionValidator>
    <asp:Label ID="pONumberLabel1" runat="server" Text="Apple PO Number:"></asp:Label>
    <asp:Label ID="pONumberLabel2" runat="server" Text="PO-"></asp:Label>
    <asp:TextBox ID="pONumberTextBox" runat="server" MaxLength="6" Width="57px"></asp:TextBox>
    <asp:Button ID="saveButton" runat="server" OnClick="saveButton_Click" Text="Save" Visible="false" />
    <div>
        <a href="AddCharge.aspx">Add a Charge</a>
    </div>

</asp:Content>
