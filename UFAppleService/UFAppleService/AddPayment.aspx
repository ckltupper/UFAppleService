<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPayment.aspx.cs" Inherits="UFAppleService.AddPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="sRONumberLabel1" runat="server" Text="SRO Number:"></asp:Label>
    <asp:Label ID="sRONumberLabel2" runat="server" Text="S-"></asp:Label>
    <asp:TextBox ID="sROTextBox" runat="server" MaxLength="6" Width="57px" AutoPostBack="true" OnTextChanged="sROTextBox_TextChanged"></asp:TextBox>
    <asp:Label ID="errorLabel" runat="server" Font-Bold="True" Font-Size="Medium" Text="That SRO does not exist.  Please verify the number is correct." Visible="False"></asp:Label>
    <div>
        <asp:Label ID="accountLabel" runat="server" Text="Account:"></asp:Label>
        <asp:DropDownList ID="accountDropDown" runat="server" AutoPostBack="true" ></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="accountDropDownDataSource" SelectCommand="AccountName" SelectCommandType="StoredProcedure" 
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" OnSelecting="accountDropDownDataSource_Selecting"></asp:SqlDataSource>
       
    </div>
    <asp:Label ID="amountLabel" runat="server" Text="Amount:"></asp:Label>
    <asp:Label ID="dollarSignLabel" runat="server" Text="$"></asp:Label>
    <asp:TextBox ID="amountTextBox" runat="server" Width="57px"></asp:TextBox>
    <asp:Label ID="dateLabel" runat="server" Text="Date:"></asp:Label>
    <asp:TextBox ID="dateTextBox" runat="server" MaxLength="10" Width="90px" OnTextChanged="dateTextBox_TextChanged"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid date." 
        ValidationExpression="(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})" 
        ControlToValidate="dateTextBox" EnableClientScript="False"></asp:RegularExpressionValidator>
    <asp:Label ID="commentLabel" runat="server" Text="Comment:"></asp:Label>
    <asp:TextBox ID="commentTextBox" runat="server" MaxLength="500" TextMode="MultiLine"></asp:TextBox>
    <asp:Button ID="saveButton" runat="server" OnClick="saveButton_Click" Text="Save" Visible="false" />

</asp:Content>
