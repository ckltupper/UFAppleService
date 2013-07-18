<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UFAppleService._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    </asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Select one of the following:</h3>
    <ol class="round">
        <li class="one">
            <h5>Add SRO</h5>
            Add a new SRO to the system.
            <a href="AddSRO.aspx">Add SRO</a>
        </li>
        <li class="two">
            <h5>Add New Transaction</h5>
            Add a new transaction to the system.  SRO must already be in the system.
            <a href="AddCharge.aspx">Add Charge</a>
            <a href="AddPayment.aspx">Add Payment</a>
        </li>
        <li class="three">
            <h5>View Transaction History</h5>
            View the transaction history for a single or group of SROs.
            <a href="SingleSROPaymentHistory.aspx">Single SRO</a>
            <a href="DateRangeSROPaymentHistory.aspx">SRO Date Range</a>
            <a href="NumberRangeSROPaymentHistory.aspx">SRO Number Range</a>
        </li>
        <li class="four">
            <h5>Open Invoices</h5>
            View the SRO(s) that still carry a balance.
            <a href="OpenInvoices.aspx">Open Invoices</a>
        </li>
        <li class="five">
            <h5>Missing SRO</h5>
            View a list of SRO(s) that are missing from the system.
            <a href="FindMissingSROs.aspx">Missing SROs</a>
        </li>
    </ol>
</asp:Content>
